
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
                        <div class="card-body">
                            <p class="card-title"><i class="ti-files p-2"></i>${index + 1}. ${apart.apartName}</p>
                        
                            <p>Address: ${apart.address}</p>
                            <p>Area: ${apart.area}</p>
                            <p>Customer Name: ${apart.customer_name}</p>
                        </div>
                        <div class="card-footer text-right">${apart.inspection_date}</div>
                    </div>
                </div>
            </div>
        `;

        container.append(cardHtml);
    });
}
