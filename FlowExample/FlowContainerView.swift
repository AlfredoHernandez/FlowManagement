//
//  Copyright © 2024 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import SwiftFlow
import SwiftUI

struct FlowContainerView: View {
    private let initialData = ["name": "Alfredo"]

    @ObservedObject var coordinator: SwiftUIFlowCoordinator
    var onStartFlow: (([String: Any]?) -> Void)?

    var body: some View {
        NavigationStack(path: $coordinator.screenStack) {
            VStack(spacing: 24) {
                VStack {
                    Text("Initial data:")
                    Text(String(describing: initialData))
                }

                Button(action: {
                    onStartFlow?(initialData)
                }, label: {
                    Text("Start flow")
                })
            }
            .navigationDestination(for: String.self) { screenName in
                coordinator.view(for: screenName)
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
