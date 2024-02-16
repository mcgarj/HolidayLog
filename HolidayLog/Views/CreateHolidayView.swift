import PhotosUI
import SwiftData
import SwiftUI

struct CreateHolidayView: View {

    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context

    @State private var holiday = Holiday()

    @State var selectedPhoto: PhotosPickerItem?
    @State var selectedPhotoData: Data?

    var body: some View {
        List {
            Section {
                TextField("Place", text: $holiday.name)
                TextField("Country", text: $holiday.country)
                DatePicker("From", selection: $holiday.dateFrom)
                DatePicker("To", selection: $holiday.dateTo)
                TextField("Notes", text: $holiday.details)
                Toggle("Favourite?", isOn: $holiday.isFavourite)
            }

            Section {
                PhotosPicker(selection: .constant(nil),
                             matching: .images,
                             photoLibrary: .shared()) {
                    Label("Add Image", systemImage: "photo")
                }
            }



            Section {
                Button("Add") {
                    withAnimation {
                        context.insert(holiday)
                    }
                    dismiss()
                }
            }
        }
        .navigationTitle("Add a trip")
    }

}

#Preview {
    CreateHolidayView()
        .modelContainer(for: Holiday.self)
}
