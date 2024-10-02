document.addEventListener('turbolinks:load', function() {
    var timeLeftElement = document.getElementById('time-left');

    if (timeLeftElement) {
        var endTime = parseInt(timeLeftElement.dataset.endTime, 10);
        var timerId = setInterval(function() {
            var currentTime = Math.floor(Date.now() / 1000);
            var timeLeft = endTime - currentTime;

            if (timeLeft <= 0) {
                clearInterval(timerId);
                window.location.href = timeLeftElement.dataset.redirectUrl;
            } else {
                timeLeftElement.textContent = formatTime(timeLeft);
            }
        }, 1000);
    }
});

function formatTime(seconds) {
    var minutes = Math.floor(seconds / 60);
    var secondsLeft = seconds % 60;
    return minutes + 'm ' + (secondsLeft < 10 ? '0' : '') + secondsLeft + 's';
}
