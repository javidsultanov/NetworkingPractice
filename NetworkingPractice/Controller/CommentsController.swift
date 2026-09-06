//
//  CommentsController.swift
//  NetworkingPractice
//
//  Created by Javid Sultanov on 06.09.26.
//

import UIKit

class CommentsController: UIViewController {
    private lazy var commentsTableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.bounces = false
        table.showsVerticalScrollIndicator = false
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private let viewModel: CommentsViewModel
        
    init(postId: Int) {
        viewModel = CommentsViewModel(postId: postId)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureConstraints()
        configureViewModel()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        title = "Comments"
    }
    
    private func configureConstraints() {
        view.addSubview(commentsTableView)
        
        NSLayoutConstraint.activate([
            commentsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            commentsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            commentsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            commentsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func configureViewModel() {
        viewModel.success = {
            self.commentsTableView.reloadData()
        }
        viewModel.error = { error in
            print(error)
        }
        viewModel.getComments()
    }
}

extension CommentsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = [viewModel.comments[indexPath.row].name, viewModel.comments[indexPath.row].email].compactMap({ $0 }).joined(separator: ", ")
        cell.textLabel?.numberOfLines = 0
        
        cell.detailTextLabel?.text = viewModel.comments[indexPath.row].body
        cell.detailTextLabel?.numberOfLines = 0
        return cell
    }
}
