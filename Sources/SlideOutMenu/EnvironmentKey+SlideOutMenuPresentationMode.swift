//
//  EnvironmentKey+SlideOutMenuPresentationMode.swift
//  
//
//  Created by Max Valek on 6/19/23.
//

import SwiftUI

// MARK: - DrawerPresentationMode + placeholder

extension SlideOutMenuPresentationMode {
    
    static var placeholder: SlideOutMenuPresentationMode {
        SlideOutMenuPresentationMode(isOpened: .constant(false))
    }
}

// MARK: - DrawerPresentationModeKey

private struct SlideOutMenuPresentationModeKey: EnvironmentKey {
    
    static var defaultValue: Binding<SlideOutMenuPresentationMode> = .constant(.placeholder)
}

// MARK: - EnvironmentValues + drawerPresentationMode

extension EnvironmentValues {
    
    var slideOutMenuPresentationMode: Binding<SlideOutMenuPresentationMode> {
        get { self[SlideOutMenuPresentationModeKey.self] }
        set { self[SlideOutMenuPresentationModeKey.self] = newValue }
    }
}
