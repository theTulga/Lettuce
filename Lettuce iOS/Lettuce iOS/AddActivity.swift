//
//  AddActivity.swift
//  Lettuce iOS
//
//  Created by Battulga Tsogtgerel on 12/16/21.
//

import SwiftUI

struct AddActivity: View {
    
    @State private var name = ""
    @State private var description = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var activities: ActivityStore
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Activity name", text: $name)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add Activity")
            .navigationBarItems(trailing: Button("Save") {
                if self.name != "" && self.description != "" {
                    let activity =
                    Activity(name: name, description: description, count: 0)
                    self.activities.activities.append(activity)
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    self.showingAlert.toggle()
                }
            })
            .alert(isPresented: $showingAlert) {
                Alert(title:Text("Fill values"), message: Text("Please enter values in the fields"), dismissButton: .default(Text("OK")))
            }
        }
    }
}

//struct AddActivity_Previews: PreviewProvider {
//    static var previews: some View {
//        AddActivity()
//    }
//}
