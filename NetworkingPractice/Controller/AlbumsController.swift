//
//  AlbumsController.swift
//  NetworkingPractice
//
//  Created by Javid Sultanov on 05.09.26.
//

import UIKit

class AlbumsController: UIViewController {
    private lazy var albumsTableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.bounces = false
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private let viewModel = AlbumsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureConstraints()
        configureViewModel()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "Albums"
    }
    
    private func configureConstraints() {
        view.addSubview(albumsTableView)
        
        NSLayoutConstraint.activate([
            albumsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            albumsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            albumsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            albumsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func configureViewModel() {
        viewModel.success = {
            self.albumsTableView.reloadData()
        }
        viewModel.error = { error in
            print(error)
        }
        viewModel.getAlbums()
    }
}

extension AlbumsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = viewModel.albums[indexPath.row].title
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}
