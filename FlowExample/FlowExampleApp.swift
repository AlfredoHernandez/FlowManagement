//
//  Copyright © 2024 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import SwiftUI

@main
struct FlowExampleApp: App {
    var body: some Scene {
        WindowGroup {
            let coordinator = SwiftUIFlowCoordinator()
            let flow = createFlow(coordinator: coordinator)
            FlowContainerView(coordinator: coordinator, flow: flow)
        }
    }

    func createGraph() -> Graph {
        let graph = Graph()
        graph.addScreen("ScreenA", nextScreens: ["ScreenB", "ScreenC"])
        graph.addScreen("ScreenB", nextScreens: ["ScreenC"])
        graph.addScreen("ScreenC", nextScreens: [])
        return graph
    }

    func createFlow(coordinator: FlowCoordinator) -> Flow {
        let flow = Flow(
            identifier: "UserOnboarding",
            initialScreen: "ScreenA",
            graph: createGraph(),
            coordinator: coordinator,
            dataManager: DefaultFlowDataManager()
        )
        flow.didFinishFlow = { data in
            print("Flow finished with \(data)")
        }
        return flow
    }
}

struct FlowContainerView: View {
    @ObservedObject var coordinator: SwiftUIFlowCoordinator
    let flow: Flow

    var body: some View {
        NavigationStack(path: $coordinator.screenStack) {
            VStack {
                Button(action: {
                    flow.start(with: ["name": "Alfredo"])
                }, label: {
                    Text("Init Flow")
                })
            }
            .navigationDestination(for: String.self) { screenName in
                coordinator.view(for: screenName)
            }.onChange(of: coordinator.screenStack) { oldValue, newValue in
                print("OLD: \(oldValue)")
                print("New: \(newValue)")
                // TODO: Hanlde flow.goBack()
            }
        }
    }
}
