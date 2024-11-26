//
//  Copyright © 2024 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import Foundation

public class Graph {
    private var adjList: [String: [String]] = [:]

    init(adjList: [String: [String]] = [:]) {
        self.adjList = adjList
    }

    public func addScreen(_ screen: String, nextScreens: [String]) {
        adjList[screen] = nextScreens
    }

    public func getNextScreens(from screen: String) -> [String]? {
        adjList[screen]
    }
}
