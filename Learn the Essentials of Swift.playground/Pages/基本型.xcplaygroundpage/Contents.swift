// Copyright© DWANGO Co.,Ltd. All Rights Reserved.
/*:
 # 基本型
 ## 定数と変数
 
 `var` は変数、 `let` は定数です。
 */
// Int(https://developer.apple.com/documentation/swift/int)
// Double(https://developer.apple.com/documentation/swift/double)
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
// String(https://developer.apple.com/documentation/swift/string)
// String() (https://developer.apple.com/documentation/swift/string/init(_:radix:uppercase:))
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
// Optional(https://developer.apple.com/documentation/swift/optional)
// init?(https://developer.apple.com/documentation/swift/int/2927504-init)
let optionalInt: Int? = 9

// 全てエラーになる
let nonNilString: String = nil
let nonNilInteger: Int = nil
var nonNilDouble: Double = 10.0
nonNilDouble = nil
// Swiftではnullではなくnil, nilはOptional型で扱う optional - オプション, 任意の, 選択可能な
let optionalInt: Int? = 9
//: 文字列が整数に変換できる場合
var myString = "7"
var possibleInt = Int(myString) // Optional型
print(possibleInt as Any) // print()の引数はany型と決められているため、Optional型がany型に変換されている

myString = "banana"
possibleInt = Int(myString)
print(possibleInt as Any) // nilになる
/*:
 ## 配列
 */
// 配列(https://developer.apple.com/documentation/swift/array)
var ratingList = ["Poor", "Fine", "Good", "Excellent"] // Array<String型>
ratingList[1] = "OK"
ratingList // ["Poor", "OK", "Good", "Excellent"], "Fine"が"OK"になる

// コンパイルエラー
let list = [1, "One"]
 
// Swift の配列は値型なので、コピーをした場合の挙動が異なる
// JavaScriptでもbも[1, 10, 3]になる
var a = [1, 2, 3]
var b = a
a[1] = 10
a   // [1, 10, 3]
b   // [1, 2, 3]
//: `let` で宣言された配列は要素の変更ができません。
let ratingList2 = ["Poor", "Fine, "Good", "Excellent"]
ratingList2[1] = "OK" // error: cannot assign through subscript: 'ratingList2' is a 'let' constant
//: 空配列の宣言とコメント
// Creates an empty array.
let emptyArray: [String] = [] // String型の空配列
// 複数行の場合はスラッシュとアスタリスクで囲む (/* ... */)
/*:
 ## 暗黙のオプショナルアンラップ
 */
// implicitly unwrapped optional(https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html#ID334)
var implicitlyUnwrappedOptionalInt: Int! // nilで初期化される(オプショナル)

var optionalInt: Int? = 3 // optionalIntはOptional型, 3はInt型なのでエラー
print(optionalInt + 3) // コンパイルエラー
                   
var implicitlyUnwrappedOptionalInt: Int! = 3 // implicitlyUnwrappedOptionalIntはInt型と見なされて通される
print(implicitlyUnwrappedOptionalInt + 3) // 6

//: [Next](@next)
