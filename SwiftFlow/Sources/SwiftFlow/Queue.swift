//
//  Copyright © 2024 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import Foundation

public struct Queue<T> {
    private var elements: [T] = []

    public mutating func enqueue(_ element: T) {
        elements.append(element)
    }

    public mutating func dequeue() -> T? {
        elements.isEmpty ? nil : elements.removeFirst()
    }

    public var isEmpty: Bool {
        elements.isEmpty
    }
}
