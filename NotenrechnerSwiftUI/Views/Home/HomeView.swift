//
//  HomeView.swift
//  NotenrechnerSwiftUI
//
//  Created by Kuehn, Sinan-Justin on 03.02.20.
//  Copyright © 2020 Kuehn, Sinan-Justin. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var myDataManager : DataManager
    
    var body: some View {
        NavigationView{
            List{
                if myDataManager.unitsFrom1stYear.count > 0 {
                    Section(header: Text("1. Studienjahr"),
                            footer: YearFooterView(average: myDataManager.yearAverage(units: myDataManager.unitsFrom1stYear) , credits: myDataManager.yearCredits(units: myDataManager.unitsFrom1stYear))
                                .frame(alignment: .trailing)
                    ){
                        ForEach(self.myDataManager.unitsFrom1stYear){ unit in
                            NavigationLink(destination: UnitView(unit: unit)){
                                UnitRowView(unit: unit)
                            }
                        }
                    }
                }
                
                if myDataManager.unitsFrom2ndYear.count > 0 {
                    Section(header: Text("2. Studienjahr"),
                            footer: YearFooterView(average: myDataManager.yearAverage(units: myDataManager.unitsFrom2ndYear) , credits: myDataManager.yearCredits(units: myDataManager.unitsFrom2ndYear))
                                .frame(alignment: .trailing)
                    ){
                        ForEach(self.myDataManager.unitsFrom2ndYear){ unit in
                            NavigationLink(destination: UnitView(unit: unit)){
                                UnitRowView(unit: unit)
                            }
                        }
                    }
                }
                
                if myDataManager.unitsFrom3rdYear.count > 0 {
                    Section(header: Text("3. Studienjahr"),
                            footer: YearFooterView(average: myDataManager.yearAverage(units: myDataManager.unitsFrom3rdYear) , credits: myDataManager.yearCredits(units: myDataManager.unitsFrom3rdYear))
                                .frame(alignment: .trailing)
                    ){
                        ForEach(self.myDataManager.unitsFrom3rdYear){ unit in
                            NavigationLink(destination: UnitView(unit: unit)){
                                UnitRowView(unit: unit)
                            }
                        }
                    }
                }
                
            }.navigationBarTitle("Module", displayMode: .inline)
                .navigationBarItems(leading: TotalView(), trailing: AddUnitButton())
                .listStyle(GroupedListStyle())
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(DataManager.shared)
    }
}


struct TotalView: View {
    @EnvironmentObject var myDataManager : DataManager
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("\(String(format:"%.01f", myDataManager.credits)) ECTS")
                    .font(.caption)
                    .foregroundColor(Color.blue)
                Text("Ø: \(String(format:"%.02f", myDataManager.average))")
                    .font(.caption)
                
            }
        }.padding()
    }
}

struct YearFooterView: View {
    var average: Double
    var credits: Double
    
    var body: some View {
        GeometryReader{ geometry in
            HStack{
                Spacer()
                VStack{
                    Text("\(String(format: "%.01f", self.credits)) ECTS")
                        .foregroundColor(Color.blue)
                    Text("Ø: \(String(format: "%.02f", self.average))")
                }
            }.padding(.horizontal, geometry.size.width * 0.07)
        }
        
    }
}



struct AddUnitButton: View {
    @EnvironmentObject var myDataManager : DataManager
    @State var addUnit: Bool = false
    
    var body: some View {
        Button(action: {
            self.addUnit = true
        }){
            Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 30, height: 30)
        }.padding()
            .sheet(isPresented: $addUnit){
                CreateUnitView()
        }
    }
}
