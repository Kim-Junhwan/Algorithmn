//
//  main.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 6/17/25.
//

import Foundation

let n = Int(readLine()!)!


var tree: [[Int]] = Array(repeating: [], count: n+1)
var depth: [Int] = Array(repeating: 0, count: n+1)
var parent: [Int] = Array(repeating: 0, count: n+1)
var visited: [Bool] = Array(repeating: false, count: n+1)

for _ in 1..<n {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    tree[input[0]].append(input[1])
    tree[input[1]].append(input[0])
}

func bfs(index: Int) {
    var queue: [(Int, Int)] = [(index, 1)]
    visited[1] = true
    depth[1] = 1
    
    while !queue.isEmpty {
        let pop = queue.removeFirst()
        depth[pop.0] = pop.1
        
        for child in tree[pop.0] {
            if !visited[child] {
                visited[child] = true
                queue.append((child, pop.1 + 1))
                parent[child] = pop.0
            }
        }
    }
}

bfs(index: 1)

let m = Int(readLine()!)!
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    var a = input[0]
    var b = input[1]
    
    if depth[a] < depth[b] {
        swap(&a, &b)
    }
    while depth[a] != depth[b] {
        a = parent[a]
    }
    
    while a != b {
        a = parent[a]
        b = parent[b]
    }
    print(a)
}
