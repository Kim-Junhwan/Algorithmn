import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}

func solution() {
    if input[1] <= 1 {
        return
    }
    var sosuArr = Array(repeating: false, count: input[1]+1)
    sosuArr[0] = true
    sosuArr[1] = true
    for i in 2...input[1] {
        var start = i+i
        if !sosuArr[i] {
            while start <= input[1] {
                sosuArr[start] = true
                start += i
            }
        }
    }
    for i in input[0]...input[1] {
        if !sosuArr[i] {
            print(i)
        }
    }
}

solution()
