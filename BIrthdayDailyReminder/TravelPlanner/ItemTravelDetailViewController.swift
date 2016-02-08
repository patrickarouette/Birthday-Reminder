//
//  AddTravelItemViewController.swift
//  TravelPlanner
//
//  Created by Patrick Arouette on 25/01/16.
//  Copyright © 2016 Patrick Arouette. All rights reserved.
//

import Foundation
import UIKit

protocol ItemTravelViewControllerDelegate: class
{
    func addTravelItemViewControllerDidCancel(controller: ItemTravelDetailViewController)
    func addTravelItemViewController(controller: ItemTravelDetailViewController, didFinishAddingItem item: TravelListItem)
    func addItemViewController(controller: ItemTravelDetailViewController, didFinishEditingItem item: TravelListItem)
}

class ItemTravelDetailViewController: UITableViewController, UITextFieldDelegate
{
    weak var delegate: ItemTravelViewControllerDelegate?
    
    
    @IBOutlet weak var textFieldTravel: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    var itemTravelToEdit: TravelListItem?
    
    @IBAction func cancel()
    {
        delegate?.addTravelItemViewControllerDidCancel(self)
    }
    
    @IBAction func done()
    {
        if let item = itemTravelToEdit
        {
            item.textTravel = textFieldTravel.text!
            delegate?.addItemViewController(self, didFinishEditingItem: item)
        } else
        {
            let travelItem = TravelListItem()
            travelItem.textTravel = textFieldTravel.text!
            travelItem.checkedTravel = false
            delegate?.addTravelItemViewController(self, didFinishAddingItem: travelItem)
        }
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath?
    {
        return nil
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        doneBarButton.enabled = false
        textFieldTravel.becomeFirstResponder()
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool
    {
        let oldText: NSString = textFieldTravel.text!
        let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)
        doneBarButton.enabled = (newText.length > 0)
        return true
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        if let item = itemTravelToEdit
        {
            title = "Edit Item"
            textFieldTravel.text = item.textTravel
            doneBarButton.enabled = true
        }
    }
    
}