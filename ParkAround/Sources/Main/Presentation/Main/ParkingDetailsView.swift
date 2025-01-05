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
    @State private var isAddedToFavorite = false

    // MARK: - Init
    init(viewModel: ViewModel) {
        _viewModel = .init(wrappedValue: viewModel)
    }

    // MARK: - Body
    var body: some View {
        ZStack {
                Colors.backgroundMedium
                    .ignoresSafeArea()

                VStack(alignment: .leading) {
                    content

                    Divider()
                        .frame(height: 2)
                        .background(Colors.text)
                        .padding(.top, Spacing.large)

                    TimeSlotsView(selectedTime: $viewModel.selectedTime)
                        .padding(.vertical, Spacing.large)

                    Divider()
                    Divider()
                        .frame(height: 2)
                        .background(Colors.text)

                    // TODO: Future paymentMethod Section

                    Spacer()

                    paymentSection
                }
                .padding(.horizontal)
                .navigationTitle("Parking Reservation")

            if viewModel.isLoading {
                LoadingOverlay()
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityIdentifier(ViewIdentifiers.view)
        .alert(isPresented: $viewModel.isAlertVisible) {
            Alert(
                title: Text(viewModel.alertContent.title),
                message: Text(viewModel.alertContent.message),
                dismissButton: .default(Text("Ok"), action: {
                    viewModel.isAlertVisible = false
                })
            )
        }
    }
}

extension ParkingDetailsView {
    private var content: some View {
        Group {
            Text(viewModel.parkingDetails.name)
                .foregroundStyle(Colors.text)
                .font(Fonts.heading)
                .padding(.bottom, Spacing.medium)
                .accessibilityIdentifier(ViewIdentifiers.Text.name)

            HStack(alignment: .top) {

                VStack(alignment: .leading, spacing: Spacing.medium) {

                    Text(viewModel.parkingDetails.parkingStatus.rawValue)
                        .foregroundStyle(.white)
                        .padding(Spacing.tiny)
                        .background(viewModel.parkingDetails.parkingStatus.backgroundColor)
                        .cornerRadius(CornerRadius.large)
                        .accessibilityIdentifier(ViewIdentifiers.Text.status)

                    MakeRow(imageName: "mappin.and.ellipse", title: viewModel.parkingDetails.address.description)
                        .accessibilityIdentifier(ViewIdentifiers.Text.description)

                    MakeRow(imageName: "parkingsign.circle", title: "\(viewModel.parkingDetails.availableSpots)/\(viewModel.parkingDetails.totalSpots) Total spots available")

                    MakeRow(imageName: "dollarsign.circle", title: "\(viewModel.parkingDetails.costPerHour) SAR /h")
                        .accessibilityIdentifier(ViewIdentifiers.Text.cost)

                    MakeRow(imageName: viewModel.getRateIcon(), title: "\(viewModel.parkingDetails.rate) /5.00")
                        .accessibilityIdentifier(ViewIdentifiers.Text.rate)

                }

                Spacer()

                Button(action: {
                    isAddedToFavorite.toggle()
                    viewModel.addToFavorite()
                }, label: {
                    Image(systemName: isAddedToFavorite ? "heart.fill": "heart")
                        .resizable()
                        .frame(width: IconSize.small, height: IconSize.small)
                })
                .accessibilityIdentifier(ViewIdentifiers.Button.addToFavorite)

            }
        }
    }

    private var paymentSection: some View {
        VStack {
            HStack {
                Text("Amount to pay:")
                    .foregroundStyle(Colors.text)
                    .font(Fonts.subheading)
                    .accessibilityIdentifier(ViewIdentifiers.Text.amountToPay)

                Spacer()

                Text("\(viewModel.totalPrice, specifier: "%.2f") SAR")
                    .font(Fonts.subheading)
                    .accessibilityIdentifier(ViewIdentifiers.Text.totalPrice)
            }


            PrimaryButton(
                label: "Pay",
                isDisabled: viewModel.isButtonDisabled,
                action: {
                Task {
                    await viewModel.processPayment()
                }
            })
            .disabled(viewModel.isButtonDisabled)
            accessibilityIdentifier(ViewIdentifiers.Button.pay)
            if viewModel.parkingDetails.parkingStatus == .occupied {
                Text("You can't reserve and pay for occupied parking spot")
                    .font(Fonts.caption)
                    .foregroundStyle(Colors.text)
            }
        }

    }
}

// MARK: - ViewIdentifiers
extension ParkingDetailsView {
    private typealias ViewIdentifiers = ParkingDetailsViewIdentifiers
}

private enum ParkingDetailsViewIdentifiers {

    enum Button {
        static let addToFavorite = "button_addToFavorite"
        static let pay = "button_pay"
    }

    enum Text {
        static let name = "text_name"
        static let status = "text_status"
        static let cost = "text_cost"
        static let rate = "text_rate"
        static let description = "text_description"
        static let amountToPay = "text_amountToPay"
        static let totalPrice = "text_totalPrice"

    }

    static let view = "parkingDetailsView"
}

#Preview {
    class ViewModelFixture: ParkingDetailsViewModelProtocol {
        var selectedTime = 1
        var totalPrice = 10.0
        var isLoading = false
        var isButtonDisabled = false
        var isAlertVisible = false
        var parkingDetails = ParkingDetails.StubFactory.make()
        var alertContent = AlertContent.StubFactory.make()

        func addToFavorite() { }
        func getRateIcon() -> String { return "star" }
        func processPayment() async { }
    }
    return ParkingDetailsView(viewModel: ViewModelFixture())
}
