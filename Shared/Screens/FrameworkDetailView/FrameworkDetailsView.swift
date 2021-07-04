//
//  FrameworkDetailsView.swift
//  AppleFrameworks
//
//  Created by Matheus Vicente on 04/07/21.
//

import SwiftUI

struct FrameworkDetailsView: View {
    var framework: Framework
    var showCloseButton: Bool
    @Binding var isShowingDetailsView: Bool
    
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack {
            if(showCloseButton) {
                XDismissButton(isShowing: $isShowingDetailsView)
                Spacer()
            }
            
            FrameworkGridItem(framework: framework).padding()
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                isShowingSafariView = true
            } label: {
                AFButton(title: "Learn More")
            }
        }
        .sheet(isPresented: $isShowingSafariView) {
            SafariView(url: URL(string: framework.urlString)!)
        }
    }
}


struct FrameworkDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailsView(
            framework: MockData.sampleFramework,
            showCloseButton: false,
            isShowingDetailsView: .constant(false)
        )
            .preferredColorScheme(.dark)
    }
}
