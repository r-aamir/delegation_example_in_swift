//
//  FirstViewController.swift
//  test
//
//  Created by AamirR on 5/21/19.
//  Copyright © 2019 AamirR. All rights reserved.
//

import UIKit

struct Ticket {
    let number: String
    let name: String
    let date: String
}
class FirstViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var data: [Ticket] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.data.append(contentsOf: self.createArray())
        self.tableView.register(UINib(nibName: "TicketCell", bundle: nil), forCellReuseIdentifier: "TicketCell")
        self.tableView.dataSource = self
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(barcodeAction))
    }
    
    @objc func barcodeAction() {
        let viewController = self.storyboard!.instantiateViewController(withIdentifier: "BarcodeVC") as! BarcodeViewController
        viewController.delegate = self
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func createArray() -> [Ticket] {
        let video1 = Ticket(number: "123456789", name: "First Name - Last Name", date: "May 18th, 2019, 7 am")
        let video2 = Ticket(number: "123456789", name: "First Name - Last Name", date: "May 18th, 2019, 7 am")
        return [video1, video2]
    }

}
extension FirstViewController: BarcodeDelegate {
    func add (_ code: String) {
        let tic = Ticket(number: code, name: "First Name - LastName", date: "May 18th, 2019, 10 am")
        print(tic.number)
        print(tic.name)
        print(tic.date)
        self.data.append(tic)
        self.tableView.reloadData()
    }
}
extension FirstViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ticket = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TicketCell", for: indexPath) as! TicketCell
        cell.setTicket(ticket: ticket)
        return cell
    }
    
}
