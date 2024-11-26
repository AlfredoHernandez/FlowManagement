//
//  Copyright © 2024 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import Foundation

protocol FlowDataManager {
    var collectedData: [String: Any] { get }

    func mergeWithInitialData(_ data: [String: Any?]?)
    func collectData(_ data: [String: Any?])
}
