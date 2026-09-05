//
//  PostController.swift
//  NetworkingPractice
//
//  Created by Javid Sultanov on 05.09.26.
//

import UIKit

class PostsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "Posts"
    }
}
