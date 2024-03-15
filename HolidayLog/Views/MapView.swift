import MapKit
import SwiftUI

struct MapView: View {
    @State private var locationService = LocationService(completer: .init())
    @State var search: String

    var body: some View {
        VStack {
            List {
                ForEach(locationService.completions) { completion in
                    Button(action: { }) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(completion.title)
                                .font(.headline)
                                .fontDesign(.rounded)
                            Text(completion.subTitle)
                            if let url = completion.url {
                                Link(url.absoluteString, destination: url)
                                    .lineLimit(1)
                            }
                        }
                    }
                    .listRowBackground(Color.clear)
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
        }
        .onChange(of: search) {
            locationService.update(queryFragment: search)
        }
        .padding()
        .interactiveDismissDisabled()
    }
}

#Preview {
    MapView(search: "London")
}
