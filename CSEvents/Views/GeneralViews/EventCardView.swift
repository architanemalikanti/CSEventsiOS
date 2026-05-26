//
//  EventCardView.swift
//  CSEvents
//
//  Created by Archita Nemalikanti on 5/25/26.
//

import SwiftUI

struct EventCardView: View {
    var event: Event
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(
                      colors: [
                          Color(red: 0.55, green: 0.0, blue: 1.0),
                          Color(red: 0.75, green: 0.2, blue: 0.95),
                          Color(red: 0.48, green: 0.56, blue: 0.91)
                      ],
                      startPoint: .topLeading,
                      endPoint: .bottomTrailing
                  ).opacity(0.1))
                .glassEffect(.regular.interactive(), in: RoundedRectangle(cornerRadius: 20))
                .frame(maxWidth: .infinity)
                .frame(height: 150)
                
            
            cardOrganization(event: event)
            
        }
    }
    
    func cardOrganization(event: Event) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(event.host.name)
                .font(.custom("DMSans-Thin", size: 16))
                .foregroundColor(.white)

            Text(event.title)
                .font(.custom("DMSans-Bold", size: 16))
                .foregroundColor(.white)
                .padding(.bottom, 5)

            HStack(spacing: 4) {
                Image(systemName: "calendar")
                Text(formatDateRange(start: event.startTime, end: event.endTime))
                    .font(.custom("DMSans-Thin", size: 12))
            }
            .foregroundColor(.white)
            
            HStack(spacing: 4) {
                Image(systemName: "mappin")
                Text(event.location)
                    .font(.custom("DMSans-Thin", size: 12))
            }
            .foregroundColor(.white)
            
            HStack(spacing: 4) {
                Image(systemName: "person.2.fill")
                Text("\(event.numberAttendees) going")
                    .font(.custom("DMSans-Bold", size: 12))
            }
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
    }
    
    func formatDateRange(start: Date, end: Date) -> String {
        let calendar = Calendar.current
        let day = calendar.component(.day, from: start)

        let ordinal = NumberFormatter()
        ordinal.numberStyle = .ordinal
        let ordinalDay = ordinal.string(from: NSNumber(value: day)) ?? "\(day)"

        let dayName = DateFormatter()
        dayName.dateFormat = "EEEE, MMMM"

        let time = DateFormatter()
        time.dateFormat = "h:mma"
        time.amSymbol = "am"
        time.pmSymbol = "pm"

        let tz = DateFormatter()
        tz.dateFormat = "zzz"

        return "\(dayName.string(from: start)) \(ordinalDay), \(time.string(from: start)) - \(time.string(from: end)) \(tz.string(from: start))"
    }
}
