//
//  Calculation.swift
//  IPCalc
//
//  Created by OS X on 3/29/18.
//  Copyright © 2018 Will. All rights reserved.
//

import Foundation

class Calculator{
    var IPOctet1: Int
    var IPOctet2: Int
    var IPOctet3: Int
    var IPOctet4: Int
    var Netmask: Int
    var IPCellData : Array<IPData>
    var netmask1: UInt = 0
    var netmask2: UInt = 0
    var netmask3: UInt = 0
    var netmask4: UInt = 0
    var netoct1: Int = 0
    var netoct2: Int = 0
    var netoct3: Int = 0
    var netoct4: Int = 0
    var firstIPOct1: Int = 0
    var firstIPOct2: Int = 0
    var firstIPOct3: Int = 0
    var firstIPOct4: Int = 0
    var lastIPOct1: Int = 0
    var lastIPOct2: Int = 0
    var lastIPOct3: Int = 0
    var lastIPOct4: Int = 0

    init(IPCal1: Int, IPCal2: Int,
         IPCal3: Int, IPCal4: Int, netmaskInt: Int) {
        IPOctet1 = IPCal1
        IPOctet2 = IPCal2
        IPOctet3 = IPCal3
        IPOctet4 = IPCal4
        Netmask = netmaskInt
        IPCellData = Array<IPData>()
    }
    
    //calculating first and last IP
    func calculateIP()-> (firstIP: String, lastIP: String, netMaskAddress: String){
        
        //calling netmask calculation function
        calculateNetMask()
        var firstIP : String
        var lastIP : String
        var netMaskAddress: String
        var IPinterVal1 : Int
        var IPinterVal2 : Int
        var IPinterVal3 : Int
        var IPinterVal4 : Int
        
        //checking for the netmask range
        if Netmask < 9 {
            var nextsub : Int = 0
            IPinterVal1 = 256 - netoct1
            nextsub = IPinterVal1
            if IPinterVal1 > IPOctet1{
                nextsub = 0
            }
            else{
            while nextsub <= IPOctet1{
                nextsub = nextsub + IPinterVal1
                if nextsub > IPOctet1{
                    nextsub = nextsub - IPinterVal1
                    break
                }
            }
            }
            firstIPOct1 = nextsub
            firstIPOct2 = 0
            firstIPOct3 = 0
            firstIPOct4 = 1
            lastIPOct1 = nextsub + (IPinterVal1-1)
            lastIPOct2 = 255
            lastIPOct3 = 255
            lastIPOct4 = 254
        }
        else if Netmask > 8 && Netmask < 17{
            var nextsub : Int = 0
            IPinterVal2 = 256 - netoct2
            nextsub = IPinterVal2
            if IPinterVal2 > IPOctet2{
                nextsub = 0
            }
            else{
            while nextsub <= IPOctet2{
                nextsub = nextsub + IPinterVal2
                if nextsub > IPOctet2{
                    nextsub = nextsub - IPinterVal2
                    break
                }
            }
            }
            firstIPOct1 = IPOctet1
            firstIPOct2 = nextsub
            firstIPOct3 = 0
            firstIPOct4 = 1
            lastIPOct1 = IPOctet1
            lastIPOct2 = nextsub + (IPinterVal2-1)
            lastIPOct3 = 255
            lastIPOct4 = 254
        }
        else if Netmask > 16 && Netmask < 25{
            var nextsub : Int = 0
            
            IPinterVal3 = 256 - netoct3
            nextsub = IPinterVal3
            if IPinterVal3 > IPOctet3{
                nextsub = 0
            }
            else{
                while nextsub <= IPOctet3{
                    nextsub = nextsub + IPinterVal3
                    if nextsub > IPOctet3{
                        nextsub = nextsub - IPinterVal3
                        break
                    }
                }
            }
            firstIPOct1 = IPOctet1
            firstIPOct2 = IPOctet2
            firstIPOct3 = nextsub
            firstIPOct4 = 1
            lastIPOct1 = IPOctet1
            lastIPOct2 = IPOctet2
            lastIPOct3 = nextsub + (IPinterVal3-1)
            lastIPOct4 = 254
        }
        else if Netmask > 24 && Netmask < 33{
            var nextsub : Int = 0
            IPinterVal4 = 256 - netoct4
            nextsub = IPinterVal4
            if IPinterVal4 > IPOctet4{
                nextsub = 0
            }
            else{
            while nextsub <= IPOctet4{
                nextsub = nextsub + IPinterVal4
                if nextsub > IPOctet4{
                    nextsub = nextsub - IPinterVal4
                    break
                }
            }
            }
            firstIPOct1 = IPOctet1
            firstIPOct2 = IPOctet2
            firstIPOct3 = IPOctet3
            firstIPOct4 = nextsub
            lastIPOct1 = IPOctet1
            lastIPOct2 = IPOctet2
            lastIPOct3 = IPOctet3
            lastIPOct4 = nextsub + (IPinterVal4-1)
        }
        
        //generating IP addresses and netmask address using interpolation
        firstIP = "\(firstIPOct1).\(firstIPOct2).\(firstIPOct3).\(firstIPOct4)"
        lastIP = "\(lastIPOct1).\(lastIPOct2).\(lastIPOct3).\(lastIPOct4)"
        netMaskAddress = "\(netoct1).\(netoct2).\(netoct3).\(netoct4)"
        return (firstIP, lastIP, netMaskAddress)
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
