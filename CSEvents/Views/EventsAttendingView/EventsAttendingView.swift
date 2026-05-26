//
//  EventsAttendingView.swift
//  CSEvents
//
//  Created by Archita Nemalikanti on 5/25/26.
//

import SwiftUI

struct EventsAttendingView: View {
    var user: User
    
    var body: some View {
        
        ZStack {
            backgroundColor()
            
            VStack(spacing: 8) {
                //Title
                title()
                    .padding(.top, 40)

                //Scroll through of the events.
                ScrollView {
                    displayAttendingEvents()
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
            Text("the events \(user.firstName) is attending 🎉")
                .font(.custom("DMSans-Regular", size: 25))
                .foregroundColor(.white)

            Text("she's locked in fr fr")
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
    
    /*
     Iterates over all the user's attending events, and organizes the layout from most recent event to last event. Uses the merge sort algorithm to sort the events from earliest to latest.
     */
    func displayAttendingEvents() -> some View {
        // the events that the user is attending, sorted by start time
        let events: [Event] = mergeSort(user.eventsAttending)
        
        return VStack(spacing: 5) {
            ForEach(events, id: \.title) { event in
                EventCardView(event: event)
            }
        }
            
        
    }
    
    /*
     The merge sort algorithm for the dates.
     Sorts by startTime ascending.
     */
    func mergeSort(_ events: [Event]) -> [Event] {
        if events.count <= 1 {
            return events
        }
        let mid = events.count / 2
        let left = Array(events[..<mid])
        let right = Array(events[mid...])
        let sortedLeft = mergeSort(left)
        let sortedRight = mergeSort(right)
        return merge(sortedLeft, sortedRight)
    }
    
    /*
     Merges two already-sorted arrays of Event into a single sorted array.
     
     This is the "combine" step of merge sort. Both input arrays must be sorted
     in ascending order by Event.startTime. Returns a new array containing all events from `left` and `right`, sorted by startTime ascending. If two events share the same startTime, the event from `left` is placed first (stable merge).
     */
    private func merge(_ left: [Event], _ right: [Event]) -> [Event] {
        var i = 0
        var j = 0
        var result: [Event] = []
        result.reserveCapacity(left.count + right.count)
        
        while i < left.count && j < right.count {
            if left[i].startTime <= right[j].startTime {
                result.append(left[i])
                i += 1
            } else {
                result.append(right[j])
                j += 1
            }
        }
        if i < left.count { result.append(contentsOf: left[i...]) }
        if j < right.count { result.append(contentsOf: right[j...]) }
        return result
    }
}

#Preview {
    EventsAttendingView(user: User(
        firstName: "Archita",
        numEventsAttending: 0,
        eventsAttending: [],
        cornellEmail: "apn32@cornell.edu",
        numFollowing: 0,
        following: [],
        major: "Computer Science",
        year: "2026"
    ))
}
