//
//  UserAndFriend.swift
//  FriendFace
//
//  Created by gülçin çetin on 22.09.2025.
//

import Foundation
import SwiftUI

struct User: Codable, Identifiable, Hashable {
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
}

struct Friend: Codable, Identifiable, Hashable {
    var id: UUID
    var name: String
}
