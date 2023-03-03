//
//  GaleryAppApp.swift
//  GaleryApp
//
//  Created by Mateusz on 03/03/2023.
//

import SwiftUI

@main
struct GalleryAppApp: App {
    var body: some Scene {
        WindowGroup {
            GalleryView(gallery: GalleryModelView())
        }
    }
}
