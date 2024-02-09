import SwiftData
import SwiftUI

struct HomeView: View {

    @State private var showCreate = false
    @Query private var trips: [Holiday]

    var body: some View {
        NavigationStack {
            List {
                ForEach(trips) { trip in
                    VStack(alignment: .leading) {
                        Text(trip.name)
                            .font(.headline)
                        Text(trip.country)
                            .font(.subheadline)
                    }
                }
            }
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
    HomeView()
}
