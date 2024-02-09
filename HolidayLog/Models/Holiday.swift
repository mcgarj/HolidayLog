import SwiftData
import UIKit

@Model
final class Holiday {
    var name: String
    var country: String
    var dateFrom: Date
    var dateTo: Date
    var details: String
    var photos: [UIImage]?
    var map: UIImage?
    var isFavourite: Bool

    init(name: String = "",
         country: String = "",
         dateFrom: Date,
         dateTo: Date,
         details: String = "",
         photos: [UIImage]? = nil,
         map: UIImage? = nil,
         isFavourite: Bool = false) {
        self.name = name
        self.country = country
        self.dateFrom = dateFrom
        self.dateTo = dateTo
        self.details = details
        self.photos = photos
        self.map = map
        self.isFavourite = isFavourite
    }
}
