//
//  ListViewController.swift
//  EasyAllergies
//
//  Created by Michael Klein on 5/9/21.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var foods = Foods()
    var searchText = ""
    //var items = ["Lucky Charms", "Captain Crunch", "Honey Nut Cheerios", "Love Cereal"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        foods.urlString += searchText
        foods.getData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailViewController
        let selectedIndexPath = tableView.indexPathForSelectedRow!
        destination.food = foods.foodArray[selectedIndexPath.row].self
    }

}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.foodArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = foods.foodArray[indexPath.row].name
        cell.detailTextLabel?.text = foods.foodArray[indexPath.row].brand
        return cell
    }
    
    
    
}
