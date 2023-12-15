

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
        $('.ingListDiv').click(function() {
            // Fetch data attributes
            var apartId = $(this).data('apart-id');
            var apartName = $(this).data('apart-name');
            var address = $(this).data('address');
            var area = $(this).data('area');
            var customerName = $(this).data('customer-name');
            var cusPhone = $(this).data('cus-phone');
            var username = $(this).data('username');

            // Populate modal
            $('#progressModalApartId').text(apartId);
            $('#progressModalApartName').text(apartName);
            $('#progressModalAddress').text(address);
            $('#progressModalArea').text(area);
            $('#progressModalCustomerName').val(customerName);
            $('#progressModalCusPhone').val(cusPhone);
            $('#progressModalUsername').val(username);
        });

        $('.waitListDiv').click(function() {
            // Fetch data attributes
            var apartId = $(this).data('apart-id');
            var apartName = $(this).data('apart-name');
            var address = $(this).data('address');
            var area = $(this).data('area');
            var customerName = $(this).data('customer-name');
            var cusPhone = $(this).data('cus-phone');
            var username = $(this).data('username');

            // Populate modal
            $('#modalApartId').text(apartId);
            $('#modalApartName').text(apartName);
            $('#modalAddress').text(address);
            $('#modalArea').text(area);
            $('#modalCustomerName').val(customerName);
            $('#modalCusPhone').val(cusPhone);
            $('#modalUsername').val(username);
        });
        $('.endListDiv').click(function() {
            // Fetch data attributes
            var apartId = $(this).data('apart-id');
            var apartName = $(this).data('apart-name');
            var address = $(this).data('address');
            var area = $(this).data('area');
            var customerName = $(this).data('customer-name');
            var cusPhone = $(this).data('cus-phone');
            var username = $(this).data('username');

            // Populate modal
            $('#endModalApartId').text(apartId);
            $('#endModalApartName').text(apartName);
            $('#endModalApartAddress').text(address);
            $('#endModalApartArea').text(area);
            $('#endModalCustomerName').val(customerName);
            $('#endModalCusPhone').val(cusPhone);
            $('#endModalUsername').val(username);
        });

        // Move card from '대기' to '진행중'
        $(".waitListDiv").click(function() {
            selectedCard = $(this);
            console.log("Card selected:", selectedCard);
        });
        $(".ingListDiv").click(function() {
            selectedCard = $(this);
            console.log("Card selected:", selectedCard);
            var apartId = selectedCard.data('apart-id');
            console.log("Apart Id : ",apartId);


        });
        $(".endListDiv").click(function() {
            selectedCard = $(this);
            console.log("Card selected:", selectedCard);
            var apartId = selectedCard.data('apart-id');
            console.log("Apart Id : ",apartId);

        });

        function fetchNonEmptyProgressInspectData(apartId)
        {
            $.ajax(
                {
                    type: 'GET',
                    url: `/data/${apartId}`,
                    dataType: 'json',
                    success: function (data) {
                        console.log(data);

                        data.forEach(function (inspectData){
                            if (inspectData.ladonRoom || inspectData.ladonPcl) {
                                var ladonHtml = '<div class="col-6 individual-list-item">' +
                                    '<div class="card card-inverse-info">' +
                                    '<div class="card-header mb-0 d-flex justify-content-between">' +
                                    '<h5 class="card-title mb-0 ">' + inspectData.ladonRoom + '</h5>' +
                                    '<button class="close x_badge" aria-label="Close">&times;</button>' +
                                    '</div>' +
                                    '<div class="card-body">' + inspectData.ladonPcl + ' <small>PCL</small></div>' +
                                    '</div>' +
                                    '</div>';
                                $("#progressLadonListDiv").append(ladonHtml);
                            }
                            if (inspectData.formalRoom || inspectData.formalPpm
                            ) {
                                var formalHtml = '<div class="col-6 individual-list-item">' +
                                    '<div class="card card-inverse-info">' +
                                    '<div class="card-header mb-0 d-flex justify-content-between">' +
                                    '<h5 class="card-title mb-0 ">' + inspectData.formalRoom + '</h5>' +
                                    '<button class="close x_badge" aria-label="Close">&times;</button>' +
                                    '</div>' +
                                    '<div class="card-body">' + inspectData.formalPpm + ' <small>PPM</small></div>' +
                                    '</div>' +
                                    '</div>';
                                $("#progressFormaldehydeListDiv").append(formalHtml);
                            }
                            if (inspectData.thermalRoom || inspectData.thermalStatus)
                            {
                                var thermalHtml = '<div class="col-6 individual-list-item">' +
                                    '<div class="card card-inverse-info">' +
                                    '<div class="card-header mb-0 d-flex justify-content-between">' +
                                    '<h5 class="card-title">' + inspectData.thermalRoom + '</h5>' +
                                    '<button class="close x_badge ml-1 p-1" aria-label="Close">&times;</button>' +
                                    '</div>' +
                                    '<div class="card-body"><i class="ti-check-box"></i>' + inspectData.thermalStatus + '</div>' +
                                    '</div>' +
                                    '</div>';
                                $("#progressCameraListDiv").append(thermalHtml);
                            }
                            if (inspectData.pipeRoom || inspectData.pipeStatus)
                            {
                                var pipeHtml = '<div class="col-6 individual-list-item">' +
                                    '<div class="card card-inverse-info">' +
                                    '<div class="card-header mb-0 d-flex justify-content-between">' +
                                    '<h5 class="card-title">' + inspectData.pipeRoom + '</h5>' +
                                    '<button class="close x_badge ml-1 p-1" aria-label="Close">&times;</button>' +
                                    '</div>' +
                                    '<div class="card-body"><i class="ti-check-box"></i>' + inspectData.pipeStatus + '</div>' +
                                    '</div>' +
                                    '</div>';
                                $("#progressPipeListDiv").append(pipeHtml);
                            }
                            if (inspectData.bathRoom || inspectData.bathStatus)

                            {
                                let roomName = inspectData.bathRoom
                                let bathOption = inspectData.bathStatus
                                let bathText = inspectData.bathContent
                                var bathHtml = `<div class="col-6 individual-list-item">
                                <div class="card card-inverse-info">
                                    <div class="card-header mb-0 d-flex justify-content-between">
                                        <h5 class="card-title mb-0">${roomName}</h5>
                                        <button class="close x_badge" aria-label="Close">&times;</button>
                                    </div>
                                    <div class="card-body"><i class="ti-check-box"></i>${bathOption}</div>`;

                                if (bathOption === "하자") {
                                    bathHtml += `<div class="card-body"><i class="ti-write"></i>${bathText}</div>`;
                                }

                                bathHtml += '</div></div>';

                                // Append the created HTML to the bathListDiv
                                $("#progressBathListDiv").append(bathHtml);
                            }
                            if (inspectData.finalRoom || inspectData.finalGonzone || inspectData.finalSelbu || inspectData.finalHaza || inspectData.finalBgo)
                            {
                                var finalHtml =`<div class="col-6 individual-list-item">
                                <div class="card card-inverse-info">
                                    <div class="card-header mb-0">
                                        <h5 class="card-title mb-0">${inspectData.roomName}</h5>
                                        <button class="close x_badge" aria-label="Close">&times;</button>
                                    </div>
                                    <div class="card-body"><i class="ti-info"></i>${inspectData.gonZone}</div>
                                    <div class="card-body"><i class="ti-info"></i>${inspectData.selBu}</div>
                                    <div class="card-body"><i class="ti-info"></i>${inspectData.haZa}</div>
                                    <div class="card-body"><i class="ti-info"></i>${inspectData.bGo}</div>`;

                                if (inspectData.image1) {
                                    finalHtml+= `<div class="card-body"><img src="${inspectData.image1}" alt="Image 1" style="max-width:100%;"></div>`;
                                }

                                if (inspectData.image2) {
                                    finalHtml += `<div class="card-body"><img src="${inspectData.image2}" alt="Image 2" style="max-width:100%;"></div>`;
                                }
                                finalHtml += '</div></div>';
                                $("#progressFinalListDiv").append(finalHtml);

                            }

                        })
                    },
                    error: function (error) {
                        console.error('Error fetching data:', error);
                    }
                }
            )
        }
        function fetchNonEmptyCompleteInspectData(apartId)
        {
            $.ajax(
                {
                    type: 'GET',
                    url: `/data/${apartId}`,
                    dataType: 'json',
                    success: function (data) {
                        console.log(data);

                        data.forEach(function (inspectData){
                            if (inspectData.ladonRoom || inspectData.ladonPcl) {
                                var ladonHtml = '<div class="col-6 individual-list-item">' +
                                    '<div class="card card-inverse-info">' +
                                    '<div class="card-header mb-0 d-flex justify-content-between">' +
                                    '<h5 class="card-title mb-0 ">' + inspectData.ladonRoom + '</h5>' +
                                    '<button class="close x_badge" aria-label="Close">&times;</button>' +
                                    '</div>' +
                                    '<div class="card-body">' + inspectData.ladonPcl + ' <small>PCL</small></div>' +
                                    '</div>' +
                                    '</div>';
                                $("#completeLadonListDiv").append(ladonHtml);
                            }
                            if (inspectData.formalRoom || inspectData.formalPpm
                            ) {
                                var formalHtml = '<div class="col-6 individual-list-item">' +
                                    '<div class="card card-inverse-info">' +
                                    '<div class="card-header mb-0 d-flex justify-content-between">' +
                                    '<h5 class="card-title mb-0 ">' + inspectData.formalRoom + '</h5>' +
                                    '<button class="close x_badge" aria-label="Close">&times;</button>' +
                                    '</div>' +
                                    '<div class="card-body">' + inspectData.formalPpm + ' <small>PPM</small></div>' +
                                    '</div>' +
                                    '</div>';
                                $("#completeFormaldehydeListDiv").append(formalHtml);
                            }
                            if (inspectData.thermalRoom || inspectData.thermalStatus)
                            {
                                var thermalHtml = '<div class="col-6 individual-list-item">' +
                                    '<div class="card card-inverse-info">' +
                                    '<div class="card-header mb-0 d-flex justify-content-between">' +
                                    '<h5 class="card-title">' + inspectData.thermalRoom + '</h5>' +
                                    '<button class="close x_badge ml-1 p-1" aria-label="Close">&times;</button>' +
                                    '</div>' +
                                    '<div class="card-body"><i class="ti-check-box"></i>' + inspectData.thermalStatus + '</div>' +
                                    '</div>' +
                                    '</div>';
                                $("#completeCameraListDiv").append(thermalHtml);
                            }
                            if (inspectData.pipeRoom || inspectData.pipeStatus)
                            {
                                var pipeHtml = '<div class="col-6 individual-list-item">' +
                                    '<div class="card card-inverse-info">' +
                                    '<div class="card-header mb-0 d-flex justify-content-between">' +
                                    '<h5 class="card-title">' + inspectData.pipeRoom + '</h5>' +
                                    '<button class="close x_badge ml-1 p-1" aria-label="Close">&times;</button>' +
                                    '</div>' +
                                    '<div class="card-body"><i class="ti-check-box"></i>' + inspectData.pipeStatus + '</div>' +
                                    '</div>' +
                                    '</div>';
                                $("#completePipeListDiv").append(pipeHtml);
                            }
                            if (inspectData.bathRoom || inspectData.bathStatus)

                            {
                                let roomName = inspectData.bathRoom
                                let bathOption = inspectData.bathStatus
                                let bathText = inspectData.bathContent
                                var bathHtml = `<div class="col-6 individual-list-item">
                                <div class="card card-inverse-info">
                                    <div class="card-header mb-0 d-flex justify-content-between">
                                        <h5 class="card-title mb-0">${roomName}</h5>
                                        <button class="close x_badge" aria-label="Close">&times;</button>
                                    </div>
                                    <div class="card-body"><i class="ti-check-box"></i>${bathOption}</div>`;

                                if (bathOption === "하자") {
                                    bathHtml += `<div class="card-body"><i class="ti-write"></i>${bathText}</div>`;
                                }

                                bathHtml += '</div></div>';

                                // Append the created HTML to the bathListDiv
                                $("#completeBathListDiv").append(bathHtml);
                            }
                            if (inspectData.finalRoom || inspectData.finalGonzone || inspectData.finalSelbu || inspectData.finalHaza || inspectData.finalBgo)
                            {
                                var finalHtml =`<div class="col-6 individual-list-item">
                                <div class="card card-inverse-info">
                                    <div class="card-header mb-0">
                                        <h5 class="card-title mb-0">${inspectData.roomName}</h5>
                                        <button class="close x_badge" aria-label="Close">&times;</button>
                                    </div>
                                    <div class="card-body"><i class="ti-info"></i>${inspectData.gonZone}</div>
                                    <div class="card-body"><i class="ti-info"></i>${inspectData.selBu}</div>
                                    <div class="card-body"><i class="ti-info"></i>${inspectData.haZa}</div>
                                    <div class="card-body"><i class="ti-info"></i>${inspectData.bGo}</div>`;

                                if (inspectData.image1) {
                                    finalHtml+= `<div class="card-body"><img src="${inspectData.image1}" alt="Image 1" style="max-width:100%;"></div>`;
                                }

                                if (inspectData.image2) {
                                    finalHtml += `<div class="card-body"><img src="${inspectData.image2}" alt="Image 2" style="max-width:100%;"></div>`;
                                }
                                finalHtml += '</div></div>';
                                $("#completeFinalListDiv").append(finalHtml);

                            }

                        })
                    },
                    error: function (error) {
                        console.error('Error fetching data:', error);
                    }
                }
            )
        }

        // Move card to '진행중' section
        $('#addModal-ing-btn').click(function() {
            if (selectedCard) {
                var apartId = selectedCard.data('apart-id');
                console.log("apart id : ",apartId);

                // New AJAX request to update the apartment status
                $.ajax({
                    type: "POST",
                    url: "/data/updateStatus",
                    contentType: "application/json",
                    data: JSON.stringify({ id : apartId, status: "progress"}),
                    success: function() {
                        // Move card to the '진행중' section on successful status update
                        selectedCard.remove();
                        selectedCard = null;
                        updateBadgeNumbers();


                        let data = [{
                            waitingApart: {id:apartId},
                            ladonRoom: $('#ladonRoomName').val(),
                            ladonPcl: $('#ladonPciInput').val(),
                            formalRoom: $('#formaldehydeRoomName').val(),
                            formalPpm: $('#formaldehydePpmInput').val(),
                            thermalRoom: $('#cameraRoomName').val(),
                            thermalStatus: $('input[name="cameraOption"]:checked').val(),
                            pipeRoom: $('#pipeRoomName').val(),
                            pipeStatus: $('input[name="pipeOption"]:checked').val(),
                            bathRoom: $("#bathRoomName").val(),
                            bathStatus: $("input[name='bathOption']:checked").val(),
                            bathContent: $("#bathText").val(),
                            finalRoom: $("#finalRoomNamet").val(),
                            finalGonzone: $("#gonzoneInput").val(),
                            finalSelbu: $("#selbuInput").val(),
                            finalHaza: $("#hazaInput").val(),
                            finalBgo: $('#bgoInput').val(),
                            finalImage1: $('#imageInput1')[0].files[0],
                            finalImage2: $('#imageInput2')[0].files[0]

                        }];


                        $.ajax({
                            type: "POST",
                            url: "/data/saveInspectIng",
                            contentType: "application/json",
                            data: JSON.stringify(data),
                            success: function(response) {
                                console.log('Data saved successfully', response);
                                alert("진행 목록으로 저장되었습니다.")
                                fetchNonEmptyProgressInspectData(apartId);

                            },
                            error: function(xhr, status, error) {
                                console.error('Error saving data', xhr.responseText);
                            }
                        });
                    },
                    error: function(xhr, status, error) {
                        console.error('Error updating status', xhr.responseText);
                    }
                });
            }
        });

        // Move card to '완료' section from '대기'
        $('#addModal-end-btn').click(function() {
            if (selectedCard) {
                var apartId = selectedCard.data('apart-id');
                console.log("apart id : ",apartId);

                // New AJAX request to update the apartment status
                $.ajax({
                    type: "POST",
                    url: "/data/updateStatus",
                    contentType: "application/json",
                    data: JSON.stringify({ id : apartId, status: "complete"}),
                    success: function() {
                        // Move card to the '진행중' section on successful status update
                        selectedCard.remove();
                        selectedCard = null;
                        updateBadgeNumbers();


                        let data = [{
                            waitingApart: {id:apartId},
                            ladonRoom: $('#ladonRoomName').val(),
                            ladonPcl: $('#ladonPciInput').val(),
                            formalRoom: $('#formaldehydeRoomName').val(),
                            formalPpm: $('#formaldehydePpmInput').val(),
                            thermalRoom: $('#cameraRoomName').val(),
                            thermalStatus: $("input[name='cameraOption']:checked").val(),
                            pipeRoom: $('#pipeRoomName').val(),
                            pipeStatus: $("input[name='pipeOption']:checked").val(),
                            bathRoom: $("#bathRoomName").val(),
                            bathStatus: $("input[name='bathOption']:checked").val(),
                            bathContent: $("#bathText").val(),
                            finalRoom: $("#finalRoomNamet").val(),
                            finalGonzone: $("#gonzoneInput").val(),
                            finalSelbu: $("#selbuInput").val(),
                            finalHaza: $("#hazaInput").val(),
                            finalBgo: $('#bgoInput').val(),
                            finalImage1: $('#imageInput1')[0].files[0],
                            finalImage2: $('#imageInput2')[0].files[0]

                        }];


                        $.ajax({
                            type: "POST",
                            url: "/data/saveInspectIng",
                            contentType: "application/json",
                            data: JSON.stringify(data),
                            success: function(response) {
                                console.log('Data saved successfully', response);
                                alert("완료 목록으로 저장되었습니다.")
                                fetchNonEmptyCompleteInspectData(apartId);
                            },
                            error: function(xhr, status, error) {
                                console.error('Error saving data', xhr.responseText);
                            }
                        });
                    },
                    error: function(xhr, status, error) {
                        console.error('Error updating status', xhr.responseText);
                    }});
            }
        });

        //stay card at 진행
        $('#progressModal-ing-btn').click(function () {
            if (selectedCard) {
                var apartId = selectedCard.data('apart-id');
                console.log("apart id : ",apartId);
                selectedCard = null;
                updateBadgeNumbers();


                let data = [{
                    waitingApart: {id:apartId},
                    ladonRoom: $('#progressLadonRoomName').val(),
                    ladonPcl: $('#progressLadonPciInput').val(),
                    formalRoom: $('#progressFormaldehydeRoomName').val(),
                    formalPpm: $('#progressFormaldehydePpmInput').val(),
                    thermalRoom: $('#progressCameraRoomName').val(),
                    thermalStatus: $("input[name='progressCameraOption']:checked").val(),
                    pipeRoom: $('#progressPipeRoomName').val(),
                    pipeStatus: $("input[name='progressPipeOption']:checked").val(),
                    bathRoom: $("#progressBathRoomName").val(),
                    bathStatus: $("input[name='progressBathOption']:checked").val(),
                    bathContent: $("#progressBathText").val(),
                    finalRoom: $("#progressFinalRoomName").val(),
                    finalGonzone: $("#progressGonzoneInput").val(),
                    finalSelbu: $("#progressSelbuInput").val(),
                    finalHaza: $("#progressHazaInput").val(),
                    finalBgo: $('#progressBgoInput').val(),
                    finalImage1: $('#progressImageInput1')[0].files[0],
                    finalImage2: $('#progressImageInput2')[0].files[0]

                }];


                $.ajax({
                    type: "POST",
                    url: "/data/saveInspectIng",
                    contentType: "application/json",
                    data: JSON.stringify(data),
                    success: function(response) {
                        console.log('Data saved successfully', response);
                        alert("저장되었습니다.")
                        fetchNonEmptyProgressInspectData(apartId);
                    },
                    error: function(xhr, status, error) {
                        console.error('Error saving data', xhr.responseText);
                    }
                });

            }

        } )

        // Move card to '완료' section from '진행중'
        $('#progressModal-end-btn').click(function() {
            if (selectedCard) {
                var apartId = selectedCard.data('apart-id');
                console.log("apart id : ",apartId);

                // New AJAX request to update the apartment status
                $.ajax({
                    type: "POST",
                    url: "/data/updateStatus",
                    contentType: "application/json",
                    data: JSON.stringify({ id : apartId, status: "complete"}),
                    success: function() {
                        // Move card to the '진행중' section on successful status update
                        selectedCard.remove();
                        selectedCard = null;
                        updateBadgeNumbers();


                        let data = [{
                            waitingApart: {id:apartId},
                            ladonRoom: $('#progressLadonRoomName').val(),
                            ladonPcl: $('#progressLadonPciInput').val(),
                            formalRoom: $('#progressFormaldehydeRoomName').val(),
                            formalPpm: $('#progressFormaldehydePpmInput').val(),
                            thermalRoom: $('#progressCameraRoomName').val(),
                            thermalStatus: $("input[name='progressCameraOption']:checked").val(),
                            pipeRoom: $('#progressPipeRoomName').val(),
                            pipeStatus: $("input[name='progressPipeOption']:checked").val(),
                            bathRoom: $("#progressBathRoomName").val(),
                            bathStatus: $("input[name='progressBathOption']:checked").val(),
                            bathContent: $("#progressBathText").val(),
                            finalRoom: $("#progressFinalRoomName").val(),
                            finalGonzone: $("#progressGonzoneInput").val(),
                            finalSelbu: $("#progressSelbuInput").val(),
                            finalHaza: $("#progressHazaInput").val(),
                            finalBgo: $('#progressBgoInput').val(),
                            finalImage1: $('#progressImageInput1')[0].files[0],
                            finalImage2: $('#progressImageInput2')[0].files[0]

                        }];


                        $.ajax({
                            type: "POST",
                            url: "/data/saveInspectIng",
                            contentType: "application/json",
                            data: JSON.stringify(data),
                            success: function(response) {
                                console.log('Data saved successfully', response);
                                alert("완료 목록으로 저장되었습니다.")
                                fetchNonEmptyCompleteInspectData(apartId);
                            },
                            error: function(xhr, status, error) {
                                console.error('Error saving data', xhr.responseText);
                            }
                        });
                    },
                    error: function(xhr, status, error) {
                        console.error('Error updating status', xhr.responseText);
                    }});
            }
        });


        $('#bathText').closest('.form-group').hide();
        $('#progressBathText').closest('.form-group').hide();
        $('#completeBathText').closest('.form-group').hide();


        $("input[name='bathOption']").change(function() {
            if ($("input[name='bathOption']:checked").val() === "하자") {
                $('#bathText').closest('.form-group').show();
            } else {
                $('#bathText').closest('.form-group').hide();
            }
        });
        $("input[name='progressBathOption']").change(function() {
            if ($("input[name='progressBathOption']:checked").val() === "하자") {
                $('#progressBathText').closest('.form-group').show();
            } else {
                $('#progressBathText').closest('.form-group').hide();
            }
        });
        $("input[name='completeBathOption']").change(function() {
            if ($("input[name='completeBathOption']:checked").val() === "하자") {
                $('#completeBathText').closest('.form-group').show();
            } else {
                $('#completeBathText').closest('.form-group').hide();
            }
        });



    });
});

$("#addProgressLadonSaveBtn").click(function () {
    let getRoomName = $("#progressLadonRoomName").val();
    let getPclValue = $("#progressLadonPciInput").val();

    common_addDefaultListDiv("#progressLadonListDiv",getRoomName,getPclValue,"PCI/L");
});

$("#addProgressFormaldehydeSaveBtn").click(function () {
    let getRoomName = $("#progressFormaldehydeRoomName").val();
    let getPpmValue = $("#progressFormaldehydePpmInput").val();

    common_addDefaultListDiv("#progressFormaldehydeListDiv",getRoomName,getPpmValue,"PPM");
});

$("#addProgressCameraSaveBtn").click(function () {
    let getRoomName = $("#progressCameraRoomName").val();
    let getCameraValue = $("input[name='progressCameraOption']:checked").val();

    addCameraToList("#progressCameraListDiv",getRoomName,getCameraValue);
});

$("#addProgressPipeSaveBtn").click(function () {
    let getRoomName = $("#progressPipeRoomName").val();
    let getPipeValue = $("input[name='progressPipeOption']:checked").val();

    addCameraToList("#progressPipeListDiv",getRoomName,getPipeValue);
});


$("#addProgressBathSaveBtn").click(function () {
    let getRoomName = $("#progressBathRoomName").val();
    let getBathValue = $("input[name='progressBathOption']:checked").val();
    let getbathText = $("#progressBathText").val();

    addBathToList("#progressBathListDiv",getRoomName,getBathValue,getbathText);
});

$("#addProgressFinalSaveBtn").click(function () {
    let getRoomName = $("#progressFinalRoomName").val();
    let getGonzoneValue = $("#progressGonzoneInput").val();
    let getSelbuValue = $("#progressSelbuInput").val();
    let getHazaValue = $("#progressHazaInput").val();
    let getBgoValue = $("#progressBgoInput").val();

    let imageFile1 = $('#progressImageInput1')[0].files[0];
    let imageFile2 = $('#progressImageInput2')[0].files[0];

    convertToBase64(imageFile1, function(base64Img1){
        convertToBase64(imageFile2, function(base64Img2){
            addFinalToList("#progressFinalListDiv", getRoomName, getGonzoneValue, getSelbuValue, getHazaValue, getBgoValue, base64Img1, base64Img2);
        });
    });


    addFinalToList("#progressFinalListDiv",getRoomName,getGonzoneValue,getSelbuValue,getHazaValue,getBgoValue);
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

    let imageFile1 = $('#imageInput1')[0].files[0];
    let imageFile2 = $('#imageInput2')[0].files[0];

    convertToBase64(imageFile1, function(base64Img1){
        convertToBase64(imageFile2, function(base64Img2){
            addFinalToList("#finalListDiv", getRoomName, getGonzoneValue, getSelbuValue, getHazaValue, getBgoValue, base64Img1, base64Img2);
        });
    });


    addFinalToList("#finalListDiv",getRoomName,getGonzoneValue,getSelbuValue,getHazaValue,getBgoValue);
});

$("#addCompleteLadonSaveBtn").click(function () {
    let getRoomName = $("#completeLadonRoomName").val();
    let getPclValue = $("#completeLadonPciInput").val();

    common_addDefaultListDiv("#completeLadonListDiv",getRoomName,getPclValue,"PCI/L");
});

$("#addCompleteFormaldehydeSaveBtn").click(function () {
    let getRoomName = $("#completeFormaldehydeRoomName").val();
    let getPpmValue = $("#completeFormaldehydePpmInput").val();

    common_addDefaultListDiv("#completeFormaldehydeListDiv",getRoomName,getPpmValue,"PPM");
});

$("#addCompleteCameraSaveBtn").click(function () {
    let getRoomName = $("#completeCameraRoomName").val();
    let getCameraValue = $("input[name='completeCameraOption']:checked").val();

    addCameraToList("#completeCameraListDiv",getRoomName,getCameraValue);
});

$("#addCompletePipeSaveBtn").click(function () {
    let getRoomName = $("#completePipeRoomName").val();
    let getPipeValue = $("input[name='completePipeOption']:checked").val();

    addCameraToList("#completePipeListDiv",getRoomName,getPipeValue);
});


$("#addCompleteBathSaveBtn").click(function () {
    let getRoomName = $("#completeBathRoomName").val();
    let getBathValue = $("input[name='completeBathOption']:checked").val();
    let getbathText = $("#completeBathText").val();

    addBathToList("#completeBathListDiv",getRoomName,getBathValue,getbathText);
});

$("#addCompleteFinalSaveBtn").click(function () {
    let getRoomName = $("#completeFinalRoomName").val();
    let getGonzoneValue = $("#completeGonzoneInput").val();
    let getSelbuValue = $("#completeSelbuInput").val();
    let getHazaValue = $("#completeHazaInput").val();
    let getBgoValue = $("#completeBgoInput").val();

    let imageFile1 = $('#completeImageInput1')[0].files[0];
    let imageFile2 = $('#completeImageInput2')[0].files[0];

    convertToBase64(imageFile1, function(base64Img1){
        convertToBase64(imageFile2, function(base64Img2){
            addFinalToList("#completeFinalListDiv", getRoomName, getGonzoneValue, getSelbuValue, getHazaValue, getBgoValue, base64Img1, base64Img2);
        });
    });


    addFinalToList("#completeFinalListDiv",getRoomName,getGonzoneValue,getSelbuValue,getHazaValue,getBgoValue);
});
function convertToBase64(file, callback) {
    if(file) {
        const reader = new FileReader();
        reader.onload = function (e) {
            callback(e.target.result);
        };
        reader.readAsDataURL(file);
    } else {
        callback(null);
    }
}


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
            </div>
        </div>
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
function addFinalToList(div, roomName, gonZone,selBu,haZa,bGo,image1,image2) {
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
                ${image1 ? `<div class="card-body"><img src="${image1}" alt="Image 1" style="max-width:100%;"></div>` : ''}
                ${image2 ? `<div class="card-body"><img src="${image2}" alt="Image 2" style="max-width:100%;"></div>` : ''}
            
            </div>
         </div>`
    );

    $(div).append(html.join(''));
}

$(document).on('click', '.x_badge', function() {
    $(this).closest('.individual-list-item').remove();
});


