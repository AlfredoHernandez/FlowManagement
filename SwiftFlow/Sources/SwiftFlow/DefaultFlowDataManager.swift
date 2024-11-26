//
//  Copyright © 2024 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import Foundation

public class DefaultFlowDataManager: FlowDataManager {
    public private(set) var collectedData = [String: Any]()

    public init(collectedData: [String: Any] = [String: Any]()) {
        self.collectedData = collectedData
    }

    public func collectData(_ data: [String: Any?]?) {
        guard let data else { return }
        collectedData.merge(data.compactMapValues { $0 }, uniquingKeysWith: { _, new in new })
    }
}
