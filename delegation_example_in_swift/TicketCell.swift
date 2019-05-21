//
//  TicketCell.swift
//  test
//
//  Created by AamirR on 5/21/19.
//  Copyright © 2019 AamirR. All rights reserved.
//

import UIKit

class TicketCell: UITableViewCell {

    @IBOutlet var label: UILabel!
    
    func setTicket(ticket: Ticket) {
        self.label.text = ticket.number
    }
    
}
