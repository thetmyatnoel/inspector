

function updateBadgeNumbers() {
   /* const ingCount = document.querySelectorAll('.ingListDiv .card').length;
    const waitCount = document.querySelectorAll('.waitListDiv .card').length;
    const endCount = document.querySelectorAll('.endListDiv .card').length;

    document.getElementById('badge-ing').textContent = ingCount;
    document.getElementById('badge-wait').textContent = waitCount;
    document.getElementById('badge-end').textContent = endCount;*/
    $("#ingCountLabel").html($(".ingListDiv .transparent .card").length);
   $("#waitCountLabel").html($(".waitListDiv .transparent .card").length);
    $("#endCountLabel").html($(".endListDiv .transparent .card").length);

}

document.addEventListener('DOMContentLoaded', function() {
    // Call the function on page load
    updateBadgeNumbers();
});

$( document ).ready(function() {
    let selectedCard;
    $(function() {
        let $tabButtonItem = $('#tab-button li'),
            $tabSelect = $('#tab-select'),
            $tabContents = $('.tab-contents'),
            activeClass = 'is-active';

        $tabButtonItem.first().addClass(activeClass);
        $tabContents.not(':first').hide();

        $tabButtonItem.find('a').on('click', function(e) {
            let target = $(this).attr('href');

            $tabButtonItem.removeClass(activeClass);
            $(this).parent().addClass(activeClass);
            $tabSelect.val(target);
            $tabContents.hide();
            $(target).show();
            e.preventDefault();
        });

        $tabSelect.on('change', function() {
            let target = $(this).val(),
                targetSelectNum = $(this).prop('selectedIndex');

            $tabButtonItem.removeClass(activeClass);
            $tabButtonItem.eq(targetSelectNum).addClass(activeClass);
            $tabContents.hide();
            $(target).show();
        });


        $('.waitListDiv').click(function() {
            // Fetch data attributes
            var apartName = $(this).data('apart-name');
            var address = $(this).data('address');
            var area = $(this).data('area');
            var customerName = $(this).data('customer-name');
            var cusPhone = $(this).data('cus-phone');
            var username = $(this).data('username');

            // Populate modal
            $('#modalApartName').text(apartName);
            $('#modalAddress').text(address);
            $('#modalArea').text(area);
            $('#modalCustomerName').val(customerName);
            $('#modalCusPhone').val(cusPhone);
            $('#modalUsername').val(username);
        });
        // Move card from '대기' to '진행중'
        $('.stretch-card.transparent').click(function() {
            selectedCard = $(this); // Store the whole card element
            console.log("Card selected:", selectedCard);
        });

        // Move card to '진행중' section
        $('#addModal-ing-btn').click(function() {
            if (selectedCard) {
                $('.ingListDiv').append(selectedCard);
                selectedCard = null; // Reset the selected card
                updateBadgeNumbers();
              //  let waitHtml = $("#ladonListDiv").html();


            }

        });

        // Move card to '완료' section from '대기'
        $('#addModal-end-btn').click(function() {
            if (selectedCard) {
                $('.endListDiv').append(selectedCard);
                selectedCard = null; // Reset the selected card
                updateBadgeNumbers();
            }
        });

        // Move card to '완료' section from '진행중'
        $('#progressModal-end-btn').click(function() {
            if (selectedCard) {
                $('.endListDiv').append(selectedCard);
                selectedCard = null; // Reset the selected card
                updateBadgeNumbers();
            }
        });


        $('#bathText').closest('.form-group').hide();

        // Event listener for changes in bathOption radio buttons
        $("input[name='bathOption']").change(function() {
            if ($("input[name='bathOption']:checked").val() === "하자") {
                $('#bathText').closest('.form-group').show();
            } else {
                $('#bathText').closest('.form-group').hide();
            }
        });


    });
});

$("#addLadonSaveBtn").click(function () {
    let getRoomName = $("#ladonRoomName").val();
    let getPclValue = $("#ladonPciInput").val();

    common_addDefaultListDiv("#ladonListDiv",getRoomName,getPclValue,"PCI/L");
});

$("#addFormaldehydeSaveBtn").click(function () {
    let getRoomName = $("#formaldehydeRoomName").val();
    let getPpmValue = $("#formaldehydePpmInput").val();

    common_addDefaultListDiv("#formaldehydeListDiv",getRoomName,getPpmValue,"PPM");
});

$("#addCameraSaveBtn").click(function () {
    let getRoomName = $("#cameraRoomName").val();
    let getCameraValue = $("input[name='cameraOption']:checked").val();

    addCameraToList("#cameraListDiv",getRoomName,getCameraValue);
});

$("#addPipeSaveBtn").click(function () {
    let getRoomName = $("#pipeRoomName").val();
    let getPipeValue = $("input[name='pipeOption']:checked").val();

    addCameraToList("#pipeListDiv",getRoomName,getPipeValue);
});


$("#addBathSaveBtn").click(function () {
    let getRoomName = $("#bathRoomName").val();
    let getBathValue = $("input[name='bathOption']:checked").val();
    let getbathText = $("#bathText").val();

    addBathToList("#bathListDiv",getRoomName,getBathValue,getbathText);
});

$("#addFinalSaveBtn").click(function () {
    let getRoomName = $("#finalRoomName").val();
    let getGonzoneValue = $("#gonzoneInput").val();
    let getSelbuValue = $("#selbuInput").val();
    let getHazaValue = $("#hazaInput").val();
    let getBgoValue = $("#bgoInput").val();


    addFinalToList("#finalListDiv",getRoomName,getGonzoneValue,getSelbuValue,getHazaValue,getBgoValue);
});


function common_addDefaultListDiv(div, room, value, value_unit){
    let html = [];

    html.push(
        ` <div class="col-6 individual-list-item">
        <div class="card card-inverse-info">
            <div class="card-header mb-0 d-flex justify-content-between">
                <h5 class="card-title mb-0 ">${room}</h5>
                <button class="close x_badge" aria-label="Close">&times;</button>
            </div>
            <div class="card-body">${value} <small>${value_unit}</small></div>
        </div></div>
      `
    );
    $(div).append(html.join(''));
}
function addCameraToList(div, roomName, cameraOption) {
    let html = [];

    html.push(
        `<div class="col-6 individual-list-item">
            <div class="card card-inverse-info">
                <div class="card-header mb-0 d-flex justify-content-between">
                    <h5 class="card-title">${roomName}</h5>
                    <button class="close x_badge ml-1 p-1" aria-label="Close">&times;</button>
                </div>
                <div class="card-body"><i class="ti-check-box"></i>${cameraOption}</div>
            </div>
         </div>`
    );

    $(div).append(html.join(''));
}
function addBathToList(div, roomName, bathOption, bathText) {
    let html = `<div class="col-6 individual-list-item">
        <div class="card card-inverse-info">
            <div class="card-header mb-0 d-flex justify-content-between">
                <h5 class="card-title mb-0">${roomName}</h5>
                <button class="close x_badge" aria-label="Close">&times;</button>
            </div>
            <div class="card-body"><i class="ti-check-box"></i>${bathOption}</div>`;

    if (bathOption === "하자") {
        html += `<div class="card-body"><i class="ti-write"></i>${bathText}</div>`;
    }

    html += `</div></div>`;

    $(div).append(html);
}
function addFinalToList(div, roomName, gonZone,selBu,haZa,bGo) {
    let html = [];

    html.push(
        `<div class="col-6 individual-list-item">
            <div class="card card-inverse-info">
                <div class="card-header mb-0">
                    <h5 class="card-title mb-0">${roomName}</h5>
                    <button class="close x_badge" aria-label="Close">&times;</button>
                </div>
                <div class="card-body"><i class="ti-info"></i>${gonZone}</div>
                <div class="card-body"><i class="ti-info"></i>${selBu}</div>
                <div class="card-body"><i class="ti-info"></i>${haZa}</div>
                <div class="card-body"><i class="ti-info"></i>${bGo}</div>
            </div>
         </div>`
    );

    $(div).append(html.join(''));
}

$(document).on('click', '.x_badge', function() {
    $(this).closest('.individual-list-item').remove();
});


