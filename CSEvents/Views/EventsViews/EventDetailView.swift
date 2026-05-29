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
        
        ScrollView{
            VStack(alignment: .leading, spacing: 0){
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
                    .frame(height: 250)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        HStack(spacing: 5) {
                            Text(event.category.displayName)
                                .font(.custom("DMSans-Regular", size: 12))
                                .foregroundColor(.white.opacity(0.8))
                        }
                        .padding(.horizontal, 10).padding(.vertical, 5)
                        .glassEffect(.regular.interactive().tint(.purple.opacity(0.8)), in: Capsule())
                        .foregroundColor(.white)
                        

                        Text(event.title)
                            .font(.custom("DMSans-Regular", size: 30))
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding(10)
                    .padding(.bottom, 8)
                }
                

                    
                    VStack(alignment: .leading, spacing: 22) {
                        HStack(spacing: 10) {
                            ZStack {
                                Circle()
                                    .fill(Color.purple.opacity(0.3))
                                    .frame(width: 36, height: 36)
                                
                                //first letter of the second word of the host club's name, as the logo
                                Text(String(event.host.name.split(separator: " ").dropFirst().first?.prefix(1) ?? "?"))
                                    .foregroundColor(.white)
                                    .font(.custom("DMSans-Bold", size: 16))
                            }
                            VStack(alignment: .leading, spacing: 1) {
                                Text(event.host.name)
                                    .font(.custom("DMSans-Bold", size: 15))
                                    .foregroundColor(.white.opacity(0.8))
                                Text("View club page")
                                    .foregroundColor(.purple)
                                    .font(.custom("DMSans-Thin", size: 13))
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundColor(.secondary)
                        }
                        .buttonStyle(.plain)

                        Divider()

                        VStack(alignment: .leading, spacing: 12) {
                            // Add event details here as needed
                        }

                        Divider()

                        VStack(alignment: .leading, spacing: 8) {
                            Text("Hi")
                        }

                        Divider()

                        HStack(spacing: 6) {
                            Image(systemName: "person.2.fill")
                                .foregroundColor(.purple)
                            Text("Hi")
                        }

                        Button {
                            // Action here
                        } label: {
                            HStack(spacing: 8) {
                                Text("Hi")
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                            //.animation(.spring(response: 0.3), value: currentEvent.isRSVPed)
                        }
                    }
                    .padding(20)
            }
            }
        .ignoresSafeArea(edges: .top)
        .navigationBarTitleDisplayMode(.inline)
            
        }
        

}
