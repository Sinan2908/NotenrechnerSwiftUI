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
    
    @State private var unitName: String = ""
    @State private var credits: Int = 5
    
    @State private var isAdded: Bool = false
    
    
    @State private var unitComponents : [UnitComponentPreview] = Array()
    
    var unitComponentName: String = ""
    
    var body: some View {
        GeometryReader{ geometry in
            ScrollView{
                VStack{
                    Text("Modul erstellen")
                        .font(.largeTitle)
                    HStack{
                        Text("Modulbezeichnung: ")
                            .frame(width: geometry.size.width / 2.4, alignment: .leading)
                        TextField("", text: self.$unitName) .textFieldStyle(RoundedBorderTextFieldStyle())
                    }.frame(height: 70)
                    HStack{
                        Text("ECTS:")
                        CreditPointsView(value: self.$credits)
                    }
                    Divider()
                    VStack(alignment: .leading){
                        Text("Kurse")
                            .font(.title)
                        Button(action: {
                            withAnimation(.easeInOut){
                                self.unitComponents.append(UnitComponentPreview())
                            }
                        }){
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color.green)
                        }
                        
                        ForEach(self.unitComponents, id: \.id) {component in
                            CreateUnitComponent(unitComponent: component)
                        }
                        
                    }
                    
                    CreateUnitButton(isAdded: self.$isAdded)
                    Spacer()
                    
                }.padding()
            }
        }
        
    }
}

struct CreateUnitView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUnitView().environmentObject(DataManager.shared)
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
    @Binding var isAdded: Bool
    
    var body: some View {
        ZStack{
            Image(systemName: "checkmark")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(Color.green)
                .opacity(self.isAdded ? 1 : 0)
            
            
            Button(action: {
                withAnimation(.easeInOut){
                    self.isAdded = true
                }
            }){
                Text("Hinzufügen")
                    .foregroundColor(Color.white)
            }.padding()
                .background(Color.blue)
                .cornerRadius(30)
                .opacity(self.isAdded ? 0 : 1)
        }
    }
}
