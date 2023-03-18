func missingNumber(_ nums: [Int]) -> Int {
   let n = nums.count
   let sum = nums.reduce(0, +)
   return (n * (n + 1)) / 2 - sum
}

missingNumber([3,0,1])
