//
//  CheckBoxStyle.swift
//  CRUDSwiftPlayground
//
//  Created by Rivaldo Fernandes on 17/04/22.
//

import Foundation
import SwiftUI

struct CheckBoxStyle: ToggleStyle {
    let taskColor: Color
    
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(self.taskColor)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            configuration.label
        }
    }
}

struct CheckBoxStyle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Toggle(isOn: .constant(true)){
                Text("Toggle is on")
            }
            
            Toggle(isOn: .constant(false)){
                Text("Toggle is off")
            }
        }
        .toggleStyle(CheckBoxStyle(taskColor: .orange))
    }
}
