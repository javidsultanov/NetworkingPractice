//
//  PhotoDescriptionController.swift
//  NetworkingPractice
//
//  Created by Javid Sultanov on 07.09.26.
//

import UIKit

class PhotoDescriptionController: UIViewController {
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let viewModel = PhotoDescriptionViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureConstraints()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        title = viewModel.photo?.author
        
        imageView.loadImage(urlString: viewModel.photo?.download_url)
    }
    
    private func configureConstraints() {
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.92),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
