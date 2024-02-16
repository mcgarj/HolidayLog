import SwiftData
import SwiftUI

struct HolidaysListView: View {
    @Environment(\.modelContext) var context

    @State private var showCreate = false
    @State private var tripToEdit: Holiday?
    @Query private var trips: [Holiday]

    var body: some View {
        NavigationStack {
            List {
                ForEach(trips) { trip in
                    HStack {
                        NavigationLink {
                            HolidayDetailView(trip: trip)
                        } label: {
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
                    .swipeActions {
                        Button(role: .destructive) {
                            withAnimation {
                                context.delete(trip)
                            }
                        } label: {
                            Label("Delete", systemImage: "trash")
                                .symbolVariant(.fill)
                        }

                        Button {
                            tripToEdit = trip
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }
                        .tint(.orange)
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
            .sheet(item: $tripToEdit) {
                tripToEdit = nil
            } content: { trip in
                UpdateHolidayView(holiday: trip)
            }
        }
    }
}

#Preview {
    HolidaysListView()
}
