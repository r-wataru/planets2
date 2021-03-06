users = [
  [1,"尾城直晃","1970-01-09","５０メートル６秒フラットのアクションスター"],
  [2,"南幅　啓史","1984-02-10",""],
  [4,"中橋　創太","1983-09-05","2本打って、俺がキングになる！"],
  [5,
    "磯部　俊晴",
    "1980-07-15",
    "やせる。

うお坐では、
しゃぶしゃぶ野菜多めをベースに、序盤で串カツを倒しておき、全体を通しては寿司を攻めていく取り組み方が良いでしょう。
中盤から後半にかけてつらくなる時間帯には、鍋にうどんや餃子を投入して気分を変えることが効果的です。麺ならスルスルと入っていきます。
デザートについては個人差があるので、各自が自分の戦い方ができれば問題ないと思います。最初からコンスタントに食べ続けるもよし、ポイントポイントで気分転換に投入するもよしです。ただし、甘味をとると満腹になってしまう人は終盤までデザートの投入は控えるべきです。"],
  [6,"澤田　優樹","1984-10-17",""],
  [7,"森　岳彦","1984-12-05","あのフェンスを越してやる！"],
  [8,"仙田　勝雄","1963-05-18","引退間近ですが、生涯現役めざし頑張ります。"],
  [9,"青野","1989-05-13","背番号の9は苦しいの9てばなく小久保の9です"],
  [10,"丸　隆宏","1980-05-24",""],
  [15,"一蝶",nil,""],
  [18,"斉藤",nil,""],
  [22,"球児","1986-08-07","来年、俺は帰ってくる　22"],
  [24,"西山","1986-03-31",""],
  [26,
    "羽生当宏",
    "1983-02-04",
    "８才の頃からサッカーに親しんできた私が、最初のグローブを手にしたのは、２６才のときでした。
自分のグローブを持つなんていうのは夢でした。だから、グローブを貰ったときは、本当に嬉しかった。
真新しいグローブを履いてみると、自分に不可能なプレーはないように思われました。
私にとってグローブは、魔法の手袋だったのです。

今なお、グローブを野球の心と思い、感謝の気持ちで磨くことに変わりはありません。
そして、初めてグローブを貰ったときの、あの感動を忘れることは出来ません。

私は戻ってきます！！
    "],
  [27,"小宮山",nil,""],
  [29,"佐藤","1984-08-29","２９食系１番！"],
  [77,
    "伊央里ア・シュヘンベルグ",
    "1985-09-19",
    "今期の目標は
４打数４安打
全部バントヒット"],
  [85,"小宮山　大樹","1990-06-02",""]]

users.each_with_index do |user, i|
  if user[2].nil?
    User.create(
      number: user[0],
      display_name: user[1],
      description: user[3]
    )
  else
    User.create(
      number: user[0],
      display_name: user[1],
      birthday: user[2],
      description: user[3]
    )
  end
end