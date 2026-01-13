//
//  DessertCuisineApp.swift
//  DessertCuisine
//
//  Created by Kalebu Patan on 1/8/24.
//

import SwiftUI

@main
struct DessertCuisineApp: App {
    var body: some Scene {
        WindowGroup {
            DessertListView()
                .environmentObject(DessertViewModel())
        }
    }
}
