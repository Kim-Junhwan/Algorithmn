//
//  baek1427.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 2021/11/11.
//

import Foundation

var input = readLine()!

var inputArray = Array(input)

var sorted = inputArray.sorted(by: >)
var answer = ""
for item in 0..<sorted.count{
    answer += String(sorted[item])
}
print(answer)
