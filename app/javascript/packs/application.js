// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"


Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import 'jquery'
import 'popper.js'
import "bootstrap"
import "controllers"
import "flatpickr"

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
// import { initSweetalert } from '../plugins/init_sweetalert';
import highlightRow from "../plugins/checklist";

  document.addEventListener('turbolinks:load', () => {
    if(document.querySelector('.case-verification')) {
      highlightRow();
    }

    $('[data-tooltip-display="true"]').tooltip(),
    flatpickr("[class='flatpickr']", {})

  });

