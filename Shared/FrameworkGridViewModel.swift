//
//  FrameworkGridViewModel.swift
//  AppleFrameworks
//
//  Created by Matheus Vicente on 04/07/21.
//

import Foundation
import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    var selectedFramework: Framework? {
        didSet {
            isShowingDetailsView = true
        }
    }
    
    @Published var isShowingDetailsView = false
}
