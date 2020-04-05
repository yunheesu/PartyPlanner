//
//  ItemDetailViewController.swift
//  PartyPlanner
//
//  Created by Heesu Yun on 3/9/20.
//  Copyright © 2020 Heesu Yun. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {

    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var personResponsibleField: UITextField!
    
    var partyPlannerListItem: PartyPlannerListItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if partyPlannerListItem == nil {
        partyPlannerListItem = PartyPlannerListItem(item: "", personResponsible: "")
        }
        itemTextField.text = partyPlannerListItem.item
        personResponsibleField.text = partyPlannerListItem.personResponsible
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        partyPlannerListItem.item = itemTextField.text!
        partyPlannerListItem.personResponsible = personResponsibleField.text!
    }
    @IBAction func cancelBarButtonPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        }else{
            navigationController!.popViewController(animated: true)
        }
    }
    

    @IBAction func saveBarButton(_ sender: UIBarButtonItem) {
    }
}
