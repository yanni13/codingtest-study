let testCase = Int(readLine()!)!

M: for _ in 0..<testCase {
  let k = Int(readLine()!)!
  var x = 0
  var Tn = [0]
  for n in 1...45 {
    if k < n * (n + 1)/2 {
      x = n
      break
    }
    Tn.append(n * (n + 1)/2)
  }
  for f in 1..<x {
    for s in f..<x {
      for t in s..<x {
        if Tn[f] + Tn[s] + Tn[t] == k {
          print(1)
          continue M
        }
      }
    }
  }
  print(0)
}