document.addEventListener('DOMContentLoaded', function() {
    function sum_amt() {
        var trNodes = document.querySelectorAll('.table tbody tr');
        trNodes.forEach(function(trNode) {
            var qtyElement = trNode.querySelector('.qty');
            var priceElement = trNode.querySelector('.price');
            var totalElement = trNode.querySelector('.total');
            var qty = qtyElement.value;
            var price = priceElement.innerText.replace('g', '');
            var total = (Number(qty) * Number(price));
            totalElement.value = total;
        });
    }

    var qtyInputs = document.querySelectorAll('.qty');
    qtyInputs.forEach(function(input) {
        input.addEventListener('input', sum_amt);
    });

    window.showMerchants = function() {
        document.getElementById("ingredients").style.display = "block";
        document.getElementById("wares").style.display = "none";
    }
    window.showWares = function() {
        document.getElementById("ingredients").style.display = "none";
        document.getElementById("wares").style.display = "block";
    }

    function getRandomInt(max) {
        return Math.floor(Math.random() * max);
    }

    var soundFolder = "../static/sounds/";
    var smallCoinFiles = ["smallCoin1.wav", "smallCoin2.wav", "smallCoin3.wav", "smallCoin4.wav", "smallCoin5.wav", "smallCoin6.wav"];
    var smallCoinSound = []

    for (var i = 0; i < smallCoinFiles.length; i++) {
        var sound = new Audio(soundFolder + smallCoinFiles[i]);
        console.log(sound.src);
        smallCoinSound.push(sound);
    }

    function saleSound() {
        smallCoinSound[getRandomInt(6)].play();
    };

    var buySellButtons = document.querySelectorAll('.buy, .sell');
    var totals = document.querySelectorAll('.total');
    var qtys = document.querySelectorAll('.qty');

    for (var i = 0; i < buySellButtons.length; i++) {
        buySellButtons[i].addEventListener("click", saleSound);
    }


});




