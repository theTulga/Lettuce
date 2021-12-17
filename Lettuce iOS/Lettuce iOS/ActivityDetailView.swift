//
//  ActivityDetailView.swift
//  Lettuce iOS
//
//  Created by Battulga Tsogtgerel on 12/16/21.
//

import SwiftUI

struct ActivityDetailView: View {
    
    @ObservedObject var activities: ActivityStore
    var index: Int
    
    var body: some View {
        NavigationView {
            VStack{
                Text("Activity Description: \(self.activities.activities[index].description)")
                Text("Completion count: \(self.activities.activities[index].count)")
                    .font(.headline)
                    .padding(.all, 10)
                
                Button("Increment the completion count by 1") {
                    var count = self.activities.activities[index].count
                    count += 1
                    self.activities.activities[index].count = count
                }
                Spacer()
            }
            .padding(.horizontal, 10)
        }
        .navigationBarTitle(Text(self.activities.activities[index].name), displayMode: .inline)
    }
}

//struct ActivityDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ActivityDetailView()
//    }
//}
