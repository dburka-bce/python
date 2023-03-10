function preprocess(){
	hideTOC();
	
	let ps=document.querySelectorAll("p");
	let taskCount=0;
	for(var i=0; i<ps.length; i++){
		if(ps[i].innerHTML.indexOf("(+/-)")==0){
			taskCount++;
			let t=document.createElement("span");
			t.innerHTML="<span class=\"tg_cnt\">#"+taskCount+"</span><span>✓</span><span>?</span>";
			t.classList.add("tg_task");
			t.classList.add("tg_taskctrl");
			t.classList.add("tg_neutral");
			
			
			t.id="task"+taskCount;
			
			let text=ps[i].innerText;
			text=text.substring(6,text.length);
			ps[i].innerHTML="";
			
			ps[i].appendChild(t);
			ps[i].innerHTML+=text;
			ps[i].addEventListener("click", taskClicked);
		}
		else if(ps[i].innerHTML.indexOf("(!Vid)")==0){
			let text=ps[i].innerText;
			let a=document.createElement("a");

			text=text.substring(7,text.length);
			a.innerHTML=text;
			ps[i].innerHTML="";
			ps[i].appendChild(a);
			ps[i].addEventListener("click", videoClicked);
		}
		else if(ps[i].innerHTML.indexOf("(!Hint)")==0){
			taskCount++;
			let t=document.createElement("span");
			t.innerHTML="<span class=\"tg_cnt\">#"+taskCount+"</span><span>✓</span><span>?</span>";
			t.classList.add("tg_task");
			t.classList.add("tg_taskctrl");
			t.classList.add("tg_neutral");
			
			
			t.id="task"+taskCount;
			let hint=ps[i].innerText;
			let text=ps[i].innerText;
			let p=document.createElement("p");

			hint=hint.substring(text.indexOf("[!")+2,hint.length-1);
			text=text.substring(8,text.indexOf("[!")-1);
			p.innerHTML=hint;
			
			p.classList.add("hidden");
			p.classList.add("hint");
			ps[i].innerHTML="";
			ps[i].appendChild(t);
			ps[i].innerHTML+=text;
			ps[i].appendChild(p);
			ps[i].addEventListener("click", taskClicked);
		}
	}
	
	let videos=$(".embeddedvideo");

	for(let i=0;i<videos.length;i++){
		videos[i].classList.add("hidden");
		videos[i].children[0].target=videos[i].children[0].scr;
		videos[i].children[0].scr="";
	}
	
	for(let i=0;i<ps.length;i++){
		if(ps[i].innerHTML.indexOf("(!Stepper)")==0){
			ps[i].innerHTML="";
			ps[i].appendChild(generateStepper());
		}
	}
	
	
}
function taskClicked(e) {
    let el = e.target;
    //console.log(el);
    if (!el.id) {
        el = el.parentNode; //
    }

    let ele = el; //.firstChild
    console.log(e.target.id + " was clicked");
    let newStatus = "";
    if (ele.classList.contains("tg_neutral")) {
        ele.classList.remove("tg_neutral");
        ele.classList.add("tg_success");
        newStatus = "+";

    } else
        if (ele.classList.contains("tg_success")) {
            ele.classList.remove("tg_success");
            ele.classList.add("tg_fail");
            newStatus = "-";
		if(e.target.parentNode.parentNode.children[e.target.parentNode.parentNode.children.length-1].classList.contains("hint")){
			showHint(e.target.parentNode.parentNode.children[e.target.parentNode.parentNode.children.length-1]);
		}
		
        } else if (ele.classList.contains("tg_fail")) {
            ele.classList.remove("tg_fail");
            ele.classList.add("tg_neutral");
            newStatus = "0";
		if(e.target.parentNode.parentNode.children[e.target.parentNode.parentNode.children.length-1].classList.contains("hint")){
			hideHint(e.target.parentNode.parentNode.children[e.target.parentNode.parentNode.children.length-1]);
		}
        }

    //ws.send(`S ${el.id.substring(4)} ${newStatus}`);
}
function showHint(p){
	p.classList.remove("hidden");
}
function hideHint(p){
	p.classList.add("hidden");
}
function videoClicked(e){
	let el = e.target;
	if(el.parentNode.nextElementSibling.classList.contains("hidden")){
		el.parentNode.nextElementSibling.classList.remove("hidden");
		videos[i].children[0].scr=videos[i].children[0].target;
		
	}else{
		el.parentNode.nextElementSibling.classList.add("hidden");
	}
	
}
function hideTOC(){
	let k=0;
	try{
		let tabs=document.getElementById("toc").children[0].children;
		for(let i=6;i<tabs.length;i++){
			tabs[i].classList.add("hidden");
		}
	}catch(er){
		k++;
		setTimeout(hideTOC,k*100);
	}
	
	
}
function generateStepper(){
	// Get the parent element where the HTML will be appended
	

	// Create the main container
	const stepperContainer = document.createElement('p');
	stepperContainer.id = 'stepper-1';
	stepperContainer.className = 'stepper';
	stepperContainer.classList.add("alert");

	// Create the text container
	const textContainer = document.createElement('p');
	textContainer.className = 'stepper-text';
	textContainer.textContent = 'This is a sample text.';
	stepperContainer.appendChild(textContainer);

	// Create the chevron up button
	const chevronUpButton = document.createElement('div');
	chevronUpButton.classList.add("step-chevron-down");
	const chevronUpSvg = document.createElementNS('http://www.w3.org/2000/svg', 'svg');
	chevronUpSvg.setAttribute('aria-hidden', 'true');
	chevronUpSvg.classList.add('svg-icon');
	const chevronUpPath = document.createElementNS('http://www.w3.org/2000/svg', 'path');
	chevronUpPath.setAttribute('d', 'M2 25h32L18 9 2 25Z');
	chevronUpPath.addEventListener("click", onStepperArrowClicked.bind(chevronUpPath));
	chevronUpSvg.appendChild(chevronUpPath);
	chevronUpButton.appendChild(chevronUpSvg);
	// Create the step counter
	const stepCounter = document.createElement('div');
	stepCounter.className = 'step-counter';
	stepCounter.textContent = '1.';
	

	// Create the chevron down button
	const chevronDownButton = document.createElement('div');
	chevronDownButton.classList.add("step-chevron-up");
	const chevronDownSvg = document.createElementNS('http://www.w3.org/2000/svg', 'svg');
	chevronDownSvg.setAttribute('aria-hidden', 'true');
	chevronDownSvg.classList.add('svg-icon');
	const chevronDownPath = document.createElementNS('http://www.w3.org/2000/svg', 'path');
	chevronDownPath.setAttribute('d', 'M2 11h32L18 27 2 11Z');
	chevronDownPath.addEventListener("click", onStepperArrowClicked.bind(chevronDownPath));
	chevronDownSvg.appendChild(chevronDownPath);
	chevronDownButton.appendChild(chevronDownSvg);

	// Append the buttons to the chevron div
	const chevronDiv = document.createElement('div');
	chevronDiv.className = 'step-chevron-div';
	chevronDiv.appendChild(chevronUpButton);
	chevronDiv.appendChild(stepCounter);
	chevronDiv.appendChild(chevronDownButton);
	stepperContainer.appendChild(chevronDiv);



	return stepperContainer;
}
function onStepperArrowClicked(arrow){
	arrow=arrow.target;
	let counter=Number(arrow.parentElement.parentElement.parentElement.children[1]);
	if(arrow.parentElement.parentElement.classList.contains("step-chevron-down")){
		arrow.parentElement.parentElement.parentElement.children[1].innerHTML=counter+1;
	}else{
		arrow.parentElement.parentElement.parentElement.children[1].innerHTML=counter-1;
	}
}
function lumos(){
	let tabs=document.getElementById("toc").children[0].children;
		for(let i=0;i<tabs.length;i++){
			tabs[i].classList.remove("hidden");
		}
}
window.addEventListener('load', 
  preprocess(), false);
