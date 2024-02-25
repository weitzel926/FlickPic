//
//  DescriptionView.swift
//  FlickPic
//
//  Created by Wade Weitzel on 2/21/24.
//

import SwiftUI
import WebKit

struct DescriptionView: View {
    let photoList: PhotoList
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            // TODO: Handle this better
            if let photo = photoList.selectedPhoto {
                Text(photo.title)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                WebView(html: photo.description)
            }
        }
        .safeAreaInset(edge: .top, alignment: .trailing) {
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.black)
                    .font(.title)
            }
        }
        .padding()
    }
}

struct WebView: UIViewRepresentable {
    let html: String
    
    func makeUIView(context: Context) -> WKWebView  {
        let webView = WKWebView()
        webView.loadHTMLString(html, baseURL: nil)
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
}

#Preview {
    guard let link = URL(string: "https://picsum.photos/300/200"),
          let mediaLink = URL(string: "https://picsum.photos/300/200"),
          let datePublished = Date.createDate(month: 12, day: 25, year: 2023) else {
        fatalError("Could not create URLs, should never happen")
    }
    
    let photo = Photo.fixture(link: link, mediaLink: mediaLink, datePublished: datePublished)
    
    let manager = PhotoListManager()
    let photoList = PhotoList(manager: manager)
    photoList.photos = [photo]
    photoList.setSelectedPhoto(photo: photo)
    
    return DescriptionView(photoList: photoList)
}
