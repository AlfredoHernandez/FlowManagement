//
//  Copyright © 2024 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import SwiftFlow
import SwiftUI

struct FlowContainerView: View {
    @ObservedObject var coordinator: SwiftUIFlowCoordinator

    var onStartFlow: (([String: Any]?) -> Void)?

    var body: some View {
        NavigationStack(path: $coordinator.screenStack) {
            VStack {
                Button(action: {
                    onStartFlow?(["name": "Alfredo"])
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

    func onStartFlow(_ action: @escaping ([String: Any]?) -> Void) -> FlowContainerView {
        var copy = self
        copy.onStartFlow = action
        return copy
    }
}

#Preview {
    let coordinator = SwiftUIFlowCoordinator()
    let flow = createFlow(coordinator: coordinator)

    FlowContainerView(coordinator: SwiftUIFlowCoordinator())
        .onStartFlow { data in
            flow.start(from: "ScreenA", with: data)
        }
}
