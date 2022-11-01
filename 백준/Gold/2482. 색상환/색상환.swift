let mod = 1_000_000_003

let n = Int(readLine()!)!
let k = Int(readLine()!)!

var dp = Array(repeating: Array(repeating: 0, count: 1001), count: 1001)

for i in 0...n { dp[i][0] = 1 }

dp[1][1] = 1

for i in 2...n {
    for j in 1...(i+1)/2 {
        dp[i][j] = (dp[i-2][j-1] + dp[i-1][j]) % mod
    }
}

print((dp[n-3][k-1] + dp[n-1][k]) % mod)
