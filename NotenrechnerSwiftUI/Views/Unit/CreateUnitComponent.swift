//
//  CreateUnitComponent.swift
//  NotenrechnerSwiftUI
//
//  Created by Kuehn, Sinan-Justin on 05.02.20.
//  Copyright © 2020 Kuehn, Sinan-Justin. All rights reserved.
//

import SwiftUI

struct CreateUnitComponent: View {
    @EnvironmentObject var myDataManager: DataManager
    var component: UnitComponent
    var componentIndex: Int {
        return myDataManager.newUnit.unitComponents.firstIndex(where: {$0.id == component.id})!
    }
    
    // 7776000s = 90d
    let NintyDaysInPast: Date = Date().addingTimeInterval(-7776000)
    let NintyDaysInFuture: Date =  Date().addingTimeInterval(7776000)
    
    
    
    
    var body: some View {
        VStack(alignment: .leading){
            Text("\(myDataManager.newUnit.unitComponents[componentIndex].componentName)").font(.title)
            HStack{
                Text("Kursname: ")
                TextField("", text: $myDataManager.newUnit.unitComponents[componentIndex].componentName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            HStack(alignment: .firstTextBaseline){
                Text("Benotet: ")
                CheckBox(isChecked: $myDataManager.newUnit.unitComponents[componentIndex].isGraded)
            }
            HStack{
                VStack(alignment: .leading){
                    Text("Prüfungsform: ")
                    Picker(selection: self.$myDataManager.newUnit.unitComponents[componentIndex].examType, label: Text("")){
                        ForEach(0..<self.myDataManager.examType.count){
                            Text(self.myDataManager.examType[$0])
                        }
                    }.pickerStyle(WheelPickerStyle())
                        .labelsHidden()
                }
                
            }
            
            Text("Prüfungsdatum: ")
            DatePicker(selection: $myDataManager.newUnit.unitComponents[componentIndex].examDate, in: NintyDaysInPast...NintyDaysInFuture, displayedComponents: [.date, .hourAndMinute ]) {
                Text("")
            }.labelsHidden()
            
            
            
            Text("Semester: ")
            
            
            Picker(selection: self.$myDataManager.newUnit.unitComponents[componentIndex].semester, label: Text("")){
                ForEach(0 ..< self.myDataManager.semester.count){
                    Text("\(self.myDataManager.semester[$0])")
                }
            }.pickerStyle(SegmentedPickerStyle())
                .labelsHidden()
            
            if  self.myDataManager.newUnit.unitComponents[componentIndex].isGraded {
                HStack{
                    Text("Anteil Gesamtnote: ").layoutPriority(100)
                    Slider(value: self.$myDataManager.newUnit.unitComponents[componentIndex].percentageGrade, in: 0...100, step: 1)
                    Text("\(String(self.myDataManager.newUnit.unitComponents[componentIndex].percentageGrade))%")
                }
            }
            
            Divider()
        }
    }
}



struct CheckBox: View {
    @Binding var isChecked : Bool
    
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut){
                self.isChecked.toggle()
            }
        }){
            HStack{
                Image(systemName: isChecked ? "checkmark.square": "square")
            }
        }
    }
}


//struct CreateUnitComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateUnitComponent()
//    }
//}
