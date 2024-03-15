import MapKit
import SwiftUI

struct MapSearchView: View {
    @State private var locationService = LocationService(completer: .init())
    @State private var search = ""

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $search)
                    .autocorrectionDisabled()
            }
            .modifier(TextFieldGrayBackgroundColor())

            Spacer()

            List {
                ForEach(locationService.completions) { completion in
                    Button(action: { }) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(completion.title)
                                .font(.headline)
                                .fontDesign(.rounded)
                            Text(completion.subTitle)
                        }
                    }
                    .listRowBackground(Color.clear)
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)

            Button("Next") {
                CreateHolidayView()
            }
        }
        .onChange(of: search) {
            locationService.update(queryFragment: search)
        }
        .padding()
        .interactiveDismissDisabled()
        .presentationDetents([.height(200), .large])
        .presentationBackground(.regularMaterial)
        .presentationBackgroundInteraction(.enabled(upThrough: .large))
    }
}

struct TextFieldGrayBackgroundColor: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(12)
            .background(.gray.opacity(0.1))
            .cornerRadius(8)
            .foregroundColor(.primary)
    }
}

#Preview {
    MapSearchView()
}
