import SwiftData
import UIKit

@Model
final class Holiday {
    var name: String
    var country: String
    var dateFrom: Date
    var dateTo: Date
    var details: String
    var locationMap: String?
    var isFavourite: Bool

    @Attribute(.externalStorage) 
    var images: [Data]?

    init(name: String = "",
         country: String = "",
         dateFrom: Date = Date.now,
         dateTo: Date = Date.now.addingTimeInterval(86400),
         details: String = "",
         isFavourite: Bool = false) {
        self.name = name
        self.country = country
        self.dateFrom = dateFrom
        self.dateTo = dateTo
        self.details = details
        self.isFavourite = isFavourite
    }
}
