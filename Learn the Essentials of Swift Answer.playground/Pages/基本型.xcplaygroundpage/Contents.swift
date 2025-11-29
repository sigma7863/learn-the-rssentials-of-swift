// Copyright© DWANGO Co.,Ltd. All Rights Reserved.
/*:
 # 基本型
 ## 定数と変数
 
 `var` は変数、 `let` は定数です。
 */

var myVariable = 42
myVariable = 50
let myConstant = 42

/*:
 > `myConstant` に Int 型を再代入したらどうなるでしょう？
 */

/*:
 ## 型
 Swift には型推論があります。
 */

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

//: 型を変換するには型を明示して初期化します。

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

/*:
 > `String(width)` を `width` に変えたらどうなるでしょう？
 */

/*:
 ## 文字列
 文字列は、ダブルクオート (`"`) で囲います。
 */

let string = "Hello Swift!"

//:  値を文字列に入れるには `\(値)` とします。

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

/*:
 ## オプショナル
 `変数名: 型名?` で宣言します。
 */

let optionalInt: Int? = 9

//: 文字列が整数に変換できる場合

var myString = "7"
var possibleInt = Int(myString)
print(possibleInt as Any)

//: 文字列が整数に変換できない場合

myString = "banana"
possibleInt = Int(myString)
print(possibleInt as Any)

/*:
 ## 配列
 */

var ratingList = ["Poor", "Fine", "Good", "Excellent"]
ratingList[1] = "OK"
ratingList

//: `let` で宣言された配列は要素の変更ができません。

let ratingList2 = ["Poor", "Fine", "Good", "Excellent"]
// ratingList2[1] = "OK"
// ratingList2

//: 空配列の宣言とコメント

// Creates an empty array.
let emptyArray = [String]()

/*:
 ## 暗黙のオプショナルアンラップ
 */

var implicitlyUnwrappedOptionalInt: Int!

//: [Next](@next)
