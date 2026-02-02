//
//  HousesViewController.swift
//  Wizipedia
//
//  Created by Tardes on 2/2/26.
//

import UIKit

class HousesViewController: UIViewController {
    @IBOutlet weak var griffindowView: GradientView!
    @IBOutlet weak var slytherinView: GradientView!
    @IBOutlet weak var hufflepuffView: GradientView!
    @IBOutlet weak var ravenclawView: GradientView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        griffindowView.applyCardStyle()
        slytherinView.applyCardStyle()
        hufflepuffView.applyCardStyle()
        ravenclawView.applyCardStyle()
    }
}
