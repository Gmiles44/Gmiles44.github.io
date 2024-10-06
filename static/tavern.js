document.addEventListener('DOMContentLoaded', function() {
    window.showFood = function() {
        document.getElementById("food").style.display = "block";
        document.getElementById("drink").style.display = "none";
        document.getElementById("lodging").style.display = "none";
    }
    window.showDrink = function() {
        document.getElementById("food").style.display = "none";
        document.getElementById("drink").style.display = "block";
        document.getElementById("lodging").style.display = "none";
    }
    window.showLodging = function() {
        document.getElementById("food").style.display = "none";
        document.getElementById("drink").style.display = "none";
        document.getElementById("lodging").style.display = "block";
    }

});
