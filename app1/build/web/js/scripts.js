function changeField(id){
    if(!$(".masc-id-"+id).hasClass("editing-field")){
        $(".editing-field input,.editing-field textarea,.editing-field select").hide();
        $(".editing-field span,.editing-field input[type='button']").show();
        $(".masc-id-"+id+" span").hide();
        $(".masc-id-"+id+" input,.masc-id-"+id+" textarea,.masc-id-"+id+" select").show();
        $(".masc-id-"+id).addClass("editing-field");
        $(".masc-id-"+id+" .edit-btn").val("Cancelar");
        $(".masc-id-"+id+" .save-edit-btn").show();
    }else{
        $(".masc-id-"+id+" input,.masc-id-"+id+" textarea,.masc-id-"+id+" select").hide();
        $(".masc-id-"+id+" span,.masc-id-"+id+" input[type='button']").show();
        $(".masc-id-"+id).removeClass("editing-field");
        $(".masc-id-"+id+" .edit-btn").val("Editar");
        $(".masc-id-"+id+" .save-edit-btn").hide();

    }
}