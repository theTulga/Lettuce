//
//  Activity.swift
//  Lettuce iOS
//
//  Created by Battulga Tsogtgerel on 12/16/21.
//

import Foundation

struct Activity: Identifiable, Codable {
    var id = UUID()
    let name: String
    let description: String
    var count: Int
}

class ActivityStore: ObservableObject {
    @Published var activities: [Activity]{
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(activities){
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init(){
        if let activities = UserDefaults.standard.data(forKey: "Activities"){
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Activity].self, from:activities) {
                self.activities = decoded
                return
            }
        }
        
        self.activities = []
    }
}
