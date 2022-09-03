import Foundation

let caseRepeatNum = Int(readLine()!)!

for _ in 0..<caseRepeatNum {
    let _ = Int(readLine()!)!
    let treeList = readLine()!.split(separator: " ").map {Int($0)!}
    print(solution(treeList: sortList(treeList: treeList)))
}

func solution(treeList: [Int])->Int{
    var maxHeight = 0
    for item in 0..<treeList.count-2 {
        maxHeight = max(maxHeight, abs(treeList[item]-treeList[item+2]))
    }
    return maxHeight
}

func sortList(treeList: [Int]) -> [Int] {
    let sortedTreeList = treeList.sorted { $0 < $1 }
    return sortedTreeList
}
