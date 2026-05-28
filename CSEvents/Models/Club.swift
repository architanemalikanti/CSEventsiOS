//
//  Club.swift
//  A Cornell student organization that has joined this app!
//
//  Created by Archita Nemalikanti on 5/25/26.
//


struct Club: Codable, Hashable {
    /*
     The name of this club.
     */
    var name: String

    /*
     The bio of this club.
     */
    var bio: String

    /*
     Number of members who follow this club.
     */
    var followers: Int
}
