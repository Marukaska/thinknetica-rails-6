document.addEventListener('turbolinks:load', function() {
    var progressBar = document.getElementById('progress-bar');

    if (progressBar) {
        var currentQuestion = progressBar.dataset.currentQuestion;
        var totalQuestions = progressBar.dataset.totalQuestions;

        // Рассчитываем процент завершения
        var progressPercentage = (currentQuestion / totalQuestions) * 100;

        // Обновляем ширину прогресс-бара и атрибуты
        progressBar.style.width = progressPercentage + '%';
        progressBar.setAttribute('aria-valuenow', progressPercentage);
    }
});