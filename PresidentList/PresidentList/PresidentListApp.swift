//
//  PresidentListApp.swift
//  PresidentList
//
//  Created by Kalebu Patan on 4/15/24.
//

import SwiftUI

@main
struct PresidentListApp: App {
    var body: some Scene {
        WindowGroup {
            PresidentListView()
                .environment(PresidentListManager())
        }
    }
}
