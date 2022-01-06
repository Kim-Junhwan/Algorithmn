//
//  baek18870.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 2021/11/21.
//

import Foundation

var num = Int(readLine()!)!
var dicCoordinate : [Int : Int] = [:]
var coordinate = readLine()!.split(separator: " ").map {Int($0)!}
var coordinateSet = Set<Int>()

coordinate.forEach{coordinateSet.insert($0)}
let coordinateSorted = coordinateSet.sorted(by: <)
Array(0..<coordinateSorted.count).forEach{
    print($0)
    dicCoordinate[coordinateSorted[$0]] = $0
}
print(dicCoordinate)
print(coordinate.map{String(dicCoordinate[$0]!)}.joined(separator: " "))
