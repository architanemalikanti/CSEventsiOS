//
//  EventsAttendingView.swift
//  CSEvents
//
//  Created by Archita Nemalikanti on 5/25/26.
//

import SwiftUI

struct EventsAttendingView: View {
    var body: some View {
        ZStack {
            
            
        }
    }
    
    func title() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("the events \(user.name) is attending 🎉")
                .font(.custom("DMSans-Regular", size: 34))
                .foregroundColor(.white)

            Text("your one place for all cornell CS opportunities")
                .font(.custom("DMSans-Thin", size: 16))
                .foregroundColor(.white.opacity(0.8))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 20)
    }
    
    func backgroundColor() -> some View {
        
        LinearGradient(
            colors: [
                Color(red: 0.45, green: 0.35, blue: 0.95),
                Color(red: 0.25, green: 0.75, blue: 0.95)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
        
    }
}

#Preview {
    EventsAttendingView()
}
