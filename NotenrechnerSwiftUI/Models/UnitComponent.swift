//
//  UnitComponent.swift
//  NotenrechnerSwiftUI
//
//  Created by Kuehn, Sinan-Justin on 03.02.20.
//  Copyright © 2020 Kuehn, Sinan-Justin. All rights reserved.
//

import SwiftUI

struct UnitComponent: Codable, Identifiable {
    var id: Int
    var componentName: String
    var grade: Double
    var examDate: Date
    var examType: String
    var semester: Int
    var isGraded: Bool
}
