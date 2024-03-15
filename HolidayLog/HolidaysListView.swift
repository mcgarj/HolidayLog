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
                            HolidayRowListView(trip: trip)
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
                    MapSearchView()
                }
                .presentationDetents([.large])
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
