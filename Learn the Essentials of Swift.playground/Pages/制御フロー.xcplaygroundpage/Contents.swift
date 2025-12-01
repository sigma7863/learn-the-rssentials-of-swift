// Copyright© DWANGO Co.,Ltd. All Rights Reserved.
/*:
 # 制御フロー
 ## 条件文
 基本的な if 文
 */
// 条件判定文に丸括弧 () が必要ない
// if文でオプショナルが値が持つかを判定できる
let number = 23
if number < 10 {
    print("The number is small") // 小さい
} else if number > 100 {
    print("The number is pretty big") // かなり大きい
} else {
    print("The number is between 10 and 100") // 10から100の間
}

// 比較演算子
// <     より小さい(未満)
// >     より大きい(超過)
// <=    以下
// >=    以上
// ==    等しい
// !=    等しくない

// 論理演算子
// &&    論理積(かつ)
// ||    論理和(または)
// !    否定(ではない)
/*:
 > `number` の値を変化させて何が出力されるか見てみましょう。
 */

//: Optional Binding
var optionName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionName {
    greeting = "Hello, \(name)"
}
print(greeting)

/*:
 > `optionalName` を `nil` にするとどうなるでしょう？
 */
// optionalName が nil でない場合のみ、 name に optionalName の値を束縛して波括弧 {} 内の処理を実行することができる(Optional Binding)

var optionalHello: String? = "Hello"
if let hello = optionalHello, hello.hasPrefix("H"), let name = optionName {
    greeting = "\(hello), \(name)" // Hello, John Appleseed
}
//: 複数条件の if 文
// ↑ ミスった, /*: */で出来るらしい(自分のこのリポジトリのソースを見て分かった)
//: switch 文
// 複合ケース (Compound Cases, https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Compound-Cases)
let vegetable = "red pepper"
var vegetableComment = "initialized"
print(vegetableComment)
switch vegetable {
    case "celery": // celery - セロリ
        vegetableComment = "Add some raisins and make ants on a dog" // レーズンを加えて、蟻の巣を作る
    case "cucumber", "watercress": // cucumber(キュウリ)またはwatercress(クレソン, オランダガラシ)にマッチするか判定する
        vegetableComment = "That would make a good tea sandwich"
    case let x where x.hasPrefix("pepper"): // whereで追加の条件を加える
        vegetableComment = "It is a spicy \(x)?"
    default: // 全てのケースが分からない場合
        vegetableComment = "Everything tastes good in soup"
}
print(vegetableComment) // Is it a spicy red pepper?
/*:
 > `default` ケースを取り除くとどうなるでしょう？
 */
// A. エラーが起きる(例: Switch must be exhaustive)
//: ## ループ
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores { // 初期化式、条件式、変化式の 3 つを書くスタイルの for 文は使えない
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)
//: CountableRange
// CountableRange(https://developer.apple.com/documentation/swift/countablerange)
var firstForLoop = 0
for i in 0..<4 { // 0から3まで
    firstForLoop += i
}
print(firstForLoop) // 6
//: CountableClosedRange
// CountableClosedRange(https://developer.apple.com/documentation/swift/countableclosedrange)
var secoundForLoop = 0
for _ in 0...4 { // _ はワイルドカードといい、インデックスの値を無視する, 0から4まで
    secoundForLoop += 1
}
print(secoundForLoop) // 6
//: [Previous](@previous) | [Next](@next)
