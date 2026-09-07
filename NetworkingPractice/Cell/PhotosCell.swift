//
//  PhotosCell.swift
//  NetworkingPractice
//
//  Created by Javid Sultanov on 07.09.26.
//

import UIKit

class PhotosCell: UICollectionViewCell {
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        configureConstraints()
    }
    
    private func configureConstraints() {
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            nameLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -20),
            nameLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 20)
        ])
    }
    
    func configureCell(photo: Photo) {
        imageView.image = nil
        nameLabel.text = photo.author
        imageView.loadImage(urlString: photo.download_url)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIImageView {
    func loadImage(urlString: String?) {
        guard let urlString,
              let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data else {
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}
