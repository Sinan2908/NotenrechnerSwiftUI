
//
//  DataManager.swift
//  NotenrechnerSwiftUI
//
//  Created by Kuehn, Sinan-Justin on 03.02.20.
//  Copyright © 2020 Kuehn, Sinan-Justin. All rights reserved.
//

import SwiftUI

class DataManager: ObservableObject {
    // create Singleton
    static let shared = DataManager()
    
    // Array for all units
    @Published var units: [Unit] = Array()
    
    
    @Published var unitsFrom1stYear: [Unit] = Array()
    @Published var unitsFrom2ndYear: [Unit] = Array()
    @Published var unitsFrom3rdYear: [Unit] = Array()
    
    private init(){
        self.loadTestData()
        self.sortData()
    }
    
    var average: Double {
        var total: Double = 0
        for unit in units {
            total += unit.finalGrade
        }
        return total / Double(units.count)
    }
    
    var credits: Double {
        var total: Double = 0
        for unit in units {
            total += unit.credits
        }
        
        return total
    }
    
    func yearAverage(units: [Unit]) -> Double{
        var total: Double = 0
        for unit in units {
            total += unit.finalGrade
        }
        return total / Double(units.count)
    }
    
    func yearCredits(units: [Unit]) -> Double{
        var total: Double = 0
        for unit in units {
            total += unit.credits
        }
        return total
    }
    
    // Saves data into Array
    func loadTestData() {
        self.units = self.load("TestData.json")
    }
    
    func sortData() {
        for unit in self.units {
            if(unit.year == 1){
                unitsFrom1stYear.append(unit)
            } else if(unit.year == 2){
                unitsFrom2ndYear.append(unit)
            } else if(unit.year == 3){
                unitsFrom3rdYear.append(unit)
            }
        }
    }
    
    
    // loads data from JSON-File
    func load<T: Decodable>(_ filename: String) -> T{
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
    
}
