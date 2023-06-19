//
//  SlideOutMenuPresentationMode.swift
//  
//
//  Created by Max Valek on 6/19/23.
//

import SwiftUI

struct SlideOutMenuPresentationMode {
    
    // _ to show its the private one (?)
    @Binding private var _isOpened: Bool
    
    init(isOpened: Binding<Bool>) {
        // 2 _s since _isOpened already has one
        __isOpened = isOpened
    }
    
    public var isOpened: Bool {
        _isOpened
    }
    
    public mutating func open() {
        if !_isOpened {
            _isOpened = true
        }
    }
    
    public mutating func close() {
        if _isOpened {
            _isOpened = false
        }
    }
}
