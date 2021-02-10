//
//  CalcuolatorTableViewController.swift
//  ios-dca-calculator
//
//  Created by Charlie on 2/9/21.
//

import UIKit

class CalculatorTableViewController: UITableViewController {
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var asset: Asset?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        symbolLabel.text = asset?.searchResult.symbol
        nameLabel.text = asset?.searchResult.name
    }
}
