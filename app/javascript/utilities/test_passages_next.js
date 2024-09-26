document.addEventListener('turbolinks:load', function() {
    const checkboxes = document.querySelectorAll('.answer-check');
    const nextButton = document.getElementById('next-btn');

    checkboxes.forEach(function(checkbox) {
        checkbox.addEventListener('change', function() {
            const isChecked = Array.from(checkboxes).some(input => input.checked);
            nextButton.disabled = !isChecked;
        });
    });
});