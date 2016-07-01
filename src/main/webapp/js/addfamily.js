
   function edit_row(no)
{
 document.getElementById("edit_button"+no).style.display="none";
 document.getElementById("save_button"+no).style.display="block";
 var sno = document.getElementById("sno_row"+no);
 var name=document.getElementById("name_row"+no);
 var education = document.getElementById("education_row"+no);
 var about = document.getElementById("about_row"+no);
 var photo = document.getElementById("photo_row"+no);
 
  var sno_data =sno.innerHTML;
  var name_data=name.innerHTML;
  var education_data= education.innerHTML;
  var about_data = about.innerHTML;
  var photo_data = photo.innerHTML;
  
  sno.innerHTML="<input type='text' id='sno_text"+no+"' value='"+sno_data+"'>";
  name.innerHTML="<input type='text' id='name_text"+no+"' value='"+name_data+"'>";
  education.innerHTML="<input type='text' id='education_text"+no+"' value='"+education_data+"'>";
  about.innerHTML="<input type='text' id='about_text"+no+"' value='"+about_data+"'>";
  photo.innerHTML="<input type='file' id='photo_img"+no+"' value='"+photo_data+"'>";
  }
  
  
  function save_row(no)
  
  {
  
  var sno_val = document.getElementById("sno_text"+no).value;
  var name_val=document.getElementById("name_text"+no).value;
  var education_val=document.getElementById("education_text"+no).value;
  var about_val=document.getElementById("about_text"+no).value;
  var photo_val = document.getElementById("photo_img"+no).value;

  document.getElementById("sno_row"+no).innerHTML=sno_val;
  document.getElementById("name_row"+no).innerHTML=name_val;
  document.getElementById("education_row"+no).innerHTML=education_val;
  document.getElementById("about_row"+no).innerHTML=about_val;
  document.getElementById("photo_row"+no).innerHTML=photo_val;
  
  document.getElementById("edit_button"+no).style.display="block";
  document.getElementById("save_button"+no).style.display="none";
  
}
  
  function delete_row(no)
{
 document.getElementById("row"+no+"").outerHTML="";
}

function add_row()
{
var new_sno = document.getElementById("new_sno").value;
var new_name=document.getElementById("new_name").value;
var new_education = document.getElementById("new_education").value;
var new_about = document.getElementById("new_about").value;
var new_photo = document.getElementById("new_photo").value;

 var table=document.getElementById("data_table");
 var table_len=(table.rows.length)-1;
 var row = table.insertRow(table_len).outerHTML="<tr id='row"+table_len+"'><td id='sno_row"+table_len+"'>"+new_sno+"</td><td id='name_row"+table_len+"'>"+new_name+"</td><td id='education_row"+table_len+"'>"+new_education+"</td><td id='about_row"+table_len+"'>"+new_about+"</td><td id='photo_row"+table_len+"'>"+new_photo+"</td><td><input type='button' id='edit_button"+table_len+"' value='Edit' class='edit' onclick='edit_row("+table_len+")'> <input type='button' id='save_button"+table_len+"' value='Save' class='save' onclick='save_row("+table_len+")'> <input type='button' value='Delete' class='delete' onclick='delete_row("+table_len+")'></td></tr>";
 document.getElementById("new_sno").value=""; 
 document.getElementById("new_name").value="";
 document.getElementById("new_education").value="";
 document.getElementById("new_about").value="";
 document.getElementById("new_photo").value="";
 }
 
   
   