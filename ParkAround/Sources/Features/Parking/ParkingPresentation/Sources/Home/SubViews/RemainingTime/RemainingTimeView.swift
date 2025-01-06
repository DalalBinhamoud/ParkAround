//
//  RemainingTimeView.swift
//  ParkAround
//
//  Created by Dalal Macbook on 06/01/2025.
//

import SwiftUI

struct RemainingTimeView<ViewModel>: View  where ViewModel: RemainingTimeViewModelProtocol {

    // MARK: - Properties
    @ObservedObject var viewModel: ViewModel

    // MARK: - Init
    init(viewModel: ViewModel){
        _viewModel = .init(wrappedValue: viewModel)
    }
    // MARK: - Body
    var body: some View {
        VStack {
            if viewModel.isSessionActive {
                Text("Remaining Time: \(viewModel.remainingTimeString)")
            }
        }
    }
}

#Preview {
    class ViewModelFixture: RemainingTimeViewModelProtocol {
        var isSessionActive = true
        var remainingTimeString = "1:0:0"
    }
    return RemainingTimeView(viewModel: ViewModelFixture())
}
