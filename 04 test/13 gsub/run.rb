# coding: cp932

# �ǂ����Regexp.union�Ȃ�z��̕������I��|�ŘA������Regexp�Ƃ��ĕԂ��Ă����悤�Ȃ̂�
# Hash��key��value�ɕϊ�����Ȃ牺�L�̂悤�ɏ�����悤�ł��B
# �����ƃL���C�Ȃ���������悤�ȋC�����܂����B�B

Regexp.union�Ŕz��̕������I��|�ŘA������Regexp�Ƃ��ĕԂ��Ă����悤�Ȃ̂�
Hash���g���āAkey��value�ɒu��������̂Ȃ牺�L�̂悤�ɏ�����悤�ł��B
�����ƃL���C�Ȃ���������悤�ȋC�����܂����B�B


h = {}
h["hoge"] = '��'
h["ruby"] = '��������'
h["�ł�"] = '�Ȃ�܂�!!'
p "hoge��ruby�ł�".gsub(Regexp.union(h.keys), h).encode('utf-8')


