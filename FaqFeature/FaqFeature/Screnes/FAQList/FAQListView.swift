//
//  FAQListView.swift
//  FaqFeature
//
//  Created by Islas Girão Garcia on 05/02/21.
//  Copyright © 2021 Islas Girão Garcia. All rights reserved.
//

import UIKit

class FAQListView: UIView {

    typealias TableViewConfiguration = UITableViewDelegate & UITableViewDataSource
    
    typealias ButtonAction = (() -> Void)
    
    private weak var tableViewConfiguration: TableViewConfiguration?
    
    private var buttonAction: (() -> Void)?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self.tableViewConfiguration
        tableView.dataSource = self.tableViewConfiguration
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        return tableView
    }()
    
    lazy var bottomButton: SnowButton = {
        let button = SnowButton(title: "Adicionar pergunta")
        return button
    }()
    
    init(tableViewConfiguration: TableViewConfiguration, buttonAction: ButtonAction){
        super.init(frame: .zero)
        self.tableViewConfiguration = tableViewConfiguration
        initialize()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FAQListView{
    
    fileprivate func initialize(){
        backgroundColor = .white
        addSubview(tableView)
        addSubview(bottomButton)
        guard let buttonAction = buttonAction else {return}
        bottomButton.action = buttonAction
    }
    
    fileprivate func setupConstraints(){
        
        bottomButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        bottomButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        bottomButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        bottomButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomButton.topAnchor, constant: -16).isActive = true
    }
}
