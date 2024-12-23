//
//  Copyright © 2024 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import SwiftFlow
import SwiftUI

@main
struct FlowExampleApp: App {
    let coordinator = SwiftUIFlowCoordinator()

    var body: some Scene {
        WindowGroup {
            let flow = createFlow(coordinator: coordinator)
            FlowContainerView(coordinator: coordinator)
                .onStartFlow { initialData in
                    flow.start(from: "ScreenA", with: initialData)
                }
        }
    }
}

func createGraph() -> Graph {
    Graph(adjList: [
        "ScreenA": ["ScreenB", "ScreenC"],
        "ScreenB": ["ScreenC"],
        "ScreenC": [],
    ])
}

func createFlow(coordinator: FlowCoordinator, dataManager: FlowDataManager = DefaultFlowDataManager()) -> Flow {
    let flow = Flow(
        identifier: "UserOnboarding",
        graph: createGraph(),
        coordinator: coordinator,
        dataManager: dataManager
    )
    flow.didFinishFlow = { _ in
        coordinator.goToRootScreen()
    }
    return flow
}
