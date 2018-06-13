//
//  ViewController.swift
//  IPCalc
//
//  Created by OS X on 3/29/18.
//  Copyright © 2018 Will. All rights reserved.


import UIKit
var IP1 : Int = 0
var IP2 : Int = 0
var IP3 : Int = 0
var IP4 : Int = 0
var NetMaskBits : Int = 0
class IPCalculator: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var checkIPTable: UIButton!
    @IBOutlet weak var CalculateFirstLast: UIButton!
    @IBOutlet weak var octet1: UITextField!
    @IBOutlet weak var octet2: UITextField!
    @IBOutlet weak var octet3: UITextField!
    @IBOutlet weak var octet4: UITextField!
    @IBOutlet weak var netmask: UITextField!
    var oct1 = String()
    var oct2 = String()
    var oct3 = String()
    var oct4 = String()
    var net1 = String()
    
    var calIP : Calculator!
    var listIP : IPListcalculation!
    var IPdata : Int = 0
    
    //Creating functionality for the button check first and last IP address
    @IBAction func checkFirstLastIP(_ sender: UIButton) {
        
        //error handling
        if((octet1.text?.isEmpty)! || (octet2.text?.isEmpty)! || (octet3.text?.isEmpty)! || (octet4.text?.isEmpty)! || (netmask.text?.isEmpty)!){
            let checkIPEmpty = UIAlertController(title: "Wait!!!", message: "Please Enter value in all fields", preferredStyle: UIAlertControllerStyle.alert)
            let fillIP = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
            checkIPEmpty.addAction(fillIP)
            self.present(checkIPEmpty, animated: true, completion: nil)
            return
        }
        IP1 = Int(octet1.text!)!
        IP2 = Int(octet2.text!)!
        IP3 = Int(octet3.text!)!
        IP4 = Int(octet4.text!)!
        NetMaskBits = Int(netmask.text!)!
        if (IP1 < 0 || IP1 > 255 || IP2 < 0 || IP2 > 255 || IP3 < 0 || IP3 > 255 || IP4 < 0 || IP4 > 255){
            let alertIP = UIAlertController(title: "Correct IP Range", message: "Please Enter Proper IP address", preferredStyle: UIAlertControllerStyle.alert)
            let fillIP = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
            alertIP.addAction(fillIP)
            self.present(alertIP, animated: true, completion: nil)
            return
        }
        if (NetMaskBits > 16 || NetMaskBits < 1 ){
            let alertNetMask = UIAlertController(title: "Correct Netmask", message: "Please Enter Netmask between 1-16", preferredStyle: UIAlertControllerStyle.alert)
            let fillNetMask = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
            alertNetMask.addAction(fillNetMask)
            self.present(alertNetMask, animated: true, completion: nil)
            return
        }
        
        //calling calculation model
        calIP = Calculator(IPCal1: IP1, IPCal2: IP2, IPCal3: IP3, IPCal4: IP4, netmaskInt: NetMaskBits)
        let firstIP = calIP.calculateIP().firstIP
        let lastIP = calIP.calculateIP().lastIP
        let netmaskAddress = calIP.calculateIP().netMaskAddress
        
        //displaying result as an alert
        let alertUser = UIAlertController(title:"IP Range Calculation", message:"First IP: \(firstIP)\nLast IP: \(lastIP)\nSubNetMask: \(netmaskAddress)", preferredStyle: UIAlertControllerStyle.alert)
        let filled = UIAlertAction(title:"ok", style:UIAlertActionStyle.default, handler: nil)
        alertUser.addAction(filled)
        self.present(alertUser, animated: true, completion: nil)
        return
        
    }
    
    //creating functionality the button Check IP List
    @IBAction func checkIPList(_ sender: UIButton) {
        
        //error handling
        if((octet1.text?.isEmpty)! || (octet2.text?.isEmpty)! || (octet3.text?.isEmpty)! || (octet4.text?.isEmpty)! || (netmask.text?.isEmpty)!){
            let checkIPEmpty = UIAlertController(title: "Wait!!!", message: "Please Enter value in all fields", preferredStyle: UIAlertControllerStyle.alert)
            let fillIP = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
            checkIPEmpty.addAction(fillIP)
            self.present(checkIPEmpty, animated: true, completion: nil)
            return
        }
        IP1 = Int(octet1.text!)!
        IP2 = Int(octet2.text!)!
        IP3 = Int(octet3.text!)!
        IP4 = Int(octet4.text!)!
        NetMaskBits = Int(netmask.text!)!
        if (IP1 < 0 || IP1 > 255 || IP2 < 0 || IP2 > 255 || IP3 < 0 || IP3 > 255 || IP4 < 0 || IP4 > 255){
            let alertIP = UIAlertController(title: "Correct IP Range", message: "Please Enter Proper IP address", preferredStyle: UIAlertControllerStyle.alert)
            let fillIP = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
            alertIP.addAction(fillIP)
            self.present(alertIP, animated: true, completion: nil)
            return
        }
        if (NetMaskBits > 16 || NetMaskBits < 0 ){
            let alertNetMask = UIAlertController(title: "Correct Netmask", message: "Please Enter Netmask between 1-16", preferredStyle: UIAlertControllerStyle.alert)
            let fillNetMask = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
            alertNetMask.addAction(fillNetMask)
            self.present(alertNetMask, animated: true, completion: nil)
            return
        }
        
        //calling IP list calculation model
        listIP = IPListcalculation(IPCal1: IP1, IPCal2: IP2, IPCal3: IP3, IPCal4: IP4, netmaskInt: NetMaskBits)
    }

    //function to resign keyboard when touched anywhere else on the application
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        octet1.resignFirstResponder()
        view.endEditing(true)
    }
    
    //function for allowing only numbers to be entered
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
        return string.rangeOfCharacter(from: invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        octet1.becomeFirstResponder()
        self.octet1.delegate = self
        self.octet2.delegate = self
        self.octet3.delegate = self
        self.octet4.delegate = self
        self.netmask.delegate = self
        octet1.keyboardType = .numberPad
        octet2.keyboardType = .numberPad
        octet3.keyboardType = .numberPad
        octet4.keyboardType = .numberPad
        netmask.keyboardType = .numberPad
        self.view.backgroundColor = UIColor(patternImage: UIImage(named : "nework.jpg")!)
        
        
        CalculateFirstLast.backgroundColor = UIColor.green
        CalculateFirstLast.layer.cornerRadius = 5
        checkIPTable.backgroundColor = UIColor.green
        checkIPTable.layer.cornerRadius = 5
    }
    
    //unwinding segue for modify button in last view controller
    @IBAction func modify(_ sender: UIStoryboardSegue) {
        octet1.text = String(IP1)
        octet2.text = String(IP2)
        octet3.text = String(IP3)
        octet4.text = String(IP4)
        netmask.text = String(NetMaskBits)
        
    }
    
    //unwinding segue for start over button in last view controller
    @IBAction func start(_ sender: UIStoryboardSegue) {
        octet1.text = ""
        octet2.text = ""
        octet3.text = ""
        octet4.text = ""
        netmask.text = ""
        octet1.becomeFirstResponder()
    }
    
}

