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
    @State var unitComponent: UnitComponentPreview
    
    @State private var selectedSemester: Int = 1
    
    @State private var percentageGrade: Double = 50
    @State private var selectedExamType: String = ""
    
    @State private var examDate = Date()
    
    
    var body: some View {
        VStack(alignment: .leading){
            Text("\(unitComponent.componentName)").font(.title)
            HStack{
                Text("Kursname: ")
                TextField("", text: self.$unitComponent.componentName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            HStack(alignment: .firstTextBaseline){
                Text("Benotet: ")
                CheckBox(isChecked: self.$unitComponent.isGraded)
            }
            HStack{
                VStack(alignment: .leading){
                    Text("Prüfungsform: ")
                    Picker(selection: self.$unitComponent.examType, label: Text("")){
                        ForEach(0 ..< self.myDataManager.examType.count){
                            Text("\(self.myDataManager.examType[$0])")
                        }
                    }.pickerStyle(WheelPickerStyle())
                        .labelsHidden()
                        .frame(height:150)
                }
            }
            
            Text("Prüfungsdatum: ")
            DatePicker(selection: $examDate, in: Date()..., displayedComponents: .date) {
                Text("")
            }.labelsHidden()
            
            
            
            Text("Semester: ")
            Picker(selection: self.$unitComponent.semester, label: Text("")){
                ForEach(0 ..< self.myDataManager.semester.count){
                    Text("\(self.myDataManager.semester[$0])")
                }
            }.pickerStyle(SegmentedPickerStyle())
                .labelsHidden()
            
            if self.unitComponent.isGraded {
                HStack{
                    Text("Anteil Gesamtnote: ").layoutPriority(100)
                    Slider(value: self.$unitComponent.percentageGrade, in: 0...100, step: 1)
                    Text("\(String(self.unitComponent.percentageGrade))%")
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
