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

                if let selectedPhotoData, let uiImage = UIImage(data: selectedPhotoData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: 300)
                }

                PhotosPicker(selection: $selectedPhoto,
                             matching: .images,
                             photoLibrary: .shared()) {
                    Label("Add Image", systemImage: "photo")
                }

                if selectedPhotoData != nil {
                    Button(role: .destructive) {
                        withAnimation {
                            selectedPhoto = nil
                            selectedPhotoData = nil
                        }
                    } label: {
                        Label("Remove Image", systemImage: "xmark")
                            .foregroundStyle(.red)
                    }
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
        .task(id: selectedPhoto) {
            if let data = try? await selectedPhoto?.loadTransferable(type: Data.self) {
                selectedPhotoData = data
            }
        }
    }

}

#Preview {
    CreateHolidayView()
        .modelContainer(for: Holiday.self)
}
