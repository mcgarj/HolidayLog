import SwiftData
import SwiftUI

struct UpdateHolidayView: View {

    @Environment(\.dismiss) var dismiss
    @Bindable var holiday: Holiday

    var body: some View {
        List {
            TextField("Place", text: $holiday.name)
            TextField("Country", text: $holiday.country)
            DatePicker("From", selection: $holiday.dateFrom)
            DatePicker("To", selection: $holiday.dateTo)
            TextField("Notes", text: $holiday.details)
            Toggle("Favourite?", isOn: $holiday.isFavourite)
            Button("Update") {
                dismiss()
            }
        }
        .navigationTitle("Update a trip")
    }
}

