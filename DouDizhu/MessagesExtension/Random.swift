//
//  Random.swift
//  DouDizhu
//
//  Created by Ant on 16/9/14.
//  Copyright © 2016年 Ant. All rights reserved.
//

import Foundation

public let random: (Int) -> Int = { Int(arc4random_uniform(UInt32($0))) }
