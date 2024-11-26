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
            VStack {
                Text("Screen A")
                Text("Current data: ")
                Text(String(describing: data))
            }

            Button("Continue with screen B") {
                didCompleteForm(["userType": "newUserB"], "ScreenB")
            }

            Button("Continue with screen C") {
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
            VStack {
                Text("Screen B")
                Text("Current data: ")
                Text(String(describing: data))
            }

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
            VStack {
                Text("Screen C")
                Text("Current data: ")
                Text(String(describing: data))
            }

            Button("Finish") {
                didCompleteForm(["finished": true], nil)
            }
        }
        .padding()
    }
}
