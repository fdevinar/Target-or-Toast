//
//  FoodItemCell.swift
//  TargetOrToast
//
//  Created by Fabricio Devinar on 14/09/22.
//

import UIKit

class FoodItemCell: UITableViewCell {
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var protein: UILabel!
    @IBOutlet weak var carbs: UILabel!
    @IBOutlet weak var fats: UILabel!
    @IBOutlet weak var cals: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    
}
