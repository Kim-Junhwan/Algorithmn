//
//  programmers42748.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 2022/02/08.
//

import Foundation
//command [1,5,3] 1부터 5까지 자른다음 정렬후 3번째에 있는 수
func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var answer : [Int] = []
    for i in commands{
        let start = i[0]-1
        let end = i[1]-1
        let select = i[2]
        let sortedArray = array[start...end].sorted()
        answer.append(sortedArray[select-1])
    }
    return answer
}

print(solution([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]] ))
