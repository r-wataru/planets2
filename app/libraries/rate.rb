class Rate
  def batting_average
    #打率	安打数÷打数　[小数点４位以下四捨五入]
  end

  def base_percentage
    #出塁率	(四死球＋安打)÷(打数＋四死球＋犠飛)　[小数点４位以下四捨五入]
  end

  def number_of_batting
    #打席数	打数＋四死球＋犠打＋犠飛＋妨害出塁
  end

  def total_bases
    #『塁打数＝<単打>×1＋二塁打×2＋三塁打×3＋本塁打×4』
  end

  def slugging_percentage
    #長打率	塁打÷打数　[小数点４位以下四捨五入]
  end

  def winning_rate
    #勝率	勝数÷(勝数＋負数)
  end

  def earned_run_average
    #防御率	自責点×９÷投球回数　[小数点３位以下四捨五入]
  end


  #規定投球回数	試合数×１
  #規定打席数	試合数×３．１　[小数点以下切り捨て]
 end