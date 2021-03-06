//
//  ReminderList.swift
//  BirthdayDailyReminder
//
//  Created by Patrick Arouette on 26/01/16.
//  Copyright © 2016 Patrick Arouette. All rights reserved.
//

import UIKit

class ReminderList: NSObject, NSCoding
{
    var name = ""
    var items = [TravelListItem]()

    init(name: String)
    {
        self.name = name
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        name = aDecoder.decodeObjectForKey("Name") as! String
        items = aDecoder.decodeObjectForKey("Items") as! [TravelListItem]
        super.init()
    }

    func encodeWithCoder(aCoder: NSCoder)
    {
        aCoder.encodeObject(name, forKey: "Name")
        aCoder.encodeObject(items, forKey: "Items")
    }
    
    func countUncheckedItems() -> Int
    {
        var count = 0
        for item in items where !item.checkedTravel
        {
            count += 1
        }
        return count
    }
    
}

