//
//  IPListCalculation.swift
//  IPCalc
//
//  Created by OS X on 4/4/18.
//  Copyright © 2018 Will. All rights reserved.
//

import Foundation
class IPListcalculation{
    
    var IPOctet1: Int = 0
    var IPOctet2: Int = 0
    var IPOctet3: Int = 0
    var IPOctet4: Int = 0
    var Netmask: Int = 0
    var netmask1: UInt = 0
    var netmask2: UInt = 0
    var netmask3: UInt = 0
    var netmask4: UInt = 0
    var netoct1: Int = 0
    var netoct2: Int = 0
    var netoct3: Int = 0
    var netoct4: Int = 0
    var IPCellData: Array<IPData>
    
    init(IPCal1: Int, IPCal2: Int,
         IPCal3: Int, IPCal4: Int, netmaskInt: Int){
        IPOctet1 = IPCal1
        IPOctet2 = IPCal2
        IPOctet3 = IPCal3
        IPOctet4 = IPCal4
        Netmask = netmaskInt
        IPCellData = Array<IPData>()
        IPListInCells()
    }
    
    //function for returning data when a single row is selected
    func IPAtIndex(_ idx: Int) -> IPData{
        return IPCellData[idx]
    }
    
    //function for returning count
    func count() -> Int{
        return IPCellData.count
    }
    
    func IPListInCells() {
        
        //calling netmask calculation function
        calculateNetMask()
        var nextsub1 : Int = 0
        var nextsub2 : Int = 0
        var nextsub3 : Int = 0
        var nextsub4 : Int = 0
        var IPinterVal1 : Int
        var IPinterVal2 : Int
        var IPinterVal3 : Int
        var IPinterVal4 : Int
        
        //checking for the netmask range and creating an array with list of IP Addresses
        if Netmask < 9 {
            IPinterVal1 = 256 - netoct1
            nextsub1 = IPinterVal1
            if IPinterVal1 > IPOctet1{
                nextsub1 = 0
            }
            else{
                while nextsub1 <= IPOctet1{
                    nextsub1 = nextsub1 + IPinterVal1
                    if nextsub1 > IPOctet1{
                        nextsub1 = nextsub1 - IPinterVal1
                        break
                    }
                }
            }
            for oct1 in nextsub1 ... (nextsub1 + (IPinterVal1-1)){
                for oct2 in 0 ... 255{
                    for oct3 in 0 ... 255{
                        for oct4 in 1 ... 254
                        {
                            IPCellData.append(IPData(IPOct1: oct1, IPOct2: oct2, IPOct3: oct3, IPOct4: oct4))
                        }
                    }
                }
            }
        }
        else if Netmask > 8 && Netmask < 17{
            IPinterVal2 = 256 - netoct2
            nextsub2 = IPinterVal2
            if IPinterVal2 > IPOctet2{
                nextsub2 = 0
            }
            else{
                while nextsub2 <= IPOctet2{
                    nextsub2 = nextsub2 + IPinterVal2
                    if nextsub2 > IPOctet2{
                        nextsub2 = nextsub2 - IPinterVal2
                        break
                    }
                }
            }
            let oct1 = IPOctet1
            for oct2 in nextsub2 ... (nextsub2 + (IPinterVal2-1)){
                for oct3 in 0 ... 255{
                    for oct4 in 1 ... 254
                    {
                        IPCellData.append(IPData(IPOct1: oct1, IPOct2: oct2, IPOct3: oct3, IPOct4: oct4))
                    }
                }
            }
            
        }
        else if Netmask > 16 && Netmask < 25{
            IPinterVal3 = 256 - netoct3
            nextsub3 = IPinterVal3
            if IPinterVal3 > IPOctet3{
                nextsub3 = 0
            }
            else{
                while nextsub3 <= IPOctet3{
                    nextsub3 = nextsub3 + IPinterVal3
                    if nextsub3 > IPOctet3{
                        nextsub3 = nextsub3 - IPinterVal3
                        break
                    }
                }
            }
            
            let oct1 = IPOctet1
            let oct2 = IPOctet2
            for oct3 in nextsub3 ... (nextsub3 + (IPinterVal3-1)){
                for oct4 in 1 ... (254)
                {
                    IPCellData.append(IPData(IPOct1: oct1, IPOct2: oct2, IPOct3: oct3, IPOct4: oct4))
                }
            }
        }
        else if Netmask > 24 && Netmask < 33{
            
            IPinterVal4 = 256 - netoct4
            nextsub4 = IPinterVal4
            if IPinterVal4 > IPOctet4{
                nextsub4 = 0
            }
            else{
                while nextsub4 <= IPOctet4{
                    nextsub4 = nextsub4 + IPinterVal4
                    if nextsub4 > IPOctet4{
                        nextsub4 = nextsub4 - IPinterVal4
                        break
                    }
                }
            }
            let oct1 = IPOctet1
            let oct2 = IPOctet2
            let oct3 = IPOctet3
            for oct4 in nextsub4 ... (nextsub4 + (IPinterVal4-1))
            {
                IPCellData.append(IPData(IPOct1: oct1, IPOct2: oct2, IPOct3: oct3, IPOct4: oct4))
            }
        }
    }
    
    //function for calculating netmask
    func calculateNetMask()
    {
        //inititalizing netmask values
        let netmaskString : [Int : String] = [
            1 : "10000000, 00000000, 00000000, 00000000",
            2 : "11000000, 00000000, 00000000, 00000000",
            3 : "11100000, 00000000, 00000000, 00000000",
            4 : "11110000, 00000000, 00000000, 00000000",
            5 : "11111000, 00000000, 00000000, 00000000",
            6 : "11111100, 00000000, 00000000, 00000000",
            7 : "11111110, 00000000, 00000000, 00000000",
            8 : "11111111, 00000000, 00000000, 00000000",
            9 : "11111111, 10000000, 00000000, 00000000",
            10 : "11111111, 11000000, 00000000, 00000000",
            11 : "11111111, 11100000, 00000000, 00000000",
            12 : "11111111, 11110000, 00000000, 00000000",
            13 : "11111111, 11111000, 00000000, 00000000",
            14 : "11111111, 11111100, 00000000, 00000000",
            15 : "11111111, 11111110, 00000000, 00000000",
            16 : "11111111, 11111111, 00000000, 00000000",
            17 : "11111111, 11111111, 10000000, 00000000",
            18 : "11111111, 11111111, 11000000, 00000000",
            19 : "11111111, 11111111, 11100000, 00000000",
            20 : "11111111, 11111111, 11110000, 00000000",
            21 : "11111111, 11111111, 11111000, 00000000",
            22 : "11111111, 11111111, 11111100, 00000000",
            23 : "11111111, 11111111, 11111110, 00000000",
            24 : "11111111, 11111111, 11111111, 00000000",
            25 : "11111111, 11111111, 11111111, 10000000",
            26 : "11111111, 11111111, 11111111, 11000000",
            27 : "11111111, 11111111, 11111111, 11100000",
            28 : "11111111, 11111111, 11111111, 11110000",
            29 : "11111111, 11111111, 11111111, 11111000",
            30 : "11111111, 11111111, 11111111, 11111100",
            31 : "11111111, 11111111, 11111111, 11111110",
            32 : "11111111, 11111111, 11111111, 11111111",
            ]
        //creating an array to store and retrive netmask values
        let netmaskar = netmaskString[Netmask]?.components(separatedBy: ", ")
        
        //converting netmask to UInt data type
        netmask1 = UInt(netmaskar![0])!
        netmask2 = UInt(netmaskar![1])!
        netmask3 = UInt(netmaskar![2])!
        netmask4 = UInt(netmaskar![3])!
        
        //converting netmask to Int data type
        netoct1 = Int(String(netmask1), radix:2)!
        netoct2 = Int(String(netmask2), radix:2)!
        netoct3 = Int(String(netmask3), radix:2)!
        netoct4 = Int(String(netmask4), radix:2)!
    }
}
