
$(function() {
  function buildHTML(todo) {
    // 以下はセレクタの中身を新規に作るという意味
    var html = $('<li class="todo">').append(todo.content);
    return html;
  }
  // submitイベントを使い、フォーム(js-form)が送信された時に処理が実行されるようにイベントを設定。
  $('.js-form').on('submit', function(e){
    e.preventDefault();   //フォームが送信されたときに、デフォルトだとフォームを送信するための通信がされてしまうので、preventDefault()を使用してデフォルトのイベントを止めます。
    var textField = $('.js-form__text-field'); //class js-form__text-fieldを代入
    var todo = textField.val(); //js-form__text-fieldのフォームに入力された値を取得し、todoに代入
    // $.ajax関数は、戻り値としてXMLHttpRequestオブジェクトを返します。
    // ここでサーバーに対して通信を行う。情報の指定(ここではdataに格納)、送信先、データの型(json)等を記述
    $.ajax({
      type: 'POST',
      url: '/todos.json',
      data:{
        todo: {
          content: todo
        }
      },
      dataType: 'json' //データをjson形式で飛ばす。
    })
    // ↓フォームの送信に成功した場合の処理
    .done(function(data) {
      var html = buildHTML(data);
      $('.todos').append(html); //$.append関数は操作後はDOMに要素が追加された状態になる。
      // todosクラスに引数で指定したdataのHTML要素を追加。
      textField.var('');
    })
    // ↓フォームの送信に失敗した場合の処理
    .fail(function() {
      alert('error');
    });
  });
});

