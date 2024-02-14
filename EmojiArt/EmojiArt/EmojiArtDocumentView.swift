//
//  EmojiArtDocumentView.swift
//  EmojiArt
//
//  Created by Eduarda Gislon on 13/02/24.
//

import SwiftUI

struct EmojiArtDocumentView: View {
    @ObservedObject var document: EmojiArtDocument
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(EmojiArtDocument.palette.map { String($0) }, id: \.self) { emoji in
                        Text(emoji)
                            .font(Font.system(size: defaultEmojiSize))
                    }
                }
            }.padding(.horizontal)
            Rectangle().foregroundColor(.yellow)
                .edgesIgnoringSafeArea([.horizontal,.bottom])
                .onDrop(of: ["public.image"], isTargeted: nil) { providers, location in
                    return drop(providers: providers)
                    
                }
        }
    }
    private func drop(providers: [NSItemProvider]) -> Bool {
        let found = providers.loadFirstObject(ofType: URL.self) { url in
            print("dropped \(url)")
            document.setBackgroundURL(url)
        }
        return found
    }
    
    
    private let defaultEmojiSize: CGFloat = 40
}

