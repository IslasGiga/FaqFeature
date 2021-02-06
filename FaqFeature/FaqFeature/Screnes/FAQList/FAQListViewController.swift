//
//  FaqListViewController.swift
//  FaqFeature
//
//  Created by Islas Girão Garcia on 05/02/21.
//  Copyright © 2021 Islas Girão Garcia. All rights reserved.
//

import UIKit

class FAQListViewController: UIViewController {
    
    lazy var customView: FAQListView = {
        let view = FAQListView(tableViewConfiguration: self, buttonAction: didTapButton)
        view.tableView.register(FAQTableViewCell.self, forCellReuseIdentifier: FAQTableViewCell.id)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Perguntas frequentes"
        
    }
    
    override func loadView(){
        super.loadView()
        view = customView
    }
}

extension FAQListViewController{
    func didTapButton(){
        //TODO: Go to createNewFaq
    }
}

extension FAQListViewController: UITableViewDelegate{
    
}

extension FAQListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FAQTableViewCell.id, for: indexPath) as? FAQTableViewCell else{
            print("Deu ruim!")
            return UITableViewCell()
        }
        return cell
    }
    
    
}


