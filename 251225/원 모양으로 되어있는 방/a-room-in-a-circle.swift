import Foundation

let n = Int(readLine()!)!
var people = [Int]()
for _ in 0..<n {
    people.append(Int(readLine()!)!)
}

var answer = Int.max

func moveDistance(_ a: Int, _ b: Int) -> Int {
    if a < b {
        return b-a
    } else {
        3
        return (n-a)+b
    }
}

for start in 0..<people.count {
    var sum = 0
    for room in 0..<people.count {
        if start == room { continue }

        let distance = moveDistance(start, room)
        sum += people[room] * distance
    }
    answer = min(sum, answer)
}

print(answer)