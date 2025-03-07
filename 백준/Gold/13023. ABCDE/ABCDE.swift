//
//  main.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 2/22/25.
//

import Foundation


let nm = readLine()!.split(separator: " ").map{ Int($0)! }
let n = nm[0]
let m = nm[1]

var relationMap: [[Int]] = Array(repeating: [], count: n)
var visited: [Bool] = Array(repeating: false, count: n)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    relationMap[input[0]].append(input[1])
    relationMap[input[1]].append(input[0])
}

func solution() {
    var answer = 0
    func dfs(depth: Int, num: Int) {
        if depth >= 5 || answer == 1 {
            answer = 1
            return
        }
        
        let relation = relationMap[num]
        visited[num] = true
        for i in relation {
            if !visited[i] {
                dfs(depth: depth+1, num: i)
            }
        }
        visited[num] = false
    }
    
    for i in 0..<n {
        if (!visited[i]) {
            dfs(depth: 1, num: i)
            if answer == 1 {
                break
            }
        }
    }
    
    print(answer)
}

solution()
