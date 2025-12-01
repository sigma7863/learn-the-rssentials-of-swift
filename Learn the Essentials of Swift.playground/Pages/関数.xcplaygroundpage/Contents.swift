// Copyright© DWANGO Co.,Ltd. All Rights Reserved.
/*:
 # 関数
 `greet` 関数
 */
func greet(name: String, day: String) -> String { // 引数名: 型名のように引数を書く, ->で戻り値の型を指定する
    return "Hello \(name), today is \(day)." // {}の中に中身を記述する
}
//: 関数を呼び出してみましょう。
greet(name: "Anna", day: "Tuesday")
greet(name: "Bob", day: "Friday")
greet(name: "Charlie", day: "a nice day")

func greet2(_name: String) { // 引数ラベルを省略したい時に_(パラメーター)を使う
    print(name)
}
// 関数呼び出し
greet2(_name: "Anna")

// 引数ラベルをパラメーター名の前に書くことで別々にすることができる
func greet3(to name: String) {
    print(name) // パラメーター名の'name'を使う
}
// 関数呼び出し
greet3(to: "Anna")
//: タプルを返す関数を実装してみましょう。
func calculateStatistics(scores: [Int]) -> (min_score: Int, max_score: Int, sum: Int)
var min_score = scores[0]
var max_score = scores[0]
var sum = 0
//: その関数を呼んでみましょう。



//: 可変長引数の関数を実装してみましょう。



//: その関数を呼んでみましょう。



//: 入れ子の関数を実装して、呼んでみましょう。



//: 関数を返す関数を実装してみましょう。



//: その関数を呼んでみましょう。



//: 引数に関数をとる関数を実装して、呼んでみましょう。



//: クロージャを使った処理を実装してみましょう。



//: 引数の型、戻り値を省略したクロージャを実装してみましょう。



//: メソッドを呼んでみましょう。



//: [Previous](@previous)
