function sum_amt() {
    var trNodes = document.getElementByClass('table').childNodes;
    for (var i=0; i < trNodes.length; i++) {

        var qty = trNodes[i].getElementsByClassName('qty').value;

        var price = trNodes[i].getElementsByClassName('price').value;

        var answer = (Number(qty) * Number(price));

        trNodes[i].getElementsByClassName('total').innerHTML = answer;
    }
}
