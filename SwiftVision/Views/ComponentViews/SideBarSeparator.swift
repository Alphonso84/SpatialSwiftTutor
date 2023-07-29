//
//  SideBarSeparator.swift
//  SwiftVision
//
//  Created by Alphonso Sensley II on 7/29/23.
//

import SwiftUI

struct SideBarSeparator: View {
    var body: some View {
        Rectangle()
            .fill(Color(uiColor: .systemGray))
            .frame(height: 1)
            .edgesIgnoringSafeArea(.horizontal)
    }
}
