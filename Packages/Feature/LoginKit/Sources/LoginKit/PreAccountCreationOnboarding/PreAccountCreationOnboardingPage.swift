#if canImport(UIKit)

  import SwiftUI
  import CoreLocalization
  import UIComponents
  import DesignSystem

  struct PreAccountCreationOnboardingPage: View {
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    @ScaledMetric private var contentScale = 100

    private let step: PreAccountCreationOnboardingStep
    private let content: PreAccountCreationOnboardingStep.Content

    private let lottiesSizeRatio: CGFloat = 750 / 700

    init(step: PreAccountCreationOnboardingStep) {
      self.step = step
      self.content = step.content
    }

    public var body: some View {
      ScrollView(.vertical) {
        VStack(spacing: 8) {
          PreAccountCreationAnimationLayout(
            contentScale: contentScale, aspectRatio: lottiesSizeRatio
          ) {
            animation
          }
          .frame(maxHeight: .infinity, alignment: .bottom)

          Text(content.title)
            .textStyle(.specialty.brand.medium)
            .multilineTextAlignment(.center)
            .foregroundColor(.ds.text.neutral.catchy)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .accessibilityAddTraits(.isHeader)

          Text(content.description)
            .textStyle(.body.standard.regular)
            .multilineTextAlignment(.center)
            .foregroundColor(.ds.text.neutral.standard)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.horizontal, 24)
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .frame(maxWidth: .infinity)
      }
      .tag(step)
    }

    @ViewBuilder
    var animation: some View {
      switch content.scene {
      case .regular(let lottie):
        LottieView(lottie)
      case .stacked(let front, let back):
        ZStack {
          LottieView(back)
          LottieView(front)
        }
      case .curtain(let curtain, let content):
        ZStack {
          LottieView(content)
          LottieView(
            curtain, loopMode: .playOnce, state: .progress(fromProgress: 0, toProgress: 0.5))
        }
      }
    }
  }

  private struct PreAccountCreationAnimationLayout: Layout {
    let contentScale: Double
    let aspectRatio: Double

    private var animationScale: Double {
      let minValue = 0.44
      let maxValue = 0.8
      let currentValue = maxValue + (1 - contentScale / 100)
      return min(maxValue, max(minValue, currentValue))
    }

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
      let size = proposal.replacingUnspecifiedDimensions()

      return .init(
        width: size.width * animationScale,
        height: (size.width / aspectRatio) * animationScale)
    }

    func placeSubviews(
      in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()
    ) {
      subviews.first?.place(at: bounds.origin, anchor: .topLeading, proposal: .init(bounds.size))
    }
  }

  enum PreAccountCreationOnboardingStep: String, Identifiable {
    var id: String { rawValue }

    case authenticator
    case trust
    case vault
    case autofill
    case security
    case privacy

    struct Content {
      enum Scene {
        case regular(lottie: LottieAsset)
        case stacked(front: LottieAsset, back: LottieAsset)
        case curtain(LottieAsset, content: LottieAsset)
      }
      let scene: Scene
      let title: String
      let description: String
    }

    var content: Content {
      switch self {
      case .authenticator:
        return Content(
          scene: .regular(lottie: .preOnboardingAuthenticatorLoop),
          title: L10n.Core.onboardingV3AuthenticatorScreenTitle,
          description: L10n.Core.onboardingV3AuthenticatorScreenDescription)
      case .trust:
        return Content(
          scene: .stacked(
            front: .preOnboardingTrustScreenTransition, back: .preOnboardingTrustScreenLoop),
          title: L10n.Core.onboardingV3TrustScreenTitle,
          description: L10n.Core.onboardingV3TrustScreenDescription)
      case .vault:
        return Content(
          scene: .curtain(
            .preOnboardingVaultScreenTransition, content: .preOnboardingVaultScreenLoop),
          title: L10n.Core.onboardingV3VaultScreenTitle,
          description: L10n.Core.onboardingV3VaultScreenDescription)
      case .autofill:
        return Content(
          scene: .regular(lottie: .preOnboardingAutofillScreenLoop),
          title: L10n.Core.onboardingV3AutofillScreenTitle,
          description: L10n.Core.onboardingV3AutofillScreenDescription)
      case .security:
        return Content(
          scene: .regular(lottie: .preOnboardingSecurityAlertsScreenLoop),
          title: L10n.Core.onboardingV3SecurityAlertsScreenTitle,
          description: L10n.Core.onboardingV3SecurityAlertsScreenDescription)
      case .privacy:
        return Content(
          scene: .regular(lottie: .preOnboardingPrivacyScreenLoop),
          title: L10n.Core.onboardingV3PrivacyScreenTitle,
          description: L10n.Core.onboardingV3PrivacyScreenDescription)
      }
    }
  }

  struct PreAccountCreationOnboardingStep_Previews: PreviewProvider {
    static var previews: some View {
      PreAccountCreationOnboardingPage(step: .authenticator)
    }
  }

#endif
