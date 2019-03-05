function imgseat(N, tabstop) {
	var objs, seates, Img, Span, A;

	objs = document.getElementsByTagName("INPUT");
	if (N == undefined)
		return false;
	if (tabstop == undefined)
		tabstop = true;

	for (var i = 0; i < objs.length; i++) {
		if (objs[i].type != "checkbox" || objs[i].name != N)
			continue;

		if (imgseat.Objs[N] == undefined) {
			imgseat.Objs[N] = [];
			imgseat.Imgs[N] = [];
			imgseat.ImgObjs[N] = [];
		}

		var len = imgseat.Objs[N].length;
		imgseat.Objs[N][len] = objs[i];
		imgseat.Imgs[N][len] = {};

		// for image cache
		(Img = new Image()).src = objs[i].getAttribute("onsrc");
		imgseat.Imgs[N][len]["on"] = Img;

		(Img = new Image()).src = objs[i].getAttribute("offsrc");
		imgseat.Imgs[N][len]["off"] = Img;

		// image element
		Img = document.createElement("IMG");
		Img.src = objs[i].checked ? objs[i].getAttribute("onsrc") : objs[i]
				.getAttribute("offsrc");

		Img.style.borderWidth = "0px";
		Img.setAttribute("class", "imgSize");
		Img.setAttribute("alt", "spaceSeat");
		Img.onclick = new Function("imgseat.onclick('" + N + "','" + len + "')");
		imgseat.ImgObjs[N][len] = Img;

		// anchor element for tab stop
		A = document.createElement("A");
		if (tabstop) {
			A.href = "javascript:;";
			A.onkeypress = new Function("evt", "if(evt==undefined)evt=event;if(evt.keyCode==13){ imgseat.onclick('"+ N + "','" + len + "'); }");
		}
		A.setAttribute("class", "a_size");
		A.style.borderWidth = "0px";
		A.appendChild(Img);

		// insert object
		Span = objs[i].parentNode;
		Span.style.display = "none";
		Span.parentNode.insertBefore(A, Span);
	}
}
imgseat.onclick = function(N, idx) {
	var C = imgseat.Objs[N][idx];
	var I = imgseat.ImgObjs[N][idx];

	C.checked = !C.checked;
	I.src = imgseat.Imgs[N][idx][C.checked ? "on" : "off"].src;

	// fire event
	if (C.onclick != undefined || C.onclick != null)
		C.onclick();
}
imgseat.Objs = {};
imgseat.Imgs = {};
imgseat.ImgObjs = {};