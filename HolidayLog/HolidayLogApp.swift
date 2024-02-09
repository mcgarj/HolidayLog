import SwiftData
import SwiftUI

@main
struct HolidayLogApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .modelContainer(for: Holiday.self)
        }
    }
}
