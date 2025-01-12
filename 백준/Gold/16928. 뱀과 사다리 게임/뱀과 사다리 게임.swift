import Foundation

var map: [Int] = Array(repeating: 0, count: 101)
var visited: [Bool] = Array(repeating: false, count: 101)

let input = readLine()!.split(separator: " ").map{ Int($0)! }

for i in 0..<input[0] {
    let ladder = readLine()!.split(separator: " ").map{ Int($0)! }
    map[ladder[0]] = ladder[1]
}

for i in 0..<input[1] {
    let snake = readLine()!.split(separator: " ").map{ Int($0)! }
    map[snake[0]] = snake[1]
}

struct Horse {
    let location: Int
    let count: Int
}

func solution() {
    var queue: [Horse] = [.init(location: 1, count: 0)]
    while !queue.isEmpty {
        let popHorse = queue.removeFirst()
        for i in 1...6 {
            var nextCoor = popHorse.location+i
            if nextCoor >= 100 {
                print(popHorse.count+1)
                return
            }
            if map[nextCoor] != 0 {
                nextCoor = map[nextCoor]
            }
            if !visited[nextCoor] {
                queue.append(.init(location: nextCoor, count: popHorse.count+1))
                visited[nextCoor] = true
            }
        }
    }
}

solution()