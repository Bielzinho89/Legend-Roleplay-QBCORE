$(function () {
    function display(bool) {
        if (bool) {
            $("#container").slideDown(400);
            $("#info").fadeIn(500)
            $("#done").hide()                   
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post(`https://bb-reports/exit`, JSON.stringify({}));
            return
        }
    };
    $("#start").click(function () {
        
       $("#startscreen").fadeOut(400)
       $("#info").fadeIn(500)
       $("#warn").hide()

       document.getElementById('firstname').value = ''
       document.getElementById('lastname').value = ''
       document.getElementById('age').value = ''
       document.getElementById('why').value = ''

    })


    var first = document.getElementById('firstname')
    var last = document.getElementById('lastname')
    var age = document.getElementById('age')
    var why = document.getElementById('why')


        $("#sumbits").click(function() {
                if($(first , last , age , why ).val() === '') {
                    $("#warn").fadeIn(400)
                    return
                    
                } else{
       
          
              
            
                $("#warn").fadeOut(400)
                $("#info").fadeOut(400)
                $("#container").hide();
                $.post(
                    `https://bb-reports/name`,
                  JSON.stringify({
                    plate: $("#firstname").val(),     
                    lastname: $("#lastname").val(),
                    age: $("#age").val(),
                    why: $("#why").val(),
                  })
                );
            }
        
    })

    $(".exit").click(function() {

        $("#container").slideUp();
        setTimeout(function(){
            $.post(`https://bb-reports/exit`, JSON.stringify({}));

        },400);


        return
    })

})
