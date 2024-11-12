let selectedId;

function selectedDate(select) {
    select.addEventListener('change', function(e) {
        selectedId = e.target.value;
    });
}