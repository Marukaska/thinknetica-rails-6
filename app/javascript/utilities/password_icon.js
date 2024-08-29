document.addEventListener("turbolinks:load", function() {
    const password = document.getElementById('password');
    const passwordConfirmation = document.getElementById('password_confirmation');

    function color_change() {
        if (passwordConfirmation.value === '') {
            passwordConfirmation.style.borderColor = ''; // Сброс цвета, если поле пустое
        } else if (passwordConfirmation.value === password.value) {
            passwordConfirmation.style.borderColor = 'green'; // Зелёный цвет, если пароли совпадают
        } else {
            passwordConfirmation.style.borderColor = 'red'; // Красный цвет, если пароли не совпадают
        }
    }

    if (password) {password.addEventListener('input', color_change)}
    if (passwordConfirmation) {passwordConfirmation.addEventListener('input', color_change)}
})