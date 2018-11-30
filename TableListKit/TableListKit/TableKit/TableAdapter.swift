//
//  TableAdapter.swift
//  TableListKit
//
//  Created by Yiming Dong on 30/11/18.
//  Copyright © 2018 Yiming Dong. All rights reserved.
//

import UIKit

class TableAdapter: NSObject {
    
    var sectionMap = TableSectionMap()
    
    var tableView: UITableView
    weak var dataSource: TableAdapterDataSource? {
        didSet {
            updateSectionMap()
        }
    }
    
    init(tableView: UITableView, dataSource: TableAdapterDataSource? = nil) {
        self.tableView = tableView
        self.dataSource = dataSource
        
        super.init()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func reloadData() {
        updateSectionMap()
        tableView.reloadData()
    }
    
    func sectionController(for index: Int) -> TableSectionController? {
        guard let data = dataSource?.objects(for: self)[index] else {return nil}
        let controller = sectionMap.objectToControllerMap[data]
        controller?.didUpdate(to: data)
        return controller
    }
    
    func index(for sectionController: TableSectionController) -> Int? {
        return sectionMap.sectionToControllerMap[sectionController]
    }
    
    private func updateSectionMap() {
        sectionMap.clear()
        guard let objects = dataSource?.objects(for: self) else {return}
        
        for (index, data) in objects.enumerated() {
            if let sectionController = dataSource?.tableAapter(self, sectionControllerFor: data) {
                sectionMap.sectionToControllerMap[sectionController] = index
                sectionMap.objectToControllerMap[data] = sectionController
            }
        }
    }
}

extension TableAdapter: TableContext {
    func dequeueCell(nibName:String, for sectionController: TableSectionController, at index: Int) -> UITableViewCell {
        guard let section = sectionMap.sectionToControllerMap[sectionController] else {return UITableViewCell()}
        let index = IndexPath(row: index, section: section)
        return tableView.dequeueReusableCell(withIdentifier: nibName, for: index)
    }
}

extension TableAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let controller = sectionController(for: indexPath.section) else {return}
        
        controller.didSelectItem(at: indexPath.row)
    }
}

extension TableAdapter: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource?.objects(for: self).count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let controller = sectionController(for: indexPath.section) else {return UITableViewCell()}
        
        let cell = controller.cellForItem(at: indexPath.row)
        
        return cell
    }
}
