//
//  LogoAnimationView.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 06.04.23.
//

import SwiftUI

struct LogoAnimationView: View {
    
    //MARK: - Prorepties
    @State private var animate = false
    @Binding var isAnimationFinished: Bool
    
    //MARK: - Body
    var body: some View {
        HStack(spacing: 0) {
            if !animate {
                AppImages.logoLeft
                    .transition(.scale(scale: 0, anchor: .trailing).combined(with: .opacity))
            }
            AppImages.logoMain
                .animation(.interpolatingSpring(stiffness: 800, damping: 10), value: animate)
            if !animate {
                AppImages.logoRight
                    .transition(.scale(scale: 0, anchor: .leading).combined(with: .opacity))
            }
        }
        .onAppear() {
            withAnimation(.interactiveSpring()) {
                animate.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.linear(duration: 1.5)) {
                    isAnimationFinished.toggle()
                }
            }
        }
    }
}

struct LogoAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        LogoAnimationView(isAnimationFinished: .constant(false))
    }
}
