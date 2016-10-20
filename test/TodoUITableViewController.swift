//
//  TodoUITableViewController.swift
//  test
//
//  Created by Ziwei Yin on 10/16/16.
//  Copyright © 2016 Ziwei Yin. All rights reserved.
//

import UIKit

class TodoUITableViewController: UITableViewController {

    var Todos = [[String]]()
    var Colors = [UIColor]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        loadColors()
        loadSavedTodos()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Todos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoTableCell", for: indexPath) as! TodoTableViewCell
        let t = Todos[indexPath.row]
        cell.titleLabel.text = t[0]
        cell.descriptionLabel.text = t[1]
        if t[3] == "true" {
            cell.doneLabel.text = "Done!"
        }
        else {
            cell.doneLabel.text = "Hurry!"
        }
        cell.backgroundColor = Colors[indexPath.row % 10]
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveTodos()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TodoTableViewCell
        if cell.doneLabel.text == "Done!" {
            Todos[indexPath.row][3] = "false"
            cell.doneLabel.text = "Hurry!"
        }
        else if cell.doneLabel.text == "Hurry!" {
            Todos[indexPath.row][3] = "true"
            cell.doneLabel.text = "Done!"
        }
        saveTodos()
    }

    func saveTodos() {
        UserDefaults.standard.set(Todos, forKey: "Todos")
    }

    func loadSavedTodos() {
        if UserDefaults.standard.object(forKey: "Todos") != nil {
            let todos = UserDefaults.standard.object(forKey: "Todos") as! [[String]]
            for t in todos {
                if pass24(from: Double(t[2])!, to: Date().timeIntervalSince1970) && t[3] == "true" {
                }
                else {
                    Todos.append(t)
                }
            }
        }
        saveTodos()
    }


    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowStat" {
            let vc = segue.destination as! StatUIViewController
            vc.numberfinished = countfinished()
        }
    }

    func countfinished() -> Int{
        var c = 0
        for t in Todos {
            print(t)
            if t[3] == "true" {
                c += 1
            }
        }
        return c
    }

    func loadsampleTodoLists() {
        let todo1 = ["Swim", "Go swimming tomorrow", String(Date().timeIntervalSince1970), "false"]
        let todo2 = ["Eat", "Eat Dinner tomorrow", String(Date().timeIntervalSince1970), "false"]
        Todos += [todo1, todo2]
    }

    func loadColors() {
        let c1 = UIColor(displayP3Red: 246/256, green: 228/256, blue: 204/256, alpha: 0.5)
        let c2 = UIColor(displayP3Red: 243/256, green: 213, blue: 189, alpha: 0.5)
        let c3 = UIColor(displayP3Red: 199/256, green: 225/256, blue: 186/256, alpha: 0.5)
        let c4 = UIColor(displayP3Red: 156/256, green: 183/256, blue: 112/256, alpha: 0.5)
        let c5 = UIColor(displayP3Red: 98/256, green: 139/256, blue: 97/256, alpha: 0.5)
        let c6 = UIColor(displayP3Red: 57/256, green: 114/256, blue: 73/256, alpha: 0.5)
        Colors += [c1, c2,c3,c4,c5,c6,c5,c4,c3,c2]
    }
    
    func pass24(from: Double, to: Double) -> Bool{
        if from - to > 1440 {
            return true
        }
        return false
    }
}
