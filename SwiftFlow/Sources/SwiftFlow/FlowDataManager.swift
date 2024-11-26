//
//  Copyright © 2024 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import Foundation

public protocol FlowDataManager {
    var collectedData: [String: Any] { get }

    func collectData(_ data: [String: Any?]?)
}
