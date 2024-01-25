

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

    $("#sideIngCountLabel").html($(".ingListDiv .transparent .card").length);
    $("#sideWaitCountLabel").html($(".waitListDiv .transparent .card").length);
    $("#sideEndCountLabel").html($(".endListDiv .transparent .card").length);

}
document.addEventListener('DOMContentLoaded', function() {

    updateBadgeNumbers();
});

$( document ).ready(function() {
    let selectedCard;
    $(function () {
        let $tabButtonItem = $('#tab-button li'),
            $tabSelect = $('#tab-select'),
            $tabContents = $('.tab-contents'),
            activeClass = 'is-active';

        $tabButtonItem.first().addClass(activeClass);
        $tabContents.not(':first').hide();

        $tabButtonItem.find('a').on('click', function (e) {
            let target = $(this).attr('href');

            $tabButtonItem.removeClass(activeClass);
            $(this).parent().addClass(activeClass);
            $tabSelect.val(target);
            $tabContents.hide();
            $(target).show();
            e.preventDefault();
        });

        $tabSelect.on('change', function () {
            let target = $(this).val(),
                targetSelectNum = $(this).prop('selectedIndex');

            $tabButtonItem.removeClass(activeClass);
            $tabButtonItem.eq(targetSelectNum).addClass(activeClass);
            $tabContents.hide();
            $(target).show();
        });
        $('.ingListDiv').click(function () {
            // Fetch data attributes
            var apartId = $(this).data('apart-id');
            var apartName = $(this).data('apart-name');
            var address = $(this).data('address');
            var area = $(this).data('area');
            var customerName = $(this).data('customer-name');
            var cusPhone = $(this).data('cus-phone');
            var email = $(this).data('email')
            var username = $(this).data('username');

            // Populate modal
            $('#progressModalApartId').text(apartId);
            $('#progressModalApartName').text(apartName);
            $('#progressModalAddress').text(address);
            $('#progressModalArea').text(area);
            $('#progressModalCustomerName').val(customerName);
            $('#progressModalCusPhone').val(cusPhone);
            $('#progressModalEmail').val(email);
            $('#progressModalUsername').val(username);
        });

        $('.waitListDiv').click(function () {
            // Fetch data attributes
            var apartId = $(this).data('apart-id');
            var apartName = $(this).data('apart-name');
            var address = $(this).data('address');
            var area = $(this).data('area');
            var customerName = $(this).data('customer-name');
            var cusPhone = $(this).data('cus-phone');
            var email = $(this).data('email')
            var username = $(this).data('username');

            // Populate modal
            $('#modalApartId').text(apartId);
            $('#modalApartName').text(apartName);
            $('#modalAddress').text(address);
            $('#modalArea').text(area);
            $('#modalCustomerName').val(customerName);
            $('#modalCusPhone').val(cusPhone);
            $('#modalEmail').val(email);
            $('#modalUsername').val(username);
        });
        $('.endListDiv').click(function () {
            // Fetch data attributes
            var apartId = $(this).data('apart-id');
            var apartName = $(this).data('apart-name');
            var address = $(this).data('address');
            var area = $(this).data('area');
            var customerName = $(this).data('customer-name');
            var cusPhone = $(this).data('cus-phone');
            var email = $(this).data('email')
            var username = $(this).data('username');

            // Populate modal
            $('#endModalApartId').text(apartId);
            $('#endModalApartName').text(apartName);
            $('#endModalApartAddress').text(address);
            $('#endModalApartArea').text(area);
            $('#endModalCustomerName').val(customerName);
            $('#endModalCusPhone').val(cusPhone);
            $('#endModalEmail').val(email);
            $('#endModalUsername').val(username);
        });


        $(".waitListDiv").click(function () {
            selectedCard = $(this);
            console.log("Card selected:", selectedCard);
        });
        $(".ingListDiv").click(function () {
            selectedCard = $(this);
            console.log("Card selected:", selectedCard);
            var apartId = selectedCard.data('apart-id');
            console.log("Apart Id : ", apartId);


            $(document).on('click', '.inspect-x-badge', function () {
                var $thisBadge = $(this);
                var badgeId = $thisBadge.attr('id');
                var $parentItem = $thisBadge.closest('.individual-list-item');

                var compareData = {};
                if (badgeId.startsWith('ladon_x_badge')) {
                    compareData.type = 'ladon';
                    compareData.room = $parentItem.find('.card-title').text().trim();
                    var pclText = $parentItem.find('#ladonCardBody_' + badgeId.split('_').pop()).text().trim();
                    var pclValue = pclText.split(' ')[0];
                    compareData.pcl = pclValue;
                } else if (badgeId.startsWith('formal_x_badge')) {
                    compareData.type = 'formal';
                    compareData.room = $parentItem.find('.card-title').text().trim();
                    var ppmText = $parentItem.find('#formalCardBody_' + badgeId.split('_').pop()).text().trim();
                    var ppmValue = ppmText.split(' ')[0];
                    compareData.ppm = ppmValue;
                } else if (badgeId.startsWith('thermal_x_badge')) {
                    compareData.type = 'thermal';
                    compareData.room = $parentItem.find('.card-title').text().trim();
                    compareData.status = $parentItem.find('#thermalCardBody_' + badgeId.split('_').pop()).text().trim();
                } else if (badgeId.startsWith('pipe_x_badge')) {
                    compareData.type = 'pipe';
                    compareData.room = $parentItem.find('.card-title').text().trim();
                    compareData.status = $parentItem.find('#pipeCardBody_' + badgeId.split('_').pop()).text().trim();
                } else if (badgeId.startsWith('bath_x_badge')) {
                    compareData.type = 'bath';
                    compareData.room = $parentItem.find('.card-title').text().trim();
                    compareData.status = $parentItem.find('#bathStatusBody_' + badgeId.split('_').pop()).text().trim();

                    var bathContent = $parentItem.find('#bathContentBody_' + badgeId.split('_').pop()).text().trim();
                    if (bathContent) {
                        compareData.content = bathContent;
                    }
                } else if (badgeId.startsWith('final_x_badge')) {
                    compareData.type = 'final';
                    compareData.room = $parentItem.find('.card-title').text().trim();
                    compareData.gonzone = $parentItem.find('#gonZone_' + badgeId.split('_').pop()).text().trim();
                    compareData.selbu = $parentItem.find('#selBu_' + badgeId.split('_').pop()).text().trim();
                    compareData.haza = $parentItem.find('#haZa_' + badgeId.split('_').pop()).text().trim();
                    compareData.bgo = $parentItem.find('#bGo_' + badgeId.split('_').pop()).text().trim();
                    var image1 = $parentItem.find('#image1_' + badgeId.split('_').pop()).attr('src');
                    var image2 = $parentItem.find('#image2_' + badgeId.split('_').pop()).attr('src');
                    if (image1) {
                        compareData.image1 = image1;
                    }
                    if (image2) {
                        compareData.image2 = image2;
                    }
                }

                $.ajax({
                    type: 'POST',
                    url: `/data/deleteData/${apartId}`,
                    contentType: 'application/json',
                    data: JSON.stringify(compareData),
                    success: function (response) {
                        if (response && response.success) {
                            $parentItem.remove(); // Remove the item from DOM if deletion is successful
                            console.log('Data matched and deleted from database');
                        } else {
                            console.log('No matching data found in database');
                        }
                    },
                    error: function (error) {
                        console.error('Error in deletion process:', error);
                    }
                });
            });
            fetchNonEmptyProgressInspectData(apartId);

        });
        $(".endListDiv").click(function () {
            selectedCard = $(this);
            console.log("Card selected:", selectedCard);
            var apartId = selectedCard.data('apart-id');
            console.log("Apart Id : ", apartId);

            $(document).on('click', '.inspect-x-badge', function () {
                var $thisBadge = $(this);
                var badgeId = $thisBadge.attr('id');
                var $parentItem = $thisBadge.closest('.individual-list-item');

                var compareData = {};
                if (badgeId.startsWith('ladon_x_badge')) {
                    compareData.type = 'ladon';
                    compareData.room = $parentItem.find('.card-title').text().trim();
                    var pclText = $parentItem.find('#ladonCardBody_' + badgeId.split('_').pop()).text().trim();
                    var pclValue = pclText.split(' ')[0];
                    compareData.pcl = pclValue;
                } else if (badgeId.startsWith('formal_x_badge')) {
                    compareData.type = 'formal';
                    compareData.room = $parentItem.find('.card-title').text().trim();
                    var ppmText = $parentItem.find('#formalCardBody_' + badgeId.split('_').pop()).text().trim();
                    var ppmValue = ppmText.split(' ')[0];
                    compareData.ppm = ppmValue;
                } else if (badgeId.startsWith('thermal_x_badge')) {
                    compareData.type = 'thermal';
                    compareData.room = $parentItem.find('.card-title').text().trim();
                    compareData.status = $parentItem.find('#thermalCardBody_' + badgeId.split('_').pop()).text().trim();
                } else if (badgeId.startsWith('pipe_x_badge')) {
                    compareData.type = 'pipe';
                    compareData.room = $parentItem.find('.card-title').text().trim();
                    compareData.status = $parentItem.find('#pipeCardBody_' + badgeId.split('_').pop()).text().trim();
                } else if (badgeId.startsWith('bath_x_badge')) {
                    compareData.type = 'bath';
                    compareData.room = $parentItem.find('.card-title').text().trim();
                    compareData.status = $parentItem.find('#bathStatusBody_' + badgeId.split('_').pop()).text().trim();

                    var bathContent = $parentItem.find('#bathContentBody_' + badgeId.split('_').pop()).text().trim();
                    if (bathContent) {
                        compareData.content = bathContent;
                    }
                } else if (badgeId.startsWith('final_x_badge')) {
                    compareData.type = 'final';
                    compareData.room = $parentItem.find('.card-title').text().trim();
                    compareData.gonzone = $parentItem.find('#gonZone_' + badgeId.split('_').pop()).text().trim();
                    compareData.selbu = $parentItem.find('#selBu_' + badgeId.split('_').pop()).text().trim();
                    compareData.haza = $parentItem.find('#haZa_' + badgeId.split('_').pop()).text().trim();
                    compareData.bgo = $parentItem.find('#bGo_' + badgeId.split('_').pop()).text().trim();
                   /* var image1 = $parentItem.find('#image1_' + badgeId.split('_').pop()).attr('src');
                    var image2 = $parentItem.find('#image2_' + badgeId.split('_').pop()).attr('src');
                    if (image1) {
                        compareData.image1 = image1;
                    }
                    if (image2) {
                        compareData.image2 = image2;
                    }*/
                    compareData.deleteImage1 = $parentItem.find('#image1_' + badgeId.split('_').pop()).length > 0;
                    compareData.deleteImage2 = $parentItem.find('#image2_' + badgeId.split('_').pop()).length > 0;

                }

                $.ajax({
                    type: 'POST',
                    url: `/data/deleteData/${apartId}`,
                    contentType: 'application/json',
                    data: JSON.stringify(compareData),
                    success: function (response) {
                        if (response && response.success) {
                            $parentItem.remove(); // Remove the item from DOM if deletion is successful
                            console.log('Data matched and deleted from database');
                        } else {
                            console.log('No matching data found in database');
                        }
                    },
                    error: function (error) {
                        console.error('Error in deletion process:', error);
                    }
                });
            });
            fetchNonEmptyCompleteInspectData(apartId);

        });

        function fetchNonEmptyProgressInspectData(apartId) {
            $.ajax(
                {
                    type: 'GET',
                    url: `/data/${apartId}`,
                    dataType: 'json',
                    success: function (data) {
                        console.log(data)

                        let ladonCounter = 1, formalCounter = 1, thermalCounter = 1,
                            pipeCounter = 1, bathCounter = 1, finalCounter = 1;

                        $("#progressLadonListDiv, #progressFormaldehydeListDiv, #progressCameraListDiv, #progressPipeListDiv, #progressBathListDiv, #progressFinalListDiv").empty();

                        data.forEach(function (inspectData) {

                            if (inspectData.ladonRoom || inspectData.ladonPcl) {
                                let ladonHtml = `<div class="col-6 individual-list-item">
                                        <div class="card card-inverse-info">
                                        <div class="card-header mb-0 d-flex justify-content-between">
                                        <h5 class="card-title mb-0 ">${inspectData.ladonRoom}</h5>
                                        <button class="close x_badge inspect-x-badge" aria-label="Close" id="ladon_x_badge_${ladonCounter}">&times;</button>
                                        </div>
                                        <div class="card-body" id="ladonCardBody_${ladonCounter}">${inspectData.ladonPcl} <small>PCL</small></div>
                                        </div>
                                     </div>`;
                                $("#progressLadonListDiv").append(ladonHtml);

                                ladonCounter++;
                            }
                            if (inspectData.formalRoom || inspectData.formalPpm
                            ) {
                                let formalHtml = `<div class="col-6 individual-list-item">
                                                            <div class="card card-inverse-info">
                                                                <div class="card-header mb-0 d-flex justify-content-between">
                                                                    <h5 class="card-title mb-0 ">${inspectData.formalRoom}</h5>
                                                                    <button class="close x_badge inspect-x-badge" aria-label="Close" id="formal_x_badge_${formalCounter}">&times;</button>
                                                                </div>
                                                                <div class="card-body" id="formalCardBody_${formalCounter}">${inspectData.formalPpm} <small>PPM</small></div>
                                                            </div>
                                                          </div>`;
                                $("#progressFormaldehydeListDiv").append(formalHtml);
                                formalCounter++;
                            }
                            if (inspectData.thermalRoom || inspectData.thermalStatus) {
                                let thermalHtml = `<div class="col-6 individual-list-item">
                                                            <div class="card card-inverse-info">
                                                                <div class="card-header mb-0 d-flex justify-content-between">
                                                                    <h5 class="card-title">${inspectData.thermalRoom}</h5>
                                                                    <button class="close x_badge inspect-x-badge ml-1 p-1" aria-label="Close" id="thermal_x_badge_${thermalCounter}">&times;</button>
                                                                </div>
                                                                <div class="card-body" id="thermalCardBody_${thermalCounter}"><i class="ti-check-box"></i>${inspectData.thermalStatus}</div>
                                                            </div>
                                                          </div>`;

                                $("#progressCameraListDiv").append(thermalHtml);
                                thermalCounter++;
                            }
                            if (inspectData.pipeRoom || inspectData.pipeStatus) {
                                var pipeHtml = `<div class="col-6 individual-list-item">
                                                            <div class="card card-inverse-info">
                                                                <div class="card-header mb-0 d-flex justify-content-between">
                                                                    <h5 class="card-title">${inspectData.pipeRoom}</h5>
                                                                    <button class="close x_badge inspect-x-badge ml-1 p-1" aria-label="Close" id="pipe_x_badge_${pipeCounter}">&times;</button>
                                                                </div>
                                                                <div class="card-body" id="pipeCardBody_${pipeCounter}"><i class="ti-check-box"></i>${inspectData.pipeStatus}</div>
                                                            </div>
                                                        </div>`;

                                $("#progressPipeListDiv").append(pipeHtml);
                                pipeCounter++;
                            }
                            if (inspectData.bathRoom || inspectData.bathStatus) {
                                let roomName = inspectData.bathRoom
                                let bathOption = inspectData.bathStatus
                                let bathText = inspectData.bathContent
                                var bathHtml = `<div class="col-6 individual-list-item">
                                                            <div class="card card-inverse-info">
                                                                <div class="card-header mb-0 d-flex justify-content-between">
                                                                    <h5 class="card-title mb-0">${roomName}</h5>
                                                                    <button class="close x_badge inspect-x-badge" aria-label="Close" id="bath_x_badge_${bathCounter}">&times;</button>
                                                                </div>
                                                                <div class="card-body" id="bathStatusBody_${bathCounter}"><i class="ti-check-box"></i>${bathOption}</div>`;

                                if (bathOption === "하자") {
                                    bathHtml += `<div class="card-body" id="bathContentBody_${bathCounter}"><i class="ti-write"></i>${bathText}</div>`;
                                }

                                bathHtml += '</div></div>';


                                // Append the created HTML to the bathListDiv
                                $("#progressBathListDiv").append(bathHtml);
                                bathCounter++;
                            }
                            if (inspectData.finalRoom || inspectData.finalGonzone || inspectData.finalSelbu || inspectData.finalHaza || inspectData.finalBgo) {

                                var finalHtml = `<div class="col-6 individual-list-item">
                                                            <div class="card card-inverse-info">
                                                                <div class="card-header mb-0">
                                                                    <h5 class="card-title mb-0">${inspectData.finalRoom}</h5>
                                                                    <button class="close x_badge inspect-x-badge" aria-label="Close" id="final_x_badge_${finalCounter}">&times;</button>
                                                                </div>
                                                                <div class="card-body" id="gonZone_${finalCounter}"><i class="ti-info"></i>${inspectData.finalGonzone}</div>
                                                                <div class="card-body" id="selBu_${finalCounter}"><i class="ti-info"></i>${inspectData.finalSelbu}</div>
                                                                <div class="card-body" id="haZa_${finalCounter}"><i class="ti-info"></i>${inspectData.finalHaza}</div>
                                                                <div class="card-body" id="bGo_${finalCounter}"><i class="ti-info"></i>${inspectData.finalBgo}</div>`;

                                if (inspectData.finalImage1) {
                                    var image1Src = `data:image/jpeg;base64,${inspectData.finalImage1}`;
                                    finalHtml += `<div class="card-body" id="image1_${finalCounter}"><img src="${image1Src}" alt="Image 1" style="max-width:100%;"></div>`;
                                }

                                if (inspectData.finalImage2) {
                                    var image2Src = `data:image/jpeg;base64,${inspectData.finalImage2}`;
                                    finalHtml += `<div class="card-body" id="image2_${finalCounter}"><img src="${image2Src}" alt="Image 2" style="max-width:100%;"></div>`;
                                }

                                finalHtml += '</div></div>';

                                $("#progressFinalListDiv").append(finalHtml);
                                finalCounter++;

                            }

                        })
                    },
                    error: function (error) {
                        console.error('Error fetching data:', error);
                    }
                }
            )
        }

        function fetchNonEmptyCompleteInspectData(apartId) {
            $.ajax(
                {
                    type: 'GET',
                    url: `/data/${apartId}`,
                    dataType: 'json',
                    success: function (data) {
                        console.log(data);
                        let ladonCounter = 1, formalCounter = 1, thermalCounter = 1,
                            pipeCounter = 1, bathCounter = 1, finalCounter = 1;

                        $("#completeLadonListDiv").empty();
                        $("#completeFormaldehydeListDiv").empty();
                        $("#completeCameraListDiv").empty();
                        $("#completePipeListDiv").empty();
                        $("#completeBathListDiv").empty();
                        $("#completeFinalListDiv").empty();

                        data.forEach(function (inspectData) {
                            if (inspectData.ladonRoom || inspectData.ladonPcl) {
                                var ladonHtml = `<div class="col-6 individual-list-item">
                                                            <div class="card card-inverse-info">
                                                                <div class="card-header mb-0 d-flex justify-content-between">
                                                                    <h5 class="card-title mb-0 ">${inspectData.ladonRoom}</h5>
                                                                    <button class="close x_badge inspect-x-badge" aria-label="Close" id="ladon_x_badge_${ladonCounter}">&times;</button>
                                                                </div>
                                                                <div class="card-body" id="ladonCardBody_${ladonCounter}">${inspectData.ladonPcl} <small>PCL</small></div>
                                                            </div>
                                                         </div>`;
                                $("#completeLadonListDiv").append(ladonHtml);
                                ladonCounter++;
                            }
                            if (inspectData.formalRoom || inspectData.formalPpm) {
                                var formalHtml = `<div class="col-6 individual-list-item">
                                                                <div class="card card-inverse-info">
                                                                    <div class="card-header mb-0 d-flex justify-content-between">
                                                                        <h5 class="card-title mb-0 ">${inspectData.formalRoom}</h5>
                                                                        <button class="close x_badge inspect-x-badge" aria-label="Close" id="formal_x_badge_${formalCounter}">&times;</button>
                                                                    </div>
                                                                    <div class="card-body" id="formalCardBody_${formalCounter}">${inspectData.formalPpm} <small>PPM</small></div>
                                                                </div>
                                                             </div>`;
                                $("#completeFormaldehydeListDiv").append(formalHtml);
                                formalCounter++;
                            }
                            if (inspectData.thermalRoom || inspectData.thermalStatus) {
                                var thermalHtml = `<div class="col-6 individual-list-item">
                                                                    <div class="card card-inverse-info">
                                                                        <div class="card-header mb-0 d-flex justify-content-between">
                                                                            <h5 class="card-title">${inspectData.thermalRoom}</h5>
                                                                            <button class="close x_badge inspect-x-badge ml-1 p-1" aria-label="Close" id="thermal_x_badge_${thermalCounter}">&times;</button>
                                                                        </div>
                                                                        <div class="card-body" id="thermalCardBody_${thermalCounter}"><i class="ti-check-box"></i>${inspectData.thermalStatus}</div>
                                                                    </div>
                                                                </div>`;
                                $("#completeCameraListDiv").append(thermalHtml);
                                thermalCounter++;
                            }

                            if (inspectData.pipeRoom || inspectData.pipeStatus) {
                                var pipeHtml = `<div class="col-6 individual-list-item">
                                                                <div class="card card-inverse-info">
                                                                    <div class="card-header mb-0 d-flex justify-content-between">
                                                                        <h5 class="card-title">${inspectData.pipeRoom}</h5>
                                                                        <button class="close x_badge inspect-x-badge ml-1 p-1" aria-label="Close" id="pipe_x_badge_${pipeCounter}">&times;</button>
                                                                    </div>
                                                                    <div class="card-body" id="pipeCardBody_${pipeCounter}"><i class="ti-check-box"></i>${inspectData.pipeStatus}</div>
                                                                </div>
                                                            </div>`;
                                $("#completePipeListDiv").append(pipeHtml);
                                pipeCounter++;
                            }

                            if (inspectData.bathRoom || inspectData.bathStatus) {
                                let roomName = inspectData.bathRoom;
                                let bathOption = inspectData.bathStatus;
                                let bathText = inspectData.bathContent;
                                var bathHtml = `<div class="col-6 individual-list-item">
                                                                <div class="card card-inverse-info">
                                                                    <div class="card-header mb-0 d-flex justify-content-between">
                                                                        <h5 class="card-title mb-0">${roomName}</h5>
                                                                        <button class="close x_badge inspect-x-badge" aria-label="Close" id="bath_x_badge_${bathCounter}">&times;</button>
                                                                    </div>
                                                                    <div class="card-body" id="bathStatusBody_${bathCounter}"><i class="ti-check-box"></i>${bathOption}</div>`;
                                if (bathOption === "하자") {
                                    bathHtml += `<div class="card-body" id="bathContentBody_${bathCounter}"><i class="ti-write"></i>${bathText}</div>`;
                                }
                                bathHtml += '</div></div>';
                                $("#completeBathListDiv").append(bathHtml);
                                bathCounter++;
                            }

                            if (inspectData.finalRoom || inspectData.finalGonzone || inspectData.finalSelbu || inspectData.finalHaza || inspectData.finalBgo) {
                                var finalHtml = `<div class="col-6 individual-list-item">
                                                                <div class="card card-inverse-info">
                                                                    <div class="card-header mb-0">
                                                                        <h5 class="card-title mb-0">${inspectData.finalRoom}</h5>
                                                                        <button class="close x_badge inspect-x-badge" aria-label="Close" id="final_x_badge_${finalCounter}">&times;</button>
                                                                    </div>
                                                                    <div class="card-body" id="gonZone_${finalCounter}"><i class="ti-info"></i>${inspectData.finalGonzone}</div>
                                                                    <div class="card-body" id="selBu_${finalCounter}"><i class="ti-info"></i>${inspectData.finalSelbu}</div>
                                                                    <div class="card-body" id="haZa_${finalCounter}"><i class="ti-info"></i>${inspectData.finalHaza}</div>
                                                                    <div class="card-body" id="bGo_${finalCounter}"><i class="ti-info"></i>${inspectData.finalBgo}</div>`;
                                if (inspectData.finalImage1) {
                                    var image1Src = `data:image/jpeg;base64,${inspectData.finalImage1}`;
                                    finalHtml += `<div class="card-body" id="image1_${finalCounter}"><img src="${image1Src}" alt="Image 1" style="max-width:100%;"></div>`;
                                }

                                if (inspectData.finalImage2) {
                                    var image2Src = `data:image/jpeg;base64,${inspectData.finalImage2}`;
                                    finalHtml += `<div class="card-body" id="image2_${finalCounter}"><img src="${image2Src}" alt="Image 2" style="max-width:100%;"></div>`;
                                }
                                finalHtml += '</div></div>';
                                $("#completeFinalListDiv").append(finalHtml);
                                finalCounter++;
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
        $('#addModal-ing-btn').click(function () {
            if (selectedCard) {
                var apartId = selectedCard.data('apart-id');
                console.log("apart id : ", apartId);
                let ladonRoomData = collectData("#ladonListDiv", "rooms");
                let ladonValData = collectData("#ladonListDiv", "values");
                let formaldehydeRoomData = collectData("#formaldehydeListDiv", "rooms");
                let formaldehydeValData = collectData("#formaldehydeListDiv", "values");
                let cameraRoomData = collectData("#cameraListDiv", "rooms");
                let cameraValData = collectData("#cameraListDiv", "options");
                let pipeRoomData = collectData("#pipeListDiv", "rooms");
                let pipeValData = collectData("#pipeListDiv", "options");
                let bathRoomData = collectData("#bathListDiv", "rooms");
                let bathOptionData = collectData("#bathListDiv", "bathoptions");
                let bathTextData = collectData("#bathListDiv", "texts");
                let finalRoomData = collectData("#finalListDiv", "rooms");
                let finalGonZoneData = collectData("#finalListDiv", "gonzones");
                let finalSelBuData = collectData("#finalListDiv", "selbus");
                let finalHaZaData = collectData("#finalListDiv", "hazas");
                let finalBGoData = collectData("#finalListDiv", "bgos");
                let finalImage1Data = collectData("#finalListDiv", "image1");
                let finalImage2Data = collectData("#finalListDiv", "image2");


                updateStatusAndSaveData(apartId, "progress", ladonRoomData, ladonValData, formaldehydeRoomData, formaldehydeValData, cameraRoomData, cameraValData, pipeRoomData, pipeValData, bathRoomData, bathOptionData, bathTextData, finalRoomData, finalGonZoneData, finalSelBuData, finalHaZaData, finalBGoData, finalImage1Data, finalImage2Data);
            }
        });
        // Move card to '완료' section from '대기'
        $('#addModal-end-btn').click(function () {
            if (selectedCard) {
                var apartId = selectedCard.data('apart-id');
                console.log("apart id : ", apartId);
                let ladonRoomData = collectData("#ladonListDiv", "rooms");
                let ladonValData = collectData("#ladonListDiv", "values");
                let formaldehydeRoomData = collectData("#formaldehydeListDiv", "rooms");
                let formaldehydeValData = collectData("#formaldehydeListDiv", "values");
                let cameraRoomData = collectData("#cameraListDiv", "rooms");
                let cameraValData = collectData("#cameraListDiv", "options");
                let pipeRoomData = collectData("#pipeListDiv", "rooms");
                let pipeValData = collectData("#pipeListDiv", "options");
                let bathRoomData = collectData("#bathListDiv", "rooms");
                let bathOptionData = collectData("#bathListDiv", "bathoptions");
                let bathTextData = collectData("#bathListDiv", "texts");
                let finalRoomData = collectData("#finalListDiv", "rooms");
                let finalGonZoneData = collectData("#finalListDiv", "gonzones");
                let finalSelBuData = collectData("#finalListDiv", "selbus");
                let finalHaZaData = collectData("#finalListDiv", "hazas");
                let finalBGoData = collectData("#finalListDiv", "bgos");
                let finalImage1Data = collectData("#finalListDiv", "image1");
                let finalImage2Data = collectData("#finalListDiv", "image2");


                updateStatusAndSaveData(apartId, "complete", ladonRoomData, ladonValData, formaldehydeRoomData, formaldehydeValData, cameraRoomData, cameraValData, pipeRoomData, pipeValData, bathRoomData, bathOptionData, bathTextData, finalRoomData, finalGonZoneData, finalSelBuData, finalHaZaData, finalBGoData, finalImage1Data, finalImage2Data);
            }
        });

        //stay card at 진행
        $('#progressModal-ing-btn').click(function () {
            if (selectedCard) {
                var apartId = selectedCard.data('apart-id');
                console.log("apart id : ", apartId);

                let ladonRoomData = collectData("#progressLadonListDiv", "rooms");
                let ladonValData = collectData("#progressLadonListDiv", "values");
                let formaldehydeRoomData = collectData("#progressFormaldehydeListDiv", "rooms");
                let formaldehydeValData = collectData("#progressFormaldehydeListDiv", "values");
                let cameraRoomData = collectData("#progressCameraListDiv", "rooms");
                let cameraValData = collectData("#progressCameraListDiv", "options");
                let pipeRoomData = collectData("#progressPipeListDiv", "rooms");
                let pipeValData = collectData("#progressPipeListDiv", "options");
                let bathRoomData = collectData("#progressBathListDiv", "rooms");
                let bathOptionData = collectData("#progressBathListDiv", "bathoptions");
                let bathTextData = collectData("#progressBathListDiv", "texts");
                let finalRoomData = collectData("#progressFinalListDiv", "rooms");
                let finalGonZoneData = collectData("#progressFinalListDiv", "gonzones");
                let finalSelBuData = collectData("#progressFinalListDiv", "selbus");
                let finalHaZaData = collectData("#progressFinalListDiv", "hazas");
                let finalBGoData = collectData("#progressFinalListDiv", "bgos");
                let finalImage1Data = collectData("#progressFinalListDiv", "image1");
                let finalImage2Data = collectData("#progressFinalListDiv", "image2");


                let data = [{
                    waitingApart: {id: apartId},
                    ladonRoom: ladonRoomData.join(","),
                    ladonPcl: ladonValData.join(","),
                    formalRoom: formaldehydeRoomData.join(","),
                    formalPpm: formaldehydeValData.join(","),
                    thermalRoom: cameraRoomData.join(","),
                    thermalStatus: cameraValData.join(","),
                    pipeRoom: pipeRoomData.join(","),
                    pipeStatus: pipeValData.join(","),
                    bathRoom: bathRoomData.join(","),
                    bathStatus: bathOptionData.join(","),
                    bathContent: bathTextData.join(","),
                    finalRoom: finalRoomData.join(","),
                    finalGonzone: finalGonZoneData.join(","),
                    finalSelbu: finalSelBuData.join(","),
                    finalHaza: finalHaZaData.join(","),
                    finalBgo: finalBGoData.join(","),
                    finalImage1Base64: finalImage1Data.join(","),
                    finalImage2Base64: finalImage2Data.join(",")
                }];
                console.log(JSON.stringify(data));

                // Proceed with AJAX call using collected data
                $.ajax({
                    type: "POST",
                    url: "/data/saveInspectIng",
                    contentType: "application/json",
                    data: JSON.stringify(data), // Sending as an array with one object
                    success: function (response) {
                        console.log('Data saved successfully', response);
                        selectedCard.remove();
                        selectedCard = null;
                        location.reload();
                    },
                    error: function (xhr, status, error) {
                        console.error('Error saving data', xhr.responseText);
                    }
                });
            }
        });

        // Move card to '완료' section from '진행중'
        $('#progressModal-end-btn').click(function () {
            if (selectedCard) {
                var apartId = selectedCard.data('apart-id');
                console.log("apart id : ", apartId);
                let ladonRoomData = collectData("#progressLadonListDiv", "rooms");
                let ladonValData = collectData("#progressLadonListDiv", "values");
                let formaldehydeRoomData = collectData("#progressFormaldehydeListDiv", "rooms");
                let formaldehydeValData = collectData("#progressFormaldehydeListDiv", "values");
                let cameraRoomData = collectData("#progressCameraListDiv", "rooms");
                let cameraValData = collectData("#progressCameraListDiv", "options");
                let pipeRoomData = collectData("#progressPipeListDiv", "rooms");
                let pipeValData = collectData("#progressPipeListDiv", "options");
                let bathRoomData = collectData("#progressBathListDiv", "rooms");
                let bathOptionData = collectData("#progressBathListDiv", "bathoptions");
                let bathTextData = collectData("#progressBathListDiv", "texts");
                let finalRoomData = collectData("#progressFinalListDiv", "rooms");
                let finalGonZoneData = collectData("#progressFinalListDiv", "gonzones");
                let finalSelBuData = collectData("#progressFinalListDiv", "selbus");
                let finalHaZaData = collectData("#progressFinalListDiv", "hazas");
                let finalBGoData = collectData("#progressFinalListDiv", "bgos");
                let finalImage1Data = collectData("#progressFinalListDiv", "image1");
                let finalImage2Data = collectData("#progressFinalListDiv", "image2");

                updateStatusAndSaveData(apartId, "complete", ladonRoomData, ladonValData, formaldehydeRoomData, formaldehydeValData, cameraRoomData, cameraValData, pipeRoomData, pipeValData, bathRoomData, bathOptionData, bathTextData, finalRoomData, finalGonZoneData, finalSelBuData, finalHaZaData, finalBGoData, finalImage1Data, finalImage2Data);
            }
        });

        $('#endModal-update-btn').click(function () {
            if (selectedCard) {
                var apartId = selectedCard.data('apart-id');
                console.log("apart id : ", apartId);

                let ladonRoomData = collectData("#completeLadonListDiv", "rooms");
                let ladonValData = collectData("#completeLadonListDiv", "values");
                let formaldehydeRoomData = collectData("#completeFormaldehydeListDiv", "rooms");
                let formaldehydeValData = collectData("#completeFormaldehydeListDiv", "values");
                let cameraRoomData = collectData("#completeCameraListDiv", "rooms");
                let cameraValData = collectData("#completeCameraListDiv", "options");
                let pipeRoomData = collectData("#completePipeListDiv", "rooms");
                let pipeValData = collectData("#completePipeListDiv", "options");
                let bathRoomData = collectData("#completeBathListDiv", "rooms");
                let bathOptionData = collectData("#completeBathListDiv", "bathoptions");
                let bathTextData = collectData("#completeBathListDiv", "texts");
                let finalRoomData = collectData("#completeFinalListDiv", "rooms");
                let finalGonZoneData = collectData("#completeFinalListDiv", "gonzones");
                let finalSelBuData = collectData("#completeFinalListDiv", "selbus");
                let finalHaZaData = collectData("#completeFinalListDiv", "hazas");
                let finalBGoData = collectData("#completeFinalListDiv", "bgos");
                let finalImage1Data = collectData("#completeFinalListDiv", "image1");
                let finalImage2Data = collectData("#completeFinalListDiv", "image2");


                let data = [{
                    waitingApart: {id: apartId},
                    ladonRoom: ladonRoomData.join(","),
                    ladonPcl: ladonValData.join(","),
                    formalRoom: formaldehydeRoomData.join(","),
                    formalPpm: formaldehydeValData.join(","),
                    thermalRoom: cameraRoomData.join(","),
                    thermalStatus: cameraValData.join(","),
                    pipeRoom: pipeRoomData.join(","),
                    pipeStatus: pipeValData.join(","),
                    bathRoom: bathRoomData.join(","),
                    bathStatus: bathOptionData.join(","),
                    bathContent: bathTextData.join(","),
                    finalRoom: finalRoomData.join(","),
                    finalGonzone: finalGonZoneData.join(","),
                    finalSelbu: finalSelBuData.join(","),
                    finalHaza: finalHaZaData.join(","),
                    finalBgo: finalBGoData.join(","),
                    finalImage1Base64: finalImage1Data.join(","),
                    finalImage2Base64: finalImage2Data.join(",")
                }];
                console.log(JSON.stringify(data));

                // Proceed with AJAX call using collected data
                $.ajax({
                    type: "POST",
                    url: "/data/saveInspectIng",
                    contentType: "application/json",
                    data: JSON.stringify(data), // Sending as an array with one object
                    success: function (response) {
                        console.log('Data saved successfully', response);
                        selectedCard.remove();
                        selectedCard = null;
                        location.reload();
                    },
                    error: function (xhr, status, error) {
                        console.error('Error saving data', xhr.responseText);
                    }
                });
            }

        })
        $('#endModal-correct-btn').click(function () {
            console.log("Correction button is clicked.")
            if (selectedCard) {
                var apartId = selectedCard.data('apart-id');
                console.log("apart id : ", apartId);

                // New AJAX request to update the apartment status
                $.ajax({
                    type: "POST",
                    url: "/data/updateStatus",
                    contentType: "application/json",
                    data: JSON.stringify({id: apartId, status: "final"}),
                    success: function () {
                        selectedCard.remove();
                        selectedCard = null;
                        updateBadgeNumbers();

                        $.ajax({
                            type: "POST",
                            url:  `/data/moveAndDeleteData/${apartId}`,
                            success: function () {
                                console.log('Data moved and old data deleted successfully');



                                let ladonRoomData = collectData("#completeLadonListDiv", "rooms");
                                let ladonValData = collectData("#completeLadonListDiv", "values");
                                let formaldehydeRoomData = collectData("#completeFormaldehydeListDiv", "rooms");
                                let formaldehydeValData = collectData("#completeFormaldehydeListDiv", "values");
                                let cameraRoomData = collectData("#completeCameraListDiv", "rooms");
                                let cameraValData = collectData("#completeCameraListDiv", "options");
                                let pipeRoomData = collectData("#completePipeListDiv", "rooms");
                                let pipeValData = collectData("#completePipeListDiv", "options");
                                let bathRoomData = collectData("#completeBathListDiv", "rooms");
                                let bathOptionData = collectData("#completeBathListDiv", "bathoptions");
                                let bathTextData = collectData("#completeBathListDiv", "texts");
                                let finalRoomData = collectData("#completeFinalListDiv", "rooms");
                                let finalGonZoneData = collectData("#completeFinalListDiv", "gonzones");
                                let finalSelBuData = collectData("#completeFinalListDiv", "selbus");
                                let finalHaZaData = collectData("#completeFinalListDiv", "hazas");
                                let finalBGoData = collectData("#completeFinalListDiv", "bgos");
                                let finalImage1Data = collectData("#completeFinalListDiv", "image1");
                                let finalImage2Data = collectData("#completeFinalListDiv", "image2");



                                let data = [{
                                    waitingApart: {id: apartId},
                                    ladonRoom: ladonRoomData.join(","),
                                    ladonPcl: ladonValData.join(","),
                                    formalRoom: formaldehydeRoomData.join(","),
                                    formaldehydePpm: formaldehydeValData.join(","),
                                    thermalRoom: cameraRoomData.join(","),
                                    thermalStatus: cameraValData.join(","),
                                    pipeRoom: pipeRoomData.join(","),
                                    pipeStatus: pipeValData.join(","),
                                    bathRoom: bathRoomData.join(","),
                                    bathStatus: bathOptionData.join(","),
                                    bathContent: bathTextData.join(","),
                                    finalRoom: finalRoomData.join(","),
                                    finalGonzone: finalGonZoneData.join(","),
                                    finalSelbu: finalSelBuData.join(","),
                                    finalHaza: finalHaZaData.join(","),
                                    finalBgo: finalBGoData.join(","),
                                    finalImage1Base64: finalImage1Data.join(","),
                                    finalImage2Base64: finalImage2Data.join(",")
                                }];
                                console.log(JSON.stringify(data));

                                $.ajax({
                                    type: "POST",
                                    url: "/data/updateApart",
                                    contentType: "application/json",
                                    data: JSON.stringify(data),
                                    success: function (response) {
                                        console.log('Data saved successfully', response);
                                        //location.reload();
                                        generateReport(apartId);
                                    },
                                    error: function (xhr, status, error) {
                                        console.error('Error saving data', xhr.responseText);
                                    }
                                });
                            },
                            error: function (xhr, status, error) {
                                console.error('Error in moving and deleting data', xhr.responseText);
                            }
                        });



                    },
                    error: function (xhr, status, error) {
                        console.error('Error updating status', xhr.responseText);
                    }
                });
            }
        });

        function collectData(divSelector, inputClass) {
            let data = [];
            $(divSelector + " ." + inputClass).each(function() {
                data.push($(this).val());
            });
            return data;
        }

        function updateStatusAndSaveData(apartId, status, ladonRoomData, ladonValData, formaldehydeRoomData, formaldehydeValData, cameraRoomData, cameraValData, pipeRoomData, pipeValData, bathRoomData, bathOptionData, bathTextData, finalRoomData, finalGonZoneData, finalSelBuData, finalHaZaData, finalBGoData, finalImage1Data, finalImage2Data) {
            // New AJAX request to update the apartment status
            $.ajax({
                type: "POST",
                url: "/data/updateStatus",
                contentType: "application/json",
                data: JSON.stringify({id: apartId, status: status}),
                success: function () {
                    // Move card to the '진행중' section on successful status update
                    selectedCard.remove();
                    selectedCard = null;
                    updateBadgeNumbers();

                    // Construct the final data object
                    let data = [{
                        waitingApart: {id: apartId},
                        ladonRoom: ladonRoomData.join(","),
                        ladonPcl: ladonValData.join(","),
                        formalRoom: formaldehydeRoomData.join(","),
                        formalPpm: formaldehydeValData.join(","),
                        thermalRoom: cameraRoomData.join(","),
                        thermalStatus: cameraValData.join(","),
                        pipeRoom: pipeRoomData.join(","),
                        pipeStatus: pipeValData.join(","),
                        bathRoom: bathRoomData.join(","),
                        bathStatus: bathOptionData.join(","),
                        bathContent: bathTextData.join(","),
                        finalRoom: finalRoomData.join(","),
                        finalGonzone: finalGonZoneData.join(","),
                        finalSelbu: finalSelBuData.join(","),
                        finalHaza: finalHaZaData.join(","),
                        finalBgo: finalBGoData.join(","),
                        finalImage1Base64: finalImage1Data.join(","),
                        finalImage2Base64: finalImage2Data.join(",")
                    }];
                    console.log(JSON.stringify(data));

                    // AJAX request to save the inspection data
                    $.ajax({
                        type: "POST",
                        url: "/data/saveInspectIng",
                        contentType: "application/json",
                        data: JSON.stringify(data),
                        success: function (response) {
                            console.log('Data saved successfully', response);
                            location.reload();
                        },
                        error: function (xhr, status, error) {
                            console.error('Error saving data', xhr.responseText);
                        }
                    });
                },
                error: function (xhr, status, error) {
                    console.error('Error updating status', xhr.responseText);
                }
            });
        }


        function generateReport(apartId) {
            $.ajax({
                url: `/data/generateReport/${apartId}`,
                type: 'GET',
                xhrFields: {
                    responseType: 'blob'
                },
                success: function(response, statusText, xhr) {
                    if (xhr.status === 200) {
                        var blob = new Blob([response], { type: 'application/pdf' });
                        var link = document.createElement('a');
                        link.href = window.URL.createObjectURL(blob);
                        link.download = "report.pdf";
                        document.body.appendChild(link);
                        link.click();
                        document.body.removeChild(link);
                        uploadReport(blob, apartId);
                    } else {
                        alert("Report generation was successful, but response status is not OK.");
                    }
                },
                error: function(xhr, status, error) {
                    console.error('Error fetching report:', xhr.responseText);
                    alert("Failed to generate report: " + error);
                }
            });
        }

        function uploadReport(blob, apartId) {
            var formData = new FormData();
            formData.append("file", blob);
            formData.append("apartId", apartId);

            $.ajax({
                url: '/data/uploadReport',
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function(data) {
                    alert("Report uploaded successfully.");
                },
                error: function(data) {
                    alert("Error in uploading report.");
                }
            });
        }




        $('#bathText').closest('.form-group').hide();
        $('#progressBathText').closest('.form-group').hide();
        $('#completeBathText').closest('.form-group').hide();
        $("input[name='bathOption']").change(function () {
                    if ($("input[name='bathOption']:checked").val() === "하자") {
                        $('#bathText').closest('.form-group').show();
                    } else {
                        $('#bathText').closest('.form-group').hide();
                    }
                });
        $("input[name='progressBathOption']").change(function () {
                    if ($("input[name='progressBathOption']:checked").val() === "하자") {
                        $('#progressBathText').closest('.form-group').show();
                    } else {
                        $('#progressBathText').closest('.form-group').hide();
                    }
                });
        $("input[name='completeBathOption']").change(function () {
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
    if (getRoomName.trim() === '') {
        alert('Please enter the room name for Ladon.');
        return;
    }

    common_addDefaultListDiv("#progressLadonListDiv",getRoomName,getPclValue,"PCI/L");
});

$("#addProgressFormaldehydeSaveBtn").click(function () {
    let getRoomName = $("#progressFormaldehydeRoomName").val();
    let getPpmValue = $("#progressFormaldehydePpmInput").val();
    if (getRoomName.trim() === '') {
        alert('Please enter the room name.');
        return;
    }

    common_addDefaultListDiv("#progressFormaldehydeListDiv",getRoomName,getPpmValue,"PPM");
});

$("#addProgressCameraSaveBtn").click(function () {
    let getRoomName = $("#progressCameraRoomName").val();
    let getCameraValue = $("input[name='progressCameraOption']:checked").val();
    if (getRoomName.trim() === '') {
        alert('Please enter the room name.');
        return;
    }

    addCameraToList("#progressCameraListDiv",getRoomName,getCameraValue);
});

$("#addProgressPipeSaveBtn").click(function () {
    let getRoomName = $("#progressPipeRoomName").val();
    let getPipeValue = $("input[name='progressPipeOption']:checked").val();
    if (getRoomName.trim() === '') {
        alert('Please enter the room name.');
        return;
    }

    addCameraToList("#progressPipeListDiv",getRoomName,getPipeValue);
});


$("#addProgressBathSaveBtn").click(function () {
    let getRoomName = $("#progressBathRoomName").val();
    let getBathValue = $("input[name='progressBathOption']:checked").val();
    let getbathText = $("#progressBathText").val();
    if (getRoomName.trim() === '') {
        alert('Please enter the room name.');
        return;
    }

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
    if (getRoomName.trim() === '') {
        alert('Please enter the room name.');
        return;
    }


    convertToBase64(imageFile1, function(base64Img1){
        convertToBase64(imageFile2, function(base64Img2){
            addFinalToList("#progressFinalListDiv",getRoomName,getGonzoneValue,getSelbuValue,getHazaValue,getBgoValue,base64Img1, base64Img2);

        });
    });



});

$("#addLadonSaveBtn").click(function () {
    let getRoomName = $("#ladonRoomName").val();
    let getPclValue = $("#ladonPciInput").val();
    if (getRoomName.trim() === '') {
        alert('Please enter the room name.');
        return;
    }

    common_addDefaultListDiv("#ladonListDiv",getRoomName,getPclValue,"PCI/L");
});

$("#addFormaldehydeSaveBtn").click(function () {
    let getRoomName = $("#formaldehydeRoomName").val();
    let getPpmValue = $("#formaldehydePpmInput").val();
    if (getRoomName.trim() === '') {
        alert('Please enter the room name.');
        return;
    }

    common_addDefaultListDiv("#formaldehydeListDiv",getRoomName,getPpmValue,"PPM");
});

$("#addCameraSaveBtn").click(function () {
    let getRoomName = $("#cameraRoomName").val();
    let getCameraValue = $("input[name='cameraOption']:checked").val();
    if (getRoomName.trim() === '') {
        alert('Please enter the room name.');
        return;
    }

    addCameraToList("#cameraListDiv",getRoomName,getCameraValue);
});

$("#addPipeSaveBtn").click(function () {
    let getRoomName = $("#pipeRoomName").val();
    let getPipeValue = $("input[name='pipeOption']:checked").val();
    if (getRoomName.trim() === '') {
        alert('Please enter the room name.');
        return;
    }

    addCameraToList("#pipeListDiv",getRoomName,getPipeValue);
});


$("#addBathSaveBtn").click(function () {
    let getRoomName = $("#bathRoomName").val();
    let getBathValue = $("input[name='bathOption']:checked").val();
    let getbathText = $("#bathText").val();
    if (getRoomName.trim() === '') {
        alert('Please enter the room name.');
        return;
    }

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
    if (getRoomName.trim() === '') {
        alert('Please enter the room name.');
        return;
    }


    convertToBase64(imageFile1, function(base64Img1){
        convertToBase64(imageFile2, function(base64Img2){
            addFinalToList("#finalListDiv",getRoomName,getGonzoneValue,getSelbuValue,getHazaValue,getBgoValue, base64Img1, base64Img2);
        });
    });



});

$("#addCompleteLadonSaveBtn").click(function () {
    let getRoomName = $("#completeLadonRoomName").val();
    let getPclValue = $("#completeLadonPciInput").val();
    if (getRoomName.trim() === '') {
        alert('Please enter the room name.');
        return;
    }

    common_addDefaultListDiv("#completeLadonListDiv",getRoomName,getPclValue,"PCI/L");
});

$("#addCompleteFormaldehydeSaveBtn").click(function () {
    let getRoomName = $("#completeFormaldehydeRoomName").val();
    let getPpmValue = $("#completeFormaldehydePpmInput").val();
    if (getRoomName.trim() === '') {
        alert('Please enter the room name.');
        return;
    }

    common_addDefaultListDiv("#completeFormaldehydeListDiv",getRoomName,getPpmValue,"PPM");
});

$("#addCompleteCameraSaveBtn").click(function () {
    let getRoomName = $("#completeCameraRoomName").val();
    let getCameraValue = $("input[name='completeCameraOption']:checked").val();
    if (getRoomName.trim() === '') {
        alert('Please enter the room name.');
        return;
    }

    addCameraToList("#completeCameraListDiv",getRoomName,getCameraValue);
});

$("#addCompletePipeSaveBtn").click(function () {
    let getRoomName = $("#completePipeRoomName").val();
    let getPipeValue = $("input[name='completePipeOption']:checked").val();
    if (getRoomName.trim() === '') {
        alert('Please enter the room name.');
        return;
    }

    addCameraToList("#completePipeListDiv",getRoomName,getPipeValue);
});


$("#addCompleteBathSaveBtn").click(function () {
    let getRoomName = $("#completeBathRoomName").val();
    let getBathValue = $("input[name='completeBathOption']:checked").val();
    let getbathText = $("#completeBathText").val();
    if (getRoomName.trim() === '') {
        alert('Please enter the room name.');
        return;
    }

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
    if (getRoomName.trim() === '') {
        alert('Please enter the room name.');
        return;
    }


    convertToBase64(imageFile1, function(base64Img1){
        convertToBase64(imageFile2, function(base64Img2){
            addFinalToList("#completeFinalListDiv",getRoomName,getGonzoneValue,getSelbuValue,getHazaValue,getBgoValue, base64Img1, base64Img2);
        });
    });


    //addFinalToList("#completeFinalListDiv",getRoomName,getGonzoneValue,getSelbuValue,getHazaValue,getBgoValue);
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
                <div class="card-body m-1 p-1">
                    <ul class="list-arrow m-0">
                        <li>${value} <small>${value_unit}</small></li>
                    </ul>
                </div>
            </div>
            
                <input type="hidden" class="rooms" value="${room}" />
                <input type="hidden" class="values" value="${value}" />
            
        </div>`
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
                 <div class="card-body m-1 p-1">
                    <ul class="list-arrow m-0">
                        <li>${cameraOption}</li>
                    </ul>
                </div>
            </div>
            <input type="hidden" class="rooms" value="${roomName}" />
            <input type="hidden" class="options" value="${cameraOption}" />
        </div>
        `
    );

    $(div).append(html.join(''));
}

function addBathToList(div, roomName, bathOption, bathText) {
    let html = [];

    html.push(
        `<div class="col-6 individual-list-item">
            <div class="card card-inverse-info">
                <div class="card-header mb-0 d-flex justify-content-between">
                    <h5 class="card-title mb-0">${roomName}</h5>
                    <button class="close x_badge" aria-label="Close">&times;</button>
                </div>
                <div class="card-body m-1 p-1">
                    <ul class="list-arrow m-0">
                        <li>${bathOption}</li>
                    
                `
    );

    if (bathOption === "하자") {
        html.push(`        <li>${bathText}</li>
                        </ul>
                    </div>`);
    }
    else
    {
        html.push(`      </ul>
                    </div>`);
    }

    html.push(
        `</div>
         
            <input type="hidden" class="rooms" value="${roomName}" />
            <input type="hidden" class="bathoptions" value="${bathOption}" />
            <input type="hidden" class="texts" value="${bathText}" />
         
        </div>
        `
    );

    $(div).append(html.join(''));
}

function addFinalToList(div, roomName, gonZone, selBu, haZa, bGo, image1, image2) {
    let html = [];

    html.push(
        `<div class="col-6 individual-list-item">
            <div class="card card-inverse-info">
                <div class="card-header mb-0">
                    <h5 class="card-title mb-0">${roomName}</h5>
                    <button class="close x_badge" aria-label="Close">&times;</button>
                </div>
                <div class="card-body m-1 p-1">
                    <ul class="list-arrow m-0">
                        <li>${gonZone}</li>
                        <li>${selBu}</li>
                        <li>${haZa}</li>
                        <li>${bGo}</li>
                    </ul>
                </div>`
    );

    if (image1) {
        html.push(`<div class="card-body"><img src="${image1}" alt="Image 1" style="max-width:100%;"></div>`);
    }

    if (image2) {
        html.push(`<div class="card-body"><img src="${image2}" alt="Image 2" style="max-width:100%;"></div>`);
    }

    html.push(
        `</div>
            <input type="hidden" class="rooms" value="${roomName}" />
            <input type="hidden" class="gonzones" value="${gonZone}" />
            <input type="hidden" class="selbus" value="${selBu}" />
            <input type="hidden" class="hazas" value="${haZa}" />
            <input type="hidden" class="bgos" value="${bGo}" />
            <input type="hidden" class="image1" value="${image1}" />
            <input type="hidden" class="image2" value="${image2}" />
        </div>
        
        `
    );

    $(div).append(html.join(''));
}

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


$(document).on('click', '.x_badge', function() {
    $(this).closest('.individual-list-item').remove();
});


