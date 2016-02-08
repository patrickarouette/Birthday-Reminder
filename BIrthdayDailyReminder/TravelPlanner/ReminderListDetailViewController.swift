//
//  ListDetailViewController.swift
//  BirthdayDailyReminder
//
//  Created by Patrick Arouette on 26/01/16.
//  Copyright © 2016 Patrick Arouette. All rights reserved.
//

import UIKit
protocol ReminderListDetailViewControllerDelegate: class
{
    func reminderListDetailViewControllerDidCancel(controller: ReminderListDetailViewController)
    func reminderListDetailViewController(controller: ReminderListDetailViewController, didFinishAddingReminderList reminderList:ReminderList)
    func reminderListDetailViewController(controller: ReminderListDetailViewController, didFinishEditingReminderList reminderList:ReminderList)
}

class ReminderListDetailViewController: UITableViewController, UITextFieldDelegate
{
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var textReminderField: UITextField!
    weak var delegate: ReminderListDetailViewControllerDelegate?
    var reminderListToEdit: ReminderList?

    @IBAction func cancel()
    {
        delegate?.reminderListDetailViewControllerDidCancel(self)
    }

    @IBAction func done()
    {
        if let reminderList = reminderListToEdit
        {
            reminderList.name = textReminderField.text!
            delegate?.reminderListDetailViewController(self, didFinishEditingReminderList: reminderList)
        }
        else
        {
            let reminderList = ReminderList(name: textReminderField.text!)
            delegate?.reminderListDetailViewController(self, didFinishAddingReminderList: reminderList)
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        if let reminderList = reminderListToEdit
        {
            title = "Edit ReminderList"
            textReminderField.text = reminderList.name
            
            doneBarButton.enabled = true
        }
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        textReminderField.becomeFirstResponder()
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath?
    {
        return nil
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool
    {
        let oldText: NSString = textField.text!
        let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)
        doneBarButton.enabled = (newText.length > 0)
        return true
    }

}

