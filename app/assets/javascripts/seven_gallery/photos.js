$(function(){
    Dropzone.autoDiscover = false;

    var uploaderWrapper = $("#uploaderWrapper");
    uploaderWrapper.dropzone({
        url: uploaderWrapper.data("url"),
        paramName: uploaderWrapper.data("name"),
        init: function () {
            this.on("success", function (file, data) {
                if(this.getUploadingFiles().length === 0 && this.getQueuedFiles().length === 0){
                    window.location = data.return_url;
                }
            })
        }
    });
});