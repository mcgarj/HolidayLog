import PhotosUI
import SwiftUI

struct HolidayDetailView: View {
    let trip: Holiday
    var favouriteStar: String {
        trip.isFavourite ? "star.fill" : "star"
    }

    var body: some View {
        List {
            Text("**Where?** \(trip.name), \(trip.country)")
            Text("**When?** \(trip.dateFrom.formatted(date: .abbreviated, time: .omitted)) - \(trip.dateTo.formatted(date: .abbreviated, time: .omitted))")
            Section {
                Text(trip.details)
            } header: {
                Text("**My Notes**")
            }
            Section {
                Image(systemName: favouriteStar)
            } header: {
                Text("**A Favourite?**")
            }

            Section {
                VStack {
                    ScrollView(.horizontal) {
                        HStack(spacing: 20) {
                            // TODO: FIX ME
                            if let selectedPhotos = trip.images {
                                ForEach(0..<selectedPhotos.count, id: \.self) { image in
                                    if let uiImage = UIImage(data: selectedPhotos[image]) {
                                        Image(uiImage: uiImage)
                                            .resizable()
                                            .scaledToFill()
                                    }

                                }
                            } else {
                                Text("No photos added")
                            }
                        }
                    }
                }
                .padding(30)
            }
        }
        .listRowSpacing(10)
        .navigationTitle("My trip to \(trip.name)")
    }
}

