//
//  Copyright © 2024 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import SwiftUI

public class SwiftUIFlowCoordinator: ObservableObject, FlowCoordinator {
    @Published var screenStack: [String] = []

    private var data: [String: Any] = [:]
    private var didCompleteForm: (([String: Any?]) -> Void)?

    public func showNextScreen(
        screenName: String,
        data: [String: Any],
        didCompleteForm: @escaping ([String: Any?]) -> Void
    ) {
        self.data = data
        self.didCompleteForm = didCompleteForm
        screenStack.append(screenName)
    }

    // MARK: - Adapter for @ViewBuilder

    @ViewBuilder
    public func view(for screenName: String) -> some View {
        switch screenName {
        case "ScreenA":
            ScreenAView(data: data, didCompleteForm: didCompleteForm ?? { _ in })
        case "ScreenB":
            ScreenBView(data: data, didCompleteForm: didCompleteForm ?? { _ in })
        case "ScreenC":
            ScreenCView(data: data, didCompleteForm: didCompleteForm ?? { _ in })
        default:
            EmptyView()
        }
    }
}
