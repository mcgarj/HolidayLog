import MapKit
import SwiftUI

struct CreateHolidayView: View {

    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    @State private var locationService = LocationService(completer: .init())

    @State private var holiday = Holiday()
    @State private var position = MapCameraPosition.automatic
    @State private var searchResults = [SearchResult]()
    @State private var selectedLocation: SearchResult?

    var body: some View {
        List {
            TextField("Place", text: $holiday.name)
                .onSubmit {
                    Task {
                        searchResults = (try? await locationService.search(with: holiday.name)) ?? []
                    }
                }
            TextField("Country", text: $holiday.country)
            DatePicker("From", selection: $holiday.dateFrom)
            DatePicker("To", selection: $holiday.dateTo)
            TextField("Notes", text: $holiday.details)
            Toggle("Favourite?", isOn: $holiday.isFavourite)

            Section {
                Map(position: $position, selection: $selectedLocation) {
                    ForEach(searchResults) { result in
                        Marker(coordinate: result.location) {
                            Image(systemName: "mappin")
                        }
                        .tag(result)
                    }
                }
                .onChange(of: searchResults) {
//                    selectedLocation = trip
                    if let firstResult = searchResults.first, searchResults.count == 1 {
                        selectedLocation = firstResult
                    }
                }
            }
            Button("Add") {
                withAnimation {
                    context.insert(holiday)
                }
                dismiss()
            }
        }
        .navigationTitle("Add a trip")
    }

}

func generateMapSearchRequest(location: Holiday) {
    let searchRequest = MKLocalSearch.Request()
    searchRequest.naturalLanguageQuery = location.name
    let search = MKLocalSearch(request: searchRequest)
}

#Preview {
    CreateHolidayView()
        .modelContainer(for: Holiday.self)
}
