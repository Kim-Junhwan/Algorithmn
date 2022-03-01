//
//  baek11650.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 2021/11/13.
//

import Foundation

var inputNum = Int(readLine()!)!

var coordinate : [[Int]] = []

for i in 0..<inputNum{
    var coordinateInput = readLine()!.split(separator: " ").map(){Int($0)!}
    coordinate.append(coordinateInput)
}

var sortedCoordinate = coordinate.sorted{
    if $0[0] == $1[0]{
        return $0[1] < $1[1]
    }
    return $0[0] < $1[0]
}

for item in 0..<sortedCoordinate.count{
    print("\(sortedCoordinate[item][0]) \(sortedCoordinate[item][1])")
}
