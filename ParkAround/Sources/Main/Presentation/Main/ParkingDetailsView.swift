//
//  ParkingDetailsView.swift
//  ParkAround
//
//  Created by Dalal Macbook on 03/01/2025.
//

import SwiftUI

struct ParkingDetailsView<ViewModel>: View where ViewModel: ParkingDetailsViewModelProtocol {

    // MARK: - Properties
    @StateObject private var viewModel: ViewModel

    // MARK: - Init
    init(viewModel: ViewModel) {
        _viewModel = .init(wrappedValue: viewModel)
    }

    // MARK: - Body
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                Colors.background
                    .ignoresSafeArea()

                VStack(alignment: .leading) {
                    content

                    Divider() // TODO: - increase hight

                    TimeSlotsView(selectedTime: $viewModel.selectedTime)
                        .padding(.vertical, Spacing.large)

                    Divider() // TODO: - increase hight
                    Spacer()
                    Spacer()

                    paymentSection
                }
                .padding(.horizontal)
                .navigationTitle("Parking Reservation")
            }
        }
    }
}

extension ParkingDetailsView {
   private var content: some View {
       Group {
            Text(viewModel.parkingDetails.name)
                .foregroundStyle(Colors.text)
                .font(Fonts.heading)

           Text(viewModel.parkingDetails.parkingStatus.rawValue)

            HStack {
                Image(systemName: "location")
                Text(viewModel.parkingDetails.address.description)
            }

            HStack {
                Image(systemName: "location")
                Text("\(viewModel.parkingDetails.availableSpots)/\(viewModel.parkingDetails.totalSpots) Total spots available")
                    .font(Fonts.caption)
            }
        }
    }

    private var paymentSection: some View {
        VStack {
            HStack {
                Text("Amount to pay:")
                    .foregroundStyle(Colors.text)
                    .font(Fonts.subheading)
                Spacer()
                Text("\(viewModel.totalPrice) SAR")
            }

            PrimaryButton(label: "Pay", action: {
                Task {
                    await viewModel.processPayment()
                }
            })
            .disabled(viewModel.isLoading)
        }

    }
}

#Preview {
    class ViewModelFixture: ParkingDetailsViewModelProtocol {
        var selectedTime = 1
        var totalPrice = 10.0
        var isLoading = false
        var parkingDetails = ParkingDetails.StubFactory.make()
        func processPayment() async { }
    }
    return ParkingDetailsView(viewModel: ViewModelFixture())
}
