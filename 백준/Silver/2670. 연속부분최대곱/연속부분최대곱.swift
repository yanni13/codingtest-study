import Foundation

let N = Int(readLine()!)!

var map: [Double] = []

for _ in 0..<N {
    let input = Double(readLine()!)!
    map.append(input)
}

var maxCount: [Double] = Array(repeating: 0.0, count: N)
maxCount[0] = map[0]

for i in 1..<N {
    // 이전 곱 * 현재값 vs 현재값 중 더 큰 값 선택
    maxCount[i] = max(map[i], maxCount[i-1] * map[i])
    

}

let maxValue = maxCount.max()!
print(String(format: "%.3f", maxValue))