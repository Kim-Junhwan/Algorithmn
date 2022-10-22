let siteNum = readLine()!.split(separator: " ").map { Int($0)! }

var sitePassword: [String: String] = [:]

for _ in 0..<siteNum[0] {
    let password = readLine()!.split(separator: " ").map {String($0)}
    sitePassword[password[0]] = password[1]
}
for _ in 0..<siteNum[1] {
    let site = readLine()!
    print(sitePassword[site]!)
}
