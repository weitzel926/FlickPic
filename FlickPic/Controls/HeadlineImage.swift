//
//  HeadlineImage.swift
//  FlickPic
//
//  Created by Wade Weitzel on 2/22/24.
//

import SwiftUI

struct HeadlineImage: View {
    let url: URL?
    
    var body: some View {
        if let url = url {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 250, maxHeight: 250)
            } placeholder: {
                PlaceholderImage()
            }
            .transaction { transaction in
                transaction.animation = .easeInOut(duration: 0.25)
            }
        } else {
            PlaceholderImage()
        }
    }
}

struct PlaceholderImage: View {
    var body: some View {
        Rectangle()
            .fill(.gray)
            .frame(maxWidth: 250, maxHeight: 250)
    }
}

#Preview {
    guard let link = URL(string: "https://picsum.photos/300/200") else {
        fatalError("Should never happen")
    }
    
    return HeadlineImage(url: link)
}
