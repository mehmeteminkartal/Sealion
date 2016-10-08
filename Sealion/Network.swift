//
//  Network.swift
//  Sealion
//
//  Created by Dima Bart on 2016-10-05.
//  Copyright © 2016 Dima Bart. All rights reserved.
//

import Foundation

public struct Network: JsonCreatable, Equatable {
    
    public let ip:      String
    public let type:    String
    public let netmask: String
    public let gateway: String
    
    // ----------------------------------
    //  MARK: - JsonCreatable -
    //
    public init(json: JSON) {
        self.ip      = json["ip_address"] as! String
        self.type    = json["type"]       as! String
        self.gateway = json["gateway"]    as! String
        
        /* ---------------------------------
         ** Attempt to cast the netmask as
         ** integer first for ipv6 masks.
         */
        let netmask  = json["netmask"]!
        if let string = netmask as? Int {
            self.netmask = String(string)
        } else {
            self.netmask = netmask as! String
        }
    }
}

public func ==(lhs: Network, rhs: Network) -> Bool {
    return (lhs.ip == rhs.ip) &&
        (lhs.type    == rhs.type) &&
        (lhs.netmask == rhs.netmask) &&
        (lhs.gateway == rhs.gateway)
}
