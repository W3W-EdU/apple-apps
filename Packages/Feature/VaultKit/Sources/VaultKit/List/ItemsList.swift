import CoreSharing
import DesignSystem
import SwiftTreats
import SwiftUI
import UIComponents

public struct ItemRowViewConfiguration {
  public let vaultItem: VaultItem
  public let isSuggestedItem: Bool
  public let isInCollectionSection: Bool
}

public struct ItemsList<RowView: View, Header: View, Footer: View>: View {
  @Environment(\.vaultItemsListDelete)
  var delete

  @Environment(\.vaultItemsListDeleteBehaviour)
  var deleteBehaviour

  let sections: [DataSection]
  let rowProvider: (ItemRowViewConfiguration) -> RowView
  let header: Header?
  let footer: Footer?

  @State
  var deleteRequest: DeleteVaultItemRequest = .init()

  @State
  var itemToDelete: VaultItem?

  private var sectionIndexesPadding: CGFloat {
    sections.count > 1 ? 10 : 0
  }

  public init(
    sections: [DataSection],
    rowProvider: @escaping (ItemRowViewConfiguration) -> RowView,
    @ViewBuilder header: () -> Header,
    @ViewBuilder footer: () -> Footer
  ) {
    self.sections = sections
    self.rowProvider = rowProvider
    self.header = header()
    self.footer = footer()
  }

  public init(
    sections: [DataSection],
    rowProvider: @escaping (ItemRowViewConfiguration) -> RowView,
    @ViewBuilder footer: () -> Footer
  ) where Header == EmptyView {
    self.sections = sections
    self.rowProvider = rowProvider
    self.header = nil
    self.footer = footer()
  }

  public init(
    sections: [DataSection],
    rowProvider: @escaping (ItemRowViewConfiguration) -> RowView,
    @ViewBuilder header: () -> Header
  ) where Footer == EmptyView {
    self.sections = sections
    self.rowProvider = rowProvider
    self.header = header()
    self.footer = nil
  }

  public init(
    sections: [DataSection],
    rowProvider: @escaping (ItemRowViewConfiguration) -> RowView
  ) where Footer == EmptyView, Header == EmptyView {
    self.sections = sections
    self.rowProvider = rowProvider
    self.header = nil
    self.footer = nil
  }

  public var body: some View {
    list
      .deleteItemAlert(request: $deleteRequest, deleteAction: deleteItem)
      .eraseToAnyView()
  }

  @ViewBuilder
  var list: some View {
    List {
      header
        .listRowSeparator(.hidden)
      Section {
        VaultForEach(
          sections: sections,
          delete: delete != nil ? { deleteRow(for: $0) } : nil,
          header: { section in
            if section.isSuggestedItems {
              sectionHeader(for: section)
            } else {
              sectionHeader(for: section)
                .id(section.listIndex)
            }
          },
          row: { section, item in
            row(
              for: item,
              isSuggestedItem: section.isSuggestedItems,
              isInCollectionSection: section.collectionName != nil
            )
          }
        ).accessibilitySortPriority(.list)
      }
      .disableHeaderCapitalization()

      footer
        .listRowSeparator(.hidden)
    }
    .listAppearance(.plain)
  }

  @ViewBuilder
  private func sectionHeader(for section: DataSection) -> some View {
    HStack(spacing: 6) {
      if !section.name.isEmpty {
        Text(section.name)
          .font(.headline)
          .foregroundColor(.ds.text.neutral.quiet)
          .accessibilityLabel(section.name.lowercased())
      }

      if let collectionName = section.collectionName, !collectionName.isEmpty {
        Tag(
          collectionName,
          trailingAccessory: section.isSharedCollection ? .icon(.ds.shared.outlined) : nil)
      }
    }
    .padding(.leading, 16)
    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    .listRowBackground(Color.ds.background.default)
  }

  private func row(for item: VaultItem, isSuggestedItem: Bool, isInCollectionSection: Bool)
    -> some View
  {
    let itemRowConfig = ItemRowViewConfiguration(
      vaultItem: item,
      isSuggestedItem: isSuggestedItem,
      isInCollectionSection: isInCollectionSection
    )

    return rowProvider(itemRowConfig)
      .listRowInsets(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 10))
      .listRowBackground(Color.ds.background.default)
      .padding(.trailing, sectionIndexesPadding)
  }

  private func deleteRow(for item: VaultItem) {
    Task {
      try await delete(item)
    }
  }

  private func delete(_ item: VaultItem) async throws {
    itemToDelete = item
    deleteRequest.itemDeleteBehavior = try await deleteBehaviour(item)
    deleteRequest.isPresented = true
  }

  private func deleteItem() {
    guard let item = itemToDelete else {
      return
    }
    self.delete?(item)
    itemToDelete = nil
  }

  private func itemDeleteBehavior() async throws -> ItemDeleteBehaviour {
    guard let item = itemToDelete else {
      return .normal
    }
    return try await deleteBehaviour(item)
  }
}
