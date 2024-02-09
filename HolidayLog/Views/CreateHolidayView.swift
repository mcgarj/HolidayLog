import SwiftUI

struct CreateHolidayView: View {

    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context

    @State private var holiday = Holiday()

    var body: some View {
        List {
            TextField("Place", text: $holiday.name)
            TextField("Country", text: $holiday.country)
            DatePicker("From", selection: $holiday.dateFrom)
            DatePicker("To", selection: $holiday.dateTo)
            TextField("Notes", text: $holiday.details)
            Toggle("Favourite?", isOn: $holiday.isFavourite)
            Button("Add") {
                withAnimation {
                    context.insert(holiday)
                }
                dismiss()
            }
        }
        .navigationTitle("Add a trip")
    }

}

#Preview {
    CreateHolidayView()
        .modelContainer(for: Holiday.self)
}
