let n = Int(readLine()!)!
let stoneArr = readLine()!.split(separator: " ").map { Int($0)! }
var dp: [Int] = Array(repeating: -1, count: n)

func jump(x: Int) -> Int{
    if x == n-1 {
        return 0
    }
    if dp[x] != -1 {
        return dp[x]
    }
    dp[x] = Int.max
    for item in x+1..<n {
        dp[x] = min(dp[x], max(jump(x: item), (item-x)*(1+abs(stoneArr[x]-stoneArr[item])) ))
    }
    return dp[x]
}

print(jump(x: 0))
