//
//  Binding+SlideOutMenuPresentationMode.swift
//  
//
//  Created by Max Valek on 6/19/23.
//

import SwiftUI

// Binding extension with function to handle presentation mode binding
extension Binding where Value == Bool {
    
    // called on a boolean binding, creates drawer presentation mode binding with the boolean
    func mappedToSlideOutMenuPresentationMode() -> Binding<SlideOutMenuPresentationMode> {
        Binding<SlideOutMenuPresentationMode>(
            get: {
                SlideOutMenuPresentationMode(isOpened: self)
            },
            set: { newValue in
                self.wrappedValue = newValue.isOpened
            }
        )
    }
}
