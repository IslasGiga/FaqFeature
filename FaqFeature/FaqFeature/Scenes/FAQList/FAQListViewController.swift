//
//  FaqListViewController.swift
//  FaqFeature
//
//  Created by Islas Girão Garcia on 05/02/21.
//  Copyright © 2021 Islas Girão Garcia. All rights reserved.
//

import UIKit
import Firebase

class FAQListViewController: UIViewController {
    
    lazy var customView: FAQListView = {
        let view = FAQListView(tableViewConfiguration: self, buttonAction: didTapButton)
        view.tableView.register(FAQTableViewCell.self, forCellReuseIdentifier: FAQTableViewCell.id)
        view.tableView.rowHeight = UITableView.automaticDimension
        view.tableView.estimatedRowHeight = 120
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Perguntas frequentes"
        let db = Firestore.firestore()
        db.collection("faq").getDocuments { (snapshot, error) in
            if let error = error{
                print(error.localizedDescription)
            }else if let snapshot = snapshot{
                for document in snapshot.documents{
                    print(document.data())
                }
            }else{
                print("Snapshot nulo")
            }
        }
    }
    
    override func loadView(){
        super.loadView()
        view = customView
    }
}

extension FAQListViewController{
    func didTapButton(){
        navigationController?.pushViewController(NewFAQViewController(), animated: true)
    }
}

extension FAQListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? FAQTableViewCell else {
            return
        }
        cell.contentView.backgroundColor = .white
        cell.backgroundColor = .white
        tableView.beginUpdates()
        cell.expanded = !(cell.expanded)
        tableView.endUpdates()
    }
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
        cell.setup(viewModel: FAQCellViewModel(question: "Question", answer: "Loren Ipsun Dolor, blablablablabalbalablablablabalbalbalbalablablablablabalbalbalbalbalablablablabalbalbalbalbalablablablablablablablabalbalbalbalablbalaa", color: .snowRed))
        
        return cell
    }
    
    
}

