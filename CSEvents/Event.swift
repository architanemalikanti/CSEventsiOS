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
struct Event {
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


/*
 A Cornell student organization that has joined this app!
 */
struct Club {
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


enum EventCategory: CaseIterable {
    case companyVisit
    case startups
    case famousSpeakers
    case careerPrep
    case TechWorkshops
    case infoSession
    case awards
    case Hackathons

    var displayName: String {
        switch self {
        case .companyVisit:    return "company visits"
        case .startups:        return "startups"
        case .famousSpeakers:  return "famous speakers"
        case .careerPrep:      return "career prep"
        case .TechWorkshops:   return "tech workshops"
        case .infoSession:     return "info session"
        case .awards:          return "awards"
        case .Hackathons:      return "hackathons"
        }
    }
}


