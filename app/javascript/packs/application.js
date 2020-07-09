// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("packs/main")
require("packs/ajax")
require("jquery")

require("packs/plugins")
require("packs/vendor/bootstrap")
require("packs/vendor/bootstrap.min")
require("packs/vendor/npm")
require("packs/vendor/modernizr-2.8.3-respond-1.4.2.min")
require("packs/vendor/jquery-1.11.2.min")

const images = require.context('../images', true)

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

window.jQuery = window.$ = require('jquery')

var Turbolinks = require("turbolinks");
Turbolinks.start();

import I18n from 'i18n-js'
window.I18n = I18n

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
