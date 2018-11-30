//
//  TableContext.swift
//  TableListKit
//
//  Created by Yiming Dong on 30/11/18.
//  Copyright © 2018 Yiming Dong. All rights reserved.
//

import UIKit

protocol TableContext {
    func dequeueCell(nibName:String, for sectionController: TableSectionController, at index: Int) -> UITableViewCell
}
