//
//  UnitRowView.swift
//  NotenrechnerSwiftUI
//
//  Created by Kuehn, Sinan-Justin on 03.02.20.
//  Copyright © 2020 Kuehn, Sinan-Justin. All rights reserved.
//

import SwiftUI

struct UnitRowView: View {
    var unit : Unit
    var body: some View {
        HStack{
            if unit.isPassed {
                SuccessImage()
            } else {
                FailureImage()
            }
            Text("\(unit.unitName)")
            Spacer()
            VStack(alignment: .trailing){
                Text("\(String(format:"%.01f", unit.credits)) ECTS")
                    .font(.caption)
                .foregroundColor(Color.blue)
                Text("Note: \(String(format:"%.02f", unit.finalGrade))")
            }
        }.padding(.horizontal, 10)
            .padding(.vertical, 8)
    }
}

struct UnitRowView_Previews: PreviewProvider {
    static var previews: some View {
        UnitRowView(unit:
            Unit(id: 0, unitName: "Test", credits: 5.0, unitComponents:
                [UnitComponent(id: 1, componentName: "test", grade: 1.5, examDate: Date(), examType: "Klausur", semester: 1, isGraded: true, percentageGrade: 50),
                 UnitComponent(id: 2, componentName: "test", grade: 3.2, examDate: Date(), examType: "Klausur", semester: 1, isGraded: true, percentageGrade: 50)
                ]
            )
        )
    }
}

struct FailureImage: View {
    var body: some View {
        Image(systemName: "plus")
            .resizable()
            .frame(width: 20, height: 20)
            .rotationEffect(.degrees(45.0))
            .foregroundColor(Color.red)
    }
}


struct SuccessImage: View {
    var body: some View {
        Image(systemName: "checkmark")
            .resizable()
            .frame(width: 20, height: 20)
            .foregroundColor(Color.green)
    }
}
