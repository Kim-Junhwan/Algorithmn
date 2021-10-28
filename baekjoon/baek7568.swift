//
//  baek7568.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 2021/10/28.
//

import Foundation

var num = Int(readLine()!)!
var list : [[Int]] = []
var answer = ""
for _ in 0..<num{
    var tallAndHeight = readLine()!.split(separator: " ").map(){Int($0)!}
    list.append(tallAndHeight)
}

for i in 0..<list.count{
    var rank = 1
    for j in 0..<list.count{
        if (list[i][0] < list[j][0]) && (list[i][1] < list[j][1]){
            rank += 1
        }
    }
    answer += "\(rank) "
}

print(answer)
