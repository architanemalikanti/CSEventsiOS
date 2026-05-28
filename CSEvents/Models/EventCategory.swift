//
//  EventCategory.swift
//  CSEvents
//
//  Created by Archita Nemalikanti on 5/25/26.
//

enum EventCategory: CaseIterable, Codable, Hashable {
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
