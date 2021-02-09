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
    
    var numberOfRowsInSection: Int{
        return list.value.count
    }
    
    private var repository: FAQRepository
    
    init(repository: FAQRepository){
        self.repository = repository
    }
    
    public func getFAQList(){
        loading.value = true
        repository.getAllFaq { [weak self] (result) in
            guard let self = self else {return}
            self.loading.value = false
            switch result{
            case .success(let list): self.list.value = list
            case .failure(let error): self.error.value = error
            }
        }
    }
    
    public func faqForRoll(atIndexPath indexPath: IndexPath) -> FAQModel{
        return list.value[indexPath.row]
    }    
}
