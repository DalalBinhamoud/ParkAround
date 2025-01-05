//
//  ReservationsHistoryView.swift
//  ParkAround
//
//  Created by Dalal Macbook on 04/01/2025.
//

import SwiftUI
import SwiftData

struct ReservationsHistoryView<ViewModel>: View where ViewModel: ReservationsHistoryViewModelProtocol {

    // MARK: - Properties

    @Environment(\.modelContext) var context

       @Query private var reservations: [ParkingReservation]
    // MARK: - Init


    @StateObject private var viewModel: ViewModel

    // MARK: - Init

    init(viewModel: ViewModel) {
        _viewModel = .init(wrappedValue: viewModel)
    }


    var body: some View {
        VStack {
            Text("Reservations History")
            ForEach(reservations) { reservation in
                Text(reservation.address.description)
            }

        }
        .onAppear {
            Task {
                await viewModel.onAppear()
            }
        }
    }
}

#Preview {

    class ViewModelFixture: ReservationsHistoryViewModelProtocol {
        var reservations: [ParkingReservation] = []
        var isLoading = false
        func onAppear() async {/* Preview */}
    }

    return ReservationsHistoryView(
        viewModel: ViewModelFixture()
    )
}
