//
//  TextSectionController.swift
//  TableListKit
//
//  Created by Yiming Dong on 30/11/18.
//  Copyright © 2018 Yiming Dong. All rights reserved.
//

import UIKit

class TextSectionController: TableSectionController {
    var model: String?
    override func cellForItem(at index: Int) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = model
        return cell
    }
    
    override func didUpdate(to object: NSObject) {
        model = (object as! String)
    }
    
    override func didSelectItem(at index: Int) {
        print("selected: \(model ?? "N/A")")
    }
}
