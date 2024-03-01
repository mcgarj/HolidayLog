import PhotosUI
import SwiftData
import SwiftUI

struct CreateHolidayView: View {

    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context

    @State private var holiday = Holiday()

    @State var photoPickerItems = [PhotosPickerItem]()
    @State var images = [UIImage]()

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
                VStack {
                    PhotosPicker("Select photos", selection: $photoPickerItems, selectionBehavior: .ordered)

                    ScrollView(.horizontal) {
                        HStack(spacing: 20) {
                            ForEach(0..<images.count, id: \.self) { i in
                                Image(uiImage: images[i])
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipShape(.circle)
                            }
                        }
                    }
                }
                .padding(30)
                .task(id: photoPickerItems) {
                    for photo in photoPickerItems {
                        if let data = try? await photo.loadTransferable(type: Data.self) {
                            if let image = UIImage(data: data) {
                                images.append(image)
                            }
                        }
                    }

                    photoPickerItems.removeAll()
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
        .task(id: photoPickerItems) {
            for photo in photoPickerItems {
                if let data = try? await photo.loadTransferable(type: Data.self) {
                    holiday.images?.append(data)
                }
            }
        }
    }
}

#Preview {
    CreateHolidayView()
        .modelContainer(for: Holiday.self)
}
