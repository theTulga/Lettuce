//
//  ContentView.swift
//  Lettuce iOS
//
//  Created by Battulga Tsogtgerel on 12/16/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var activities = ActivityStore()
    @State private var showingAddActivityView = false
    @State private var currIndex = 0
    
    var body: some View {
        VStack{
            TabView(selection: $currIndex) {
                Color.green
                    .tag(1)
                    .tabItem { Image (systemName: "cart.circle") }
                NavigationView {
                    List(0..<activities.activities.count,id:\.self) { index in
                            NavigationLink(destination:ActivityDetailView(activities: self.activities, index: index)) {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(self.activities.activities[index].name)
                                            .font(.headline)
                                        Text(self.activities.activities[index].description)
                                    }
                                    Spacer()
                                    Text("\(self.activities.activities[index].count)")
                                }
                            }
                    }
                    .navigationBarTitle(Text("Habit Tracking"))
                    .navigationBarItems(trailing:
                        Button(action: {
                            self.showingAddActivityView = true
                        }, label: {
                            Image(systemName: "plus")
                        })
                    )
                    .sheet(isPresented: $showingAddActivityView) {
                            AddActivity(activities: self.activities)
                    }
                }
                .tabItem {
                    Image(systemName: "location.circle")
                    Text("Tracking")
                }
                
                
                Color.blue
                    .tag(2)
                    .tabItem { Image (systemName: "heart.circle") }
                Color.orange
                    .tag(3)
                    .tabItem { Image (systemName: "person.circle") }
            }
//            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .font(.title)
        }
//            NavigationView {
//                List(0..<activities.activities.count,id:\.self) { index in
//                        NavigationLink(destination:ActivityDetailView(activities: self.activities, index: index)) {
//                            HStack {
//                                VStack(alignment: .leading) {
//                                    Text(self.activities.activities[index].name)
//                                        .font(.headline)
//                                    Text(self.activities.activities[index].description)
//                                }
//                                Spacer()
//                                Text("\(self.activities.activities[index].count)")
//                            }
//                        }
//                }
//                .navigationBarTitle(Text("Habit Tracking"))
//                .navigationBarItems(trailing:
//                    Button(action: {
//                        self.showingAddActivityView = true
//                    }, label: {
//                        Image(systemName: "plus")
//                    })
//                )
//                .sheet(isPresented: $showingAddActivityView) {
//                        AddActivity(activities: self.activities)
//                }
//            }
//        }
    
//    var body: some View {
//        NavigationView {
//            List(0..<state.activities.count,id:\.self) { index in
//                NavigationLink(destination: ActivityDetailView(state: self.state, index: index)) {
//                    HStack {
//                        VStack(alignment: .leading) {
//                            Text(self.state.activities[index].name)
//                                .font(.headline)
//                            Text(self.state.activities[index].description)
//                        }
//                        Spacer()
//
//                        Text("\(self.state.activities[index].count)")
//                    }
//                }
//
//            }
//        }
//        .navigationBarTitle("Habit Tracking")
//        .navigationBarItems(trailing: Button(action: {
//            self.showingAddActivityView = true }, label: {
//                Image(systemName: "plus")
//            }
//        )).sheet(isPresented:$showingAddActivityView) {
//            AddActivity(state: self.state)
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
