
# Dir.glob�̈���
# '*'   �t�H���_���܂߂܂��B
# '*.*' �t�@�C�������ɂȂ�悤�ł��B
fns = Dir.glob('*.*')
fns_ext = fns.map{File.extname(_1)}.tally
p fns, fns.size
p fns_ext
################################

