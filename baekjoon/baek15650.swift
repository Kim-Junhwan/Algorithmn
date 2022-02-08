//
//  baek15650.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 2022/01/03.
//

import Foundation

var num = readLine()!.split(separator: " ").map {Int($0)!}
var visit : [Bool] = Array(repeating: false, count: num[0])
var arr : [Int] = Array(repeating: 0, count: num[1])

func dfs(n : Int, m : Int, depth : Int){
    if depth == m{
        var answer = ""
        for val in arr{
            answer += "\(val) "
        }
        print(answer)
        return
    }
    
    for i in 0..<n{
        if !visit[i] {
            visit[i] = true
            arr[depth] = i+1
            dfs(n: n, m: m, depth: depth+1)
            visit[i] = false
        }
    }
}

dfs(n: num[0], m: num[1], depth: 0)
