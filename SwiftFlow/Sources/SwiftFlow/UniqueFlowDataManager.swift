//
//  Copyright © 2024 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import Foundation

public class UniqueFlowDataManager: FlowDataManager {
    private var uniqueCollectedData = Set<String>()
    public private(set) var collectedData = [String: Any]()

    public func collectData(_ data: [String: Any?]?) {
        guard let data else { return }
        for (key, value) in data {
            if uniqueCollectedData.insert(key).inserted {
                collectedData[key] = value
            }
        }
    }
}
