//
//  DetailView.swift
//  HackerNews
//
//  Created by Igor on 29.06.2020.
//  Copyright © 2020 GsomGsom. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    let url: String?

    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.example.com")
    }
}
