import SwiftData
import SwiftUI

@main
struct HolidayLogApp: App {
    var body: some Scene {
        WindowGroup {
            HolidaysListView()
                .modelContainer(for: Holiday.self)
        }
    }
}
