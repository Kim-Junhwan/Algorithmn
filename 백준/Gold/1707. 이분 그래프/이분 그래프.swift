import Foundation

let k = Int(readLine()!)!

func solution(relation: [[Int]], v: Int) {
    var isEven = true
    var visited: [Bool] = Array(repeating: false, count: v+1)
    var check: [Int] = Array(repeating: 0, count: v+1)
    for i in 1...v {
        if (isEven) {
            dfs(node: i)
        } else {
            break
        }
    }
    
    if (isEven) {
        print("YES")
    } else {
        print("NO")
    }
    
    func dfs(node: Int) {
        visited[node] = true
        
        for i in relation[node] {
            if (!visited[i]) {
                check[i] = (check[node] + 1) % 2
                dfs(node: i)
            } else if (check[node] == check[i]) {
                isEven = false
            }
        }
    }
}

for _ in 0..<k {
    let ve = readLine()!.split(separator: " ").map{Int($0)!}
    var relation: [[Int]] = Array(repeating: [], count: ve[0]+1)
    for _ in 0..<ve[1] {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        relation[input[0]].append(input[1])
        relation[input[1]].append(input[0])
    }
    solution(relation: relation, v: ve[0])
}


