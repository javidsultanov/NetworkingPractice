//
//  PhotosController.swift
//  NetworkingPractice
//
//  Created by Javid Sultanov on 05.09.26.
//

import UIKit

class PhotosController: UIViewController {
    private lazy var photosCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(PhotosCell.self, forCellWithReuseIdentifier: "PhotosCell")
        collection.delegate = self
        collection.dataSource = self
        collection.bounces = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private let viewModel = PhotosViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureConstraints()
        configureViewModel()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "Photos"
    }
    
    private func configureConstraints() {
        view.addSubview(photosCollectionView)
        
        NSLayoutConstraint.activate([
            photosCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photosCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            photosCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.96),
            photosCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func configureViewModel() {
        viewModel.success = {
            self.photosCollectionView.reloadData()
        }
        viewModel.error = { error in
            print(error)
        }
        viewModel.getPhotos()
    }
}

extension PhotosController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCell", for: indexPath) as? PhotosCell else {
            return UICollectionViewCell()
        }
        
        cell.configureCell(photo: viewModel.photos[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = PhotoDescriptionController()
        controller.viewModel.photo = viewModel.photos[indexPath.item]
        controller.hidesBottomBarWhenPushed = true
        navigationController?.show(controller, sender: self)
    }
}

extension PhotosController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: photosCollectionView.frame.width, height: 200)
    }
}
