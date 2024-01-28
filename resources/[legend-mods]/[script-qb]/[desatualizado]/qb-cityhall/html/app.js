var qbCityhall = {}
var mouseOver = false;
var selectedIdentity = null;
var selectedIdentityType = null;
var selectedJob = null;
var selectedJobId = null;

qbCityhall.Open = function(data) {
    qbCityhall.fillCharInfo(data);
    $(".container").fadeIn(150);
}

qbCityhall.Close = function() {
    $(".container").fadeOut(150, function(){
        qbCityhall.ResetPages();
    });
    $.post('https://qb-cityhall/close');

    qbCityhall.ResetJobInfo()
}

qbCityhall.ResetPages = function() {
    $(".cityhall-main-options").show();
    $(".cityhall-identity-page").hide();
    $(".cityhall-job-page").hide();
}

qbCityhall.ResetJobInfo = function() {
    $(selectedJob).removeClass("job-selected");
    $(selectedIdentity).removeClass("job-selected");
    $(".request-identity-button").fadeOut(100);
    $(".job-details-info").fadeOut(100);
    $(".job-actions-buttons").fadeOut(100);

    selectedJob = null;
    selectedIdentity = null;
}

qbCityhall.fillCharInfo = function (data) {
    var gender = "Male"
    if (data.char.gender == 0) 
        gender = "Male"
    else
        gender = "Female"

    var elem = '<div class="char-info-title"><span>Character Information</span></div>' +
        '<div class="char-info-box"><span id="info-label">Name: </span><span class="char-info-js">'+ data.char.name + '</span></div>' + 
        '<div class="char-info-box"><span id="info-label">Birth date: </span><span class="char-info-js">'+ data.char.birth +'</span></div>' +
        '<div class="char-info-box"><span id="info-label">Gender: </span><span class="char-info-js">'+ gender +'</span></div>' +
        '<div class="char-info-box"><span id="info-label">Nationality: </span><span class="char-info-js">'+ data.char.nationality +'</span></div>' +
        '<div class="char-info-box"><span id="info-label">Current Job: </span><span class="char-info-js">'+ data.char.currentJob +'</span></div>' +
        '<div class="char-info-box"><span id="info-label">Phone number: </span><span class="char-info-js">'+ data.char.phoneNumber +'</span></div>' +
        '<div class="char-info-box"><span id="info-label">Account number: </span><span class="char-info-js">'+ data.char.accountNumber +'</span></div>';
    
    $( ".cityhall-personal-info" ).html(elem);
}

qbCityhall.SetupJobInfo = function (data) {
    var elem = '<div class="job-info-title"><span>'+ data.job.title +'</span></div>' +
        '<div class="job-info-box"><span id="info-label">Salary: </span><span class="job-info-js">$'+ data.job.salary +'</span></div>' + 
        '<div class="job-info-box"><span id="info-label">Description: </span><span class="job-info-js">'+ data.job.description +'</span></div>    ';

    $( ".job-details-info" ).html(elem);
}

$(document).ready(function(){
    window.addEventListener('message', function(event) {
        switch(event.data.action) {
            case "open":
                qbCityhall.Open(event.data);
                break;
            case "close":
                qbCityhall.Close();
                break;
            case "setupJobInfo":
                qbCityhall.SetupJobInfo(event.data);
                break;
        }
    })
});

$(document).on('keydown', function() {
    switch(event.keyCode) {
        case 27: // ESC
            qbCityhall.Close();
            break;
    }
});

$('.cityhall-option-block').click(function(e){
    e.preventDefault();

    var blockPage = $(this).data('page');

    $(".cityhall-main-options").fadeOut(100, function(){
        $(".cityhall-"+blockPage+"-page").fadeIn(100);
    });

    if (blockPage == "identity") {
        $(".identity-page-blocks").html("");
        $(".identity-page-blocks").html(
            '<div class="identity-page-block" data-type="id_card">'+
                '<div class="identity-license-image">'+
                    '<img src="images/id_card.png" alt="id_card">'+
                '</div>'+
                '<div class="identity-license-info">'+
                    '<div class="license-title-box"><span id="info-label">ID Card</span></div>'+
                    '<div class="license-info-box"><span id="info-label">Request new ID Card</span></div>'+
                '</div>'+
            '</div>');

        $.post('https://qb-cityhall/requestLicenses', JSON.stringify({}), function(licenses){
            $.each(licenses, function(i, license){
                var elem = '<div class="identity-page-block" data-type="'+license.idType+'">'+
                                '<div class="identity-license-image">'+
                                    '<img src="images/'+license.idType+'.png" alt="id_card">'+
                                '</div>'+
                                '<div class="identity-license-info">'+
                                    '<div class="license-title-box"><span id="info-label">'+license.label+'</span></div>'+
                                    '<div class="license-info-box"><span id="info-label">Request new '+license.label+'</span></div>'+
                                '</div>'+
                            '</div>';

                $(".identity-page-blocks").append(elem);
            });
        });
    }
});

$(document).on("click", ".identity-page-block", function(e){
    e.preventDefault();

    var idType = $(this).data('type');

    selectedIdentityType = idType;

    if (selectedIdentity == null) {
        $(this).addClass("identity-selected");
        // $(".hover-description").fadeIn(10);
        selectedIdentity = this;
        if (idType == "id_card") {
            $(".request-identity-button").fadeIn(100);
            $(".request-identity-button").html("<p>Buy $50</p>")
        } else if (idType == "driver_license") {
            $(".request-identity-button").fadeIn(100);
            $(".request-identity-button").html("<p>Buy $50</p>")
        } else if (idType == "weaponlicense") {
            $(".request-identity-button").fadeIn(100);
            $(".request-identity-button").html("<p>Buy $50</p>")
        }
    } else if (selectedIdentity == this) {
        $(this).removeClass("identity-selected");
        selectedIdentity = null;
        $(".request-identity-button").fadeOut(100);
    } else {
        $(selectedIdentity).removeClass("identity-selected");
        $(this).addClass("identity-selected");
        selectedIdentity = this;
        if (idType == "id_card") {
            $(".request-identity-button").html("<p>Buy $50</p>")
        } else if (idType == "driver_license") {
            $(".request-identity-button").html("<p>Buy $50</p>")
        } else if (idType == "weaponlicense") {
            $(".request-identity-button").html("<p>Buy $50</p>")
        }
    }
});

$(".request-identity-button").click(function(e){
    e.preventDefault();

    $.post('https://qb-cityhall/requestId', JSON.stringify({
        idType: selectedIdentityType
    }))

    qbCityhall.ResetPages();
});

$(document).on("click", ".job-page-block", function(e){
    e.preventDefault();

    var job = $(this).data('job');

    selectedJobId = job;

    if (selectedJob == null) {
        $(this).addClass("job-selected");
        selectedJob = this;
        $.post('https://qb-cityhall/setJobInfo', JSON.stringify({ job: selectedJobId }))
        $(".job-details-info").fadeIn(100);
        $(".job-actions-buttons").fadeIn(100);
    } else if (selectedJob == this) {
        $(this).removeClass("job-selected");
        selectedJob = null;
        $(".job-details-info").fadeOut(100);
        $(".job-actions-buttons").fadeOut(100);
    } else {
        $(selectedJob).removeClass("job-selected");
        $(this).addClass("job-selected");
        selectedJob = this;
        $.post('https://qb-cityhall/setJobInfo', JSON.stringify({ job: selectedJobId }))
    }
});

$(document).on('click', '.gps-job-button', function(e){
    e.preventDefault();

    $.post('https://qb-cityhall/setGps', JSON.stringify({
        job: selectedJobId
    }))

    qbCityhall.ResetJobInfo();
    qbCityhall.ResetPages();
});

$(document).on('click', '.apply-job-button', function(e){
    e.preventDefault();

    $.post('https://qb-cityhall/applyJob', JSON.stringify({
        job: selectedJobId
    }))

    qbCityhall.ResetJobInfo();
    qbCityhall.ResetPages();
});

$(document).on('click', '.back-to-main', function(e){
    e.preventDefault();

    qbCityhall.ResetJobInfo();  
    qbCityhall.ResetPages();
});
