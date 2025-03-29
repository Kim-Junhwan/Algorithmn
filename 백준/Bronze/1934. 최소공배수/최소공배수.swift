import Foundation

let n = Int(readLine()!)!

func uclid(x: Int, y: Int) -> Int {
    var max = max(x, y)
    var min = min(x, y)
    while max % min != 0 {
        var result = max % min
        max = min
        min = result
    }
    return min
}


for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    print((input[0]*input[1])/(uclid(x: input[0], y: input[1])))
}
