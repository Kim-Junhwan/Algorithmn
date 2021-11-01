//
//  baek1436.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 2021/11/01.
//

import Foundation

var N = Int(readLine()!)!

var count = 0
var number = 1
while true{
    if String(number).contains("666"){
        count += 1
        if count == N{
            print(number)
            break
        }
    }
    number += 1
}
