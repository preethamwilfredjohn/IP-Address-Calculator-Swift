//
//  IPData.swift
//  IPCalc
//
//  Created by OS X on 4/4/18.
//  Copyright © 2018 Will. All rights reserved.
//

import Foundation
class IPData{
    var IPOctet1: Int
    var IPOctet2: Int
    var IPOctet3: Int
    var IPOctet4: Int
    init(){
        IPOctet1 = 0
        IPOctet2 = 0
        IPOctet3 = 0
        IPOctet4 = 0
    }
    init(IPOct1: Int, IPOct2: Int, IPOct3: Int, IPOct4: Int){
        self.IPOctet1 = IPOct1
        self.IPOctet2 = IPOct2
        self.IPOctet3 = IPOct3
        self.IPOctet4 = IPOct4
    }
    
    //function for returning IP address
    func fullIP() -> String{
        return "\(IPOctet1).\(IPOctet2).\(IPOctet3).\(IPOctet4)"
    }
}
