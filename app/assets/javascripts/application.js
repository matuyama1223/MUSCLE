// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .

$(function(){
    var maxNum = 5, // 最大枚数
    // 画像に数字入れて１~
  // ↓ rdm ランダムで引数にしてあげて
    rdm = Math.floor(Math.random() * (maxNum))+1;
  // ⬆︎　rdm----------------------------------------↓ ランダムの数字を持ってくっる
    $('#randomShow').attr('src', 'assets/kinniku'+rdm+'.png');
    // 　　⬆︎定義してあげる　img id="randomShow" で持ってくる
    								// assets_pathにしてあげる
});
// stylesheets/application.scssに＃randomShowで画像の大きさ変更してる
// 画像はjQueryはpublic/images/の中に入れてあげる
$(function(){
    var maxNum = 5, // 最大枚数
    // 画像に数字入れて１~
  // ↓ rdm ランダムで引数にしてあげて
    rdm = Math.floor(Math.random() * (maxNum))+1;
  // ⬆︎　rdm----------------------------------------↓ ランダムの数字を持ってくっる
    $('#randomSho').attr('src', '/images/kinniku'+rdm+'.png');
    // 　　⬆︎定義してあげる　img id="randomShow" で持ってくる
});


