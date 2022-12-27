
let nq = readLine()!.split(separator: " ").map {Int($0)!}
var duckArr: [Int] = []
var treeVisited: [Bool] = Array(repeating: false, count: nq[0]+1)

for _ in 0..<nq[1] {
    duckArr.append(Int(readLine()!)!)
}

func solution(start: Int) -> Int{
    var current = start
    var firstBlock = 0
    
    while current != 1 {
        if treeVisited[current] {
            firstBlock = current
        }
        current /= 2
    }
    if firstBlock == 0 {
        treeVisited[start] = true
    }
    return firstBlock
}

for item in duckArr {
    print(solution(start: item))
}
