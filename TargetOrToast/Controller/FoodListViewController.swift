//
//  UserGoalsViewController.swift
//  TargetOrToast
//
//  Created by Fabricio Devinar on 18/08/22.
//

import UIKit

class FoodListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //var foodItems: [FoodItem] = []
    var foodItems:Array = ["test","xyz","lorem","ipsum"]
    
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
        return 5
    }
    
    // provides cell for each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let idx = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! FoodItemCell
        
        cell.name.text = "Chicken"
        cell.protein.text = "120"
        
        
        return cell
        
    }
    
    
}

