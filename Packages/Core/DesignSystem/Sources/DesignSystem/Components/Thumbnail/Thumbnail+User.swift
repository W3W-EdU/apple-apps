import Foundation
import SwiftUI

extension Thumbnail {
  public enum User: View {
    case single(Image?)
    case group

    public var body: some View {
      BaseThumbnail {
        switch self {
        case .single(let image):
          UserThumbnailContentView(image: image)
        case .group:
          IconThumbnailContentView(Image.ds.group.outlined)
        }
      }
    }
  }
}

private struct UserThumbnailContentView: View {
  let image: Image?

  var body: some View {
    if let image {
      image
        .resizable()
        .renderingMode(.original)
        .aspectRatio(contentMode: .fill)
    } else {
      IconThumbnailContentView(Image.ds.users.outlined)
    }
  }
}

#Preview("User") {
  HStack {
    Thumbnail.User.single(nil)
      .controlSize(.mini)
    Thumbnail.User.single(nil)
      .controlSize(.regular)
    Thumbnail.User.single(nil)
      .controlSize(.large)
  }
}

#Preview("Group") {
  HStack {
    Thumbnail.User.group
      .controlSize(.mini)
    Thumbnail.User.group
      .controlSize(.regular)
    Thumbnail.User.group
      .controlSize(.large)
  }
}
