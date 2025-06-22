struct FenwickTree {
    var size: Int
    var tree: [Int]
  
    init(size: Int) {
        self.size = size
        self.tree = Array(repeating: 0, count: size + 1)
    }
    
    func lsb(_ x: Int) -> Int {
        return x & -x
    }

    mutating func update(index: Int, diff: Int) {
        var idx = index
        while idx <= size {
            tree[idx] += diff
            idx += lsb(idx)
        }
    }

    func getSum(index: Int) -> Int {
        var sum = 0
        var idx = index
        while idx > 0 {
            sum += tree[idx]
            idx -= lsb(idx)
        }
        return sum
    }
    
    func rangeSum(from: Int, to: Int) -> Int {
        return getSum(index: to) - getSum(index: from - 1)
    }
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
var fenwickTree = FenwickTree(size: input[0])
var array = [Int](repeating: 0, count: input[0] + 1)

for i in 1...input[0] {
    let value = Int(readLine()!)!
    fenwickTree.update(index: i, diff: value)
    array[i] = value
}

for _ in 0..<(input[1] + input[2]) {
    let orders = readLine()!.split(separator: " ").map { Int($0)! }
    if orders[0] == 1 {
        let idx = orders[1]
        let diff = orders[2] - array[idx]
        fenwickTree.update(index: idx, diff: diff)
        array[idx] = orders[2]
    } else {
        let result = fenwickTree.rangeSum(from: orders[1], to: orders[2])
        print(result)
    }
}