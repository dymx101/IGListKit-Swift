//
//  TableAdapterDataSource.swift
//  TableListKit
//
//  Created by Yiming Dong on 30/11/18.
//  Copyright © 2018 Yiming Dong. All rights reserved.
//

import Foundation

protocol TableAdapterDataSource: class {
    func objects(for tableViewAdapter: TableAdapter) -> [NSObject]
    func tableAapter(_ tableAdapter: TableAdapter, sectionControllerFor object: NSObject) -> TableSectionController
}
