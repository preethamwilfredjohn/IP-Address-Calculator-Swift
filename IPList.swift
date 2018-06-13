//
//  IPList.swift
//  IPCalc
//
//  Created by OS X on 4/4/18.
//  Copyright © 2018 Will. All rights reserved.
//

import UIKit

class IPList: UITableViewController {
    var IPListTable : IPListcalculation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        IPListTable = IPListcalculation(IPCal1: IP1 , IPCal2: IP2, IPCal3: IP3, IPCal4: IP4, netmaskInt: NetMaskBits)
        
        //table view protocols
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    //function for checking number of sections in the table view
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //function for displaying header for the table section
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "IP List"
    }
    
    //function for returning count of rows in table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return IPListTable.count()
    }
    
    //function for populating value for each row in table
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "IPCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        var IPadd = IPData()
        IPadd = IPListTable.IPAtIndex(indexPath.row)
        cell.textLabel!.text = IPadd.fullIP()
        return cell
    }
    
    //segue function
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segueID = segue.identifier{
            switch segueID {
            case "IPDetail":
                if let IPDVC = segue.destination as? IPDetailViewController{
                    let selectedRow = self.tableView.indexPathForSelectedRow?.row
                    IPDVC.IPDetail = IPListTable.IPAtIndex(selectedRow!)
                }
            default:
                break
            }
        }
    }
}
