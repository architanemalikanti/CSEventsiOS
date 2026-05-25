//
//  CSEventsView.swift
//  CSEvents
//
//  Created by Archita Nemalikanti on 5/21/26.
//

import SwiftUI

struct CSEventsView: View {
    
    
    
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
