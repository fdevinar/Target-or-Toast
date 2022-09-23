//
//  UserGoalsViewController.swift
//  TargetOrToast
//
//  Created by Fabricio Devinar on 18/08/22.
//

import UIKit

//MARK: - UIView Controller
class FoodListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var foodItems: [FoodItem] = [
        FoodItem(name: "Chicken", unit: "100g", protein: 30, carbs: 0, fats: 2, cals: 160),
        FoodItem(name: "Rice", unit: "100g", protein: 2, carbs: 30, fats: 2, cals: 180),
        FoodItem(name: "Olive Oil", unit: "spoon", protein: 0, carbs: 0, fats: 12, cals: 100),
        FoodItem(name: "Eggs", unit: "unit", protein: 6, carbs: 0, fats: 5, cals: 80),
        FoodItem(name: "Whey", unit: "2 scoops", protein: 23, carbs: 15, fats: 10, cals: 240),
        FoodItem(name: "Steak", unit: "100g", protein: 30, carbs: 5, fats: 15, cals: 280),
        FoodItem(name: "Nuts", unit: "100g", protein: 8, carbs: 4, fats: 15, cals: 300)
    ]
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("FoodItems.plist")
    // Users/fdevinar/Library/Developer/CoreSimulator/Devices/E0A31B81-D69E-4E3E-905C-209B7105FE2A/data/Containers/Data/Application/1E20DAAD-1E45-4109-BD40-2F1D25EA9DBA/Documents
    //

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FoodItemCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
    }
    
    //MARK: - Add New Food Items
    @IBAction func clickAddButton(_ sender: UIButton) {
        var itemName = UITextField()
        let alert = UIAlertController(title: "Add New Food Item", message: "", preferredStyle: .alert)
        alert.addTextField{ (alertTextField) in
            print("alert add text field")
            alertTextField.placeholder = "Food Name"
            itemName = alertTextField
        }
        let action = UIAlertAction(title: "Add Item", style: .default) {
            (action) in
            self.foodItems.append(FoodItem(name: itemName.text!, unit: "test", protein: 20, carbs: 15, fats: 10, cals: 100))
            self.writeItems()
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func writeItems() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(foodItems)
            try data.write(to: dataFilePath!)
        }   catch {
            print(error)
        }
        tableView.reloadData()
    }
    
    //TODO: READ ITEMS

    
}

//MARK: - TableView Data Source
extension FoodListViewController: UITableViewDataSource {
    // gets number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodItems.count
    }
    // provides cell for each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idx = indexPath.row
        let name = foodItems[idx].name
        let unit = foodItems[idx].unit
        let highMacro = foodItems[idx].getHighMacro()
        var cellColor = UIColor(named: "white")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! FoodItemCell
        switch highMacro {
            case "protein":
                cellColor = .red
            case "carbs":
                cellColor = .yellow
            case "fats":
                cellColor = .green
            default:
                break
        }
        cell.contentCell.backgroundColor = cellColor?.withAlphaComponent(0.4)
        cell.name.text = name
        cell.unit.text = "(" + unit + ")"
        return cell
    }
}

//MARK: - TableView Delegate Methods

extension FoodListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let idx = indexPath.row
        print(idx)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
