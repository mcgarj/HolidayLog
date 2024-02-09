import SwiftUI

struct CreateHolidayView: View {

    @Environment(\.dismiss) var dismiss

    @State private var holiday = Holiday()

    var body: some View {
        List {
            TextField("Place", text: .constant(""))
            TextField("Country", text: .constant(""))
            DatePicker("From", selection: .constant(.now))
            //hard code date to tomorrow for now
            DatePicker("To", selection: .constant(Date.now.addingTimeInterval(86400)))
            TextField("Notes", text: .constant(""))
            Toggle("Favourite?", isOn: .constant(false))
            Button("Add") {
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
