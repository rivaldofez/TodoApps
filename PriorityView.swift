//
//  PriorityView.swift
//  CRUDSwiftPlayground
//
//  Created by Rivaldo Fernandes on 17/04/22.
//

import Foundation
import SwiftUI

struct PriorityView: View {
    let priorityTitle : String
    @Binding var selectedPriority: Priority
    
    
    var body: some View {
        Text(priorityTitle)
            .font(.system(.headline, design: .rounded))
            .foregroundColor(.white)
            .padding(10)
            .background(selectedPriority.priorityType == priorityTitle.lowercased() ? selectedPriority.priorityColor(): Color(.systemGray4))
            .cornerRadius(10)
    }
}

struct PriorityView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            PriorityView(priorityTitle: "High", selectedPriority: .constant(.high))
            PriorityView(priorityTitle: "Normal", selectedPriority: .constant(.normal))
            PriorityView(priorityTitle: "Low", selectedPriority: .constant(.low))
        }
    }
}
