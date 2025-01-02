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
    @State private var position: MapCameraPosition = .automatic

    init(viewModel: ViewModel) {
        _viewModel = .init(wrappedValue: viewModel)
    }
    var body: some View {
        VStack {
            Text("Home ParkingSpotsMapView")

            if viewModel.isLoading {
                ProgressView()
            } else {
                mapContainer
//                List {
//                    ForEach(viewModel.parkingSpots){ spot in
//                        Text(spot.name)
//                    }
//                }
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
    @ViewBuilder private var mapContainer: some View {
        Map(
            position: $position
        ) {
        // TODO: add annotations
        }
        .onTapGesture {
            withAnimation {
                position = .automatic
            }
        }
    }
}

#Preview {
    class ViewModelfixture: ParkingSpotsMapViewModelProtocol {
        var isLoading = false
        var parkingSpots: [ParkingDetails] = []
        func onAppear() { }
    }

    return ParkingSpotsMapView(
        viewModel: ViewModelfixture()
    )
}
