//
//  FrameworkDetailsView.swift
//  AppleFrameworks
//
//  Created by Matheus Vicente on 04/07/21.
//

import SwiftUI

struct FrameworkDetailsView: View {
    var framework: Framework
    @Binding var isShowingDetailsView: Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Button {
                    isShowingDetailsView = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                }
            }.padding()
            
            Spacer()
            
            FrameworkTitleView(framework: framework).padding()
            
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
        FrameworkDetailsView(framework: MockData.sampleFramework, isShowingDetailsView: .constant(false))
            .preferredColorScheme(.dark)
    }
}
