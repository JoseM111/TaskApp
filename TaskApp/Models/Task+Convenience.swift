import Foundation
import CoreData

extension Task {
@discardableResult

    convenience init(name: String, notes: String? = nil,
                     due: Date? = nil, isComplete: Bool = false,
                     context: NSManagedObjectContext = CoreDataStack.context
    ) {
        self.init(context: context)
        self.name = name
        self.notes = notes
        self.due = due
        self.isComplete = isComplete
    }
}
