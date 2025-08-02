
import Foundation

let t = Int(readLine()!)!
var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 31), count: 31)


for i in 1...30 {
    dp[i][1] = i
    dp[i][0] = 1
    dp[i][i] = 1
}

for i in 2...30 {
    for j in 1...i {
        dp[i][j] = dp[i-1][j] + dp[i-1][j-1]
    }
}

for _ in 0..<t {
    let nm = readLine()!.split(separator: " ").map{Int($0)!}
    let n = nm[0]
    let m = nm[1]
    print(dp[m][n])
}
