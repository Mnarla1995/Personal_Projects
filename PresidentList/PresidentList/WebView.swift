//
//  WebView.swift
//  PresidentList
//
//  Created by Kalebu Patan on 4/15/24.
//

import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {
    
    let urlString: String
    
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: URL(string:urlString)!))
    }
    
}
