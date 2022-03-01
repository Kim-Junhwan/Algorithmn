//
//  baek2231.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 2021/10/28.
//

import Foundation

let num = Int(readLine()!)!

func solution(num : Int)->Int{
    var result = 0
    for i in 0..<num{
        var number = i
        var sum = 0
        while(number != 0){
            sum += number % 10
            number /= 10
        }
        if(sum+i == num){
            result = i
            return i
        }
    }
    return result
}

print(solution(num: num))
