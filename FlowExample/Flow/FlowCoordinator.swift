//
//  Copyright © 2024 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import Foundation

protocol FlowCoordinator {
    func showNextScreen(screenName: String, data: [String: Any], didCompleteForm: @escaping ([String: Any?]) -> Void)
}
