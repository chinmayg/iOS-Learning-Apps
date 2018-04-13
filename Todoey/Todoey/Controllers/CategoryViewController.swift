//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Chinmay Ghotkar on 4/2/18.
//  Copyright © 2018 Chinmay Ghotkar. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class CategoryViewController: SwipeTableViewController {

    let realm = try! Realm()
    var categories : Results<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCategories()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Categories added yet!"
        if let cellColor = categories?[indexPath.row].color {
            cell.backgroundColor = UIColor(hexString: cellColor)
            guard let categoryColor = UIColor(hexString: cellColor) else {fatalError()}
            cell.textLabel?.textColor = ContrastColorOf(categoryColor, returnFlat: true)
        } else {
            cell.backgroundColor = UIColor(hexString: "000000")
        }
        
        
        return cell
    }
    
    //MARK: - Table View data delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = self.categories?[indexPath.row]
        }
    }
    
    // MARK: - Add new category
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Category", style: .default) {
            (action) in
            //what will happen once the user clicks the Add Category Button on our UIAlert
            let newCategory = Category()
            newCategory.name = textField.text!
            newCategory.color = UIColor.randomFlat.hexValue()
            self.saveCategories(category: newCategory)
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Methods to interact with realm database
    
    func saveCategories(category: Category ) {
        
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving context. \(error)")
        }
        
        tableView.reloadData()
    }

    func getCategories() {
        categories = realm.objects(Category.self)
        
        tableView.reloadData()

    }
    
    // MARK: - Delete data from swipe
    
    override func updateModel(at indexPath: IndexPath) {
        if let selectedCategory = self.categories?[indexPath.row] {
            do {
                try self.realm.write {
                    self.realm.delete(selectedCategory)
                }
            } catch {
                print("Error saving deleting. \(error)")
            }
        }
    }
    
}
