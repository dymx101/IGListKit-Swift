//
//  TextSectionController.swift
//  TableListKit
//
//  Created by Yiming Dong on 30/11/18.
//  Copyright © 2018 Yiming Dong. All rights reserved.
//

import UIKit

class TextSectionController: TableSectionControllerProtocol {
    var model: String?
    func cellForItem(at index: Int) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = model
        return cell
    }
    
    func didUpdate(to object: Any) {
        model = (object as! String)
    }
    
    func didSelectItem(at index: Int) {
        print("selected: \(model ?? "N/A")")
    }
}
