var a = Array(readLine()!)
var b = Array(readLine()!)
var first = Array("0"+a)
var second = Array("0"+b)
var answer = ""
var arr: [[Int]] = Array(repeating: Array(repeating: 0, count: 42), count: 42)
for i in 1...a.count {
    for j in 1...b.count {
        if first[i] == second[j] {
            arr[i][j] = arr[i-1][j-1]+1
        } else {
            arr[i][j] = max(arr[i-1][j], arr[i][j-1])
        }
    }
}


func lcs(x: Int, y: Int) {
    if (x==0) || (y==0) {
        return
    }
    if first[x] == second[y] {
        lcs(x: x-1, y: y-1)
        answer += String(first[x])
    } else {
        if arr[x][y-1] == arr[x][y] {
            lcs(x: x, y: y-1)
        } else {
            lcs(x: x-1, y: y)
        }
    }
}

lcs(x: a.count, y: b.count)
print(answer)
