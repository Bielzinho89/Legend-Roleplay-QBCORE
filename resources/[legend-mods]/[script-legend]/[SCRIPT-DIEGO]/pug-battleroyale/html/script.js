var CreatorActive = false;
var royaleActive = false;

$(document).ready(function(){
    window.addEventListener('message', function(event){
        var data = event.data;

        if (data.action == "Update") {
            UpdateUI(data.type, data);
        } 
		if (data.action == "Draw") {
			DrawText(data.type, data);
		}
		if (data.action == "empty") {
			DrawReload(data.type, data);
		}
    });
});

function DrawReload(type, data) {
    if (type == "reload") {
        if (data.active) {
			$(".blackbg2").show()
			// $(".drawtext").show()
			$("#royale-text2").html(data.data.txt);
			$("#royale-char2").html(data.data.char);
        } else {
            royaleActive = false;
            // $(".drawtext").fadeOut(300);
            $(".blackbg2").fadeOut(100);
        }
    }
}

function DrawText(type, data) {
    if (type == "text") {
        if (data.active) {
			$(".blackbg").show()
			// $(".drawtext").show()
			$("#royale-text").html(data.data.txt);
			$("#royale-char").html(data.data.char);
        } else {
            royaleActive = false;
            // $(".drawtext").fadeOut(300);
            $(".blackbg").fadeOut(100);
        }
    }
}

function UpdateUI(type, data) {
    if (type == "royale") {
        if (data.active) {
            if (data.data.shrink) {
                royaleActive = true;
                $(".background").show()
                // $(".background2").show()
                $(".royale").show()
                $("#royale-position").html(data.data.ppllft + '/' + data.data.players + ' ALIVE' );
                $("#royale-points").html(data.data.myills);
                $("#royale-time").html('\u2614' + ' ' + data.data.time);
                $("#royale-skull").html("\u2620");
            } else {
                $(".background").show()
                // $(".background2").show()
                $(".royale").show()
                $("#royale-position").html(data.data.ppllft + '/' + data.data.players + ' ALIVE' );
                $("#royale-points").html(data.data.myills);
                $("#royale-time").html('\u2600 ' + ' ' + data.data.time);
                $("#royale-skull").html("\u2620");
            }
        } else {
			if (data.data.shrink == "gulag") {
                $(".background").fadeOut(300);
                // $(".background2").show()
                $(".royale").show()
                $("#royale-position").html(' ');
                $("#royale-points").html(' ');
                $("#royale-time").html(data.data.time);
                $("#royale-skull").html(" ");
			} else {
				royaleActive = false;
				$(".royale").fadeOut(300);
				$(".background").fadeOut(300);
			}
        }
    }
}