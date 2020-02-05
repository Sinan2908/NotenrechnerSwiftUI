//
//  CreateUnitComponent.swift
//  NotenrechnerSwiftUI
//
//  Created by Kuehn, Sinan-Justin on 05.02.20.
//  Copyright © 2020 Kuehn, Sinan-Justin. All rights reserved.
//

import SwiftUI

struct CreateUnitComponent: View {
    @State var unitComponent: UnitComponentPreview
    
    var body: some View {
        VStack{
            HStack{
                Text("Kursname: ")
                TextField("", text: $unitComponent.componentName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                
            }
            HStack{
                Text("Benotet: ")
                CheckBox(isChecked: self.$unitComponent.isGraded)
            }
        }
    }
}


struct CheckBox: View {
    @Binding var isChecked : Bool
    
    var body: some View {
        Button(action: {
            self.isChecked.toggle()
        }){
            HStack{
                Image(systemName: isChecked ? "checkmark.square": "square")
            }
        }
    }
}


//struct CreateUnitComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateUnitComponent()
//    }
//}
