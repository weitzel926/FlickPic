//
//  AddFavoriteView.swift
//  FlickPic
//
//  Created by Wade Weitzel on 2/22/24.
//

import SwiftUI

struct AddFavoriteView: View {
    let photoList: PhotoList
    
    @State var name: String = ""
    @State var rating: Int = 1
    
    var body: some View {
        VStack {
            Text("Add To Favorites")
                .font(.title)
                .fontWeight(.semibold)
            HeadlineImage(url: photoList.selectedPhoto?.photoURL)
            // TODO: Handle this better
            Text(photoList.selectedPhoto?.title ?? "")
                .fontWeight(.semibold)
            Form {
                TextField("Enter your comment", text: $name)
                Picker("Rating", selection: $rating) {
                    ForEach(1..<6) {
                        Text(String($0))
                    }
                }
            }
            Button {
                
            } label: {
                Text("Submit")
            }
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

    let manager = PhotoListManager()
    let photoList = PhotoList(manager: manager)
    photoList.photos = [photo]
    photoList.setSelectedPhoto(photo: photo)
    
    return AddFavoriteView(photoList: photoList)
}
