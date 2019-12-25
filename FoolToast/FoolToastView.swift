//
//  FoolToastView.swift
//
//  Created by foolbear on 2019/12/24.
//  Copyright © 2019 Foolbear Co.,Ltd. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
struct FoolToastView<Presenting>: View where Presenting: View {
    let presenting: () -> Presenting
    @ObservedObject var toastManager = FoolToastManager.shared
    
    var body: some View {
        let isShowing = toastManager.toasts.count != 0
        return
            ZStack(alignment: .center) {
                self.presenting()
                VStack {
                    Spacer()
                    ForEach(toastManager.toasts) { toast in
                        FoolToastItemView(toast: toast)
                    }
                }
                .opacity(isShowing ? 1 : 0)
        }
    }
}

@available(iOS 13.0, *)
struct FoolToastItemView: View {
    var toast: Toast
    @State private var isShowing = false
    let toastManager = FoolToastManager.shared
    let timeShowIn = 0.4
    let timeShowing = 2.0
    
    var body: some View {
        toast.content
            .font(.footnote)
            .lineLimit(3)
            .multilineTextAlignment(.center)
            .padding(.all, 3)
            .background(Color.secondary.colorInvert().opacity(0.8))
            .cornerRadius(5)
            .padding(.all, 2)
            .opacity(isShowing ? 1 : 0)
            .animation(isShowing ? .easeIn(duration: timeShowIn) : .easeOut(duration: toastManager.maxTimeToastShowing - timeShowIn - timeShowing))
            .onAppear() {
                self.isShowing = true
                DispatchQueue.main.asyncAfter(deadline: .now() + self.timeShowing) {
                    self.isShowing = false
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + self.toastManager.maxTimeToastShowing) {
                    self.toastManager.removeToast(self.toast)
                }
        }
    }
}

@available(iOS 13.0, *)
public extension View {
    func foolToast() -> some View {
        FoolToastView(presenting: { self })
    }
}
