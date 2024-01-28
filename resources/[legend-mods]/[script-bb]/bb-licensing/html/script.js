window.addEventListener('message', (event) => {
  if (event.data.type == "open_lic") {
      $("main").css("display", "block");
      $('input[type="text"]').val('');
    } else  {
      $("main").hide()
  }
});

$(document).keyup((e) => {
  if (e.key === "Escape") {
    $("main").slideUp();
    setTimeout(() => {
            $.post(`https://bb-licensing/exit`, JSON.stringify({}));
    }, 100);
  }
});

$("#submit").click(() => {
  var bname = $("#bname").val();
  var bowner = $("#bowner").val();
  var btype = $("#btype").val();
  var baddress = $("#baddress").val();
  var idate = $("#idate").val();
  var edate = $("#edate").val();
  var iname = $("#iname").val();

  // console.log(GetParentResourceName())
  $.post(`https://bb-licensing/submitform`, JSON.stringify({
    bname : bname,
    bowner : bowner,
    btype: btype,
    baddress : baddress,
    idate : idate,
    edate : edate,
    iname : iname
  }));
  
  $("main").slideUp();
});