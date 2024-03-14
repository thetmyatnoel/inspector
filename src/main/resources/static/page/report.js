
const search_tool = (evt) => {

    const cards = document.querySelectorAll('.cards-list .card-item'),

        value = evt.currentTarget.value.trim().toUpperCase();


    for (let card of cards) {

        const texts_to_search_for = [...card.querySelectorAll('.card-title')];


        if (texts_to_search_for.some(

            (txt) => txt.textContent.toUpperCase().includes(value)
        )) {

            card.style.display = '';
        } else {

            card.style.display = 'none';
        }
    }
}

document.querySelector('#searchInput').addEventListener('input', search_tool);

document.addEventListener('DOMContentLoaded', function() {
    updateBadgeNumbers();
});
$(document).ready(function() {
    if (loggedInUsername) {
        $.ajax({
            url: `data/reports/${loggedInUsername}`,
            type: 'GET',
            success: function(apartments) {
                displayApartments(apartments);
            },
            error: function(error) {
                console.error('Error fetching data:', error);
            }
        });
    }
});

function displayApartments(apartments) {
    const container = $('#apartments-container');

    apartments.forEach((apart, index) => {
        const cardHtml = `
            <div class="col-md-12 p-1 rounded card-item" data-label="${apart.apartName}">
                <div class="col-md-12 stretch-card transparent">
                    <div class="card card-outline-primary">
                        <div class="card-body" onclick="fetchAndDisplayReportByName('${apart.customer_name}')">
                            <p class="card-title"><i class="ti-files p-2"></i>${index + 1}. ${apart.apartName}</p>
                        
                            <p>Address: ${apart.address}</p>
                            <p>Area: ${apart.area}</p>
                            <p>Customer Name: ${apart.customer_name}</p>
                        </div>
                        <div class="card-footer d-flex justify-content-between align-items-center">
                            <button class="btn btn-primary" onclick="sendEmail('${apart.id}')">이메일 전송</button>
                            <p class="text-left">${apart.inspection_date}</p>
                        </div>
                </div>
            </div>
        `;

        container.append(cardHtml);
    });
}
function fetchAndDisplayReportByName(name) {
    window.open(`/data/reports/by-name/${name}`, '_blank');
    /*$.ajax({
        url: `/data/reports/by-name/${name}`,
        type: 'GET',
        xhrFields: {
            responseType: 'blob'
        },
        success: function(response) {
            var file = new Blob([response], {type: 'application/pdf'});
            var fileURL = URL.createObjectURL(file);

            // Initialize PDF.js viewer
            var pdfjsLib = window['pdfjs-dist/build/pdf'];
            pdfjsLib.GlobalWorkerOptions.workerSrc = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.6.347/pdf.worker.min.js';

            var loadingTask = pdfjsLib.getDocument(fileURL);
            loadingTask.promise.then(function(pdf) {
                console.log('PDF loaded');

                // Fetch the first page
                var pageNumber = 1;
                pdf.getPage(pageNumber).then(function(page) {
                    console.log('Page loaded');

                    var scale = 1.5;
                    var viewport = page.getViewport({scale: scale});

                    // Prepare canvas using PDF page dimensions
                    var container = document.getElementById('pdf-viewer-container');
                    var canvas = document.createElement('canvas');
                    container.appendChild(canvas);
                    var context = canvas.getContext('2d');
                    canvas.height = viewport.height;
                    canvas.width = viewport.width;

                    // Render PDF page into canvas context
                    var renderContext = {
                        canvasContext: context,
                        viewport: viewport
                    };
                    var renderTask = page.render(renderContext);
                    renderTask.promise.then(function () {
                        console.log('Page rendered');
                    });
                });
            }, function (reason) {
                // PDF loading error
                console.error(reason);
            });
        },
        error: function(error) {
            console.error('Error fetching report:', error);
        }
    });*/

}
function sendEmail(waitingApartId) {
    $.ajax({
        url: `/data/send-report-email/${waitingApartId}`,
        type: 'POST',
        success: function(response) {
            alert('이메일 전송 성공!!');
        },
        error: function(error) {
            console.error('Error sending email:', error);
        }
    });
}
