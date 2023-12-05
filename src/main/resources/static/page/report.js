
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

// EventTarget.addEventListener() to bind the search_tool() function (note the deliberate
// lack of parentheses) as the event-handler for the 'input' event:
document.querySelector('#searchInput').addEventListener('input', search_tool);
