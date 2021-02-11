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
    
    var loadingVC: LoadingViewController?
    
    var searchController: UISearchController!
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
      return (searchController?.isActive ?? false) && !isSearchBarEmpty
    }
    
    private var viewModel: FAQListViewModel
    
    init(viewModel: FAQListViewModel){
        self.viewModel = viewModel
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Perguntas frequentes"
        viewModel.getFAQList()
        loadingVC = LoadingViewController()
        configBinds()
        configSearchController()
    }
    
    override func loadView(){
        super.loadView()
        view = customView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func configBinds(){
        viewModel.loading.bind{ (isLoading) in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                isLoading ?
                    self.loadingVC?.show(on: self) :
                    self.loadingVC?.hide()
            }
        }
        
        viewModel.error.bind{ error in
            guard let error = error else {return}
            let alert = UIAlertController(title: "Erro!", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                alert.dismiss(animated: true, completion: nil)
            }))
            DispatchQueue.main.async { [weak self] in
                self?.present(alert, animated: true, completion: nil)
            }
        }
        
        viewModel.list.bind{ list in
            DispatchQueue.main.async { [weak self] in
                self?.customView.tableView.reloadData()
            }
        }
        
        viewModel.filteredList.bind { (filteredList) in
            DispatchQueue.main.async { [weak self] in
                self?.customView.tableView.reloadData()
            }
        }
    }
    
    func configSearchController(){
        let searchButton = UIBarButtonItem(image: UIImage.init(named: "search"), landscapeImagePhone: UIImage.init(named: "search"), style: .plain, target: self, action:
            #selector(showSearchBar(sender:)))
        searchButton.tintColor = .white
        navigationItem.rightBarButtonItem = searchButton
    }
    
    @objc private func showSearchBar(sender: UIBarButtonItem){
        
        if let searchController = searchController, searchController.isActive{
            navigationController?.dismiss(animated: true, completion: nil)
        }else if let searchController = searchController{
            present(searchController, animated: true, completion: nil)
        }else{
            searchController = UISearchController(searchResultsController: nil)
            searchController.hidesNavigationBarDuringPresentation = false
            searchController.automaticallyShowsCancelButton = true
            searchController.searchResultsUpdater = self
            searchController.delegate = self
            searchController.searchBar.tintColor = .white
            UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            
            navigationItem.searchController = searchController
            definesPresentationContext = true
            self.extendedLayoutIncludesOpaqueBars = true
            present(searchController, animated: true, completion: nil)
        }
    }
}

extension FAQListViewController{
    func didTapButton(){
        //TODO: put this on coordinator
        let repository = viewModel.repository
        let viewModel = NewFAQViewModel(repository: repository)
        let vc = NewFAQViewController(viewModel: viewModel)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func filterFaqListForSearchText(_ searchText: String){
        viewModel.filterFaqListForSearchText(searchText)
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
        return viewModel.numberOfRowsInSection(isFiltering: isFiltering)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FAQTableViewCell.id, for: indexPath) as? FAQTableViewCell else{
            return UITableViewCell()
        }
        
        let model = viewModel.faqForRoll(atIndexPath: indexPath, isFiltering: isFiltering)
        cell.setup(model: model)
        return cell
    }
    
    
}

extension FAQListViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        viewModel.filterFaqListForSearchText(searchBar.text!)
    }
}

extension FAQListViewController: UISearchControllerDelegate{
    func willDismissSearchController(_ searchController: UISearchController) {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .snowBlue
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white,
                                             .font: UIFont.arialBoldFont(withSize: 18)]
        navigationController?.navigationBar.tintColor = .white
    }
}
