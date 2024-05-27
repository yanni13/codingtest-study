func solution(_ n:Int) -> Int {
    var nums = [0, 1]

    for i in 1..<n {
        nums.append((nums[i] + nums[i-1]) % 1234567)
    }
    return (nums[n])
}