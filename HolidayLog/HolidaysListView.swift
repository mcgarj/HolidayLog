import SwiftData
import SwiftUI

struct HolidaysListView: View {

    @State private var showCreate = false
    @Query private var trips: [Holiday]

    var body: some View {
        NavigationStack {
            List {
                ForEach(trips) { trip in
                    HStack {
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
                                if trip.isFavourite {
                                    Image(systemName: "star.fill")
                                        .foregroundStyle(.yellow)
                                }
                            }
                        }


                    }
                }
            }
            .listRowSpacing(10)
            .navigationTitle("Holiday Log")
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        showCreate.toggle()
                    }, label: {
                        Label("Add trip", systemImage: "plus")
                    })
                }
            }
            .sheet(isPresented: $showCreate,
                   content: {
                NavigationStack {
                    CreateHolidayView()
                }
                .presentationDetents([.medium])
            })
        }
    }
}

#Preview {
    HolidaysListView()
}
