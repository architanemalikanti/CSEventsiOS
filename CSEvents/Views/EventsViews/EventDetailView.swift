//
//  EventDetailView.swift
//  CSEvents
//
//  Created by Archita Nemalikanti on 5/27/26.
//

import SwiftUI

struct EventDetailView: View {
    var event: Event
    var body: some View {
        
        ZStack(alignment: .bottomLeading) {
            LinearGradient(
                colors: [
                    Color(red: 0.55, green: 0.0, blue: 1.0),
                    Color(red: 0.75, green: 0.2, blue: 0.95),
                    Color(red: 0.48, green: 0.56, blue: 0.91)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .frame(height: 180)
            VStack(alignment: .leading, spacing: 6) {
                HStack(spacing: 5) {
                    Text("Hi")
                }
                .padding(.horizontal, 10).padding(.vertical, 5)
                .background(.white.opacity(0.2))
                .foregroundColor(.white)
                .clipShape(Capsule())

                Text(event.title)
                    .foregroundColor(.white)
            }
            .padding(20)
            .padding(.bottom, 8)
        }

    }
}
