import SwiftUI

struct HolidayDetailView: View {
    let trip: Holiday
    var favouriteStar: String {
        trip.isFavourite ? "star.fill" : "star"
    }

    var body: some View {
        List {
            Text(trip.name)
            Text(trip.country)
            Text("From: \(trip.dateFrom) - \(trip.dateTo)")
            Text(trip.details)
            Image(systemName: favouriteStar)
        }
        .navigationTitle("My trip to \(trip.name)")
    }
}

