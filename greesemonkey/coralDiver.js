// ==UserScript==
// @name         Coral Diver Copy Request URL
// @namespace    optimus.assetlifecycle.tampermonkey
// @version      0.1
// @description  Get a URL representing the Coral Diver request to save and share with others
// @author       Jake Arntson & Jay Hilden
// @match        https://coral.amazon.com/*
// @grant        none
// ==/UserScript==

(function() {
    'use strict';
    var container = $('<div style="padding-bottom:10px;" />');
    var requestGroup = $('#request-group')[0];
    container.insertBefore(requestGroup);

    var input=document.createElement("input");
    input.type="button";
    input.value="Create Link To This Request";
    input.onclick = createUrl;

    var newButton = $(input);
    newButton.addClass("btn btn-large btn-success");
    container.append(newButton);

    var textbox = $(document.createElement("input"));
    textbox.hide();
    container.append(textbox);

    var msg = $('<span class="alert-info" style="display:none; margin-left:10px; font-size: 1.2em;">Link copied to clipboard!</span>');
    container.append(msg);


    function createUrl()
    {
        var url = window.location.href.substr(0, window.location.href.indexOf("explorer")) + "explorer/";
        var editor = ace.edit("request-input-editor");  
        url = url + "?request=" + btoa(editor.getValue());

        var endpoint = document.getElementById('target_uri_chosen').getElementsByTagName('span')[0].innerHTML;

        url = url + "&endpoint=" + encodeURIComponent(endpoint);

        copyToClipboard(url); 
    }

    function copyToClipboard(text) {
        textbox.val(text);
        textbox.show();
        textbox.select();        
        document.execCommand("copy");
        textbox.hide();
        msg.fadeIn();

        setTimeout(function(){
            msg.fadeOut("slow");
        },2000);

    }
})();

