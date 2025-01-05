//
//  TimeSlotsView.swift
//  ParkAround
//
//  Created by Dalal Macbook on 04/01/2025.
//

import SwiftUI

struct TimeSlotsView: View {

    // MARK: - Properties
    @Binding private var selectedTime: Int

    init(selectedTime: Binding<Int>) {
        _selectedTime = selectedTime
    }

    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            Text("Select Time")
                .foregroundStyle(Colors.text)
                .font(Fonts.heading)

            availableHourse
        }
    }
}

extension TimeSlotsView {
    private var availableHourse: some View {

        ScrollView(.horizontal) {
            HStack {
                ForEach(1..<7) { time in
                    InlineButton(label: "\(time) \(time == 1 ? "Hour" : "Hours")",
                                 background: selectedTime == time ? Colors.secondary : Colors.primary,
                                 action: {
                        selectedTime = time
                    })
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    TimeSlotsView(selectedTime: .constant(2)
    )
}
