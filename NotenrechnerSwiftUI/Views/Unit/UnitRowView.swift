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
                    .foregroundColor(unit.isPassed ? Color.blue : Color.red)
                Text("Note: \(String(format:"%.02f", unit.finalGrade))")

            }
        }.padding(.horizontal, 10)
            .padding(.vertical, 8)
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
