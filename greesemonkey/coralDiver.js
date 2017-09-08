// ==UserScript==
// @name         Coral Diver Copy Request URL
// @namespace    optimus.assetlifecycle.tampermonkey
// @version      0.1
// @description  Get a URL representing the Coral Diver request to save and share with others
// @author       jarntson@ jhilden@
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
        var sourceUrl = window.location.href;
        var url = sourceUrl.substr(0, sourceUrl.indexOf("explorer")) + "explorer/op/";
        var operation = $('#operation_chosen span')[0].innerHTML;
        url += operation.substr(0, operation.indexOf(' (...)'));

        var params = {};

        //ace is the built in editor tool, we have access to it.
        var editorText = ace.edit("request-input-editor").getValue();
        params.request = btoa(editorText);

        var endpoint = $('#target_uri_chosen span')[0].innerHTML;
        params.endpoint = encodeURIComponent(endpoint);

        params.protocol = $('#protocol').val();
        params.auth = $('#auth_type').val();
        params.cardinality = $("#execution-behavior").val();

        copyToClipboard(url + "?" + $.param(params));
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
