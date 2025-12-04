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

func greet2(_ name: String) { // 引数ラベルを省略したい時に_(パラメーター)を使う, _ とnameの間にスペースを入れる
    print(name)
}
// 関数呼び出し
greet2("Anna")

// 引数ラベルをパラメーター名の前に書くことで別々にすることができる
func greet3(to name: String) {
    print(name) // パラメーター名の'name'を使う
}
// 関数呼び出し
greet3(to: "Anna")
//: タプルを返す関数を実装してみましょう。
func calculateStatistics(scores: [Int]) -> (min_score: Int, max_score: Int, sum: Int) { // 戻り値はInt型の値が3つあるタプル, (min_score:...の部分
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
    
    return(min_score, max_score, sum)
}
//: その関数を呼んでみましょう。
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9]) // タプル - リストみたいなもの
print(statistics) // (min_score: 3, max_score: 100, sum: 120), 戻り値のタプルで指定しているため3つの要素が出ている
print(statistics.sum) // 120
print(statistics.2) // 120, min_score, max_score, sumの3番目を表している
//: 可変長引数の関数を実装してみましょう。
func sum0f(numbers: Int...) -> Int { // 型名(Int...)の後ろに...をつけることで可変長引数になる, 可変長引数 -
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
//: その関数を呼んでみましょう。
sum0f() // _ 0
sum0f(numbers: 42, 597, 12) // _ 651, 関数の中の引数の型はArray, 0個の場合は引数なしで呼びだし、1個以上の場合はカンマ(,)で区切る
//: 入れ子の関数を実装して、呼んでみましょう。
func returnFifteen() -> Int {
    var y = 10
    func add() { // add関数はreturnFifteen関数の中からしかアクセス出来ない, 一つの関数の中で同じような処理をする場所があれば入れ子の関数を作って処理をまとめることができる
        y += 5
    }
    add()
    
    return y
}
returnFifteen() // 15
//: 関数を返す関数を実装してみましょう。
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne // Swiftの関数は第一級オブジェクトなので、関数の戻り値に関数を指定することができる, オブジェクトとしての関数の部分は addOne で、丸括弧 () は必要ない(丸括弧をつけると関数呼び出しになるため)
}
//: その関数を呼んでみましょう。
var increment = makeIncrementer()
increment(7) // increment(number: 7)のように引数ラベルを指定することはできない(コンパイルエラー), 関数が定数や変数に割り当てられると、その関数シグネチャに引数ラベルは含まれないため
// 関数シグネチャ - 関数の入力と出力を定義するもの, 例: (Int) -> Int, Int 型の引数を取り、Int 型の戻り値を返す関数シグネチャ
//: 引数に関数をとる関数を実装して、呼んでみましょう。
// リストの中に 10 未満の数字が 1つでもあるかどうかを調べて、Bool（true/false）を返す
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
// map(https://developer.apple.com/documentation/combine/publisher/map(_:)-99evh)
numbers.map({ // {}の部分がクロージャで、引数と戻り値を先に記述し、inの後に処理を記述する
    (number: Int) -> Int in
    let result = 3 * number // numbersの配列の全ての要素を3倍する
    return result
})
//: 引数の型、戻り値を省略したクロージャを実装してみましょう。
// 引数の型が渡されるメソッドにより決定している場合や、戻り値が型推論によって明らかな場合は記述を省略できる
// 一行で値を返す場合は return が必要ない
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

let sortedNumbers = numbers.sorted { $0 > $1 } // sortedの引数名を省略した場合、$0, $1, $2...となる
// 引数のクロージャが1つだけの場合、sortedの丸括弧 "()" 自体を省略できる
print(sortedNumbers)

//特定の型のメンバーとして定義された関数のことを メソッド と呼びます。
//つまり、メソッドは定義された型またはそのサブタイプでしか呼ぶことができません。
//: メソッドを呼んでみましょう。
let exampleString = "hello"
if exampleString.hasPrefix("lo") { // hasPrefix()はString型以外からは呼べない, prefix - 接尾辞
    print("ends in lo") // メソッドはドット記法で呼ぶ
}
//: [Previous](@previous)
// 挑戦
// 初級
// Playground を作成し、Hello, (自分の名前) を出力してみましょう。
// Playground の作成は、 File > New > Playground から行えます。
print("Hello, Sigma!")

// 解答
let nameString = "Hello, David"
print(nameString)

//中級
//Playground にて、Hello, (任意の名前) を出力する関数を実装してみましょう。
//また、その関数を呼び出してみましょう。
func sayHello(to person: String) -> String {
  return "Hello, \(person)"
}

sayHello(to: "David")
//上級
//オプショナル整数型([Int?])の配列を引数に取り、nil の要素を取り除いた [Int] 型の 配列を返す関数を実装してみましょう。
//例：
//[1, 2, nil, 3, 4, nil, 5] -> [1, 2, 3, 4, 5]
//func returnArray(a: [Int?]) -> [Int] {
//    return
//}

// 解答
//for 文と if 文を使って以下のように書けます。
func nonNilArray(optionalArray: [Int?]) -> [Int] {
  var array = [Int]()
  for element in optionalArray {
    if let element = element {
      array += [element]
    }
  }
  return array
}

nonNilArray(optionalArray: [1, 2, nil, 3, 4, nil, 5])
// 配列型には compactMap というメソッドが用意されており、 これと同じ動作をします
// compactMap(https://developer.apple.com/documentation/swift/array/compactmap(_:) )

//Swift 言語の基礎を学ぼう 1
//今回は、iOS ネイティブアプリ開発の準備をしていきます。
//
//開発に必要な Xcode をインストールし、Swift 言語の基礎を学びます。
//
//
//
//目次
//【講義】iOS 開発に必要なもの
//【実習】Xcode をインストールしよう
//【講義】Swift 言語とは
//【実習】Playground を使ってみよう
//【実習】Swift 言語の基礎
//基本型
//定数と変数
//型
//文字列
//オプショナル
//配列
//暗黙のオプショナルアンラップ
//制御フロー
//条件文
//ループ
//関数
//まとめ
//【講義】iOS 開発に必要なもの
//まず iOS ネイティブアプリ開発をするには、macOS(OS X) が搭載されたコンピューターが必要です。
//
//さらに、以下のツールが必要です。
//
//Xcode
//Xcode は、 Apple が提供している、 iOS 開発をするための IDE です。
//処理系のインストールからアプリの配布までを行える非常に多機能なものになっています。
//
//執筆時の環境は以下です。
//
//macOS Big Sur 11.4
//Xcode 12.5.1 (12E507)
//iOS の開発環境は絶えず更新されています。
//同じバージョンの開発環境でない場合には異なる挙動をすることがありますので、その際には随時自分で対応してください。
//最新バージョンではない Xcode は developer.apple.com/からインストールが可能です。
//
//macOS のバージョンの確認方法
//なお、PC に外付けするディスプレイが 1 つあると便利です。外付けのディスプレイが 1 つあると、教材と Xcode を別々のディスプレイに表示することができるので、学習の効率が上がります。
//ただし、ディスプレイがもう 1 つあることは 必須ではありません。そのようなディスプレイがなくても本教材を進めることはできるので、ご安心ください。
//
//【実習】Xcode をインストールしよう
//App Store から Xcode をインストールしてみましょう。
//
//まず、 App Store アプリを起動します。
//起動の仕方にはいくつかありますが、左上のアップルメニュー (🍎) をクリックしてプルダウンメニューから [App Store] を選択すれば起動します。
//
//アップルメニューと App Store という項目
//左上の検索窓に Xcode と入力し return を押します。
//
//検索窓に入力した Xcode
//検索結果の先頭に Xcode という項目が出るのでその項目をクリックします。
//
//検索結果に表示された Xcode
//[インストール] ボタンを押してインストールをします。
//この時 AppleID とパスワードを求められる時がありますが入力してインストールをしてください。
//
//インストールが終わると [開く] という表示に変わるので、そのボタンをクリックし、 Xcode を起動します。
//
//また初回起動時は Command Line Tools のインストールをするためにユーザ名とパスワードを求められることがあります。
//Command Line Tools には今後使用する Swift 言語の処理系も含まれているのでインストールをしておきましょう。
//
//【講義】Swift 言語とは
//iOS ネイティブアプリ開発では Swift 言語を使用します。
//Objective-C, Objective-C++ といった言語でも開発は可能ですが、この教材では触れません。
//
//Swift 言語とは、 2014 年に Apple が発表したプログラミング言語で、次のような特徴があります。
//
//強い静的型付け、型推論
//LLVM を使用してコンパイルされる
//Objective-C, Objective-C++ と共存できる
//Swift はプログラムを実行する際にコンパイルという、ソースコードを実行環境で動作するコードに変換する作業を行います。
//これは LLVM というコンパイラ基盤によって行われます。
//Swift 以前の iOS 開発に用いられた Objective-C, Objective-C++ といった言語も同じく LLVM を使用してコンパイルされ動作するようになっているので、 Objective-C, Objective-C++ で実装された コードを同じプロジェクトで使用することができます。
//
//また、 2015 年末にオープンソース化されたため Swift 自体は iOS, macOS(OS X) 以外でも動作します。
//対応しているプラットフォームについて、詳細は Swift.org - Platform Support を参照してください。
//
//2023 年 9 月現在のバージョンは Swift 5.8.1 で、半年から 1 年のペースでアップデートが行われています。
//以前のバージョンとは互換性がない場合も多いので、過去の資料を参考にする際はバージョンに気をつけましょう。
//
//【実習】Playground を使ってみよう
//さて、今節では Playground を使って Swift 言語を学んでいきます。
//Playground とは、 Swift を対話的に実行できるファイルです。
//拡張子は .playground です。
//
//learn-the-essentials-of-swift.zip をダウンロードし、今節で使用する Playground を開きましょう。
//
//ダウンロードし、 zip を解凍したら、 ディレクトリにある Learn the Essentials of Swift.playground をダブルクリックしましょう。
//同じく入っている Learn the Essentials of Swift Answer.playground は解答です。
//Swift 言語に慣れるためには実際にコードを書いてみるのが大切ですので、 今節を最後まで学んでから開くことをおすすめします。
//
//なお、ダウンロードしたファイルを開く際に以下のような警告が出る場合があります。 先ほどダウンロードしたファイルを開こうとしているのであれば、Trust and Open をクリックして問題ありません。
//また、これ以降の各節でファイルを配布します。その際も同様の警告が出る場合がありますので、開こうとしているファイルを確認してからそれぞれのファイルに対して Trust and Open をクリックしてください。
//
//Learn the Essentials of Swift.playground を開く際の警告
//Playground ファイルをダブルクリックするとウィンドウが開き、早速 Playground が使える状態になります。
//
//Playground で開いた Learn the Essentials of Swift.playground
//今回用意した Playground は複数ページに分かれています。
//ページ下部のリンクから遷移できますが、遷移が楽になるように command ⌘ + 1 を押してみましょう。
//
//すると左カラムが現れるので、そこから任意のページを開くことができます。
//
//Playground 左カラム
//ここ(エディタ部)には Swift のコードを書くことができます。
//また、今回のようにコメントをマークアップすることができたり、 複数のページを使うこともできたりするので機能の紹介をするのに向いています。
//実際に Apple のドキュメントや Swift のオープンソースライブラリで、機能の概要を説明するのに使われています。
//
//Swift のコードを記述すると即時実行され、結果が右側に表示されます。
//iOS アプリを Playground で実装することは難しいですが、 Swift の挙動の確認をするには大変便利なものです。
//Swift を学習するにはうってつけですので、今回はこれを使って学んでいきましょう。
//
//コードを追加するか、画面下部にある Execute Playground ボタンを押すと実行されます。
//
//Execute Playground ボタン
//式・値が評価された場合は右側に結果が表示されます。
//print(), debugPrint(), dump() といったログ出力用の関数を使った場合は画面下部に結果が表示されます。
//print() は引数を標準出力に出力する関数です。debugPrint() は型情報なども含めたデバッグ情報を出力するのに利用し、dump() はオブジェクトの内部情報も含めて出力するのに利用します。
//リンク先が公式ドキュメントになっているので、英語ですが興味があれば読んでみることをおすすめします。
//
//【実習】Swift 言語の基礎
//実際に Swift 言語がどのような構文、文法になっているのかを、先ほどの Playground で実際に動作を確かめながら見ていきます。
//Learn the Essentials of Swift.playground を開き、そこに実際にコードを書きながら学んでいきましょう。
//
//Playground の使い方
//このセクションの以降の見出しは Playground の見出しに対応しています。
//実際にコードを書いて動作を確かめつつ、 Note が書いてある場所ではその内容を自分で試してみましょう。
//
//また、あえてエラーになるコードも含まれていますが、エラーが出たままだとその先に進んでも コンパイルが実行されないのでその部分は消すかコメントアウト(スラッシュ二つ //)してから 進むようにしてください。
//
//Playground でしばらく待っても結果が表示されない場合
//残念ながら Playground では実行してしばらく待っても結果が表示されない場合があります。
//対処方法としては、右のツールバーからPlayground SettingsのPlatform を macOS に変更してみましょう。
//
//
//
//iOSの開発ですが、Playground では主に Swift の記述の練習をしていきますので、ここではよしとします。
//後の節で iOS でしか駆動しない UIKit を使う時は、Platform を iOS に戻してください。
//
//基本型
//定数と変数
//let は定数です。let 定数名 と宣言します。
//JavaScript の const に当たります。
//違うのは、 let で再代入をした場合は実行時エラーではなくコンパイルエラーになる点です。
//
//var は変数です。var 変数名 と宣言します。
//JavaScript の let, var に当たります。
//JavaScript と違いスコープによる再代入の可・不可は制御できません。
//
//以下のコードを Playground に書いて、変数と定数を宣言してみましょう。
//
//var myVariable = 42
//myVariable = 50
//let myConstant = 42
//Please Type!
//なお、変数の初期値がない場合は変数の型を明示的に指定する必要があります。
//
//var myVariable: Int
//myVariable = 42
//Please Type!
//JavaScript では必ず行末にセミコロン (;) が必要ですが、 Swift では 1 行に 1 文だけの場合は必要ありません。
//1 行に複数の文を書くことは可読性を悪くするため基本的にセミコロンを書かないようにしましょう。
//
//変数宣言 var, let と実行結果
//さらに、Note にあるように、 myConstant に再代入をしてみましょう。
//
//myConstant = 50
//Please Type!
//すると error: cannot assign to value: 'myConstant' is a 'let' constant というコンパイルエラーが出るはずです。
//コンパイルエラーはログに詳細が出力されたり、エラーが出ている行が赤くなるため、どこでどのようなエラーが出たかわかるようになっています。
//
//再代入が必要なければ let を使いましょう。
//
//なお , で区切って複数の定数や変数を同時に宣言することもできます。
//
//// 複数の Int 型の定数を定義
//let constant1 = 1, constant2 = 2, constant3 = 3
//
//// 複数の String 型の変数を定義（型注釈のみ）
//var variable1, variable2, variable3: String
//
//型
//Swift では JavaScript とは違い、変数や定数ごとに、代入できる値の種類を決める必要があります。
//これを変数や定数の「型」と言い、宣言時に型も指定します。
//ただし型を自動で決める型推論という機能がありますので、右辺で評価した式や値の型がわかっている場合には、型を明示せず自動で型を決定することもできます。
//
//以下のコードを書いて、暗黙的に型が決まる場合と明示的に型が決まる場合を見てみましょう。
//
//let implicitInteger = 70
//let implicitDouble = 70.0
//let explicitDouble: Double = 70
//Please Type!
//右側には全て 70 と表示されましたが、上の一つと下の二つは型が異なります。
//
//1行目の 70 は整数です。
//Swift では整数は Int というデータ型で扱われます。
//右辺の 70 が Int 型なので、左辺の implicitInteger は Int 型になります。
//
//2行目の 70.0 は整数に .0 というように小数点が書かれているので、浮動小数点数です。
//Swift では浮動小数点数は Double というデータ型で扱われます。
//右辺の 70.0 が Double 型なので、左辺の implicitDouble は Double 型になります。
//
//3行目の explicitDouble は、右辺の 70 が Int 型ですが、 Double と明示しているので Double 型になります。
//
//また、 Swift は静的な型付け言語なため、宣言した後に型を変えることはできません。
//変換するためには型を明示して初期化をする必要があります。
//
//以下のコードを書いて、違う型になったことを確認してみましょう。
//
//let label = "The width is "
//let width = 94
//let widthLabel = label + String(width)
//Please Type!
//label は String 型、 width は Int 型なのでそのままでは連結ができません。
//そのため width を String 型に変換するために String() で初期化をしています。
//結果的に widthLabel の型は String となります。
//
//ここで、 String(width) を width に変えるとどうなるでしょうか。
//
//error: binary operator '+' cannot be applied to operands of type 'String' and 'Int' というコンパイルエラーが 出ますが、これは型の異なるもの同士の足し算ができないということです。
//
//文字列
//ダブルクオート(")で囲うと文字列になります。
//
//以下を書いて、 String 型の定数を宣言してみましょう。
//
//let string = "Hello Swift!"
//Please Type!
//文字列に値を入れるには、バックスラッシュ \ の後に丸括弧 () でくくることでできます。
//ES6 におけるバッククオートを利用した String template の ${hoge} と似ていますね。
//
//以下を書いて、文字列に値を入れてみましょう。
//
//let apples = 3
//let oranges = 5
//let appleSummary = "I have \(apples) apples."
//let fruitSummary = "I have \(apples + oranges) pieces of fruit."
//Please Type!
//+ は Swift では足し算を表します。
//他の代表的な算術演算子は以下です。
//
//演算子
//+    足し算
//-    引き算
//*    かけ算
///    わり算
//%    剰余
//appleSummary は "I have 3 apples.", fruitSummary は "I have 8 pieces of fruit." という文字列になります。
//
//オプショナル
//Swift 言語には「オプショナル」という機能があります。
//
//まず、 Swift では要素が何もない状態を、 nil と表現します。
//JavaScript でいう null ですね。
//
//そして、 nil は通常どの型にも代入することはできません。
//
//(以下のコードは書く必要はありません)
//
//let nonNilString: String = nil
//let nonNilInteger: Int = nil
//var nonNilDouble: Double = 10.0
//nonNilDouble = nil
//
//これらはいずれも nil を代入するところでコンパイルエラーとなります。
//
//そこで Swift で nil を扱う型が Optional です。
//Optional 型を使うと nil を代入することができます。
//
//オプショナルにするには、型名の後に ? をつけるだけです。
//
//以下のコードを書いて、 Optional 型を宣言してみましょう。
//
//let optionalInt: Int? = 9
//Please Type!
//オプショナルは失敗しうる動作を行う場合に便利です。
//成功したら値を返し、失敗した場合は nil を返します。
//
//以下のように、String から Int へ変換する例を見てみましょう。
//Int の init? という初期化関数を利用します。
//初期化関数については後ほど触れますが、 String から Int への変換はオプショナルになっています。
//
//以下のコードを書いて、型変換がどのような型を返すか見てみましょう。
//
//var myString = "7"
//var possibleInt = Int(myString)
//print(possibleInt as Any)
//Please Type!
//possibleInt は myString が整数型に変換できるので 7 が得られます。
//また、ログが Optional(7) と表示されましたが、これは possibleInt が Int 型でなく Optional 型だということを表しています。
//
//print の引数は possibleInt as Any となっています。
//これは print の引数の型が Any であるため、 Optional 型を Any 型に 変換しています。
//本来ならば Any 型はどのような型でも暗黙的に変換できるのですが、 Optional 型は nil を許容しているため、明示的に変換する必要があります。
//
//次に、以下のコードを書いて、同じく型変換がどのような型を返すか見てみましょう。
//
//myString = "banana"
//possibleInt = Int(myString)
//print(possibleInt as Any)
//Please Type!
//ログが nil と表示されました。
//myString が Int に型変換できないと possibleInt は nil になります。
//このように、変換できたかどうかを nil かそうでないかで判断することができます。
//
//配列
//Swift の配列は JavaScript ととてもよく似ています。
//
//まずは以下を書いて、配列を宣言し、要素を変更してみましょう。
//
//var ratingList = ["Poor", "Fine", "Good", "Excellent"]
//ratingList[1] = "OK"
//ratingList
//Please Type!
//ratingList は "Fine" が "OK" に変わり、 ["Poor", "OK", "Good", "Excellent"] になりました。
//
//宣言は角括弧 ([]) で囲います。
//要素にアクセスするときは角括弧にアクセスしたいインデックスを書きます。
//0 から始まっているのも JavaScript と同じですね。
//
//もちろん配列にも型はあります。
//上の例では Array<String> 型になるため、配列に String 型以外のものは入れられません。
//配列に入れることができるのは一種類のデータ型のみになるため、型を揃えて配列を作りましょう。
//例えば、以下の例はコンパイルエラーになります。
//
//(書く必要はありません)
//
//let list = [1, "One"]
//
//また、 JavaScript では const で宣言した配列もその要素は後から変更できてしまいましたが、 Swift では配列を let で宣言すると要素の変更ができません。
//
//試しに以下を書いてみると、コンパイルエラーになります。
//
//let ratingList2 = ["Poor", "Fine", "Good", "Excellent"]
//ratingList2[1] = "OK"
//Please Type!
//error: cannot assign through subscript: 'ratingList2' is a 'let' constant というエラーになります。
//
//また、Swift の配列は値型なので、コピーをした場合の挙動が異なります。
//
//(書く必要はありません)
//
//var a = [1, 2, 3]
//var b = a
//a[1] = 10
//a   // [1, 10, 3]
//b   // [1, 2, 3]
//
//JavaScript だと b も [1, 10, 3] になります。
//
//空配列を宣言する場合は配列用の初期化文法を使います。
//
//以下のコードを書いて、空配列を宣言してみましょう。
//
//// Creates an empty array.
//let emptyArray: [String] = []
//Please Type!
//これで emptyArray は String 型を要素とする空配列になりました。
//
//コードの一行上にあるのはコメントです。
//
//1 行だけの場合はスラッシュ二つ (//)
//複数行の場合はスラッシュとアスタリスクで囲む (/* ... */)
//こちらも JavaScript と同じですね。
//
//暗黙のオプショナルアンラップ
//"implicitly unwrapped optional" と言います。
//
//オプショナルの ? の代わりに ! をつけて宣言します。
//
//以下のコードを書いてみましょう。
//
//var implicitlyUnwrappedOptionalInt: Int!
//Please Type!
//右側に nil と表示されますが、これは implicitlyUnwrappedOptionalInt が nil で 初期化されたということです。
//
//つまりはオプショナルなのですが、これにアクセスする場合はオプショナルでないような振る舞いをします。
//
//var optionalInt: Int? = 3
//print(optionalInt + 3)　// コンパイルエラー
//
//var implicitlyUnwrappedOptionalInt: Int! = 3
//print(implicitlyUnwrappedOptionalInt + 3) // 6
//
//例えばこの場合、一つ目の例においては、optionalInt はオプショナルですが 3 は Int 型ですので、型が合わずコンパイルエラーになりますが、二つ目の例においては、implicitlyUnwrappedOptionalInt は Int 型としてみなされ、6 と計算することができます。
//
//なお、先ほどの
//
//var implicitlyUnwrappedOptionalInt: Int!
//
//のように、変数の値の初期化をしないままアクセスをすると実行時エラーとなるため、使う前に必ず nil 以外で初期化が行われているようにしましょう。
//
//iOS アプリ開発では InterfaceBuilder とコードを繋げて開発を進めますが、その際に UI のパーツに紐付けるのがこの implicitly unwrapped optional なのです。
//具体的な使用例は実際に InterfaceBuilder を使用する際に説明します。
//
//このような実行時エラーを引き起こしうる構文を積極的に使うことはおすすめしません。
//しかし、現在 Xcode を利用して開発をする上では必要なことなので知っておきましょう。
//
//制御フロー
//Swift には二つの制御フローがあります。
//
//条件文
//ループ
//これらも JavaScript ととてもよく似ています。
//
//条件文
//if と switch の二種類があります。
//
//まずは以下のコードを書いて、基本的な if 文を見てみましょう。
//
//let number = 23
//if number < 10 {
//  print("The number is small")
//} else if number > 100 {
//  print("The number is pretty big")
//} else {
//  print("The number is between 10 and 100")
//}
//Please Type!
//ここで、 < は比較演算子で未満を表します。
//他に Swift の代表的な比較演算子は以下のようなものがあります。
//
//演算子
//<    より小さい(未満)
//>    より大きい(超過)
//<=    以下
//>=    以上
//==    等しい
//!=    等しくない
//また、今回は登場しませんが論理演算子の代表的なものも紹介します。
//
//演算子
//&&    論理積(かつ)
//||    論理和(または)
//!    否定(ではない)
//他にも多くの演算子が存在しますが全部は紹介しきれないので、 今後の学習の中で新しく出てきた時に紹介していくことにします。
//
//number の値を変えてみて、どのような文がログ出力されるか調べてみましょう。
//
//JavaScript と異なるのは、条件判定文に丸括弧 () が必要ないという点です。
//
//また、 if 文でオプショナルが値が持つかを判定できます。
//
//以下のコードを書いて、オプショナルが値を持つと if 文内で変数が束縛されるのを見てみましょう。
//
//「束縛」とは、引数や定数などの名前に対して特定の値を固定することです。 以下の例では、 name が if 文内で使うことのできる String 型の定数になっています。
//
//var optionalName: String? = "John Appleseed"
//var greeting = "Hello!"
//if let name = optionalName {
//  greeting = "Hello, \(name)"
//}
//print(greeting)
//Please Type!
//optionalName を nil にすると greeting の値はどうなるでしょうか。
//
//この if 文では let name = optionalName と記述することで、if 文でオプショナルが値を持つかを判定しています。
//optionalName が nil でない場合のみ、 name に optionalName の値を束縛して波括弧 {} 内の処理を実行することができます。
//これを　Optional Binding といいます。
//
//また、複数の条件文を , でつなげて記述できます。
//それにより前の条件文を使って判定したり、複数の値を使ったりできます。
//
//以下のコードを書いて動作を確認してみましょう。
//
//var optionalHello: String? = "Hello"
//if let hello = optionalHello , hello.hasPrefix("H"), let name = optionalName {
//  greeting = "\(hello), \(name)"
//}
//Please Type!
//次に、 switch 文です。
//
//JavaScript の switch 文とよく似ていますが、 Swift の switch 文はとてもパワフルです。
//
//以下を書いて、 switch 文でできることを確認してみましょう。
//
//let vegetable = "red pepper"
//var vegetableComment = "initialized"
//print(vegetableComment)
//switch vegetable {
//  case "celery":
//    vegetableComment = "Add some raisins and make ants on a log."
//  case "cucumber", "watercress":
//    vegetableComment = "That would make a good tea sandwich."
//  case let x where x.hasSuffix("pepper"):
//    vegetableComment = "Is it a spicy \(x)?"
//  default:
//    vegetableComment = "Everything tastes good in soup."
//}
//print(vegetableComment)
//Please Type!
//特徴を以下に挙げていきます。
//
//break は必要ありません。
//case の条件として、複数の条件式を , で区切って記述できます。
//これを複合ケース (Compound Cases) といいます。
//case "cucumber", "watercress": は、"cucumber" または "watercress" にマッチします。
//マッチするケースが見つかった場合、実行してそのまま switch 文を抜け出しますが、 fallthrough を使った場合は次のマッチするケースを探し続けます。
//let でパターンにマッチしたものを束縛して定数として使えます。
//let x where x.hasSuffix("pepper") の where は追加条件を表します。
//全てのケースを網羅する必要があります。
//全てのケースがわからない場合は default を使います。
//ループ
//Swift のループには、 for と while があります。
//
//どちらも JavaScript と同じですが、やはり条件文に丸括弧が必要ありません。
//
//Swift の for 文では for-of ループに似た for-in ループのみを使います。
//初期化式、条件式、変化式の 3 つを書くスタイルの for 文は使えないので気をつけましょう。
//
//ループと条件文を組み合わせた以下のコードを書いてみましょう。
//
//let individualScores = [75, 43, 103, 87, 12]
//var teamScore = 0
//for score in individualScores {
//    if score > 50 {
//        teamScore += 3
//    } else {
//        teamScore += 1
//    }
//}
//print(teamScore)
//Please Type!
//in には配列のほか、 整数の範囲を指定することもあります。
//整数の範囲は CountableRange, CountableClosedRange という型で表すことができます。
//
//以下を書いて、 CountableRange 型の場合を見てみましょう。
//
//var firstForLoop = 0
//for i in 0..<4 {
//  firstForLoop += i
//}
//print(firstForLoop) // 6
//Please Type!
//..< は終端を含まない範囲を表す、 CountableRange 型のリテラルです。
//
//リテラルとは、プログラムのソースコード上に直接記述される値のことです。 ダブルクオートで囲った文字列の値("hello" など)を表すものを文字列リテラル、整数(123 など)を表す整数リテラルなどがあります。
//
//0..<4 は 0 から 3 までということになります。
//
//以下を書いて、 CountableClosedRange 型の場合を見てみましょう。
//
//var secondForLoop = 0
//for _ in 0...4 {
//  secondForLoop += 1
//}
//print(secondForLoop) // 5
//Please Type!
//... は終端を含む範囲を表す、 CountableClosedRange 型のリテラルです。
//0...4 は 0 から 4 までということになります。
//
//また、 _ は ワイルドカード といい、インデックスの値を無視することになります。
//
//関数
//関数は func で宣言します。 function を短くした書き方ですね。
//他のプログラミング言語同様、関数は 0 以上の引数を受け取れます。
//その際は name: Type のように 引数名: 型名 の形式で記述します。
//なお、引数はデフォルトで定数であり、関数内で再代入することはできません。
//Swift 2 以前は var を引数に使用できましたが、Swift 3 以降は廃止されています。
//戻り値の型は -> の後に記述します。
//そして波括弧({})の中に中身を記述します。
//
//以下のコードを書いて、関数を実装してみましょう。
//
//func greet(name: String, day: String) -> String {
//  return "Hello \(name), today is \(day)."
//}
//Please Type!
//この greet は以下のように呼び出します。
//以下を書いて、関数を呼び出してみましょう。
//
//greet(name: "Anna", day: "Tuesday")
//greet(name: "Bob", day: "Friday")
//greet(name: "Charlie", day: "a nice day")
//Please Type!
//それぞれ文字列が表示されますね。
//Swift では、基本的に呼び出す時には引数名が必要です。
//引数名には 2 つの種類があり、1 つは関数の中で使う名前、もう 1 つは関数を呼び出すときに使う名前です。
//関数の中で使う名前を「パラメータ名」と呼び、関数を呼び出すときに使う名前を「引数ラベル」と呼びます。
//これをそれぞれ指定したり省略したりできます。
//また、引数の順番を入れ替えることはできません。
//
//引数ラベルを省略したい場合は、パラメータ名の前に _ をつけます。
//
//func greet2(_ name: String) {
//  print(name)
//}
//
//// 関数呼び出し
//greet2("Anna")
//Please Type!
//また、引数ラベルをパラメータ名の前に書くことで別々にすることもできます。
//
//func greet3(to name: String) {
//  print(name) // パラメータ名の `name` を使う
//}
//
//// 関数呼び出し
//greet3(to: "Anna")
//Please Type!
//関数は タプル を使用することで複数の値を返すことができます。
//Swift のタプルは複数の値を丸括弧 () でくくることで表現されます。
//
//以下の関数のようにして使用します。
//
//func calculateStatistics(scores: [Int]) -> (min_score: Int, max_score: Int, sum: Int) {
//    var min_score = scores[0]
//    var max_score = scores[0]
//    var sum = 0
//
//    for score in scores {
//        if score > max_score {
//            max_score = score
//        } else if score < min_score {
//            min_score = score
//        }
//        sum += score
//    }
//
//    return (min_score, max_score, sum)
//}
//Please Type!
//この関数の戻り値は、 Int 型の値が 3 つあるタプルです。
//この値へのアクセスは以下のように行います。
//
//let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
//print(statistics.sum)
//print(statistics.2)
//Please Type!
//今回は宣言時に要素に先頭から min_score, max_score, sum と名前をつけているので、その名前でアクセスできます（最初の print 文）。
//また名前をつけたかつけなかったかに関わらず、先頭の要素から 0, 1, 2, ... と添字でもアクセスできます（二番目の print 文）。
//
//関数の引数は可変長引数にすることもできます。
//以下を書いてみましょう。
//
//func sumOf(numbers: Int...) -> Int {
//  var sum = 0
//  for number in numbers {
//    sum += number
//  }
//  return sum
//}
//Please Type!
//型名の後ろに ... をつけることで可変長引数になります。
//関数の中でその引数の型は Array になります。
//こうすることで numbers は 0 個以上の Int 型の定数を引数に取ることができます。
//
//以下のように呼び出してみましょう。
//
//sumOf()
//sumOf(numbers: 42, 597, 12)
//Please Type!
//0 個の場合は無引数として呼び出し、 1 個以上の場合は定数をカンマ (,) で区切ります。
//
//また、関数は入れ子にすることができます。
//以下を書いてみましょう。
//
//func returnFifteen() -> Int {
//  var y = 10
//  func add() {
//    y += 5
//  }
//  add()
//
//  return y
//}
//returnFifteen()
//Please Type!
//この add 関数は returnFifteen 関数の中からしかアクセスできません。
//一つの関数の中で同じような処理をする場所があれば入れ子の関数を作って処理をまとめることができます。
//
//Swift では関数は第1級オブジェクトです。
//そのため関数の戻り値に関数を指定することもできます。
//
//func makeIncrementer() -> ((Int) -> Int) {
//  func addOne(number: Int) -> Int {
//    return 1 + number
//  }
//  return addOne
//}
//Please Type!
//makeIncrementer 関数は addOne 関数を返します。
//オブジェクトとしての関数の部分は addOne で、丸括弧 () は必要ありません。
//丸括弧をつけると関数呼び出しになるためです。
//
//以下のようにして呼び出してみましょう。
//
//var increment = makeIncrementer()
//increment(7)
//Please Type!
//increment は変数のように見えますが、 makeIncrementer が関数を返しているので関数です。
//そのため普段の関数のように実行することができます。
//
//ただし、引数ラベルは指定することはできません。
//例えば increment(number: 7) とするとコンパイルエラーになります。
//
//これは、関数が定数や変数に割り当てられると、その関数シグネチャに引数ラベルは含まれないためです。
//
//関数シグネチャとは、関数の入力と出力を定義するものです。
//例えば (Int) -> Int は、Int 型の引数を取り、Int 型の戻り値を返す関数シグネチャです。
//
//関数を Int などの型と同じように扱えるということは、関数を引数に与えることもできます。
//以下を書いてみましょう。
//
//func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
//  for item in list {
//    if condition(item) {
//      return true
//    }
//  }
//  return false
//}
//func lessThanTen(number: Int) -> Bool {
//  return number < 10
//}
//var numbers = [20, 19, 7, 12]
//hasAnyMatches(list: numbers, condition: lessThanTen)
//Please Type!
//関数の特別なケースとして クロージャ (closure)があります。
//Objective-C では blocks と呼ばれていたものです。
//クロージャはその場で宣言できる名前がない関数のようなものです。
//
//まずは以下を書いてみましょう。
//
//numbers.map({
//  (number: Int) -> Int in
//  let result = 3 * number
//  return result
//})
//Please Type!
//波括弧 {} で囲われた部分がクロージャです。
//引数と戻り値を先に記述し、 in の後に処理を記述します。
//
//map は関数を引数にとり、その関数には配列の各要素が渡されます。
//これは配列のそれぞれの要素を三倍する処理になっています。
//
//次にクロージャの特別な書き方を紹介します。
//引数の型が渡されるメソッドにより決定している場合や、戻り値が型推論によって明らかな場合は記述を省略できます。
//さらに、一行で値を返す場合は return が必要ありません。
//
//以下を書いてみましょう。
//
//let mappedNumbers = numbers.map({ number in 3 * number })
//print(mappedNumbers)
//Please Type!
//さらに引数名を省略できます。
//また、関数の引数の最後にクロージャがある場合、クロージャを丸括弧 () の外に出すことができます。
//
//以下のようになります。書いてみましょう。
//
//let sortedNumbers = numbers.sorted { $0 > $1 }
//print(sortedNumbers)
//Please Type!
//引数名を省略した場合、先頭から $0, $1, $2, ... となります。
//今回のように引数がクロージャ 1 つだけの場合、丸括弧自体を省略することになります。
//
//特定の型のメンバーとして定義された関数のことを メソッド と呼びます。
//つまり、メソッドは定義された型またはそのサブタイプでしか呼ぶことができません。
//
//switch 文の例にあるように、 String 型は hasSuffix() というメソッドが定義されています。
//hasSuffix() は String 型以外からは呼べません。
//
//以下を書いて、 hasSuffix() を呼んでみましょう。
//
//let exampleString = "hello"
//if exampleString.hasSuffix("lo") {
//  print("ends in lo")
//}
//Please Type!
//ends in lo とログ出力されます。
//
//このように、メソッドはドット記法で呼びます。
//
//まとめ
//Xcode をインストールすることで iOS アプリ開発の準備ができる
//Playground を通して Swift 言語の動作を確認することができる
//
//挑戦
//挑戦で出されている課題は、挑戦してもしなくても構いません。
//挑戦には初級、中級、上級の課題が用意されていますので、 自分の実力に合わせて調べたりしながらチャレンジしてみてください。
//
//初級
//Playground を作成し、Hello, (自分の名前) を出力してみましょう。
//Playground の作成は、 File > New > Playground から行えます。
//
//中級
//Playground にて、Hello, (任意の名前) を出力する関数を実装してみましょう。
//また、その関数を呼び出してみましょう。
//
//上級
//オプショナル整数型([Int?])の配列を引数に取り、nil の要素を取り除いた [Int] 型の 配列を返す関数を実装してみましょう。
//例：
//
//[1, 2, nil, 3, 4, nil, 5] -> [1, 2, 3, 4, 5]
//
//挑戦の解答例
//答えを隠す
//
//初級
//let nameString = "Hello, David"
//print(nameString)
//
//中級
//以下は一例です。引数に文字列を与えて出力がされれば良いです
//
//func sayHello(to person: String) -> String {
//  return "Hello, \(person)"
//}
//
//sayHello(to: "David")
//
//上級
//for 文と if 文を使って以下のように書けます。
//
//func nonNilArray(optionalArray: [Int?]) -> [Int] {
//  var array = [Int]()
//  for element in optionalArray {
//    if let element = element {
//      array += [element]
//    }
//  }
//  return array
//}
//
//nonNilArray(optionalArray: [1, 2, nil, 3, 4, nil, 5])
//
//なお、配列型には compactMap というメソッドが用意されており、 これと同じ動作をします。
