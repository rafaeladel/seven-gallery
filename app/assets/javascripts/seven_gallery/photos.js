var initUploader;
$(function () {
    Dropzone.autoDiscover = false;

    initUploader = function (options, callback) {
        var uploaderWrapper = $("#uploaderWrapper"),
            default_options = {
                url: uploaderWrapper.data("url"),
                paramName: uploaderWrapper.data("name"),
                init: function () {
                    this.on("success", function (file, data) {
                        if (this.getUploadingFiles().length === 0 && this.getQueuedFiles().length === 0) {
                            if (typeof callback === "function") {
                                callback(data);
                            } else {
                                window.location = data.return_url;
                            }
                        }
                    })
                }
            },
            final_options = merge_options(default_options, options);

        uploaderWrapper.dropzone(final_options);
    }

    $(".image_cropper").each(function () {
        var img = $(this),
            wrapper = img.closest(".image_wrapper");
        img.Jcrop({
            aspectRatio: 1,
            onSelect: function (coords) {
                updateCoords(img, wrapper, coords);
            },
            onChange: function (coords) {
                updateCoords(img, wrapper, coords);
            }
        });
    });

    function updateCoords(img, wrapper, coords) {
        wrapper.find(".crop_w").val(coords.w);
        wrapper.find(".crop_h").val(coords.h);
        wrapper.find(".crop_x").val(coords.x);
        wrapper.find(".crop_y").val(coords.y);
        updatePreview(img, wrapper, coords);
    }

    function updatePreview(img, wrapper, coords) {
        wrapper.find(".preview").css({
            width: Math.round(100 / coords.w * img.width()) + "px",
            height: Math.round(100 / coords.h * img.height()) + "px",
            marginLeft: "-" + Math.round(100 / coords.w * coords.x) + "px",
            marginTop: "-" + Math.round(100 / coords.h * coords.y) + "px"
        });
    }

    $(".photos_wrapper").sortable({
        cursor: "move",
        opacity: 0.5,
        update: function (e, ui) {
            var status_holder = $(e.target).find(".arrange_status");
            status_holder.show();
            $.ajax({
                type: "post",
                url: $(e.target).data("url"),
                data: $(e.target).sortable("serialize"),
                success: function (data) {
                    if (data.success) {
                        status_holder.hide();
                    } else {
                        status_holder.show().text("Error occurred.");
                    }
                }
            });
        }
    });

    function merge_options(obj1,obj2){
        var obj3 = {};
        for (var attrname in obj1) { obj3[attrname] = obj1[attrname]; }
        for (var attrname in obj2) { obj3[attrname] = obj2[attrname]; }
        return obj3;
    }

});