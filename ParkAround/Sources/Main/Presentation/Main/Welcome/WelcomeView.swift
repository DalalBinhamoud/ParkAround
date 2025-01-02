//
//  WelcomeView.swift
//  ParkAround
//
//  Created by Dalal Macbook on 01/01/2025.
//

import SwiftUI

struct WelcomeView<ViewModel> : View where ViewModel: WelcomeViewModelProtocol {

    // MARK: - Properties
    @ObservedObject private var viewModel: ViewModel


    // MARK: - Init
    init(viewModel: ViewModel) {
        _viewModel = .init(wrappedValue: viewModel)
    }

    // MARK: - Body
    var body: some View {
        VStack {
            Text("Welcome")
            Button(action: {
                viewModel.onContinue()
            }, label: {
                Text("On Continue")
            })

        }
    }
}

#Preview {
    class ViewModelfixture: WelcomeViewModelProtocol {
        var onContinue = { }
    }
    return WelcomeView(
        viewModel: ViewModelfixture()
    )
}
