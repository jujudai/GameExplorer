// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import Raty from "./raty.js"         // 同じ階層にあるraty.jsをRatyという名前でインポート

Rails.start()
// Turbolinks.start()
ActiveStorage.start()

// ratyアクションの定義
window.raty = function(elem,opt){ 
    var raty =  new Raty(elem,opt)
    raty.init();
    return raty;
}