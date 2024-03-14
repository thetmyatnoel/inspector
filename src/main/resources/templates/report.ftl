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
                    <div class="mt-3">
                        <button id="startRecord">Start Recording</button>
                        <button id="stopRecord" disabled>Stop Recording</button>
                        <audio id="audioPlayback" controls></audio>
                    </div>

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

    let mediaRecorder;
    let audioChunks = [];

    document.getElementById("startRecord").onclick = function() {
        navigator.mediaDevices.getUserMedia({ audio: true })
            .then(stream => {
                mediaRecorder = new MediaRecorder(stream);
                mediaRecorder.ondataavailable = event => {
                    audioChunks.push(event.data);
                };
                mediaRecorder.onstop = () => {
                    const audioBlob = new Blob(audioChunks, { type: 'audio/ogg; codecs=opus' });
                    const audioUrl = URL.createObjectURL(audioBlob);
                    document.getElementById("audioPlayback").src = audioUrl;

                    // Prepare to send this data to the backend
                    const formData = new FormData();
                    formData.append("file", audioBlob);

                    // Fetch API to send the audio file to the backend for transcription
                    fetch("http://localhost:5001/transcribe", { // Ensure this URL matches your setup
                        method: "POST",
                        body: formData,
                    })
                        .then(response => response.json())
                        .then(data => {
                            console.log(data); // Process transcription result
                        })
                        .catch(error => console.error("Error:", error));
                };
                audioChunks = [];
                mediaRecorder.start();
                document.getElementById("stopRecord").disabled = false;
            });
    };

    document.getElementById("stopRecord").onclick = function() {
        mediaRecorder.stop();
        document.getElementById("stopRecord").disabled = true;
    };
</script>

<!-- endinject -->
</body>

</html>
