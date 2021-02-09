//
//  Bindable.swift
//  FaqFeature
//
//  Created by Islas Girão Garcia on 09/02/21.
//  Copyright © 2021 Islas Girão Garcia. All rights reserved.
//

import Foundation

public class Bindable<T>{
    
    public typealias BindType = ((T) -> Void)
    
    public var bindList: [BindType] = []
    
    
    public var value: T{
        didSet{
            execBindList()
        }
    }
    
    public init(_ value: T){
        self.value = value
    }
    
    public func bind(skip: Bool = false, _ bind: @escaping BindType){
        bindList.append(bind)
        guard skip else{
            bind(value)
            return
        }
    }
    
    public func remove(){
        _ = bindList.popLast()
    }
    
    private func execBindList(){
        bindList.forEach({ [unowned self] bind in
            bind(self.value)
        })
    }
}
