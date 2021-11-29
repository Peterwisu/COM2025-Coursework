// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery_ujs
//= require jquery.validate
//= require activestorage
//= require turbolinks
//= require_tree .




$(document).ready(function() {
    
    validatecontact();

    toggleTheme();

});

//toggle web theme
function toggleTheme(){

    $('#checkbox').click(function(){
         //select body
        var element = document.body;         
        //check if body contain class 'body-dark;
        if(element.classList.contains("body-dark")){
            //call function light() to change theme to light mode    
            light();
        }else{
            //call function dark() to change theme to dark mode
            dark();
        }
    });

}

//Change a theme of a web page to light theme
function light(){


    
    //select body
    var element = document.body;    
    // remove class 'body dark' from a body          
    element.classList.remove("body-dark"); 
    //select all element with id 'linkcolorwhite'
    var tags = document.querySelectorAll('*[id^="linkcolorwhite"]');
        //run a loop throught all element with id'linkcolorwhite'
        for (var i = 0; i < tags.length; i++) {
            //change a font color
            tags.item(i).style.color= "black";
        }
}

//Change a theme of a web page to dark theme
function dark(){
        //select body
        var element = document.body;    
        //add class 'body dark' from a body
        element.classList.add("body-dark"); 
        //select all element with id 'linkcolorwhite'
        var tags = document.querySelectorAll('*[id^="linkcolorwhite"]');
             //run a loop throught all element with id'linkcolorwhite'
            for (var i = 0; i < tags.length; i++) {
                //change a font color
                tags.item(i).style.color= "white";
            }
}

function validatecontact(){

    //validate a form with id contact_form
    $("#contact_form").validate({
        
        //rule for validation fields
        rules:{
            name:{
                required: true
            },
            email:{
                required: true
               
            },
            telephone:{
                required: true
            },
            message:{
                required: true
            }
        },//message display if the form submit does not pass a requirement rules
        messages:{
            name:{
                required: "Name is required.Please fill your name"
            },
            email:{
                required: "Email is required.Please fill your email"
                
            },
            telephone:{
                required: "Phone number is required.Please fill your phone Number"
            },
            message:{
                required: "Please Fill your message"
            }

        },
        
        });
}