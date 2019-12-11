//
//  UserInformation.swift
//  boostcouse02-iOS
//
//  Created by 차요셉 on 09/12/2019.
//  Copyright © 2019 차요셉. All rights reserved.
//

import Foundation

class UserInformation {
    static let shared: UserInformation = UserInformation()
    
    var id:String?
    var password:String?
    var text:String?
    var phonenumber:String?
    var birth:String?
}
