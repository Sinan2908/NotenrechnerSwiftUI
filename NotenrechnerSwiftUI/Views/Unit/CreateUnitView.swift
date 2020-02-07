//
//  CreateUnitView.swift
//  NotenrechnerSwiftUI
//
//  Created by Kuehn, Sinan-Justin on 03.02.20.
//  Copyright © 2020 Kuehn, Sinan-Justin. All rights reserved.
//

import SwiftUI

struct CreateUnitView: View {
    @EnvironmentObject var myDataManager : DataManager
    
    @Binding var addUnit: Bool
    @State private var unitName: String = ""
    @State private var credits: Int = 5
    
    var unitComponentName: String = ""
    
    
    var body: some View {
        GeometryReader{ geometry in
            ScrollView{
                VStack(alignment: .leading){
                    Text("Modul erstellen")
                        .font(.largeTitle)
                    HStack{
                        Text("Modulbezeichnung: ")
                            .frame(width: geometry.size.width / 2.4, alignment: .leading)
                        TextField("", text: self.$unitName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }.frame(height: 70)
                    HStack{
                        Text("ECTS:")
                        CreditPointsView(value: self.$credits)
                    }
                    Divider()
                    VStack(alignment: .leading){
                        Text("Kurse")
                            .font(.title)
                        Divider().frame(width: 100, alignment: .leading)
                        
                        ForEach(self.myDataManager.newUnit.unitComponents){ component in
                            CreateUnitComponent( component: component)
                        }
                        
                        
                        //                        ForEach(myDataManager.unit[unitIndex].unitComponents) { component in
                        //                            CreateUnitComponent(unitIndex: self.unitIndex, component: component)
                        //                        }
                        Button(action: {
                            withAnimation(.easeInOut){ self.myDataManager.newUnit.addUnitComponent(component: UnitComponent(id: self.myDataManager.newUnit.unitComponents.count + 1 , componentName: "", grade: 4.0, examDate: Date(), examType: 0, semester: 0, isGraded: false, percentageGrade: 50))
                            }
                        }){
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color.green)
                        }
                        
                    }
                    
                    CreateUnitButton(unitName: self.unitName, credits: self.credits, addUnit: self.$addUnit)
                    
                    Spacer()
                }.padding()
            }
        }
        
    }
}


struct CreditPointsView: View {
    @Binding var value : Int
    
    var body: some View {
        HStack{
            Button(action: {
                if(self.value > 0){
                    self.value -= 1
                }
            }){
                Image(systemName: "minus.circle.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            Text("\(value)")
            
            Button(action: {
                self.value += 1
            }){
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                
            }
        }.layoutPriority(100)
        
        
    }
}



struct CreateUnitButton: View {
    @EnvironmentObject var myDataManager: DataManager
    var unitName: String
    var credits: Int
    @Binding var addUnit: Bool
    
    var body: some View {
        GeometryReader{ geometry in
            Button(action: {
                withAnimation(.easeInOut){
                    self.myDataManager.newUnit.unitName = self.unitName
                    self.myDataManager.newUnit.credits = Double(self.credits)
                    self.myDataManager.units.append(self.myDataManager.newUnit)
                    if(self.myDataManager.newUnit.year == 1){
                        self.myDataManager.unitsFrom1stYear.append(self.myDataManager.newUnit)
                    } else if(self.myDataManager.newUnit.year == 2){
                        self.myDataManager.unitsFrom2ndYear.append(self.myDataManager.newUnit)
                    } else if(self.myDataManager.newUnit.year == 3){
                        self.myDataManager.unitsFrom3rdYear.append(self.myDataManager.newUnit)
                    }
                    self.addUnit = false
                }
            }){
                Text("Hinzufügen")
                    .foregroundColor(Color.white)
                    .frame(width: geometry.size.width * 0.8)
            }
            .padding()
            .background(Color.blue)
            .cornerRadius(30)
        }
    }
}
