func solution(_ s:String) -> Int{
    var stack = [Character]()
    
    for char in s {
        if let before = stack.last {
            if before == char {
                stack.removeLast()
                continue
            }
        }
        stack.append(char)
    }
    
    return stack.isEmpty ? 1 : 0
}
