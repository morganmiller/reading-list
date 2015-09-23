$(document).ready(function(){
  createLink();
  appendLink();
  changeLinkStatus();
});

function createLink() {
  $("#create-link").on('click', function(e) {
    e.preventDefault();
    var linkParams = {
      url: $('#link-url').val()
    };

    $.post('/links', {link: linkParams}).success(function(link) {
      appendLink(link);
    });
  });
}

function appendLink(link) {
  $('.unread-links').append(link)
}

function appendReadLink(link) {
  $('.read-links').append(link)
}

function changeLinkStatus() {
  $('.links').on('click', '.change-status', function(e) {
    e.preventDefault();
    var clickedText = $(e.target).text();
    var linkId = $(this).closest('.link').data().id;
    var linkLi = $(this).closest('.link');

    $.ajax({
      method: "PUT",
      url: "/links/" + linkId,
      data: {id: linkId}
    }).success(function(link) {
      linkLi.remove();
      if(clickedText == "Mark read") {
        appendReadLink(link);
      } else {
        appendLink(link);
      }
    });
  });
}
