//
//  EventDebugging.swift
//  WolfCore_iOS
//
//  Created by Wolf McNally on 6/30/17.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import UIKit
import WolfCore

public func printViewTouchedInEvent(_ event: UIEvent) {
    guard event.type == .touches else { return }
    guard let touch = event.allTouches?.first else { return }
    guard touch.phase == .began else { return }
    guard let window = touch.window else { return }
    let locationInWindow = touch.location(in: window)
    let view = window.hitTest(locationInWindow, with: event)
    print("touch in: \(view†)")
}

//
// To subclass UIApplication in order to use printViewTouchedInEvent():
//

// AppDelegate.swift:
//
//    //@UIApplicationMain
//    public class AppDelegate: UIResponder, UIApplicationDelegate {
//      ...
//    }

// Application.swift:
//
//    class Application: UIApplication {
//      override func sendEvent(_ event: UIEvent) {
//        printViewTouchedInEvent(event)
//        super.sendEvent(event)
//      }
//    }

// Main.swift:
//
//    UIApplicationMain(
//      CommandLine.argc,
//      UnsafeMutableRawPointer(CommandLine.unsafeArgv)
//        .bindMemory(
//          to: UnsafeMutablePointer<Int8>.self,
//          capacity: Int(CommandLine.argc)),
//      NSStringFromClass(Application.self),
//      NSStringFromClass(AppDelegate.self)
//    )
