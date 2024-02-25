//
//  DetailView.swift
//  FlickPic
//
//  Created by Wade Weitzel on 2/19/24.
//

import SwiftUI
import WebKit

struct DetailView: View {
    let photoList: PhotoList
    // TODO: Is this the smoothest way to set this?
    let selectedPhoto: Photo
    
    @State var shouldPresentSheet = false
    
    var body: some View {
        VStack(spacing: 20) {
            // TODO: Handle this better
            Text(photoList.selectedPhoto?.title ?? "")
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .font(.title)
            HeadlineImage(url: photoList.selectedPhoto?.photoURL)
            Text("Author:")
                .fontWeight(.bold)
            // TODO: Handle this better
            Text(photoList.selectedPhoto?.author ?? "")
                .multilineTextAlignment(.center)
            // TODO: Handle this better
            NameValueLabel(name: "Date Published:", value: "\(photoList.selectedPhoto?.datePublishedString ?? "")")
            NavigationLink {
                AddFavoriteView(photoList: photoList)
            } label: {
                Text("Add As A Favorite")
            }
            Button() {
                shouldPresentSheet.toggle()
            } label: {
                Text("See Detailed Description")
            }
        }
        .padding()
        .sheet(isPresented: $shouldPresentSheet) {
        } content: {
            // TODO: Consider injecting the model instead
            DescriptionView(photoList: photoList)
        }
        .onAppear() {
            photoList.setSelectedPhoto(photo: selectedPhoto)
        }
    }
}

struct NameValueLabel: View {
    let name: String
    let value: String
    
    var body: some View {
        HStack {
            Text(name)
                .fontWeight(.bold)
            Text(value)
                .multilineTextAlignment(.center)
        }
    }
}

//#Preview {
//    guard let link = URL(string: "https://picsum.photos/300/200"),
//          let mediaLink = URL(string: "https://picsum.photos/300/200"),
//          let datePublished = Date.createDate(month: 12, day: 25, year: 2023) else {
//        fatalError("Could not create URLs, should never happen")
//    }
//    
//    let photo = Photo.fixture(link: link, mediaLink: mediaLink, datePublished: datePublished)
//    return DetailView(photo: photo)
//}

