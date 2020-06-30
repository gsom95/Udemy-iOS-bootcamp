//
//  WebView.swift
//  HackerNews
//
//  Created by Igor on 30.06.2020.
//  Copyright © 2020 GsomGsom. All rights reserved.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {

    let urlString: String?

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let urlString = urlString, let url = URL(string: urlString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
    }
}
