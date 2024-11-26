//
//  Copyright © 2024 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import Foundation

class Flow {
    private let identifier: String
    private let coordinator: FlowCoordinator
    private let dataManager: FlowDataManager
    private let graph: Graph
    private var currentScreen: String

    public var didFinishFlow: (([String: Any]) -> Void)?
    public var exitFromFlow: (() -> Void)?

    init(identifier: String, initialScreen: String, graph: Graph, coordinator: FlowCoordinator, dataManager: FlowDataManager) {
        self.identifier = identifier
        currentScreen = initialScreen
        self.graph = graph
        self.coordinator = coordinator
        self.dataManager = dataManager
    }

    func start(with data: [String: Any?]? = nil) {
        dataManager.mergeWithInitialData(data)
        proceedToNextScreen()
    }

    private func proceedToNextScreen() {
        coordinator.showNextScreen(screenName: currentScreen, data: dataManager.collectedData) { [weak self] formData in
            self?.didCompleteForm(formData: formData)
        }
    }

    private func didCompleteForm(formData: [String: Any?]) {
        dataManager.collectData(formData)
        if let nextScreens = graph.getNextScreens(from: currentScreen), let nextScreen = nextScreens.first {
            currentScreen = nextScreen
            proceedToNextScreen()
        } else {
            didFinishFlow?(dataManager.collectedData)
        }
    }
}
