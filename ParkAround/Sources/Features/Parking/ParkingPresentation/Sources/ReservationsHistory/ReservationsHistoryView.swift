//
//  ReservationsHistoryView.swift
//  ParkAround
//
//  Created by Dalal Macbook on 04/01/2025.
//

import SwiftData
import SwiftUI

struct ReservationsHistoryView<ViewModel>: View where ViewModel: ReservationsHistoryViewModelProtocol {

    // MARK: - Properties
    @Environment(\.modelContext) var context
    @Query private var reservations: [ParkingReservation]
    @StateObject private var viewModel: ViewModel

    // MARK: - Init
    init(viewModel: ViewModel) {
        _viewModel = .init(wrappedValue: viewModel)
    }

    // MARK: - Body
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                if reservations.count == 0 {
                    Spacer()
                    emptyList
                    Spacer()
                } else {
                    ScrollView {
                        ForEach(reservations) { reservation in
                            reservationCard(reservation: reservation)
                        }
                    }

                }
            }
            .padding()
            .navigationTitle("Reservations History")
        }
        .onAppear {
            Task {
                await viewModel.onAppear()
            }
        }
    }
}

extension ReservationsHistoryView {
    @ViewBuilder private var emptyList: some View {
        VStack(spacing: Spacing.medium) {
            Image("no-parking-reservation", bundle: .main)
                .resizable()
                .scaledToFit()
                .frame(width: IconSize.large, height: IconSize.large)

            Text("No Past Reservations")
                .foregroundStyle(Colors.text)
                .font(Fonts.subheading)

            Text("You don't have any reservations yet. please select your preferred parking spot from the map")
                .foregroundStyle(Colors.text)
                .lineSpacing(Spacing.small)
                .multilineTextAlignment(.center)
                .font(Fonts.body)
        }
    }

   private func reservationCard(reservation: ParkingReservation) -> some View {
       VStack(alignment: .leading) {
            MakeRow(imageName: "calendar", title: reservation.date.formatted(date: .abbreviated, time: .shortened))

           Divider()
               .frame(height: 2)
               .background(Colors.text)

            MakeRow(imageName: "mappin.and.ellipse", title: reservation.address.description)
            MakeRow(imageName: "dollarsign.circle", title: "\(reservation.cost)")
        }
       .padding()
//       .frame(maxWidth: .infinity)
       .background(Colors.primary)
       .cornerRadius(CornerRadius.large)
       .shadow(radius: 3)
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
