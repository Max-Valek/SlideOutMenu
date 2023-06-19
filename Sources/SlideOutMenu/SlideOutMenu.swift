import SwiftUI

public struct SlideOutMenu<Menu: View, Content: View>: View {
    
    @Binding private var isOpened: Bool
    private let menu: Menu
    private let content: Content
    
    
    public init(isOpened: Binding<Bool>,
        @ViewBuilder menu: () -> Menu,
        @ViewBuilder content: () -> Content) {
        _isOpened = isOpened
        self.menu = menu()
        self.content = content()
    }
    
    public var body: some View {
        ZStack(alignment: .leading) {
            content
            
            if isOpened {
                Color.clear
                    // so we can click on more that just open button
                    .contentShape(Rectangle())
                    .onTapGesture {
                        isOpened = false
                    }
                
                menu
                    .transition(.move(edge: .leading))
                    // without this, menu just went under content when dismissed
                    .zIndex(1)
            }
        }
        // animation invoked when isOpened changes
        .animation(.spring(), value: isOpened)
        // pass drawer presentation mode into env (pass to everything)
        .environment(\.slideOutMenuPresentationMode, $isOpened.mappedToSlideOutMenuPresentationMode())
    }
}

// MARK: - Preview

struct SlideOutMenu_Previews: PreviewProvider {
    
    // extracted view for content
    struct BackgroundView: View {
        
        @Environment(\.slideOutMenuPresentationMode) var slideOutMenuPresentationMode
        
        var body: some View {
            ZStack {
                Color.white
                Button {
                    slideOutMenuPresentationMode.wrappedValue.open()
                    //isOpened.toggle()
                } label: {
                    Text("Open")
                        .foregroundColor(Color.secondary)
                }

            }
        }
    }
    
    struct DrawerPrev: View {
        
        @State var isOpened = false
        
        var body: some View {
            SlideOutMenu(isOpened: $isOpened) {
                ZStack {
                    Color.gray
                    Text("Menu")
                }
                .frame(width: 200)
            } content: {
                BackgroundView()
            }

        }
    }
    
    static var previews: some View {
        DrawerPrev()
    }
}
