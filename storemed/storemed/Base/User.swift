//
//  User.swift
//  Platform Mobile
//
//  Created by larens on 03/04/2019.
//  Copyright © 2019 Project All rights reserved.
//

import UIKit


class User: NSObject, Codable {
    
    struct Access: Codable {
        var addTask: Bool!
    }
    
    enum Role {
        case participant
        case moderator
    }
    
    var id: String?
    var username: String?
    var fullName: String?
    var firstName: String?
    var lastName: String?
    var profilePicture: String?
    var following: Bool?
    var followsYou: Bool?
    var followingCount: Int?
    var followersCount: Int?
    var access: Access?
    
    var role: Role?
    var isMe: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case username = "username"
        case fullName = "fullName"
        case firstName = "firstName"
        case lastName = "lastName"
        case profilePicture = "profilePicture"
        case following = "following"
        case followsYou = "followsYou"
        case followingCount = "followingCount"
        case followersCount = "followersCount"
        case access = "access"
    }
    
    
    // Rnadom
    
    static let names = [
        "Rosalina Cheung",
        "Sheridan Kellems",
        "Dorthey Zhao",
        "Alba Sustaita",
        "Sidney Poudrier",
        "Vincenzo Testani",
        "Kaylee Stocker",
        "Johana Feliz",
        "Stephani Lineman",
        "Zofia Bosworth",
        "Val Jiang",
        "Jon Roosevelt",
        "Alberto Pennell",
        "Arlie Halter",
        "Shaunda Gerace",
        "Maxie Monzon",
        "Elisha Loftis",
        "Mariela Lagunas",
        "Stan Swain",
        "France Surette",
        ]
    
    static func makeRandom() -> User {
        let user = User()
        user.profilePicture = "avatar-\((0...42).randomElement() ?? 0)"
        user.fullName = User.names.randomElement()
        user.role = Role.participant
        
        return user
    }
    

}
