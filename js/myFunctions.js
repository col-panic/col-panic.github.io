/**
 * private javascript functions marco@descher.at
 */
function headerSwitch(that) {
	var parent = that.parentNode;
	var childs = parent.parentNode.childNodes;
	for (var i = 0; i < childs.length; i++) {
		if (childs[i] instanceof HTMLLIElement) {
			childs[i].removeAttribute("class");
		}
	}

	parent.setAttribute("class", "active")

	var val = that.href.toString().lastIndexOf('#');
	var siteName = that.href.toString().substr(val + 1);

	loadIntoContentDiv(siteName);
}

function loadIntoContentDiv(name) {
	$("#content").load("html/" + name + ".html");
}

function setLastUpdatedString(document, id) {
	var dt = document.lastModified
	var updateElement = document.getElementById(id);
	updateElement.innerHTML = "updated "+Date.parse(dt).toLocaleDateString();
}
