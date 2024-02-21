//
//  DetailView.swift
//  FlickPic
//
//  Created by Wade Weitzel on 2/19/24.
//

import SwiftUI
import WebKit

struct DetailView: View {
    let photo: Photo
    
    @State var shouldPresentSheet = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text(photo.title)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .font(.title)
            
            HeadlineImage(url: photo.photoURL)
            Text("Author:")
                .fontWeight(.bold)
            Text(photo.author)
                .multilineTextAlignment(.center)
            NameValueLabel(name: "Date Published:", value: "\(photo.datePublishedString)")
            Button() {
                shouldPresentSheet.toggle()
            } label: {
                Text("See detailed description")
            }
        }
        .padding()
        .sheet(isPresented: $shouldPresentSheet) {
        } content: {
            DescriptionView(photo: photo)
        }
    }
}

struct HeadlineImage: View {
    let url: URL
    
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 250, maxHeight: 250)
        } placeholder: {
            Rectangle()
                .fill(.gray)
                .frame(maxWidth: 250, maxHeight: 250)
        }
        .transaction { transaction in
            transaction.animation = .easeInOut(duration: 0.25)
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

#Preview {
    guard let link = URL(string: "https://picsum.photos/300/200"),
          let mediaLink = URL(string: "https://picsum.photos/300/200"),
          let datePublished = Date.createDate(month: 12, day: 25, year: 2023) else {
        fatalError("Could not create URLs, should never happen")
    }
    
    let photo = Photo.fixture(link: link, mediaLink: mediaLink, datePublished: datePublished)
    return DetailView(photo: photo)
}

