//
//  Unit.swift
//  NotenrechnerSwiftUI
//
//  Created by Kuehn, Sinan-Justin on 03.02.20.
//  Copyright © 2020 Kuehn, Sinan-Justin. All rights reserved.
//

import SwiftUI

struct Unit: Codable, Identifiable {
    var id : Int
    var unitName: String
    
    var finalGrade : Double {
        if unitComponents.isEmpty {
            return 4.0
        }
        var average : Double = 0
        for component in unitComponents {
            average += component.grade
        }
        return average / Double(unitComponents.count)
    }
    
    var credits: Double
    
    var isPassed: Bool {
        return finalGrade <= 4.0
    }
    
    var year: Int {
        var highestSemester = 0
        var year = 0
        
        for unitComponent in unitComponents {
            if unitComponent.semester > highestSemester {
                highestSemester = unitComponent.semester
            }
        }
        
        year = highestSemester / 2
       
        if highestSemester % 2 != 0 {
            year += 1
        }
        
        return year
    }
    
    var unitComponents: [UnitComponent]
    
    mutating func addUnitComponent(component: UnitComponent){
        self.unitComponents.append(component)
    }
    
    
}
