//
//  Observable.swift
//  SeSAC3Week6
//
//  Created by NAM on 2023/09/19.
//

import Foundation
class Observable<T> {
    
    
    private var listner: ((T) -> Void)?
    
    var value: T {
        didSet {
            listner?(value)
            
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ sample: @escaping (T) -> Void) {
        
        sample(value)
        
        listner = sample
        
    }
    
}
