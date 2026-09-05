//
//  PostController.swift
//  NetworkingPractice
//
//  Created by Javid Sultanov on 05.09.26.
//

import UIKit

class PostsController: UIViewController {
    private lazy var postsTableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private let viewModel = PostsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureConstraints()
        configureViewModel()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "Posts"
    }
    
    private func configureConstraints() {
        view.addSubview(postsTableView)
        
        NSLayoutConstraint.activate([
            postsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            postsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func configureViewModel() {
        viewModel.success = {
            self.postsTableView.reloadData()
        }
        viewModel.error = { error in
            print(error)
        }
        viewModel.getPostItems()
    }
}

extension PostsController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = viewModel.posts[indexPath.row].title
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        cell.textLabel?.numberOfLines = 0

        cell.detailTextLabel?.text = viewModel.posts[indexPath.row].body
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        cell.detailTextLabel?.numberOfLines = 0
        return cell
    }
    
    
}
