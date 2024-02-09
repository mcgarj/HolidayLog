import SwiftUI

struct HomeView: View {

    @State private var showCreate = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(1...3, id: \.self) {
                    Text("Location \($0)")
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
