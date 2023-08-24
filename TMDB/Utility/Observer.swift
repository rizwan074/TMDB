//
//  Observer.swift
//  TMDB
//
//  Created by Rizwan Mehmood on 24/08/2023.
//

import Foundation



class ObservableListner<T> {
    
    typealias Listener = (T) -> Void
    
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(fire: Bool = false, listener: Listener?) {
        self.listener = listener
        if fire {
            listener?(value)
        }
    }
}
