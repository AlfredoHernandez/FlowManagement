//
//  Copyright © 2024 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import SwiftUI

struct ScreenAView: View {
    let data: [String: Any]
    let didCompleteForm: ([String: Any?]) -> Void

    var body: some View {
        VStack {
            Text("Screen A")
            Button("Next") {
                didCompleteForm(["userType": "newUser"])
            }
        }
        .padding()
    }
}

struct ScreenBView: View {
    let data: [String: Any]
    let didCompleteForm: ([String: Any?]) -> Void

    var body: some View {
        VStack {
            Text("Screen B")
            Button("Next") {
                didCompleteForm(["age": 30])
            }
        }
        .padding()
    }
}

struct ScreenCView: View {
    let data: [String: Any]
    let didCompleteForm: ([String: Any?]) -> Void

    var body: some View {
        VStack {
            Text("Screen C")
            Button("Finish") {
                didCompleteForm(["finished": true])
            }
        }
        .padding()
    }
}
