import Foundation

struct DestinationResponse: Codable {
    let name: String
    let lat: String
    let lng: String
    let country: String
}

struct DestinationJSONDecoder {

    static func decode(from fileName: String) -> [DestinationResponse] {

        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let destinations = try? JSONDecoder().decode([DestinationResponse].self, from: data) else {
            return []
        }

        return destinations
    }
}
