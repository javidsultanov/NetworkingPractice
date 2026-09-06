//
//  AlbumsViewModel.swift
//  NetworkingPractice
//
//  Created by Javid Sultanov on 06.09.26.
//

import Foundation

class AlbumsViewModel {
    var albums: [Albums] = []
    
    private let manager = NetworkingManager()
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func getAlbums() {
        manager.getAlbumItems { data, error in
            if let data {
                self.albums = data
                self.success?()
            } else if let error {
                self.error?(error)
            }
        }
    }
}
