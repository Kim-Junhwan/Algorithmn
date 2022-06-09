import Foundation


func solution(_ s:String) -> Int {
    if s.count == 1{
        return 1
    }
    var answer = s.count
    //num은 압축할 문자열의 개수
    for num in 1...s.count/2{
        var zipStr = s[0..<num]
        var zipLv = 1
        var zip = ""
        for str in stride(from: num, to: s.count, by: num){
            var next = s[str..<(str+num > s.count ? s.count : str+num)]
            if next == zipStr{
                zipLv += 1
            }else{
                zip.append("\( zipLv==1 ? "" : "\(zipLv)" )\(zipStr)")
                zipStr = next
                zipLv = 1
            }
        }
        zip.append(zipLv==1 ? zipStr : "\(zipLv)\(zipStr)")
        answer = min(zip.count, answer)
    }
    return answer
}

extension String {
    subscript(_ range: Range<Int>) -> String {
        let fromIndex = self.index(self.startIndex, offsetBy: range.startIndex)
        let toIndex = self.index(self.startIndex,offsetBy: range.endIndex)
        return String(self[fromIndex..<toIndex])
    }
}
