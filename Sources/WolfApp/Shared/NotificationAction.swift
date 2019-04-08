//
//  NotificationAction.swift
//  WolfApp
//
//  Created by Wolf McNally on 7/17/15.
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

import Foundation

open class NotificationAction {
    private let observer: NotificationObserver
    public let notificationBlock: NotificationBlock

    public init(name: NSNotification.Name, using notificationBlock: @escaping NotificationBlock) {
        self.notificationBlock = notificationBlock
        observer = notificationCenter.addObserver(for: name, using: notificationBlock)
    }

    public init(name: NSNotification.Name, object: AnyObject?, using notificationBlock: @escaping NotificationBlock) {
        self.notificationBlock = notificationBlock
        observer = notificationCenter.addObserver(forName: name, object: object, queue: nil, using: notificationBlock)
    }

    deinit {
        notificationCenter.removeObserver(observer)
    }
}
