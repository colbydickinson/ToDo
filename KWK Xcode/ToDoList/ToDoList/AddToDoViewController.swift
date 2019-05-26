//
//  AddToDoViewController.swift
//  ToDoList
//
//  Created by Colby Dickinson on 5/22/19.
//  Copyright © 2019 Colby Dickinson. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {

    var previousVC = ToDoTableViewController()
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

       @IBAction func addTapped(_ sender: UIButton) {
        
        /*
        let toDo = ToDo()
        
        if let titleText = titleTextField.text {
            toDo.name = titleText
            toDo.important = importantSwitch.isOn
            }
            previousVC.toDos.append(toDo)
            previousVC.tableView.reloadData()
            navigationController?.popViewController(animated: true)
            } */
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let toDo = ToDoCD(entity: ToDoCD.entity(), insertInto: context)
            if let titleText = titleTextField.text {
                toDo.name = titleText
                toDo.important = importantSwitch.isOn
            }
            try? context.save()
            
            navigationController?.popViewController(animated: true)
        }
            }
 }
