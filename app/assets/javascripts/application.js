// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery_ujs
//= require popper
//= require bootstrap
//= require dataTables/jquery.dataTables
//= require_tree .

document.addEventListener('DOMContentLoaded', () => {
  const navbarPopover = document.getElementById("navbar-popover");

  const modalElement = document.getElementById("user-registration-modal");
  const modalTitle = modalElement.querySelector(".modal-header h3");
  const form = modalElement.querySelector("form");

  const emailField = form.querySelector("input[name='user[email]']");
  const lastNameField = form.querySelector("input[name='user[last_name]']");
  const firstNameField = form.querySelector("input[name='user[first_name]']");
  const role = form.querySelector("select[name='user[role_id]']");

  modalElement.addEventListener("show.bs.modal", function (event) {
    const button = event.relatedTarget;
    const action = button.getAttribute("data-action");

    if (action === "edit") {
      // Change modal title and set form action for editing
      modalTitle.textContent = "Edit User Details";
      form.action = `/users/update/${button.getAttribute("data-role-id")}`; // Update URL for editing
      form.method = "patch"; // Use PATCH for editing

      // Populate fields with current values
      emailField.value = button.getAttribute("data-email");
      lastNameField.value = button.getAttribute("data-last-name");
      firstNameField.value = button.getAttribute("data-first-name");
      role.value = (button.getAttribute("data-role-id")).toString();
    }
  });

  function togglePopoverVisibility(event) {
      event.preventDefault();
      const popoverVisibility = window.getComputedStyle(navbarPopover).visibility;
      console.log(popoverVisibility);
      (popoverVisibility != "visible") ? navbarPopover.style.visibility = "visible": navbarPopover.style.visibility = "hidden";
  }
  
  document.querySelector('[data-action="open-navbar-popover"]').addEventListener('click', togglePopoverVisibility);
});