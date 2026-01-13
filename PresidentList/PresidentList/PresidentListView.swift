//
//  PresidentListView.swift
//  PresidentList
//
//  Created by Kalebu Patan on 4/15/24.
//

import SwiftUI

struct PresidentListView: View {
    
    @Environment(PresidentListManager.self) private var presidentListManager
    @State private var selection: President?
    @State private var visibility: NavigationSplitViewVisibility = .all
    
    var body: some View {
        NavigationSplitView(columnVisibility: $visibility) {
            List(selection: $selection) {
                ForEach(presidentListManager.getPresidentsList()) { president in
                    NavigationLink(value: president) {
                        if let name = president.name {
                            Text(name)
                        }
                    }
                }
                .navigationTitle(K.presidentList)
                .onAppear {
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        selection = presidentListManager.getPresidentsList().first
                    }
                }
            }
        } detail: {
            if let president = selection, let urlString = president.url, let name = president.name {
                WebView(urlString: urlString)
                    .navigationTitle(name)
            }
        }
        .navigationSplitViewStyle(.balanced)
    }
    
    
}

#Preview {
    PresidentListView()
}
