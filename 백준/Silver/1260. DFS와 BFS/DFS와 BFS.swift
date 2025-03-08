//
//  main.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 2/22/25.
//

import Foundation

let nmv = readLine()!.split(separator: " ").map{Int($0)!}
let n = nmv[0]
let m = nmv[1]
let v = nmv[2]

var relation: [[Int]] = Array(repeating: [], count: n)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    relation[input[0]-1].append(input[1]-1)
    relation[input[1]-1].append(input[0]-1)
}

relation = relation.map { $0.sorted() }

func solution() {
    var dfsAnswer = ""
    var dfsVisited: [Bool] = Array(repeating: false, count: n)
    func dfs(num: Int) {
        dfsAnswer.append("\(num+1) ")
        for i in relation[num] {
            if !dfsVisited[i] {
                dfsVisited[i] = true
                dfs(num: i)
            }
        }
    }
    
    dfsVisited[v-1] = true
    dfs(num: v-1)
    
    var bfsAnswer = ""
    var bfsVisited: [Bool] = Array(repeating: false, count: n)
    func bfs(num: Int) {
        var queue: [Int] = []
        queue.append(num)
        
        while !queue.isEmpty {
            let pop = queue.removeFirst()
            bfsAnswer.append("\(pop+1) ")
            for i in relation[pop] {
                if !bfsVisited[i] {
                    bfsVisited[i] = true
                    queue.append(i)
                }
            }
        }
    }
    
    bfsVisited[v-1] = true
    bfs(num: v-1)
    
    print(dfsAnswer)
    print(bfsAnswer)
}

solution()
