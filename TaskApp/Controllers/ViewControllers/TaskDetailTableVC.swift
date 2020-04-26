import UIKit

class TaskDetailTableVC: UITableViewController {

    // MARK: - Class Properties
    var task: Task?
    var dueDateValue: Date?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    func updateViews() {
        guard let ifTask: Task = task, isViewLoaded else { return }
        title = ifTask.name
    }

}
