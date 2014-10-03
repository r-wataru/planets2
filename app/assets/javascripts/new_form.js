$(document).ready(function() {
  $("#user_new_user_name").click(function() {
    if ($("label[for='user_new_user_name']").length > 0) {
      if ($(this).is(':checked')) {
        $("#user_login_name").attr("disabled", false);
        $("#user_display_name").attr("disabled", false);
        $("#user_password").attr("disabled", false);
        $("#user_password_confirmation").attr("disabled", false);
      } else {
        $("#user_login_name").attr("disabled", true);
        $("#user_display_name").attr("disabled", true);
        $("#user_password").attr("disabled", true);
        $("#user_password_confirmation").attr("disabled", true);
      }
    }
  });

  if ($("label[for='user_new_user_name']").length > 0) {
    if ($("#user_new_user_name").is(':checked')) {
      $("#user_login_name").attr("disabled", false);
      $("#user_display_name").attr("disabled", false);
      $("#user_password").attr("disabled", false);
      $("#user_password_confirmation").attr("disabled", false);
    } else {
      $("#user_login_name").attr("disabled", true);
      $("#user_display_name").attr("disabled", true);
      $("#user_password").attr("disabled", true);
      $("#user_password_confirmation").attr("disabled", true);
    }
  }
});