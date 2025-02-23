
let n = Int(readLine()!)!

struct Queue {
    var inputStack: [Int] = []
    var outputStack: [Int] = []
    
    mutating func append(input: Int) {
        inputStack.append(input)
    }
    
    mutating func pop() -> Int? {
        if (outputStack.isEmpty) {
            while !inputStack.isEmpty {
                outputStack.append(inputStack.removeLast())
            }
        }
        return outputStack.removeLast()
    }
    
    var count: Int {
        return inputStack.count + outputStack.count
    }
}

func solution() {
    var queue = Queue()
    for i in 1...n {
        queue.append(input: i)
    }
    while queue.count != 1 {
        queue.pop()
        let pop = queue.pop()!
        queue.append(input: pop)
    }
    print(queue.pop()!)
}

solution()
