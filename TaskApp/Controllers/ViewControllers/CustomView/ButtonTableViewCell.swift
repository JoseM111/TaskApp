import UIKit

/**©------------------------------------------------------------------------------©*/
protocol ButtonTableViewCellDelegate: class {
    // Handles the cell the user toggles
    func btnCellBtnTapped(_ sender: ButtonTableViewCell)
}
/**©------------------------------------------------------------------------------©*/

class ButtonTableViewCell: UITableViewCell {

    // MARK: _@IBOutlet
    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var timestampLabel: UILabel!
    
    // An optional instance to access our delegate protocol
    var delegate: ButtonTableViewCellDelegate?
    
    // MARK: _@IBAction
    @IBAction func buttonTapped(_ sender: UIButton) {
        delegate?.btnCellBtnTapped(self)
    }
    
    /**©------------------------------------------------------------------------------©*/
    func toggleIsCompleteFor(for task: Task) {
        primaryLabel.text = task.name
        timestampLabel.text = "Task due date: \(task.due?.dateRightNow() ?? "")"
        updateBtn(completedTask: task.isComplete)
    }

    fileprivate func updateBtn(completedTask isComplete: Bool) {
        let imgName = isComplete ? "Complete" : "Incomplete"
        completeButton.setImage(UIImage(named: imgName), for: .normal)
    }
    /**©------------------------------------------------------------------------------©*/

}

/*-----------------------------------------------------------------------
  Declaration
  class UITableViewCell : UIView
 
  Summary
  The visual representation of a single row in a table view.
 
  Description
  A UITableViewCell object is a specialized type of view that manages the
  content of a single table row. You use cells primarily to organize and
  present your app’s custom content, but UITableViewCell provides some
  specific customizations to support table-related behaviors, including:
  Applying a selection or highlight color to the cell.
  Adding standard accessory views, such as a detail or disclosure control.
  Putting the cell into an editable state.
  Indenting the cell's content to create a visual hierarchy in your table.
  Your app’s content occupies most of the cell’s bounds, but the cell may
  adjust that space to make room for other content. Cells display accessory
  views on the trailing edge of their content area. When you put your table
  into edit mode, the cell adds a delete control to the leading edge of its
  content area, and optionally swaps out an accessory view for a reorder
  control.
  -----------------------------------------------------------------------*/
