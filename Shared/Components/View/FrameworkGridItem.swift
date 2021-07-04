//
//  FramworkTitleView.swift
//  AppleFrameworks
//
//  Created by Matheus Vicente on 04/07/21.
//

import SwiftUI

struct FrameworkGridItem: View {
    let framework: Framework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 90, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.5)
        }
        .padding()
    }
}

struct FrameworkGridItem_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridItem(framework: MockData.sampleFramework)
    }
}
