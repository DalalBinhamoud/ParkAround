//
//  ParkingSpotsMapView.swift
//  ParkAround
//
//  Created by Dalal Macbook on 01/01/2025.
//

import MapKit
import SwiftData
import SwiftUI

struct ParkingSpotsMapView<ViewModel>: View where ViewModel: ParkingSpotsMapViewModelProtocol {

    // MARK: - Properties
    @ObservedObject private var viewModel: ViewModel
    @State private var isSheetPresented = false
    @State private var navigateToDetails = false
    @Binding private var searchQuery: String
    @State private var selectedParking: ParkingDetails?

    @State private var networkMonitor = NetworkMonitor()

    // MARK: - Map Config
    private let RiyadhRegion = CLLocationCoordinate2D(latitude: 24.7519539, longitude: 46.6421894)
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)

    // MARK: - Init
    init(
        searchQuery: Binding<String>,
        viewModel: ViewModel
    ) {
        _searchQuery = searchQuery
        _viewModel = .init(wrappedValue: viewModel)
    }

    // MARK: - Body
    var body: some View {
        NavigationStack{
            ZStack {
                Colors.backgroundMedium
                    .ignoresSafeArea()

                VStack {
                    mapContent
                }

                if viewModel.isLoading {
                    LoadingOverlay()
                }
            }
            .navigationDestination(isPresented: $navigateToDetails) {
                // TODO: handle optional
                ParkingDetailsView(
                    viewModel: ParkingDetailsViewModel(
                        parkingDetails: selectedParking ?? ParkingDetails.StubFactory.make(),
                        parkingRepository: viewModel.parkingRepository,
                        paymentRepository: viewModel.paymentRepository,
                        sessionManager: viewModel.sessionManager
                    )
                )
            }
        }
        .alert(isPresented: $networkMonitor.showAlert) {
            Alert(
                title: Text("No Internet Connection"),
                message: Text("Please check your network settings and try again"),
                dismissButton: .default(Text("Ok"), action: {
                    networkMonitor.showAlert = false
                })

            )
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
                            selectedParking = parkingDetails
                            isSheetPresented = true
                        }, label: {
                            Image(viewModel.getParkingMarker(for: parkingDetails.parkingStatus), bundle: .main)
                                .resizable()
                                .frame(width: Constants.iconSize, height: Constants.iconSize)
                        })
                    }
                }
            }
            .sheet(isPresented: $isSheetPresented) {
                ParkingDetailsSheetView(details: selectedParking ??  ParkingDetails.StubFactory.make()) {
                    withAnimation {
                        navigateToDetails = true
                        isSheetPresented = false // dismiss sheet
                    }
                }
                .presentationDetents([.height(Constants.sheetHight), .medium])
                .presentationDragIndicator(.visible)

            }
            userLocationButton
        }
    }

    @ViewBuilder private var userLocationButton: some View {
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

// MARK: - ViewIdentifiers
extension ParkingSpotsMapView {
    private typealias ViewIdentifiers = ParkingSpotsMapViewIdentifiers
}

private enum ParkingSpotsMapViewIdentifiers {

    enum Button {
        static let userLocation = "button_userLocation"
    }

    static let mapView = "mapView"
    static let view = "parkingSpotsMapView"
}

private enum Constants {
    static let sheetHight: CGFloat = 200 // TODO: read geometry
    static let iconSize: CGFloat = 50
    static let userLocationIcon: CGFloat = 60
}
