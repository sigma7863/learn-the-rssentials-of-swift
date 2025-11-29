// Copyright© DWANGO Co.,Ltd. All Rights Reserved.
/*:
 # 関数
 `greet` 関数
 */

func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}

//: 関数を呼び出してみましょう。

greet(name: "Anna", day: "Tuesday")
greet(name: "Bob", day: "Friday")
greet(name: "Charlie", day: "a nice day")

//: タプルを返す関数を実装してみましょう。

func calculateStatistics(scores: [Int]) -> (min_score: Int, max_score: Int, sum: Int) {
    var min_score = scores[0]
    var max_score = scores[0]
    var sum = 0

    for score in scores {
        if score > max_score {
            max_score = score
        } else if score < min_score {
            min_score = score
        }
        sum += score
    }

    return (min_score, max_score, sum)
}

//: その関数を呼んでみましょう。

let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)

//: 可変長引数の関数を実装してみましょう。

func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}

//: その関数を呼んでみましょう。

sumOf()
sumOf(numbers: 42, 597, 12)

//: 入れ子の関数を実装して、呼んでみましょう。

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()

    return y
}

returnFifteen()

//: 関数を返す関数を実装してみましょう。

func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}

//: その関数を呼んでみましょう。

var increment = makeIncrementer()
increment(7)

//: 引数に関数をとる関数を実装して、呼んでみましょう。

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

//: クロージャを使った処理を実装してみましょう。

numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

//: 引数の型、戻り値を省略したクロージャを実装してみましょう。

let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

//: 引数名を省略したクロージャを実装してみましょう。

let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)

//: メソッドを呼んでみましょう。

let exampleString = "hello"
if exampleString.hasSuffix("lo") {
    print("ends in lo")
}

//: [Previous](@previous)
