import 'jquery';
import 'bootstrap';

import Modal from "./modal"
Modal.start();

import "./vendor/rails";
import "./vendor/stimulus";
import "./vendor/turbolinks";

document.addEventListener("turbolinks:load", function() {
  $('#content > form :input:visible:first').focus();
  $('[data-toggle="tooltip"]').tooltip();
});
