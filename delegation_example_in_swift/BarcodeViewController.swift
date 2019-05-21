//
//  ViewController.swift
//  test
//
//  Created by AamirR on 5/21/19.
//  Copyright © 2019 AamirR. All rights reserved.
//

import UIKit

protocol BarcodeDelegate: class {
    func add(_ code: String)
}

class BarcodeViewController: UIViewController {

    weak var delegate: BarcodeDelegate?
    
    private func exitAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addBarcode(_ sender: Any) {
        let range = 10001...99999
        let min = UInt32(range.lowerBound)
        let max = UInt32(range.upperBound)
        let ticketNumber = min + arc4random_uniform(max - min)
        self.delegate?.add("\(Int(ticketNumber))")
        self.exitAction()
    }
    
}
