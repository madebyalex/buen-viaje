//
//  VacationDetailsVC.swift
//  buen-viaje
//
//  Created by Alexander on 19.09.2020.
//  Copyright © 2020 Alexander Nuzhnyi. All rights reserved.
//

import UIKit

class VacationDetailsVC: UIViewController {
    
    var vacation: Vacation!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = vacation.title
    }

}
