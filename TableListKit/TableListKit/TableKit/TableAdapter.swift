//
//  TableAdapter.swift
//  TableListKit
//
//  Created by Yiming Dong on 30/11/18.
//  Copyright © 2018 Yiming Dong. All rights reserved.
//

import UIKit

class TableAdapter: NSObject {
    
    var tableView: UITableView
    weak var dataSource: TableAdapterDataSource?
    
    init(tableView: UITableView, dataSource: TableAdapterDataSource? = nil) {
        self.tableView = tableView
        self.dataSource = dataSource
        
        super.init()
        
        self.tableView.dataSource = self
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func sectionController(for indexPath: IndexPath) -> TableSectionControllerProtocol? {
        guard let data = dataSource?.objects(for: self)[indexPath.row] else {return nil}
        let sectionController = dataSource?.tableAapter(self, sectionControllerFor: data)
        sectionController?.didUpdate(to: data)
        return sectionController
    }
}

extension TableAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let controller = sectionController(for: indexPath) else {return}
        
        controller.didSelectItem(at: indexPath.row)
    }
}

extension TableAdapter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.objects(for: self).count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let controller = sectionController(for: indexPath) else {return UITableViewCell()}
        
        let cell = controller.cellForItem(at: indexPath.row)
        
        return cell
    }
}
