//
//  Copyright © 2024 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import SwiftFlow
import SwiftUI

public class SwiftUIFlowCoordinator: ObservableObject, FlowCoordinator {
    @Published var screenStack: [String] = []

    private var data: [String: Any] = [:]
    private var didCompleteForm: FormCompletion?

    public func showNextScreen(
        screenName: String,
        data: [String: Any],
        didCompleteForm: @escaping FormCompletion
    ) {
        self.data = data
        self.didCompleteForm = didCompleteForm
        screenStack.append(screenName)
    }

    public func goToRootScreen() {
        screenStack.removeAll()
    }

    // MARK: - Adapter for @ViewBuilder

    @ViewBuilder
    public func view(for screenName: String) -> some View {
        if let didCompleteForm {
            switch screenName {
            case "ScreenA":
                ScreenAView(data: data, didCompleteForm: didCompleteForm)
            case "ScreenB":
                ScreenBView(data: data, didCompleteForm: didCompleteForm)
            case "ScreenC":
                ScreenCView(data: data, didCompleteForm: didCompleteForm)
            default:
                EmptyView()
            }
        } else {
            EmptyView()
        }
    }
}
