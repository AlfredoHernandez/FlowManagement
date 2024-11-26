//
//  Copyright © 2024 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import Foundation

public typealias FormCompletion = ([String: Any?], String?) -> Void

public protocol FlowCoordinator {
    func showNextScreen(screenName: String, data: [String: Any], didCompleteForm: @escaping FormCompletion)
}
