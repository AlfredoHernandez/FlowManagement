//
//  Copyright © 2024 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import Foundation

public class Flow {
    private let identifier: String
    private let coordinator: FlowCoordinator
    private let dataManager: FlowDataManager
    private let graph: Graph
    private var currentScreen: String?

    public var didFinishFlow: (([String: Any]) -> Void)?
    public var exitFromFlow: (() -> Void)?

    public init(identifier: String, graph: Graph, coordinator: FlowCoordinator, dataManager: FlowDataManager) {
        self.identifier = identifier
        self.graph = graph
        self.coordinator = coordinator
        self.dataManager = dataManager
    }

    public func start(from initialScreen: String, with data: [String: Any?]? = nil) {
        currentScreen = initialScreen
        dataManager.collectData(data)
        showCurrentScreen()
    }

    private func showCurrentScreen() {
        guard let currentScreen else { return }

        coordinator.showNextScreen(screenName: currentScreen, data: dataManager.collectedData) { [weak self] formData, nextScreen in
            self?.handleScreenCompletion(formData: formData, preferredNextScreen: nextScreen)
        }
    }

    private func handleScreenCompletion(formData: [String: Any?], preferredNextScreen: String?) {
        dataManager.collectData(formData)
        moveToNextScreen(preferredNextScreen: preferredNextScreen)
    }

    private func moveToNextScreen(preferredNextScreen: String?) {
        guard let currentScreen,
              let nextScreens = graph.getNextScreens(from: currentScreen)
        else {
            finishFlow()
            return
        }

        if let preferredNextScreen, nextScreens.contains(preferredNextScreen) {
            self.currentScreen = preferredNextScreen
        } else if let defaultNextScreen = nextScreens.first {
            self.currentScreen = defaultNextScreen
        } else {
            finishFlow()
            return
        }

        showCurrentScreen()
    }

    private func finishFlow() {
        didFinishFlow?(dataManager.collectedData)
    }
}
