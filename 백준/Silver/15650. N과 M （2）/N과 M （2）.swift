var input = readLine()!.split(separator: " ").map {Int($0)!}

func solution(maxNum: Int, count: Int) {
    var arr: [Int] = [Int](repeating: -1, count: count)
    var usedArr: [Bool] = [Bool](repeating: false, count: count)
    
    func dfs(depth: Int, inputNum: Int) {
        if depth == count {
            var printArr = ""
            for item in arr {
                printArr.append("\(item) ")
            }
            print(printArr)
            return
        }
        if inputNum <= maxNum {
        for item in inputNum...maxNum {
            arr[depth] = item
            dfs(depth: depth+1, inputNum: item+1)
        }
    }
    }
    dfs(depth: 0, inputNum: 1)
}

solution(maxNum: input[0], count: input[1])
