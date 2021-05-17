//
//  HomeViewController.swift
//  EasyAllergies
//
//  Created by Michael Klein on 5/8/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var brandSearchTextField: UITextField!
    
    @IBOutlet weak var keywordSearchTextField: UITextField!
    
    @IBOutlet weak var filterControl: UISegmentedControl!
    
    @IBOutlet weak var favoritesButton: UIBarButtonItem!
    
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //@IBAction func favoritesButtonPressed(_ sender: UIBarButtonItem) {
    //}
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var brandSearchText = brandSearchTextField.text! ?? ""
        var keywordSearchText = keywordSearchTextField.text ?? ""
        var filterText = ""
        var searchText = ""
        
        if filterControl.selectedSegmentIndex == 0 {
            filterText = "&diet=Gluten%20Free"}
        if filterControl.selectedSegmentIndex == 1 {
            filterText = "&diet=Vegan"}
        if filterControl.selectedSegmentIndex == 2 {
            filterText = "&diet=Vegetarian"}
        if filterControl.selectedSegmentIndex == 3 {
            filterText = ""}
        
        brandSearchText = brandSearchText.replacingOccurrences(of: " ", with: "%20")
        brandSearchText = brandSearchText.replacingOccurrences(of: "’", with: "%27")

        keywordSearchText = keywordSearchText.replacingOccurrences(of: " ", with: "%2-")

        if brandSearchText != "" {
            searchText += "&brand=\(brandSearchText)"
        }
        if keywordSearchText != "" {
            searchText += "&keyword=\(keywordSearchText)"
        }
        
        searchText += filterText
        
//        //if segue.identifier == "ShowFavoritiesSegue" {
//            //destination = segue.description as! SavedListViewController
//        //}
        if segue.identifier == "SearchShowSegue" {
            var destination = segue.destination as! ListViewController
            destination.searchText = searchText
        }
    }
}
