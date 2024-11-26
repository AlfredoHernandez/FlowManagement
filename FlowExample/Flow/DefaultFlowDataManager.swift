//
//  Copyright © 2024 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import Foundation

class DefaultFlowDataManager: FlowDataManager {
    private(set) var collectedData = [String: Any]()

    public func mergeWithInitialData(_ data: [String: Any?]?) {
        guard let data else { return }
        collectedData.merge(data.compactMapValues { $0 }, uniquingKeysWith: { _, new in new })
    }

    public func collectData(_ data: [String: Any?]) {
        collectedData.merge(data.compactMapValues { $0 }, uniquingKeysWith: { _, new in new })
    }
}
