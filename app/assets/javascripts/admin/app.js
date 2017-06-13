(function($) {
    // 定义APP
    window.App || (window.App = {});

    $(document).on("page:change",function(){
        //定义一下页面上要执行的方法
        var body=$("body")
        var controller=body.data("controller");
        var action=body.data('action').replace(/\s/g,"_")
        if(window.App[controller]){
            // controller 开始时通用
            if(window.App[controller]['before'] && typeof(window.App[controller]['before'])==='function'){
                //console.log('before controller');
                window.App[controller]['before']();
            }

            if(window.App[controller][action] && typeof(window.App[controller][action])==='function'){
                // beforeAction
                if(window.App[controller]['beforeAction'] && typeof(window.App[controller]['beforeAction'])==='function'){
                    //console.log('beforeAction');
                    window.App[controller]['beforeAction']();
                }
                window.App[controller][action]();
                // afterAction
                if(window.App[controller]['afterAction'] && typeof(window.App[controller]['afterAction'])==='function'){
                    //console.log('afterAction');
                    window.App[controller]['afterAction']();
                }
            }

            // controller 结束时通用
            if(window.App[controller]['after'] && typeof(window.App[controller]['after'])==='function'){
                //console.log('after controller');
                window.App[controller]['after']();
            }
        }

        var CSRF_token=$('meta[name="csrf-token"]').attr('content')

        console.log(CSRF_token)
        // 展开菜单处理一下
        // $('#side-menu').metisMenu();


            $(".MyEditor").froalaEditor({
                language:"zh_cn",
                imageManagerDeleteURL:"/admin/image_delete",
                fileUploadURL:"/admin/upload",
                imageUploadURL:"/admin/image_upload",
                imageManagerLoadURL:"/admin/image_manage",
                fileUploadParams:{
                    authenticity_token:CSRF_token
                },
                imageUploadParams:{
                    authenticity_token:CSRF_token
                }
            })

        if($("#template_content").length>0) {
            var editor = CodeMirror.fromTextArea(document.getElementById("template_content"), {
                mode: "application/x-erb",
                lineWrapping: true,
                styleActiveLine: true, //line选择是是否加亮
                lineNumbers: true
            });
            editor.setSize('auto', 'auto');
        }


    })
})(jQuery);
