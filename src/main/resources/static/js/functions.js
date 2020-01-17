function ynCheck(elm, div, radio) {
		if(radio != 'SIM'){
			document.getElementById(div).style.display = "none";
			document.getElementById(div).getElementsByTagName('INPUT')[0].setAttribute("disabled", "true");
			document.getElementById(div).getElementsByTagName('INPUT')[0].removeAttribute("required");
			document.getElementById(div).getElementsByTagName('INPUT')[0].value = '';
		} else {
			document.getElementById(div).style.display = "inline-block";
			document.getElementById(div).style.width = "86%";
			document.getElementById(div).getElementsByTagName('INPUT')[0].removeAttribute("disabled");
			document.getElementById(div).getElementsByTagName('INPUT')[0].setAttribute("required", "true");
		}
	}
	
	function ynCheck2(elm, div, qtdeF, idade, radio) {
		if(radio != 'SIM'){
			document.getElementById(div).style.display = "none";
			document.getElementById(qtdeF).setAttribute("disabled", "true");
			document.getElementById(idade).setAttribute("disabled", "true");
		} else {
			document.getElementById(div).style.display = "inline-block";
			document.getElementById(div).getElementsByTagName('INPUT')[0].removeAttribute("disabled");
			document.getElementById(div).getElementsByTagName('INPUT')[1].removeAttribute("disabled");
		}
	}
	
	function enableCheckBox(div, chBox){
			if(chBox.checked) {
				document.getElementById(div).style.display = "inline-block";
	      		document.getElementById(div).removeAttribute("disabled");
			} else {
				document.getElementById(div).style.display = "none";
				document.getElementById(div).setAttribute("disabled", "true");
			}
		}