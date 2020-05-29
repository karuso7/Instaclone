//
//  KeyboardAdaptive.swift
//  Instaclone
//
//  Created by Karsten Krause on 29.05.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import SwiftUI
import Combine

// MARK: Klasse zur Tasterturhöhen Ermittlung
struct KeyboardAdaptive: ViewModifier {
    @State private var bottomPadding: CGFloat = 0

    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .padding(.bottom, self.bottomPadding)
                .onReceive(Publishers.keyboardHeight) { keyboardHeight in
                    let keyboardTop = geometry.frame(in: .global).height - keyboardHeight
                    let focusedTextInputBottom = UIResponder.currentFirstResponder?.globalFrame?.maxY ?? 0
                    self.bottomPadding = max(0, focusedTextInputBottom - keyboardTop+100 - geometry.safeAreaInsets.bottom)
            }
            .animation(.easeOut(duration: 0.16))
        }
    }
}





// MARK: - Extensions

// Struct KeyboardAdaptive verfügbar machen ich jeder View
extension View {
    func keyBoardAdaptive() -> some View {
        ModifiedContent(content: self, modifier: KeyboardAdaptive())
    }
}


// MARK: Erweiterung des Publisher Protocols zur Erkennung der Keyboard-Höhe
extension Publishers {
    
    // statische Keyboard-Höhe: SwiftUI erkennt dann automatisch, wenn sich die Keyboardhöhe ändert (z.B durch Auswahl durch ein anderen Keyboard-Typ
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        
        //  Anzeigen des Keyboard am untersten Punkt des Views, damit das Keyboard von unten nach oben fahren kann.
        let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
            .map { $0.keyboardHeight }
        
        // Ausblenden des Keyboards bis zum untersten Punkt des Views
        let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }
        
        // Updatet den View-Status mit den letzten ermittelten Wert der Keyboard-Höhe
        return MergeMany(willShow, willHide)
            .eraseToAnyPublisher()
    }
}


extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}




extension UIResponder {
    private static weak var _currentFirstResponder: UIResponder?
    
    static var currentFirstResponder: UIResponder? {
        _currentFirstResponder = nil
        UIApplication.shared.sendAction(#selector(UIResponder.findFirstResponder(_:)), to: nil, from: nil, for: nil)
        return _currentFirstResponder
    }

    

    @objc private func findFirstResponder(_ sender: Any) {
        UIResponder._currentFirstResponder = self
    }
    
    var globalFrame: CGRect? {
        guard let view = self as? UIView else { return nil }
        return view.superview?.convert(view.frame, to: nil)
    }
}

