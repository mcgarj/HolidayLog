import SwiftUI

struct HolidayRowListView: View {
    let trip: Holiday

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(trip.name)
                    .font(.headline)
                Text("\(trip.dateFrom.formatted(date: .abbreviated, time: .omitted))")
                    .font(.subheadline)
                Text("\(trip.dateTo.formatted(date: .abbreviated, time: .omitted))")
                    .font(.subheadline)
            }
            HStack {
                Text(trip.country)
                    .font(.subheadline)
                Spacer()
                if trip.isFavourite {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                }
            }
        }
    }
}
