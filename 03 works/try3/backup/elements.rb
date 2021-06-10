
# class Receiverは値を保持するためのものです。
# メソッドのレシーバになるものです。
# クラスにて値を保持します。
# in fileとapfにより既定の値と
# 作業用の変数としても使用します。
# 作業用の変数のみを使用して出力することはできません。do関係のメソッドの引数に指定して、apf情報を持つレシーバを利用してください。
class Receiver
  attr_accessor :key, :value, :base, :on_change, :position
end

[:position][:x]    = arg[0].to_i
[:position][:size] = arg[1].to_i
[:position][:cn]   = arg[2].to_i

# load(apf)
# apf = load_apf








