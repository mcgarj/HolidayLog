import MapKit
import SwiftUI

struct HolidayDetailView: View {
    let trip: Holiday
    var favouriteStar: String {
        trip.isFavourite ? "star.fill" : "star"
    }
    @State private var position = MapCameraPosition.automatic
    @State private var searchResults = [SearchResult]()
    @State private var selectedLocation: SearchResult?
    @State private var enteredLocation: SearchCompletion?

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
        }
        .listRowSpacing(10)
        .navigationTitle("My trip to \(trip.name)")
    }
}



