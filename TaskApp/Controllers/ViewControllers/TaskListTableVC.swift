import UIKit

class TaskListTableVC: UITableViewController {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    /*-----------------------------------------------------------------
      This method is called before the view controller's view is about
      to be added to a view hierarchy and before any animations are
      configured for showing the view. You can override this method to
      perform custom tasks associated with displaying the view. For
      example, you might use this method to change the orientation or
      style of the status bar to coordinate with the orientation or
       style of the view being presented. If you override this method,
        you must call super at some point in your implementation.
      -----------------------------------------------------------------*/
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source
    /**©------------------------------------------------------------------------------©*/
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        TaskController.shared.tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
                as? ButtonTableViewCell else { return UITableViewCell() }
        // Configure the cell...
        /// Accessing our tasks array
        let taskArray = TaskController.shared.tasks[indexPath.row]
        // Updating the cell
        cell.toggleIsCompleteFor(for: taskArray)
        cell.delegate = self

        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let taskToDelete = TaskController.shared.tasks[indexPath.row]
            TaskController.shared.deleteTask(taskToDelete: taskToDelete)
        }
    }

    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toViewTask" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let destinationVC = segue.destination as? TaskDetailTableVC else {
                let defaultTask = TaskController.shared.tasks[indexPath.row]

            }
        }
    }
    /**©------------------------------------------------------------------------------©*/
}

extension TaskListTableVC: ButtonTableViewCellDelegate {
    func btnCellBtnTapped(_ sender: ButtonTableViewCell) {
        // Get the indexPath of the the sender; I.E. the cell
        guard let indexPath = tableView.indexPath(for: sender) else { return }
        // Use that index to get the Task we need
        let task = TaskController.shared.tasks[indexPath.row]
        // Use our Model Controller to handle the isComplete Property
        TaskController.shared.toggleIsCompleteFor(task: task)
        // Have the cell Update
        sender.toggleIsCompleteFor(for: task)
    }
}
