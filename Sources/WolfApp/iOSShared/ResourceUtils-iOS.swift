//
//  ResourceUtils-iOS.swift
//  WolfApp
//
//  Created by Wolf McNally on 6/25/17.
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

public func loadViewController<T: UIViewController>(withIdentifier identifier: String, fromStoryboardNamed storyboardName: String, in bundle: Bundle? = nil) -> T {
    let storyboard = loadStoryboard(named: storyboardName, in: bundle)
    return storyboard.instantiateViewController(withIdentifier: identifier) as! T
}

public func loadViewController<T: UIViewController>(withIdentifier identifier: String, from storyboard: UIStoryboard) -> T {
    return storyboard.instantiateViewController(withIdentifier: identifier) as! T
}

public func loadInitialViewController<T: UIViewController>(fromStoryboardNamed storyboardName: String, in bundle: Bundle? = nil) -> T {
    let storyboard = loadStoryboard(named: storyboardName, in: bundle)
    return storyboard.instantiateInitialViewController() as! T
}
