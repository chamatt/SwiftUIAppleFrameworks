//
//  FrameworkGridView.swift
//  AppleFrameworks
//
//  Created by Matheus Vicente on 03/07/21.
//

import SwiftUI

struct FrameworkGridView: View {
    @StateObject var viewModel = FrameworkGridViewModel()
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible()),]
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid (columns: columns) {
                    ForEach(MockData.frameworks) { framework in
                            FrameworkTitleView(framework: framework)
                                .onTapGesture {
                                    viewModel.selectedFramework = framework
                                }
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
            
        }
        .sheet(isPresented: $viewModel.isShowingDetailsView) {
            FrameworkDetailsView(
                framework: viewModel.selectedFramework!,
                isShowingDetailsView: $viewModel.isShowingDetailsView)
        }
    }
}

struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
        FrameworkGridView()
            .preferredColorScheme(.dark)
        
    }
}

struct FrameworkTitleView: View {
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


