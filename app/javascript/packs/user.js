var $ = require("jquery");
var graphql = require("graphql.js");

$(document).ready(function () {
  var graph = graphql("/graphql", {
    method: "POST",
    headers: {
      "X-CSRF-Token": $('meta[name="csrf-token"]').attr("content"),
    },
  });

  function getUser() {
    return graph(`query ($login: String!) {
      user(login: $login) {
        login
        name
        repos {
          name
          svnUrl
        }
      }
    }`);
  }

  $("#search-button").on("click", function (e) {
    const login = $("#login-input").val();

    getUser()({
      login: login,
      partial: "welcome/results.html.erb",
    }).then(({ response }) => $("#results").html(response));
  });
});
