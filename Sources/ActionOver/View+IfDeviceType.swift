//
//  View+IfDeviceType.swift
//  
//
//  Created by Andrea Miotto on 19/4/20.
//

import SwiftUI

internal enum DeviceType {
    case iphone
    case ipad
    case mac
}

internal var deviceType: DeviceType = {
    #if targetEnvironment(macCatalyst)
    return .mac
    #elseif os(macOS)
    return .mac
    #else
    if UIDevice.current.userInterfaceIdiom == .pad {
        return .ipad
    } else {
        return .iphone
    }
    #endif
}()

internal extension View {

    @ViewBuilder func ifIs<T>(_ condition: Bool, transform: (Self) -> T) -> some View where T: View {
        if condition {
            transform(self)
        } else {
            self
        }
    }

    @ViewBuilder func iPhone<T>(_ transform: (Self) -> T) -> some View where T: View {
        if deviceType == .iphone {
            transform(self)
        } else {
            self
        }
    }

    @ViewBuilder func iPad<T>(_ transform: (Self) -> T) -> some View where T: View {
        if deviceType == .ipad {
            transform(self)
        } else {
            self
        }
    }

    @ViewBuilder func mac<T>(_ transform: (Self) -> T) -> some View where T: View {
        if deviceType == .mac {
            transform(self)
        } else {
            self
        }
    }

    @ViewBuilder func iPadAndMac<T>(_ transform: (Self) -> T) -> some View where T: View {
        if deviceType == .mac || deviceType == .ipad {
            transform(self)
        } else {
            self
        }
    }
}
