//
//  Model.swift
//  iOSMessengerOnline
//
//  Created by Amanzhol on 30.06.2024.
//

import Foundation
import UIKit

enum AuthResponce {
    case success, noVerify, error
}

struct Slides {
    var id: Int
    var text: String
    var image: UIImage
}

struct LoginField {
    var email: String
    var password: String
}

struct ResponseCode {
    var code: Int
    
}
