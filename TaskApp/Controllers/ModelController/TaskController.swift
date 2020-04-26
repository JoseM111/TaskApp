import Foundation
import CoreData

class TaskController {

    // MARK: @Shared-Instance-Singleton
    static let shared = TaskController()

    // MARK: @Computed-Properties
    var tasks: [Task] {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        let postRequest: [Task]? = try? CoreDataStack.context.fetch(fetchRequest)
        return postRequest ?? []
    }

    // A function that saves the apps persistence data
    func saveToPersistence() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print("[ERROR SAVING DATA \(error.localizedDescription)]")
        }
    }

    func toggleIsCompleteFor(task: Task) {
        // Update the isComplete Property on the task to the opposite state
        task.isComplete.toggle()
        // I want this in the Model Controller because the isComplete is a property on my model.
        saveToPersistence()
    }
    /**©------------------------------------------------------------------------------©*/
    // MARK: _CRUD
    // CREATE
    func addNewTask(taskName name: String, notes: String, due: Date) {
        Task(name: name, due: due)
        saveToPersistence()
    }

    /// READ() if we have data to read
    // UPDATE
    func updateTask(task: Task, name: String, notes: String, due: Date) {
        task.name = name
        task.notes = notes
        task.due = due

        saveToPersistence()
    }

    // DELETE
    func deleteTask(taskToDelete task: Task) {
        CoreDataStack.context.delete(task)
        saveToPersistence()
    }
    /**©------------------------------------------------------------------------------©*/
}
