import Foundation
let input = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
let N = input[0], K = input[1]
let kindergarten = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
var diffrence: [Int] = []

for i in 1..<kindergarten.count {
    diffrence.append(kindergarten[i]-kindergarten[i-1])
}

diffrence.sort()

print(diffrence[0..<(N-K)].reduce(0, +))
