//
//  Copyright © 2024 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import SwiftFlow
import SwiftUI

struct ScreenAView: View {
    let data: [String: Any]
    let didCompleteForm: FormCompletion

    var body: some View {
        VStack {
            Text("Screen A")

            Button("Next B") {
                didCompleteForm(["userType": "newUserB"], "ScreenB")
            }

            Button("Next C") {
                didCompleteForm(["userType": "newUserC"], "ScreenC")
            }
        }
        .padding()
    }
}

struct ScreenBView: View {
    let data: [String: Any]
    let didCompleteForm: FormCompletion

    var body: some View {
        VStack {
            Text("Screen B")
            Button("Next") {
                didCompleteForm(["age": 30], nil)
            }
        }
        .padding()
    }
}

struct ScreenCView: View {
    let data: [String: Any]
    let didCompleteForm: FormCompletion

    var body: some View {
        VStack {
            Text("Screen C")
            Button("Finish") {
                didCompleteForm(["finished": true], nil)
            }
        }
        .padding()
    }
}
