$("#upload_file").change(function () {

  var url = $(this).attr("data-import-url")
  var data = new FormData();
  $.each($("#upload_file")[0].files, function(i, file) {
    data.append("file", file);
  });
  data.append("csrfmiddlewaretoken", $(this).attr("data-csrf-token"));

  $.ajax({
    url: url,
    data: data,
    cache: false,
    contentType: false,
    processData: false,
    type: 'post',
    beforeSend: function () {
      // before send, display loading, etc...
    },
    success: function (data) {
      // success handling...
    },
    error: function () {
      // error handling...
    }
  });

});