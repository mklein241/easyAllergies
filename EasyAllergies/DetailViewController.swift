//
//  DetailViewController.swift
//  EasyAllergies
//
//  Created by Michael Klein on 5/14/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var gfLabel: UILabel!
    @IBOutlet weak var veganLabel: UILabel!
    @IBOutlet weak var vegetarianLabel: UILabel!
    @IBOutlet weak var ingredientsTextView: UITextView!
    
    var food: Item!
    //var myFoods: [String: [String?]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard food != nil else {
            return
        }
        updateUserInterface()

    }
    
    func updateUserInterface() {
        itemLabel.text = food.name
        brandLabel.text = food.brand
        
        let gf = food.diet_labels?.gluten_free?.is_compatible
        let vegan = food.diet_labels?.vegan?.is_compatible
        let vegetarian = food.diet_labels?.vegan?.is_compatible
        
        if gf == true {
            gfLabel.text = "Yes"
        } else if gf == false{
            gfLabel.text = "No"
        } else {
            gfLabel.text = "Undetermined"
        }
        
        if vegan == true {
            veganLabel.text = "Yes"
        } else if vegan == false{
            veganLabel.text = "No"
        } else {
            veganLabel.text = "Undetermined"
        }
        
        if vegetarian == true {
            vegetarianLabel.text = "Yes"
        } else if vegetarian == false{
            vegetarianLabel.text = "No"
        } else {
            vegetarianLabel.text = "Undetermined"
        }
        
        ingredientsTextView.text = food.ingredients ?? ""
    }
    
    //@IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
    //    myFoods[food.name] = [brandLabel.text, gfLabel.text, veganLabel.text, vegetarianLabel.text, ingredientsTextView.text]
    //}
    

}
