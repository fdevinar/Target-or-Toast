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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FoodItemCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")

        // Do any additional setup after loading the view.
    }
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
    // test tot git
}
