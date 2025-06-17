
let N = Int(readLine()!)!

var tp = [[Int]]()
var dp = Array(repeating: 0, count: N + 1)

for _ in 0..<N {
    let counsel = readLine()!.split(separator: " ").map { Int($0)! }
    tp.append(counsel)
}

for i in 0..<N {
    // 상담을 하지 않는 날
    if dp[i] > dp[i + 1] {
        dp[i+1] = dp[i]
    }
    
    // 상담을 하는 날
    if i + tp[i][0] <= N {
        if dp[i+tp[i][0]] < dp[i] + tp[i][1] {
            dp[i+tp[i][0]] = dp[i] + tp[i][1]
        }
    }
}

print(dp[N])



