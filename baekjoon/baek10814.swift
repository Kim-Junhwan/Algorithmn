//
//  baek10814.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 2021/11/19.
//

import Foundation

struct person{
    let age : Int
    let name : String
}

var list : [person] = []
var num = Int(readLine()!)!
var answer = ""

for _ in 0..<num{
    var input = readLine()!.split(separator: " ")
    list.append(person(age: Int(input[0])!, name: String(input[1])))
}

var sortedList = list.sorted {
    if $0.age < $1.age{
        return $0.age < $1.age
    }else{
        return false
    }
}

for i in 0..<sortedList.count{
    print("\(sortedList[i].age) \(sortedList[i].name)")
}
