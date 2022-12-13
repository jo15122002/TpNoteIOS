//
//  Users.swift
//  UserList
//
//  Created by digital on 01/12/2022.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let users = try? newJSONDecoder().decode(Users.self, from: jsonData)

import Foundation

// MARK: - User
struct User: Codable, Identifiable, Equatable {
    let id: Int
    var name, username, email: String
    var address: Address
    var phone, website: String
    var company: Company
    
    static func defaultuser()-> User {
        return User(id: 4, name: "Jean", username: "JB", email: "JBdu74@myspace.com", address: Address(street: "Rue jean massé", suite: "", city: "Paris", zipcode: "01548", geo: Geo(lat: "1.2545", lng: "0.25484")), phone: "0458745968", website: "JbLaRacaille.fr", company: Company(name: "JeanAndCo", catchPhrase: "Wesh on fait du style ici nous", bs: "bs"))
    }
    
    static func == (lhs: User, rhs: User) -> Bool{
        return lhs.id == rhs.id
    }
}

// MARK: - Address
struct Address: Codable {
    var street, suite, city, zipcode: String
    var geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    var lat, lng: String
}

// MARK: - Company
struct Company: Codable {
    var name, catchPhrase, bs: String
}

typealias Users = [User]
