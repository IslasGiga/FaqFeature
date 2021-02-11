//
//  NewFAQViewModel.swift
//  FaqFeature
//
//  Created by Islas Girão Garcia on 09/02/21.
//  Copyright © 2021 Islas Girão Garcia. All rights reserved.
//

import Foundation

class NewFAQViewModel{
    
    var loading: Bindable<Bool> = Bindable(false)
    var error: Bindable<Error?> = Bindable(nil)
    
    var repository: FAQRepository
    
    init(repository: FAQRepository){
        self.repository = repository
    }
    
    func saveFaq(_ model: FAQModel){
        loading.value = true
        repository.insetFaq(model) { [weak self] (error) in
            guard let self = self else {return}
            self.loading.value = false
            self.error.value = error
        }
    }
    
    
    
}
