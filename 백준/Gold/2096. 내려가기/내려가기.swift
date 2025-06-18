
let N = Int(readLine()!)!
var dp_max = [0, 0, 0]
var dp_min = [0, 0, 0]

for i in 0..<N {
    let input = readLine()!.split(separator: " ").map {Int($0)!}
    let a = input[0]
    let b = input[1]
    let c = input[2]
    
    if i == 0 {
        dp_max = [a,b,c]
        dp_min = [a,b,c]
    } else {
        let prev_max = dp_max
        let prev_min = dp_min
        
        // 이동 가능한 경로에서 누적 최대값을 찾음
        dp_max[0] = max(prev_max[0], prev_max[1]) + a
        dp_max[1] = max(prev_max[0], prev_max[1], prev_max[2]) + b
        dp_max[2] = max(prev_max[1], prev_max[2]) + c
        
        // 이동 가능한 경로에서 누적 최소값을 찾음
        dp_min[0] = min(prev_min[0], prev_min[1]) + a
        dp_min[1] = min(prev_min[0], prev_min[1], prev_min[2]) + b
        dp_min[2] = min(prev_min[1], prev_min[2]) + c
        
    }
}

print("\(dp_max.max()!) \(dp_min.min()!)")