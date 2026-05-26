//
//  CSEventsView.swift
//  CSEvents
//
//  Created by Archita Nemalikanti on 5/21/26.
//

import SwiftUI

struct CSEventsView: View {
    
    @State private var user = User(
        firstName: "Archita",
        numEventsAttending: 0,
        eventsAttending: [],
        cornellEmail: "an123@cornell.edu",
        numFollowing: 0,
        following: [],
        major: "Computer Science",
        year: "2026"
    )
    
    var body: some View {
        TabView {
            EventsView()
                .tabItem {
                    Label("Events", systemImage: "calendar")
                }
            EventsAttendingView()
                .tabItem{
                    Label("Going", systemImage: "briefcase")
                }
            
            ProfilePageView()
                .tabItem{
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}

#Preview {
    CSEventsView()
}
