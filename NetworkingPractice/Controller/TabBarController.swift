//
//  TabBarController.swift
//  NetworkingPractice
//
//  Created by Javid Sultanov on 05.09.26.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    private func configureUI() {
        let postsController = PostsController()
        postsController.tabBarItem = .init(title: "Posts",
                                           image: UIImage(systemName: "list.clipboard"),
                                           tag: 0)
        let postsNavigation = UINavigationController(rootViewController: postsController)
        
        let photosController = PhotosController()
        photosController.tabBarItem = .init(title: "Photos",
                                            image: UIImage(systemName: "photo"),
                                            tag: 0)
        let photosNavigation = UINavigationController(rootViewController: photosController)
        
        let albumsController = AlbumsController()
        albumsController.tabBarItem = .init(title: "Albums",
                                            image: UIImage(systemName: "square.stack"),
                                            tag: 0)
        let albumsNavigation = UINavigationController(rootViewController: albumsController)
        
        let usersController = UsersController()
        usersController.tabBarItem = .init(title: "Users",
                                           image: UIImage(systemName: "person"),
                                           tag: 0)
        let usersNavigation = UINavigationController(rootViewController: usersController)
        
        viewControllers = [postsNavigation, photosNavigation, albumsNavigation, usersNavigation]
    }
}
