import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    var answer:Int64 = 0
    answer = Int64((w*h) - (w+h-gcd(w, h)))
    return answer
}

func gcd(_ num: Int, _ num2: Int) -> Int {
    let mod: Int = num % num2
    return 0 == mod ? min(num, num2) : gcd(num2, mod)
}
