//
//  ViewController.swift
//  Dec-7-editedTableView
//
//  Created by Admin on 7/12/22.
//

import UIKit

class FirstVC: UIViewController {

    @IBOutlet weak var taskList: UITableView!
    @IBOutlet weak var inputTask: UITextField!
    
    var tasks = List.listOfTasks
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskList.delegate = self
        taskList.dataSource = self
    }
    
    @IBAction func appendTask(_ sender: Any) {
        appendTaskToList()
    }
    
    func appendTaskToList() {
        if let txt = inputTask.text {
            if(txt != "") {
                tasks.append(List(tasks: txt))
                taskList.reloadData()
            }
        }
    }
}

extension FirstVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        taskList.deselectRow(at: indexPath, animated: true)
    }
}

extension FirstVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = taskList.dequeueReusableCell(withIdentifier: Constraints.tempCellOne, for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row].tasks
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(indexPath.section == 0) {
            if(editingStyle == .delete) {
                
                taskList.beginUpdates()
                taskList.deleteRows(at: [indexPath], with: .fade)
                tasks.remove(at: indexPath.row)
                taskList.endUpdates()
            }
        }
    }
}
