
# class Receiverは値を保持するためのものです。
# メソッドのレシーバになるものです。
# クラスにて値を保持します。
# in fileとapfにより既定の値と
# 作業用の変数としても使用します。
# 作業用の変数のみを使用して出力することはできません。do関係のメソッドの引数に指定して、apf情報を持つレシーバを利用してください。
class Receiver
  attr_accessor :key, :value, :base, :on_change
end

# load(apf)
# apf = load_apf








