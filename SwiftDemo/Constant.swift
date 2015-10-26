//
//  Constant.swift
//  SwiftDemo
//
//  Created by Arpit Vishwakarma on 04/09/15.
//  Copyright (c) 2015 Arpit. All rights reserved.
//

//import Foundation
import UIKit

let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
let SCREEN_MAX_LENGTH = max(SCREEN_WIDTH, SCREEN_HEIGHT)
let SCREEN_MIN_LENGTH = min(SCREEN_WIDTH, SCREEN_HEIGHT)

let IS_IPHONE_4_OR_LESS =  UIDevice.currentDevice().userInterfaceIdiom == .Phone && SCREEN_MAX_LENGTH < 568.0
let IS_IPHONE_5 = UIDevice.currentDevice().userInterfaceIdiom == .Phone && SCREEN_MAX_LENGTH == 568.0
let IS_IPHONE_6 = UIDevice.currentDevice().userInterfaceIdiom == .Phone && SCREEN_MAX_LENGTH == 667.0
let IS_IPHONE_6P = UIDevice.currentDevice().userInterfaceIdiom == .Phone && SCREEN_MAX_LENGTH == 736.0
