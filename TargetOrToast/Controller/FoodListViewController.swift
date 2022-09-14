//
//  UserGoalsViewController.swift
//  TargetOrToast
//
//  Created by Fabricio Devinar on 18/08/22.
//

import UIKit

class FoodListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var foodItems: [FoodItem] = [
        FoodItem(name: "Chicken", protein: 30, carbs: 0, fats: 2, cals: 160),
        FoodItem(name: "Rice", protein: 2, carbs: 30, fats: 2, cals: 180),
        FoodItem(name: "Olive Oil", protein: 0, carbs: 0, fats: 12, cals: 100),
        FoodItem(name: "Eggs", protein: 6, carbs: 0, fats: 5, cals: 80),
        FoodItem(name: "Whey", protein: 23, carbs: 15, fats: 10, cals: 240)
    ]
    
    
    //var foodItems:Array = ["test","xyz","lorem","ipsum"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FoodItemCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")

        // Do any additional setup after loading the view.
    }
}

extension FoodListViewController: UITableViewDataSource {
    // gets number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodItems.count
    }
    
    // provides cell for each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idx = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! FoodItemCell
        
        
        cell.name.text = foodItems[idx].name
        cell.protein.text = String(foodItems[idx].protein!)
        cell.carbs.text = String(foodItems[idx].carbs!)
        cell.fats.text = String(foodItems[idx].fats!)
        cell.cals.text = String(foodItems[idx].cals!)
        
        
        return cell
        
    }
    
    
}

