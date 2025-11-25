let firstLine = readLine()!
let parts = firstLine.split(separator: " ")
let a = Int(parts[0])!
let b = Int(parts[1])!
let n = String(readLine()!).map { String($0) }

func pow(_ x: Int, _ y: Int) -> Int {
    var sum = 1
    for _ in 0..<y {
        sum *= x
    }
    return sum
}

func convertTen(_ str: [String], _ n: Int) -> Int {
    var sum = 0

    for i in 0..<str.count {
        if str[i] == "0" { continue }
        sum += pow(n, str.count-1-i)
    }
    return sum
}

func convertN(_ num: Int, _ n: Int) -> String {
    var currentNum = num
    var answer = ""
    while currentNum >= n {
        answer += "\(currentNum % n)"
        currentNum /= n
    }
    answer += "\(currentNum)"

    return String(answer.reversed())
}


print(convertN(convertTen(n, a), b))