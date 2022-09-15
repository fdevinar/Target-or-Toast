//
//  FoodListModel.swift
//  TargetOrToast
//
//  Created by Fabricio Devinar on 15/08/22.
//

import Foundation

struct FoodItem {
    
    var name:    String
    var unit:    String
    var protein: Int
    var carbs:   Int
    var fats:    Int
    var cals:    Int
    
    func getHighMacro() -> String {
    
        if self.protein > self.carbs || self.protein > self.fats {
        return "protein"
        }
        else if self.carbs > self.fats  {
                return "carbs"
            }
            else {
                return "fats"
            }
  
    }
    
}
