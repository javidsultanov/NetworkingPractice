//
//  PhotosViewModel.swift
//  NetworkingPractice
//
//  Created by Javid Sultanov on 07.09.26.
//

import Foundation

class PhotosViewModel {
    var photos: [Photo] = []
    
    private let manager = NetworkingManager()
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func getPhotos() {
        manager.getPhotoItems { data, error in
            if let data {
                self.photos = data
                self.success?()
            } else if let error {
                self.error?(error)
            }
        }
    }
}
