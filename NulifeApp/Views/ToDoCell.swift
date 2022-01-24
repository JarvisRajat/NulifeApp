//
//  ToDoCell.swift
//  NulifeApp
//
//  Created by Rajat Raj on 22/01/22.
//

import UIKit


class ToDoCell: UITableViewCell {

    @IBOutlet private weak var parentView: UIView!
    @IBOutlet private weak var toDoTitle: UILabel!
    @IBOutlet private weak var editBtn: UIButton!
    @IBOutlet private weak var toDoList: UITableView!
    private var data = ["Cell 1", "Cell 2", "Cell 3", "Cell 4", "Cell 5"]
    private var textField: UITextField?
    var parent: UIViewController?
    override func awakeFromNib() {
        super.awakeFromNib()
        parentView.shadowEffect()
        toDoList.delegate = self
        toDoList.dataSource = self
        registerCell()
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        toDoList.reloadData()
        let size = CGSize(width: targetSize.width,
                          height: toDoList.frame.origin.y + 250)
        return size
    }
    
    private func registerCell() {
        toDoList.register(UINib(nibName: "ToDoDetailCell", bundle: nil), forCellReuseIdentifier: "ToDoDetailCell")
    }
    @IBAction func editBtnAction(_ sender: UIButton) {
        let dialogMsg = UIAlertController(title: "To-Do", message: "Add your task here", preferredStyle: .alert)
        let saveBtn = UIAlertAction(title: "Save", style: .default) {(action) in
            if let update = self.textField?.text, !update.isEmpty {
                self.data.insert(update, at: 0)
                self.toDoList.beginUpdates()
                self.toDoList.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
                self.toDoList.endUpdates()
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("Dialog Cancel tapped")
        }
        dialogMsg.addAction(saveBtn)
        dialogMsg.addAction(cancel)
        dialogMsg.addTextField {(tF) in
            self.textField = tF
            self.textField?.placeholder = "Write your task"
        }
        parent?.present(dialogMsg, animated: true, completion: nil)
        print("Edit Btn Tapped")
    }
}
extension ToDoCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoDetailCell", for: indexPath) as? ToDoDetailCell
        else { return UITableViewCell() }
        cell.dataSource = data[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editItem = UIContextualAction(style: .normal, title: "Edit") {  (contextualAction, view, boolValue) in
            let selectedCellData = self.data[indexPath.row]
            let dialogBox = UIAlertController(title: "To-Do", message: "Update your task here", preferredStyle: .alert)
            let saveBtn = UIAlertAction(title: "Save", style: .default) {(action) in
                if let update = self.textField?.text, !update.isEmpty {
                    self.data[indexPath.row] = update
                    DispatchQueue.main.async {
                        self.toDoList.reloadData()
                        print("Data has been updated in table")
                    }
                }
            }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                print("Dialog Cancel tapped")
            }
            dialogBox.addAction(saveBtn)
            dialogBox.addAction(cancel)
            dialogBox.addTextField {(tF) in
                self.textField = tF
                self.textField?.placeholder = "Update your task"
                self.textField?.text = selectedCellData
            }
            self.parent?.present(dialogBox, animated: true, completion: nil)
            print("Edit Tapped")
        }
        let deleteItem = UIContextualAction(style: .normal, title: "Delete") {  (contextualAction, view, boolValue) in
            self.data.remove(at: indexPath.row)
            self.toDoList.beginUpdates()
            self.toDoList.deleteRows(at: [indexPath], with: .automatic)
            self.toDoList.endUpdates()
            print("Delete Tapped")
        }
        editItem.image = UIImage(systemName: "pencil")
        editItem.backgroundColor = .systemGreen
        deleteItem.image = UIImage(systemName: "bin.xmark.fill")
        deleteItem.backgroundColor = .systemRed
        let swipeActions = UISwipeActionsConfiguration(actions: [editItem, deleteItem])
        swipeActions.performsFirstActionWithFullSwipe = false
        return swipeActions
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
