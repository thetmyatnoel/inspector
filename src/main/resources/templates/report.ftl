<!DOCTYPE html>
<html lang="en">

<#include "/common/head.ftl">
<body>
<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
            <a class="navbar-brand brand-logo mr-5" href="/report"><img src="images/logo-text.png" class="mr-2" alt="logo" style="height: auto; max-width: 100px;"/></a>
            <a class="navbar-brand brand-logo-mini" href="/report"><img src="images/logo.png" alt="logo" style="height: auto; max-width: 100%;"/></a>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
            <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                <span class="icon-menu"></span>
            </button>
            <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
                <span class="icon-menu"></span>
            </button>
            <ul class="navbar-nav navbar-nav-right">
                <li class="nav-item nav-profile dropdown show">
                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown" aria-expanded="true">
                        <img src="/images/user.png" alt="profile">
                        <#if username?? && username != "">
                            ${username}
                        <#else>
                            User
                        </#if>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
                        <a class="dropdown-item" href="/login"><i class="ti-power-off text-primary"></i>Logout</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->
        <#include "/common/sidebar.ftl">
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-md-12 grid-margin">
                        <div class="row">
                            <div class="col-12 col-xl-8 mb-2 mb-xl-0">
                                <h3 class="font-weight-bold">종합 보고서</h3>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <h2>Upload or Record Audio for Transcription</h2>
                    <input type="file" id="audioInput" accept="audio/*" style="display: none;">
                    <button id="recordButton">Record</button>
                    <button id="stopRecordButton" style="display: none;">Stop Recording</button>
                    <button id="uploadButton">Upload Audio</button>
                    <div id="transcriptionResult">Transcription will appear here</div>
                </div>
                <div class="row">
                    <div class="col-md-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">

                                <!-- Search Box -->
                                <div class="search-box rounded">
                                    <input type="search" class="form-control rounded" id="searchInput" placeholder="Search reports..." aria-label="Search" aria-describedby="search-addon" >

                                </div>

                                <!-- Cards List -->
                                <div class="cards-list">
                                    <div id="apartments-container"></div>
                                    <!-- Additional card items can be added here -->
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- Add this in your content-wrapper where you want to display the PDF -->
                <#-- <div class="pdf-viewer">
                    <#include "/common/pdfViewer.ftl">
                </div> -->


                <#include "/common/footer.ftl">
            </div>
            <!-- partial -->
        </div>
        <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->

<#include "/common/js.ftl">
<script type="text/javascript">
    const loggedInUsername = "${username!""}";
    const pendingCount = ${pendingCount!0};
    const progressCount = ${progressCount!0};
    const completeCount = ${completeCount!0};
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.6.347/pdf.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.6.347/pdf.worker.min.js"></script>
<script src="/page/report.js"></script>
<script src="/page/index.js"></script>
<script>
    $(document).ready(function() {
        // Function to update badge numbers
        function updateBadgeNumbers() {
            $("#sideIngCountLabel").html(progressCount); // For "진행중"
            $("#sideWaitCountLabel").html(pendingCount); // For "대기"
            $("#sideEndCountLabel").html(completeCount); // For "완료"
        }

        // Call the function on document ready to update the counts immediately when the page loads
        updateBadgeNumbers();
    });

    $(document).ready(function() {
        let mediaRecorder;
        let audioChunks = [];

        $('#recordButton').click(function() {
            navigator.mediaDevices.getUserMedia({ audio: true })
                .then(stream => {
                    mediaRecorder = new MediaRecorder(stream);
                    audioChunks = []; // Ensure audioChunks is empty before starting a new recording
                    mediaRecorder.start();
                    console.log("Recording started");

                    mediaRecorder.ondataavailable = function(event) {
                        audioChunks.push(event.data);
                    };

                    mediaRecorder.onstop = function() {
                        console.log("Recording stopped");
                        const audioBlob = new Blob(audioChunks, { type: 'audio/wav' });
                        console.log("Blob created, size:", audioBlob.size);
                        if (audioBlob.size > 0) {
                            sendAudioToServer(audioBlob);
                        } else {
                            console.error("Blob is empty. No data was captured.");
                        }
                        // Clear the chunks array after blob creation
                        audioChunks = [];
                        stream.getTracks().forEach(track => track.stop()); // Ensure all tracks are stopped
                        $('#stopRecordButton').hide();
                        $('#recordButton').show();
                    };

                    $('#stopRecordButton').show();
                    $('#recordButton').hide();
                })
                .catch(error => {
                    console.error("Error accessing the microphone:", error);
                });
        });

        $('#stopRecordButton').click(function() {
            if (mediaRecorder && mediaRecorder.state === 'recording') {
                mediaRecorder.stop();
            }
        });

        $('#uploadButton').click(function() {
            $('#audioInput').click();
        });

        $('#audioInput').change(function(event) {
            const file = event.target.files[0];
            if (file) {
                sendAudioToServer(file);
            }
        });

        function sendAudioToServer(file) {
            const formData = new FormData();
            formData.append('file', file);

            console.log("Preparing to send audio to server");
            $.ajax({
                url: '/data/transcribe', // Ensure this URL matches your server endpoint
                type: 'POST',
                data: formData,
                contentType: false,
                processData: false,
                success: function(data) {
                    console.log('Success:', data.transcription);

                    var parsedData = (typeof data === "string") ? JSON.parse(data) : data;
                    console.log('Parsed data:', parsedData);
                    console.log('Transcription:', parsedData.transcription);
                    $('#transcriptionResult').text(parsedData.transcription);
                },
                error: function(xhr, status, error) {
                    console.error('Error:', error);
                }
            });
        }
    });
</script>

<!-- endinject -->
</body>

</html>
