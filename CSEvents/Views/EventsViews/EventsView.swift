//
//  EventsView.swift
//  CSEvents
//
//  Created by Archita Nemalikanti on 5/25/26.
//

import SwiftUI

struct EventsView: View {
    var user: User
    var body: some View {
        ZStack{
            //Background Color
            backgroundColor()

            VStack(spacing: 8) {
                //Title
                title()
                    .padding(.top, 40)

                ScrollView(.horizontal, showsIndicators: false) {
                    displayCategories()
                        .padding(.horizontal, 20)
                }
                .scrollClipDisabled()

                Rectangle()
                    .fill(.white.opacity(0.15))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                    .padding(.horizontal, 20)
                    .padding(.top, 6)

                //Scroll through of the events.
                ScrollView {
                    displayEvents()
                        .padding(.horizontal, 20)
                }
                .padding(.top, 6)

            }
            .padding(.horizontal, 0)
            .preferredColorScheme(.dark)
        }
    }
    
    func title() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("cs events @ cornell")
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
    
    func displayCategories() -> some View {
        HStack(spacing: 4) {
            ForEach(EventCategory.allCases, id: \.self){ category in
                Text(category.displayName)
                    .font(.custom("DMSans-ExtraLight", size: 13))
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 8)
                    .glassEffect(.regular.interactive().tint(.purple.opacity(0.2)), in: Capsule())

            }
        }
    }

    func displayEvents() -> some View {
        VStack(spacing: 5) {
            ForEach(user.eventsAttending, id: \.title) { event in
                EventCardView(event: event)
            }
        }
        
    }
}
