function test(sth) {
    sth.style.color = "blue";
    this.style.color = "blue";
}

$(document).ready(function () {
    $('form').submit(function (e) {
        e.preventDefault();
        if ($('#InputPrice').val() == "" || $('#InputPrice').val() == "" || ParseInt($("#InputPrice").val()) > 0) {
            return false;
        }
        $('<tr>', {
            html: `<td>${$('#goods_table  tr').length}</td><td>${$('#ProductTitle').val()}</td><td>${$('#InputPrice').val()}</td>`,
            onmouseover: 'test'
        }).appendTo('#goods_table');
        $("#goods_table tr:last").mouseenter((e) => {
            $(e.target).parent().css('background', "darksalmon");
        }).mouseleave((e) => {
            $(e.target).parent().css('background', "");
        }).click((e) => {
            $(e.target).parent().clone().appendTo($("#basket_table")).css('background', "");
            $('#latest').text("Outdated");
        });
        $('#ProductTitle').val("");
        $('#InputPrice').val("");
        
    });
    $("#btn-calc-price").click(() => {
        var sum = 0;

        $("#basket_table td:nth-child(3n)")
            .each((iter, block) => {
                console.log(parseInt(block.innerText));

                sum += parseInt(block.innerText);
            });

        $("#price").text(sum);
        $('#latest').text("");
    })
});