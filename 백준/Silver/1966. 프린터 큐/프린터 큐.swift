let testCase = Int(readLine()!)!

func solution(arr: [(Int, Int)], n: Int, m: Int) -> Int{
    var answer = 0
    var copyArr = arr
    
    while !copyArr.isEmpty {
        var isMax = true
        let first = copyArr.removeFirst()
        
        for item in 0..<copyArr.count {
            if first.1 < copyArr[item].1 {
                copyArr.append(first)
                for _ in 0..<item {
                    copyArr.append(copyArr.removeFirst())
                }
                isMax = false
                break
            }
        }
        if !isMax {
            continue
        }
        
        answer += 1
        if first.0 == m {
            break
        }
    }
    return answer
}

for _ in 0..<testCase {
    let nm = readLine()!.split(separator: " ").map {Int($0)!}
    var inputNum = -1
    let importanceArr: [(Int, Int)] = readLine()!.split(separator: " ").map { num in
        inputNum += 1
        return (inputNum,Int(num)!)
    }
    print(solution(arr: importanceArr, n: nm[0], m: nm[1]))
}


