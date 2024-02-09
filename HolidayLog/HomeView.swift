import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(1...3, id: \.self) {
                    Text("Location \($0)")
                }
            }
            .navigationTitle("Holiday Log")
        }
    }
}

#Preview {
    HomeView()
}
