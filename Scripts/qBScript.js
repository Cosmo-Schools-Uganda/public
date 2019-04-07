
var currentcnt=1;
var iseven=false;
var cnty = 1;




$(document).ready(function() {
   

   var y=0;
   
   $('.combo option').remove();
   
   for(y=1;y<=5;y++){
	   
	    $('.combo').append('<option value='+y+'>'+y+'</option>');
	 
   }
   
 });
 
 
 $('#mainchk').on('change',function(){
	 
	 
	if(this.checked){
		
		
	$('.ia').prop('checked',true);
		
		
	} 
	
	else{
		
		$('.ia').prop('checked',false);
	}
	 
 });
 
 $('.combo').on('change',function(){
	
	 
	  $( ".combo option:selected" ).each(function() {
	 
	 	 var selectedvalue= $(this).text();
	 
		//if(currentcnt==0){
	
            
		//	$('.ObjectiveGen tr:not(#header_row)').remove();

		//	OptionCount(0, selectedvalue);
			
		//	currentcnt=selectedvalue;
			
		//}
	 
	if(selectedvalue>currentcnt){
	
	
	//OptionCount(currentcnt,selectedvalue);
	
	    
	 	currentcnt=selectedvalue;
			
		}
		 
		 
		 else if(selectedvalue<currentcnt){
			 
			 
			 var conf=confirm("There is information filled in here, Are you sure you want to remove these rows ?");
			 
			 if (conf=true)
			 {
					//DeleteOptions(selectedvalue,currentcnt);
				 currentcnt=selectedvalue;

			}

			else{
	
	
	
				}			 
		
		 
		 
		 }
	
	 });
	 
	 
	 
 });


 function DeleteOptions(start,cnt){
	 
	 var x=cnt;
	 var y=start;
	 var i;
	
	 for(i=cnt;i>start;i--){
		 
	    
	     $('.ObjectiveGen tr').eq(i).css({ 'visibility': 'hidden' });
		 
	 }
	 
 }

 
function OptionCount(start,cnt){
	
	var elems=['A','B','C','D','E','F','G'];
	
	var x=cnt;
	var y=start;
	var i;
	
	
	for(i=start;i<=x;i++){
		
		
		//$('.ObjectiveGen tbody').append($('<tr style="width:100%; height:10%;"><td class="rowdata"><input type="checkbox" class="ia" style="position:relative; right:160%;" class="ia"></td><td class="rowdata" style="width:15%;">'+elems[i]+'</td><td id="inp" style="width:70%;"><input type="text" style="width:100%;" id="text'+i+'"/></td><td style="width:15%;"><input type="radio" name="answerradio" /></td></tr>'))
    $('.ObjectiveGen tr').eq(i).css({ 'visibility': 'visible'});

	  //$('tr td:not(#inp)').addClass("mitu_center");
	
	
	}
	
	
}



$('#mn').on('click',function(){
	
    $('.ObjectiveGen tr:not(#header_row)').remove();
  
    currentcnt = 0;
    $('.combo').innerHtml = "";
    cnty = cnty + 1;
	
	//$('#qt').text("Qtn: "+ cnty);
	
	//$('#qt').append('<a href="#"><b>Hello Africa</b></a>');
	
});

$('#prev').on('click', function () {

    if (cnty > 1) {

        cnty = cnty - 1;

        $('#qt').text("Qtn: " + cnty);

    }



   

    //$('#qt').append('<a href="#"><b>Hello Africa</b></a>');

});
/* function doit(){
	
	document.getElementById('demo').innerHTML = "Hello World";
	
	var txt=document.getElementById('qt');
	
	txt.innerHTML="Hello World";
	
	OptionCount();
	
} */

//$('#del').on('click',function(){
    
//    deleteData(2);

//});

    function deleteData(selectedindex) {

        var SelecteddataValue = $('.rowdata:eq('+selectedindex+') .txt');

        var conf = confirm("Are You Sure you want to delete the data Selected?");

        if (conf == true) {

            SelecteddataValue.text().remove();

        }

        else {


        }
       
    }
 