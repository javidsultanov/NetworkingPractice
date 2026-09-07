//
//  UserController.swift
//  NetworkingPractice
//
//  Created by Javid Sultanov on 06.09.26.
//

import UIKit

class UserDescriptionController: UIViewController {
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var companyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let viewModel = UserDescriptionViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureConstraints()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        title = viewModel.user?.name
        
        userNameLabel.text = "Username: \(viewModel.user?.username ?? "")"
        emailLabel.text = "Email: \(viewModel.user?.email ?? "")"
        phoneLabel.text = "Phone: \(viewModel.user?.phone ?? "")"
        companyLabel.text = "Company: \(viewModel.user?.company?.name ?? "")"
        addressLabel.text = "Address: \(viewModel.user?.address?.street ?? ""), \(viewModel.user?.address?.suite ?? ""), \(viewModel.user?.address?.city ?? "") / \(viewModel.user?.address?.zipcode ?? "")"
    }
    
    private func configureConstraints() {
        view.addSubview(userNameLabel)
        view.addSubview(emailLabel)
        view.addSubview(phoneLabel)
        view.addSubview(companyLabel)
        view.addSubview(addressLabel)
        
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            userNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            emailLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),
            
            phoneLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20),
            phoneLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            
            companyLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 20),
            companyLabel.leadingAnchor.constraint(equalTo: phoneLabel.leadingAnchor),
            
            addressLabel.topAnchor.constraint(equalTo: companyLabel.bottomAnchor, constant: 20),
            addressLabel.leadingAnchor.constraint(equalTo: companyLabel.leadingAnchor),
            addressLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
