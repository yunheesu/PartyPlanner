//
//  ViewController.swift
//  PartyPlanner
//
//  Created by Heesu Yun on 3/9/20.
//  Copyright © 2020 Heesu Yun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
        
    var partyPlannerList: [PartyPlannerListItem] = []
    var partyItems = ["Potato Chips",
                      "Tortilla Chips",
                      "Salsa",
                      "Chili",
                      "Punch",
                      "Sudsy Beverages",
                      "Brownies",
                      "Cupcakes",
                      "Fruit salad",
                      "Ribs",
                      "Corn bread",
                      "Macaroni Salad",
                      "Sandwich Rolls",
                      "Roast Beef",
                      "Ham",
                      "Cheese",
                      "Mayo",
                      "Mustard",
                      "Hummus",
                      "Baby carrots",
                      "Celery",
                      "Veggie Dip",
                      "Napkins",
                      "Plates & Bowls",
                      "Forks and Knives",
                      "Cups"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        for partyItem in partyItems { //loop through all items
            let partyListItem = PartyPlannerListItem(item: partyItem, personResponsible: "")
            partyPlannerList.append(partyListItem) // just to refer to partyPlannerList
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //preparing for segway
        if segue.identifier == "Show Detail" {
        let destination = segue.destination as! ItemDetailViewController
        let selectedIndexPath = tableView.indexPathForSelectedRow
            destination.partyPlannerListItem = partyPlannerList[selectedIndexPath!.row]
        }else{
            if let selectedIndexPath = tableView.indexPathForSelectedRow { //when + is clicked, initialize the properties to empty strings
                tableView.deselectRow(at: selectedIndexPath, animated: true) // updating use interface to display appropriate values
            }
        }
    }

    @IBAction func unwindFromItemDetatilViewController(for segue: UIStoryboardSegue) {
        let source = segue.source as! ItemDetailViewController
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            partyPlannerList[selectedIndexPath.row] = source.partyPlannerListItem
            tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
        }else{
            let newIndexPath = IndexPath(row: partyPlannerList.count, section:0)
            partyPlannerList.append(source.partyPlannerListItem)
            tableView.insertRows(at: [newIndexPath], with: .bottom)
            tableView.scrollToRow(at: newIndexPath, at: .bottom, animated: true)
        }
    }
    
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("👊🏻 numberOfRowsInSection was just called and there are \(partyPlannerList.count) rows in the tableView")
        return partyPlannerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = partyPlannerList[indexPath.row].item
        cell.detailTextLabel?.text = partyPlannerList[indexPath.row].personResponsible //subtitle --> changed partyItems to partyPlannerList!
        print("👍🏻 dequeueing the table view cell for indexPath.row = \(indexPath.row) where the cell contains item \(partyPlannerList[indexPath.row])")
        return cell
    }
    
    
}
