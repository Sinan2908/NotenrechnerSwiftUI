//
//  UnitView.swift
//  NotenrechnerSwiftUI
//
//  Created by Kuehn, Sinan-Justin on 03.02.20.
//  Copyright © 2020 Kuehn, Sinan-Justin. All rights reserved.
//

import SwiftUI

struct UnitView: View {
    var unit: Unit
    var body: some View {
        Text("\(unit.unitName)")
    }
}

struct UnitView_Previews: PreviewProvider {
    static var previews: some View {
        UnitView(unit:
            Unit(id: 0, unitName: "Test", credits: 5.0, unitComponents:[
                UnitComponent(id: 1, componentName: "test", grade: 1.5, examDate: Date(), examType: "Klausur", semester: 1, isGraded: true),
                UnitComponent(id: 2, componentName: "test", grade: 3.2, examDate: Date(), examType: "Klausur", semester: 1, isGraded: true)
                ]
        ))
    }
}
