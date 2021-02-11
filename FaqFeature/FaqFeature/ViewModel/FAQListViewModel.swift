//
//  FAQListViewModel.swift
//  FaqFeature
//
//  Created by Islas Girão Garcia on 09/02/21.
//  Copyright © 2021 Islas Girão Garcia. All rights reserved.
//

import Foundation

class FAQListViewModel{
    
    var loading: Bindable<Bool> = Bindable(false)
    var error: Bindable<Error?> = Bindable(nil)
    var list: Bindable<[FAQModel]> = Bindable([])
    var filteredList: Bindable<[FAQModel]> = Bindable([])
    
    var repository: FAQRepository
    
    init(repository: FAQRepository){
        self.repository = repository
    }
    
    public func getFAQList(){
        loading.value = true
        repository.updateFAQList { [weak self] (result) in
            guard let self = self else {return}
            self.loading.value = false
            switch result{
            case .success(let list): self.list.value = list
            case .failure(let error): self.error.value = error
            }
        }
    }
    
    public func numberOfRowsInSection(isFiltering: Bool) -> Int{
        return isFiltering ? filteredList.value.count : list.value.count
    }
    
    public func faqForRoll(atIndexPath indexPath: IndexPath, isFiltering: Bool) -> FAQModel{
        return isFiltering ? filteredList.value[indexPath.row] : list.value[indexPath.row]
    }
    
    public func filterFaqListForSearchText(_ searchText: String){
        filteredList.value = list.value.filter({
            $0.question.contains(searchText) || $0.answer.contains(searchText)
        })
    }
}
