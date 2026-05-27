//
//  Event.swift
//  CSEvents
//
//  Created by Archita Nemalikanti on 5/22/26.
//

import Foundation

/*
 Just any regular event that a club may host.
 */
struct Event: Codable {
    /*
     The club that's hosting this event.
     */
    var host: Club
    
    /*
     The title of the event.
     */
    var title: String
    
    /*
     The location of the event. (string for now)
     */
    var location: String
    
    /*
     The description of the event.
     */
    var description: String
    
    /*
     The start time of the event.
     */
    var startTime: Date
    
    /*
     The end time of the event.
     */
    var endTime: Date
    
    /*
     The category of this event.
     */
    var category: EventCategory
    
    /*
     The number of people attending this event.
     */
    var numberAttendees: Int
}


