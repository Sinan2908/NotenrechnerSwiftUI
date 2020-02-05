//
//  UnitComponentPreview.swift
//  NotenrechnerSwiftUI
//
//  Created by Kuehn, Sinan-Justin on 05.02.20.
//  Copyright © 2020 Kuehn, Sinan-Justin. All rights reserved.
//

import SwiftUI

struct UnitComponentPreview {
    var id : UUID = UUID()
    var componentName: String = "N/A"
    var grade: Double = 0
    var examDate: Date = Date()
    var examType: String = "N/A"
    var semester: Int = 0
    var isGraded: Bool = false
}
