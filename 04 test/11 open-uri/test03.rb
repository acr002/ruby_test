
require 'open-uri'

url = 'http://rooter.jp'

OpenURI.open_uri(url) do |a|

  # ������ɂ���
  # p a.read

  # �����R�[�h
  p a.charset

  # URI�̎擾
  p a.base_uri

  # �w�b�_�̓��e���擾
  p a.content_encoding

  # �ŏI�X�V�������擾
  p a.last_modified

  # �w�b�_�����n�b�V���Ŏ擾����
  p a.meta
end


