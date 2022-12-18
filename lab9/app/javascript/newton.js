function show_result(data){
    var result = document.getElementById("result");
    if (!data.errors){
        result.innerHTML = "<ol>"
        for(let a of data.steps){
            result.innerHTML += "<li>" + a + "</li>";
        }
        result.innerHTML += "</ol>"
        result.innerHTML += "<p id='answer'>Answer: " + data.value + "</p>"
        result.innerHTML += "<p>" + Date() + "</p>";
    }else{
        result.innerHTML = "<p id='error'>Error: " + data.errors + "</p>"
    }
   }
$(document).ready(function(){
    $("#newton_form").bind("ajax:success",
    function(xhr, data, status) {
    // data is already an object
    show_result(data)
    })
})
