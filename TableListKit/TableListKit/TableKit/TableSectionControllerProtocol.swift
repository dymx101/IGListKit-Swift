//
//  TableSectionControllerProtocol.swift
//  TableListKit
//
//  Created by Yiming Dong on 30/11/18.
//  Copyright © 2018 Yiming Dong. All rights reserved.
//

import UIKit

protocol TableSectionControllerProtocol {
    func cellForItem(at index: Int) -> UITableViewCell
    func didUpdate(to object: Any)
    func didSelectItem(at index: Int)
}
