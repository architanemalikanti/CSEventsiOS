//
//  EventsView.swift
//  CSEvents
//
//  Created by Archita Nemalikanti on 5/25/26.
//

import SwiftUI

struct EventsView: View {
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
    
    /*
     The variable for sample, fake data.
     */
    var sampleEvents: [Event] = {
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

    func displayEvents() -> some View {
        VStack(spacing: 5) {
            ForEach(sampleEvents, id: \.title) { event in
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

#Preview {
    EventsView()
}
