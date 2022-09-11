//
//  UserInfo.swift
//  Login
//
//  Created by 쭌이 on 2022/08/08.
//

import Foundation


class UserInfo {
    static let shared: UserInfo = UserInfo()
    
    var id: String?
    var password: String?
    var check: String?
    var text: String?
    var date: String?
    var phone: String? = ""
    
    
    //private init() { }
}
