
$(function() {
  function buildHTML(todo) {
    //�ȉ��̓Z���N�^�̒��g��V�K�ɍ��Ƃ����Ӗ�
    var html = $('<li class="todo">').append(todo.content);
    return html;
  }
//submit�C�x���g���g���A�t�H�[���ijs-from�j�����M���ꂽ���ɏ��������s�����悤�ɃC�x���g��ݒ�B
  $('.js-form').on('submit', function(e) {
    e.preventDefault(); //�t�H�[�������M���ꂽ���ɁA�f�t�H���g���ƃt�H�[���𑗐M���邽�߂̒ʐM������Ă��܂��̂ŁApreventDefault()���g�p���ăf�t�H���g�̃C�x���g���~�߂܂��B
    var textField = $('.js-form__text-field'); //class js-form__text-field����
    var todo = textField.val(); //js-form__text-field�̃t�H�[���ɓ��͂��ꂽ�l���擾���Atodo�ɑ��
    //$.ajax�֐��́A�߂�l�Ƃ��� XMLHttpRequest�I�u�W�F�N�g��Ԃ��܂��B
    //�����ŃT�[�o�[�ɑ΂��Ă̒ʐM���s���B���̎w��i�����ł�data�Ɋi�[�j�A���M��A�f�[�^�̌^�iJson�j�����L�q
    $.ajax({
      type: 'POST',
      url: '/todos.json',
      data: {
        todo: {
          content: todo
        }
      },
      dataType: 'json' //�f�[�^��json�`���Ŕ�΂�
    })
    //���t�H�[���̑��M�ɐ��������ꍇ�̏���
    .done(function(data) {
      var html = buildHTML(data);
      $('.todos').append(html); //$.append�֐��͑�����DOM�ɗv�f���ǉ����ꂽ��ԂɂȂ�B
�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@//todos�N���X�Ɉ����Ŏw�肵��data��HTML�v�f��ǉ��B

      textField.val(''); //
    })
    //���t�H�[���̑��M�Ɏ��s�����ꍇ�̏���
    .fail(function() {
      alert('error');
    });
  });
});

