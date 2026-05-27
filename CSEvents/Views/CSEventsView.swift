//
//  CSEventsView.swift
//  CSEvents
//
//  Created by Archita Nemalikanti on 5/21/26.
//

import SwiftUI

struct CSEventsView: View {

    /// The current user of the app — hardcoded to Archita for now,
    /// preloaded with sample events and default zeroed-out social stats. Parent owns the view, through @State.
    @State private var user = User(
        firstName: "Archita",
        numEventsAttending: 0,
        eventsAttending: CSEventsView.sampleEvents,
        cornellEmail: "apn32@cornell.edu",
        numFollowing: 0,
        following: [],
        major: "Computer Science",
        year: "2026"
    )

    var body: some View {
        TabView {
            EventsView(user: user)
                .tabItem {
                    Label("Events", systemImage: "calendar")
                }
            EventsAttendingView(user: user)
                .tabItem {
                    Label("Going", systemImage: "briefcase")
                }
            ProfilePageView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
    
    ///The network call to get information about the user. Returns a User object.
    func getUser() async throws -> User {
        let endpoint = "https://sampleEndpoint"
        
        //convert the string to URL object.
        guard let url = URL(string: endpoint) else {
            throw UserRetrivalError.invalidURL
        }
        
        //returns data, response (if we have a good url)
        let (data, response) = try await URLSession.shared.data(from: url)
        
        //check if 200, and if not, throw UserRetrivalError.invalidResponse
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw UserRetrivalError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(User.self, from: data)
            
        } catch {
            throw UserRetrivalError.invalidData
        }
        
    }
    
    enum UserRetrivalError: Error{
        case invalidURL
        case invalidResponse
        case invalidData
    }

    /// Mock Data. .
    /// Each event is tied to a real Cornell club and location to keep things grounded.
    static var sampleEvents: [Event] = {

        /// Quick helper to build a `Date` from month, day, and hour — saves us from
        /// writing out `DateComponents` five times over.
        func date(_ month: Int, _ day: Int, _ hour: Int) -> Date {
            var c = DateComponents()
            c.year = 2026; c.month = month; c.day = day; c.hour = hour
            return Calendar.current.date(from: c)!
        }

        return [
 
            Event(
                host: Club(name: "Cornell Claude Club", bio: "Cornell's AI and LLM enthusiasts.", followers: 412),
                title: "Intro to Prompt Engineering",
                location: "Gates Hall 114",
                description: "Learn how to write effective prompts and build simple AI-powered tools. Open to all majors.",
                startTime: date(6, 3, 17),
                endTime: date(6, 3, 19),
                category: .TechWorkshops,
                numberAttendees: 60
            ),
 
            Event(
                host: Club(name: "Cornell DTI", bio: "Design for social good at Cornell.", followers: 980),
                title: "DTI Spring Showcase",
                location: "Duffield Hall Atrium",
                description: "See the semester's projects from Cornell DTI — web apps, mobile tools, and more built for nonprofits.",
                startTime: date(6, 7, 18),
                endTime: date(6, 7, 20),
                category: .awards,
                numberAttendees: 200
            ),
        
            Event(
                host: Club(name: "Cornell AppDev", bio: "Building apps that matter.", followers: 750),
                title: "Hack4Impact Kickoff",
                location: "Rhodes Hall 471",
                description: "Kick off our semester-long hackathon building apps for social impact. Team formation and ideation night.",
                startTime: date(6, 10, 19),
                endTime: date(6, 10, 21),
                category: .Hackathons,
                numberAttendees: 85
            ),
    
            Event(
                host: Club(name: "Cornell Entrepreneurship Club", bio: "Empowering student founders.", followers: 630),
                title: "Founder Fireside: YC Alumni Panel",
                location: "Statler Hall 196",
                description: "Three Cornell-founded YC companies share how they went from idea to funding. Q&A at the end.",
                startTime: date(6, 14, 17),
                endTime: date(6, 14, 18),
                category: .famousSpeakers,
                numberAttendees: 120
            ),
      
            Event(
                host: Club(name: "Cornell Armada", bio: "Cornell's competitive programming team.", followers: 310),
                title: "ICPC Practice Bootcamp",
                location: "Bill & Melinda Gates Hall 122",
                description: "Weekly competitive programming session. Bring your laptop — problems range from easy to hard.",
                startTime: date(6, 17, 16),
                endTime: date(6, 17, 18),
                category: .TechWorkshops,
                numberAttendees: 40
            ),
        ]
    }()

}

#Preview {
    CSEventsView()
}
