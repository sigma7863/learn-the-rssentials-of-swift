// Copyright© DWANGO Co.,Ltd. All Rights Reserved.
/*:
 # 制御フロー
 ## 条件文
 基本的な if 文
 */

let number = 23
if number < 10 {
    print("The number is small")
} else if number > 100 {
    print("The number is pretty big")
} else {
    print("The number is between 10 and 100")
}

/*:
 > `number` の値を変化させて何が出力されるか見てみましょう。
 */

//: Optional Binding

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}
print(greeting)

/*:
 > `optionalName` を `nil` にするとどうなるでしょう？
 */

//: 複数条件の if 文

var optionalHello: String? = "Hello"
if let hello = optionalHello , hello.hasPrefix("H"), let name = optionalName {
    greeting = "\(hello), \(name)"
}

//: switch 文

let vegetable = "red pepper"
switch vegetable {
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log."
case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich."
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"
default:
    let vegetableComment = "Everything tastes good in soup."
}
print(vegetableComment)

/*:
 > `default` ケースを取り除くとどうなるでしょう？
 */

//: ## ループ

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

//: CountableRange

var firstForLoop = 0
for i in 0..<4 {
    firstForLoop += i
}
print(firstForLoop)

//: CountableClosedRange

var secondForLoop = 0
for _ in 0...4 {
    secondForLoop += 1
}
print(secondForLoop)

//: [Previous](@previous) | [Next](@next)
