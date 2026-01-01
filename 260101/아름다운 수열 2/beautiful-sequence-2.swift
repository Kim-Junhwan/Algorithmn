import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]

let a = readLine()!.split(separator: " ").map { Int($0)! }
let b = readLine()!.split(separator: " ").map { Int($0)! }

func getSoon() -> [[Int]] {
    var setArr = Set<[Int]>()
    var visited: [Bool] = Array(repeating: false, count: m)
    func a(start: [Int], depth: Int) {
        if depth == b.count {
            setArr.insert(start)
            return
        }
        for i in 0..<b.count {
            if visited[i] { continue }
            var next = start
            next.append(b[i])
            visited[i] = true
            a(start: next, depth: depth+1)
            visited[i] = false
        }
    }
    for num in 0..<b.count {
        visited[num] = true
        a(start:[b[num]], depth: 1)
        visited[num] = false
    }
    return Array(setArr)
}

if n < m {
    print(0)
} else if n == m {
    print(a == b ? 1 : 0)
} else {
let mSoon = getSoon()
var answer = 0
for i in 0..<n-m+1 {
    if mSoon.contains(Array(a[i..<i+m])) {
        answer += 1
    }
}

print(answer)
}
