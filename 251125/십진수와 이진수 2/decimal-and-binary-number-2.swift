let binary = Array(readLine()!).map{String($0)}

func pow(_ x: Int, _ y: Int) -> Int {
    var sum = 1
    for _ in 0..<y {
        sum *= x
    }
    return sum
}

func toTen(str: [String]) -> Int {
    var sum = 0
    for i in 0..<str.count {
        if str[i] == "0" {continue}
        sum += Int(pow(2, str.count-i-1))
    }
    return sum
}

func toTwo(num: Int) -> String {
    var str = ""
    var currentNum = num

    while currentNum > 1 {
        str += "\(currentNum % 2)"
        currentNum /= 2
    }
    str += "\(currentNum)"

    return String(str.reversed())
}

print(toTwo(num: toTen(str: binary) * 17))

