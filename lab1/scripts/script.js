function ring(){
	alert('Doo-daa-doo')
}
function rewrite(){
	var a = document.getElementById('target_input').value;
	document.getElementById('target_p').textContent = 'Last added value: ' + a;
	var new_node = document.createElement("p");
	new_node.textContent = a;
	document.body.appendChild(new_node);
}

asyncfunction arewrite(){
	
}