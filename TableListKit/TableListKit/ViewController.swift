//
//  ViewController.swift
//  TableListKit
//
//  Created by Yiming Dong on 30/11/18.
//  Copyright © 2018 Yiming Dong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TableAdapterDataSource {

    var tableview: UITableView!
    
    var adapter: TableAdapter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview = UITableView(frame: view.bounds, style: .plain)
        view.addSubview(tableview)
        
        adapter = TableAdapter(tableView: tableview)
        adapter.dataSource = self
    }

    func objects(for tableViewAdapter: TableAdapter) -> [NSObject] {
        return ["1" as NSString, "" as NSString, "3" as NSString]
    }
    
    func tableAapter(_ tableAdapter: TableAdapter, sectionControllerFor object: NSObject) -> TableSectionController {
        if let object = object as? String {
            if object.isEmpty {
                return EmptySectionController()
            } else {
                return TextSectionController()
            }
        } else {
            return EmptySectionController()
        }
    }
}

