//
//  User.swift
//  CSEvents
//
//  Created by Archita Nemalikanti on 5/25/26.
//

import Foundation


/*
 A struct to represent a basic user of this app. Conforms to Codable.
 */
struct User: Codable {
    /*
     The name of the user.
     */
    var firstName: String
    
    /*
     The number of events the user is attending.
     */
    var numEventsAttending: Int
    
    /*
     The actual events that the user is attending.
     */
    var eventsAttending: [Event]
    
    /*
     The Cornell email of the student.
     */
    var cornellEmail: String
    
    /*
     The number of clubs that the user is following.
     */
    var numFollowing: Int
    
    /*
     The clubs that the user is following.
     */
    var following: [Club]
    
    /*
     The college major of the student.
     */
    var major: String
    
    /*
     The class standing of the student. (Will eventually make an enum).
     */
    var year: String
    
    
}
