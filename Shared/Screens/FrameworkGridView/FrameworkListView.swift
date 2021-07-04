//
//  FrameworkGridView.swift
//  AppleFrameworks
//
//  Created by Matheus Vicente on 03/07/21.
//

import SwiftUI

struct FrameworkListView: View {
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        NavigationView {
            if(viewModel.isListStyle) {
                List {
                    ForEach(MockData.frameworks) { framework in
                        NavigationLink(
                            destination: FrameworkDetailsView(
                                framework: framework,
                                showCloseButton: false,
                                isShowingDetailsView: $viewModel.isShowingDetailsView
                            )
                        ) {
                            FrameworkListItem(framework: framework)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("🍎 Frameworks")
                .navigationBarItems(trailing: ListToggleButton(isEnabled: $viewModel.isListStyle))
            } else {
                ScrollView {
                    LazyVGrid (columns: viewModel.columns) {
                        ForEach(MockData.frameworks) { framework in
                            FrameworkGridItem(framework: framework)
                                .onTapGesture {
                                    viewModel.selectedFramework = framework
                                }
                        }
                    }
                }
                .navigationTitle("🍎 Frameworks")
                .navigationBarItems(trailing: ListToggleButton(isEnabled: $viewModel.isListStyle))
                .sheet(isPresented: $viewModel.isShowingDetailsView) {
                    FrameworkDetailsView(
                        framework: viewModel.selectedFramework!,
                        showCloseButton: true,
                        isShowingDetailsView: $viewModel.isShowingDetailsView)
                }
            }
        }
        .accentColor(Color(.label))
    }
}

struct FrameworkListView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkListView()
            .preferredColorScheme(.dark)
        FrameworkListView()
    }
}



