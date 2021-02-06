//
//  FaqListViewController.swift
//  FaqFeature
//
//  Created by Islas Girão Garcia on 05/02/21.
//  Copyright © 2021 Islas Girão Garcia. All rights reserved.
//

import UIKit

class FAQListViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Perguntas frequentes"
    }
    
    override func loadView(){
        super.loadView()
        view = FAQListView(tableViewConfiguration: self, buttonAction: didTapButton)
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
        return UITableViewCell()
    }
    
    
}


