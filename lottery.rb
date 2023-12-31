#memberに対象者を格納index0は使いたくないので、"無効"を定義しておく
#"無効"以外ならどこを変更しても、追加しても対応できる
member = ["無効", "上窪田", "鬼海", "山本", "吉田"]
  #使用者がわかりやすいようにアナウンス(読みやすいよう間をあけながら)
  puts "こんにちは♪ 私は司会者抽選プログラムです！"
  sleep(1)
  puts "公明正大に司会者を抽選するお手伝いをします。"
  sleep(1)
  puts "指示にしたがって、番号を入力してください。"
  sleep(1)
#無限ループ開始
while true
  sleep(1)
  #１回目のループ時(フラグoff)のみ表示
  puts "本日お休みの受講者はいますか？" if @loop_flag.nil?
  #2回目のループ時（フラグON）時から表示
  puts "他にお休みの受講者はいますか？" if @loop_flag
  puts "1:はい 2:いいえ"
  #休みがいるかどうかの選択を取得
  number = gets.to_i
  #１を選択した場合の処理
  if number == 1
    #休みがいた場合はどうするのかを出力
	  puts "お休みの受講者を、番号で教えてください"
    sleep(1)
    #一度に複数押さないように、また、複数いた場合混乱しないように案内を添える
    puts "１人ずつ除外します。複数いる場合は処理を繰り返してください"
    sleep(1)
      #index番号と名前を要素数の分だけ繰り返しながらリスト表示"無効"は非表示にする
	    member.each_with_index do |name, i|
      next if name == "無効"
	    puts "#{i}:#{name}"
      end
      puts "休み選択で間違えた場合は、選択番号以外を入力すれば最初の選択に戻ります"
    #対象のindex番号を指定して取得
    index = gets.to_i
    #１回目のループが終了フラグをつくる
    @loop_flag = true
      #選択した番号が、現在の要素数内かどうかの判定
      #0は無効なので含ないように、1から始めるため、現在の要素数（...で終端含めず）の範囲を対象とする
    if (1...member.length).include?(index)
      #index番号で除外者を表記
      puts "抽選から#{member[index]}さんを除外します"
      #指定したindex番号の要素を削除する
      member.delete_at(index)
    else
      #除外対象者選択時の無効入力時の出力
      puts "無効な入力値です。最初の選択に戻ります"
    end
  #2を選択した場合の処理(休みの対象者がいない状態までループし続けるため最終的にここに行き着く)
  elsif number == 2
    #このままだと抽選に"無効"が混じってしまうため、さんざん利用した挙句削除する。
    member.delete_at(0)
      #現在出席者が除外されていないか確認のためにリストを再表示、指定する必要はないため名前のみ
      member.each do |name|
      puts "#{name}"
      end
    #ドラムロール
    puts "以上のメンバーから抽選します。だらららららららららららら..."
    #1秒待機
    sleep(1)
    puts "...だだん！"
    #もったいつけてさらに1秒待機
    sleep(1)
    #現在配列に乗ったmemberからsampleメソッドでランダムに１人を取得して出力
    puts "おめでとうございます！本日の司会者は#{member.sample}さんです！よろしくお願いします♪"
	  break
  else
    #休みがいるかいないか選択時の無効入力時の出力
	  puts "無効な入力値です。最初の選択に戻ります"
 end
end
