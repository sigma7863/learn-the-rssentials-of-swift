// Copyright© DWANGO Co.,Ltd. All Rights Reserved.
/*:
 # 基本型
 ## 定数と変数
 
 `var` は変数、 `let` は定数です。
 */
var myVariable = 42
myVariable = 50
let myConstant = 42

// 変数の初期値がない場合は変数の型を明示的に指定する必要がある
// var myVariable: Int
// myVariable = 42
/*:
 > `myConstant` に Int 型を再代入したらどうなるでしょう？
 */
myConstant = 50

// 再代入が必要なければ let を使う
// 複数の Int型の定数を定義
let constant = 1, constant2 = 2, constant3 = 3

// 複数の String 型の変数を定義(型注釈のみ, 入力候補が出る)
var variable1, variable2, variable3: String
/*:
 ## 型
 Swift には型推論があります。
 */
// implicit - 暗黙な integer - 整数
let implicitInteger = 70 // Int型
let implicitDouble = 70.0 // Double型
let explicitDouble: Double = 70 // Doubleと明示することでInt型ではなくDouble型と認識させる
//: 型を変換するには型を明示して初期化します。
let label = "The width is " // String型
let width = 94 // Int型
let widthLabel = label + String(width) // String()でString型に変換
/*:
 > `String(width)` を `width` に変えたらどうなるでしょう？
 */
// 答え: error: binary operator '+' cannot be applied to operands of type 'String' and 'Int' というコンパイルエラーが出る(型の異なるもの同士の足し算ができないとい)
/*:
 ## 文字列
 文字列は、ダブルクオート (`"`) で囲います。
 */
let string = "Hello Swift!"
//:  値を文字列に入れるには `\(値)` とします。
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples." // I have 3 apples. \()で文字列に値を入れられる
let fruitSummary = "I have\(apples + oranges) pieces of fruit." // I have 8 pieces of fruit.

// 算術演算子
// +    足し算
// -    引き算
// *    かけ算
// /    わり算
// %    剰余
/*:
 ## オプショナル
 `変数名: 型名?` で宣言します。
 */
// 全てエラーになる
let nonNilString: String = nil
let nonNilInteger: Int = nil
var nonNilDouble: Double = 10.0
nonNilDouble = nil
// Swiftではnullではなくnil, nilはOptional型で扱う optional - オプション, 任意の, 選択可能な
let optionalInt: Int? = 9
//: 文字列が整数に変換できる場合
var myString = "7"
var possibleInt = Int(myString)
print(possibleInt as Any) // print()の引数はany型のため、
//: 文字列が整数に変換できない場合



/*:
 ## 配列
 */



//: `let` で宣言された配列は要素の変更ができません。



//: 空配列の宣言とコメント



/*:
 ## 暗黙のオプショナルアンラップ
 */



//: [Next](@next)
