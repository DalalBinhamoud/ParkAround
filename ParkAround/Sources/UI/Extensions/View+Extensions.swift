//
//  View+Extensions.swift
//  ParkAround
//
//  Created by Dalal Macbook on 30/12/2024.
//

import Foundation
import SwiftUI

extension View {
    func overlay<T: View>(overlayView: T, show: Binding<Bool>) -> some View {
        modifier(Overlay(overlayView: overlayView, show: show))
    }
}


struct Overlay<T: View> : ViewModifier {

    let overlayView: T
    @Binding var show: Bool

    func body(content: Content) -> some View {
        ZStack(alignment: .top) {
            content
            if show {
                overlayView
            }
        }
    }
}
