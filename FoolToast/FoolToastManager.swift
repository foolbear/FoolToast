//
//  FoolToastManager.swift
//
//  Created by foolbear on 2019/12/24.
//  Copyright © 2019 Foolbear Co.,Ltd. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
public func showFoolToast(_ toast: Text) {
    FoolToastManager.shared.showToast(toast: Toast(content: toast))
}

@available(iOS 13.0, *)
public struct Toast: Identifiable {
    public var id = UUID()
    var content: Text
}

@available(iOS 13.0, *)
public class FoolToastManager: ObservableObject {
    static let shared = FoolToastManager()
    private init() {}
    
    var maxToastCount = 8
    var maxTimeToastShowing = 10.0
    @Published var toasts: [Toast] = []
    
    func showToast(toast: Toast) {
        toasts.append(toast)
        if toasts.count > maxToastCount {
            toasts.removeFirst()
        }
    }
    
    func removeToast(_ toast: Toast) {
        toasts = toasts.filter { $0.id != toast.id }
    }
}

