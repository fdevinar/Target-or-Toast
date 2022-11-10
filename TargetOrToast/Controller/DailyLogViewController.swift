//
//  DailyLogViewController.swift
//  TargetOrToast
//
//  Created by Fabricio Devinar on 09/11/22.
//

import UIKit

class DailyLogViewController: UIViewController {
    
    @IBOutlet weak var logTable: UITableView!
    
    var dailyItems: [DailyItem] = [
    DailyItem(name: "Frango", qty: 5),
    DailyItem(name: "Arroz", qty: 5),
    DailyItem(name: "Ovos", qty: 4),
    DailyItem(name: "Oliva", qty: 5),
    DailyItem(name: "Whey", qty: 1)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        logTable.delegate = self
        logTable.dataSource = self
        logTable.register(UINib(nibName: "DailyItemCell", bundle: nil), forCellReuseIdentifier: "DailyItemIdentifier")
        
        print("DailyLog loaded")
    }

}

extension DailyLogViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idx = indexPath.row
        let name = dailyItems[idx].name
        let qty = dailyItems[idx].qty
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DailyItemIdentifier", for: indexPath) as! DailyItemCell
        
        cell.name.text = name
        cell.qty.text = String(qty)
        return cell
    }
    
    
}

extension DailyLogViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let idx = indexPath.row
        print(idx)
    }
    
}
