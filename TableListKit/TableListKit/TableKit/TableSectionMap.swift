//
//  TableSectionMap.swift
//  TableListKit
//
//  Created by Yiming Dong on 30/11/18.
//  Copyright © 2018 Yiming Dong. All rights reserved.
//

import Foundation

class TableSectionMap {
    var sectionToControllerMap = [TableSectionController: Int]()
    var objectToControllerMap = [NSObject: TableSectionController]()
    
    func clear() {
        sectionToControllerMap.removeAll()
        objectToControllerMap.removeAll()
    }
}
