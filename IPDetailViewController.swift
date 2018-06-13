//
//  IPDetailViewController.swift
//  IPCalc
//
//  Created by OS X on 4/4/18.
//  Copyright © 2018 Will. All rights reserved.
//

import UIKit

class IPDetailViewController: UIViewController {
    var IPDetail : IPData!
    var netmaskDetail : Calculator!
    var IPRetainData : IPCalculator!
    var IPOctet1: String = ""
    var IPOctet2: String = ""
    var IPOctet3: String = ""
    var IPOctet4: String = ""
    var netmask: Int = 0
    
    @IBOutlet weak var IPaddress: UILabel!
    @IBOutlet weak var IPClass: UILabel!
    @IBOutlet weak var modify: UIButton!
    @IBOutlet weak var start: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named : "nework.jpg")!)
        modify.backgroundColor = UIColor.green
        modify.layer.cornerRadius = 5
        let IPadd = IPDetail.fullIP()
        start.backgroundColor = UIColor.green
        start.layer.cornerRadius = 5
        //displaying selected IP address in a label
        IPaddress.text = IPadd
        let IPAddressArray = IPadd.components(separatedBy: ".")
        IPOctet1 = IPAddressArray[0]
        IPOctet2 = IPAddressArray[1]
        IPOctet3 = IPAddressArray[2]
        IPOctet4 = IPAddressArray[3]
        let octet1 = Int(IPAddressArray[0])!
        
        //checking for IP address class
        if octet1 < 127
        {
            IPClass.text = "A"
        }
        else if octet1 > 127 && octet1 < 192
        {
            IPClass.text = "B"
        }
        else if octet1 > 191 && octet1 < 224
        {
            IPClass.text = "C"
        }
        else if octet1 > 223 && octet1 < 240
        {
            IPClass.text = "D"
        }
        else if octet1 > 239 && octet1 <= 255
        {
            IPClass.text = "E"
        }
    }
}
