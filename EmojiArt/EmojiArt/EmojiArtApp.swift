//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Eduarda Gislon on 13/02/24.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: EmojiArtDocument())
        }
    }
}
