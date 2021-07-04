//
//  ListToggleButton.swift
//  AppleFrameworks
//
//  Created by Matheus Vicente on 04/07/21.
//

import SwiftUI

struct ListToggleButton: View {
    @Binding var isEnabled: Bool
    
    var body: some View {
            Button {
                isEnabled.toggle()
            } label: {
                Image(systemName: "list.bullet")
                    .foregroundColor(isEnabled ? Color(.blue) : Color(.label))
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
//                    .background(isEnabled ? Color(.label).opacity(0.1) : Color(.label).opacity(0))
                    .cornerRadius(10)
            }
    }
}


struct ListToggleButton_Previews_Wrapper: View {
    @State var isEnabled = false
    
    var body: some View {
        ListToggleButton(isEnabled: $isEnabled)
    }
}

struct ListToggleButton_Previews: PreviewProvider {
    static var previews: some View {
        ListToggleButton_Previews_Wrapper().preferredColorScheme(.dark)
    }
}
