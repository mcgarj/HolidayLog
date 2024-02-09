import SwiftData
import UIKit

@Model
final class Holiday {
    var name: String
    var country: String
    var dateFrom: Date
    var dateTo: Date
    var details: String
    //TODO: CHANGE TO IMAGE TYPE
    var photos: [String]?
    var locationMap: String?
    var isFavourite: Bool

    init(name: String = "",
         country: String = "",
         dateFrom: Date,
         dateTo: Date,
         details: String = "",
         photos: [String]? = nil,
         locationMap: String? = nil,
         isFavourite: Bool = false) {
        self.name = name
        self.country = country
        self.dateFrom = dateFrom
        self.dateTo = dateTo
        self.details = details
        self.photos = photos
        self.locationMap = locationMap
        self.isFavourite = isFavourite
    }
}
