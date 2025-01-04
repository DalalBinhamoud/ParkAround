//
//  ParkingSpotsMapView.swift
//  ParkAround
//
//  Created by Dalal Macbook on 01/01/2025.
//

import MapKit
import SwiftUI

struct ParkingSpotsMapView<ViewModel>: View where ViewModel: ParkingSpotsMapViewModelProtocol {

    // MARK: - Properties
    @ObservedObject private var viewModel: ViewModel
    @State private var navigateToDetails = false
    @State private var searchQuery = ""
    @State private var selectedSpot: ParkingDetails?

    // MARK: - Mam Config
//    private let RiyadhRegion = CLLocationCoordinate2D(latitude: 24.774265, longitude: 46.738586)
    private let RiyadhRegion = CLLocationCoordinate2D(latitude: 24.7519539, longitude: 46.6421894)
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)

    // MARK: - Init
    init(viewModel: ViewModel) {
        _viewModel = .init(wrappedValue: viewModel)
    }

    // MARK: - Body
    var body: some View {
        NavigationStack{
            ZStack {
                VStack {
                    ParkingSearchView(searchQurey: $searchQuery)
                    if viewModel.isLoading {
                        ProgressView()
                    } else {
                        mapContent
                    }
                }
            }
            .navigationDestination(isPresented: $navigateToDetails) {
                // TODO: handle optional
                ParkingDetailsView(
                   viewModel: ParkingDetailsViewModel(
                    parkingDetails: selectedSpot ?? ParkingDetails.StubFactory.make(),
                    paymentRepository: viewModel.paymentRepository
                   )
                )
            }
        }
        .onAppear {
            Task {
                await viewModel.onAppear()
            }
        }
    }
}

extension ParkingSpotsMapView {
    @ViewBuilder private var mapContent: some View {

        // filteredList
        let filteredSpots = viewModel.getFilteredSpots(for: searchQuery)

        ZStack(alignment: .bottomTrailing) {
            Map(position: $position) {

                ForEach(filteredSpots) { parkingDetails in
                    Annotation(parkingDetails.name, coordinate: parkingDetails.coordinate) {
                        Button(action: {
                            selectedSpot = parkingDetails
                        }, label: {
                            Image(systemName: "bolt.car.circle.fill")
                                .resizable()
                                .frame(width: Constants.iconSize, height: Constants.iconSize) // TODO: scale
                        })
                    }
                }
        }
        .sheet(item: $selectedSpot) { spot in
            getSheetContent(spot: spot)
                .presentationDetents([.height(Constants.sheetHight), .medium])
                .presentationDragIndicator(.visible)

        }
            Button(action: {
                withAnimation {
                    position = .userLocation(fallback: position.fallbackPosition ?? position)
                }
            }, label: {
                Image(systemName: "location.circle")
                    .resizable()
                    .frame(width: Constants.userLocationIcon , height: Constants.userLocationIcon)
            })
            .padding(Spacing.medium)
        }
    }

    private func getSheetContent(spot: ParkingDetails) -> some View {

        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Text("name: \(spot.name)")
                Text("Rate: \(spot.rate, specifier: "%.2f")")
                Text("available Spots: \(spot.availableSpots)")
            }

            Spacer()

            VStack(spacing: Spacing.large) {

                Text(spot.parkingStatus.rawValue)

                Button(action: {
                    withAnimation {
                        navigateToDetails = true
                        selectedSpot = nil // dismiss sheet
                    }
                }, label: {
                    Text("Select & Pay")
                })
            }
        }
        .padding(.horizontal, Spacing.large)
    }
}

private enum Constants {
    static let sheetHight: CGFloat = 150
    static let iconSize: CGFloat = 50
    static let userLocationIcon: CGFloat = 60
}

#Preview {
    class ViewModelFixture: ParkingSpotsMapViewModelProtocol {
        var isLoading = false
        var parkingSpots: [ParkingDetails] = [
            ParkingDetails(id: 1, name: "parking 1", rate: 3.2, address: GeoLocation(latitude: 24.7519539, longitude: 46.6421894), availableSpots: 12, totalSpots: 30),
            ParkingDetails(id: 2, name: "parking 2", rate: 4.5, address: GeoLocation(latitude: 24.7519636, longitude: 46.642228), availableSpots: 45, totalSpots: 50)
        ]
        var paymentRepository: PaymentRepositoryProtocol = PaymentRepository()
        func onAppear() { }
    }

    return ParkingSpotsMapView(
        viewModel: ViewModelFixture()
    )
}
