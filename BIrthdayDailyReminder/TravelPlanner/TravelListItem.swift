//
//  TravelListItem.swift
//  TravelPlanner
//
//  Created by Patrick Arouette on 25/01/16.
//  Copyright © 2016 Patrick Arouette. All rights reserved.
//

import Foundation

class TravelListItem : NSObject, NSCoding
{
    var textTravel = ""
    var checkedTravel = false
    
    override init()
    {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        textTravel = aDecoder.decodeObjectForKey("Text") as! String
        checkedTravel = aDecoder.decodeBoolForKey("Checked")
        super.init()
    }
    
    func toggleChecked()
    {
        checkedTravel = !checkedTravel
    }
    
    func encodeWithCoder(aCoder: NSCoder)
    {
        aCoder.encodeObject(textTravel, forKey: "Text")
        aCoder.encodeBool(checkedTravel, forKey: "Checked")
    }
    
}