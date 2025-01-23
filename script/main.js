function switchBanner() {
    var n = $('#header').attr("src");
    n = parseInt(n.slice(n.length - 5, n.length - 4));
    var nn = n == 3 ? 1 : n + 1;
    $('#header')
        .fadeOut(400, function () {
            $('#header').attr('src', $('#header').attr("src").replace(n, nn));
        })
        .fadeIn(400);
    setTimeout("switchBanner()", 5000);
}

$(document).ready(function () {

    //Banner
    setTimeout("switchBanner()", 5000);

    //Inserir Comentário
    $('#postCom').submit(function () {
        if (!confirm("Post comment?")) {
            return false;
        }
    });

    //Editar comentário
    $('.editarCom').click(function () {
        $(this).parent().next().children("textarea")
            .prop('disabled', false)
            .focus();
        $(this).parent().next().children("input[name=actionCom]").val("editar");
        $(this).hide();
        $(this).siblings(".excluirCom").hide();
        $(this).siblings(".atualizarCom").show();
        $(this).siblings(".cancelarCom").show();
    });

    $('.atualizarCom').click(function () {
        if (confirm("Update comment?")) {
            $(this).parent().next().submit();
        }
    });

    $('.cancelarCom').click(function () {
        $(this).parent().next().children("textarea").prop('disabled', true);
        $(this).siblings(".atualizarCom").hide();
        $(this).hide();
        $(this).siblings(".editarCom").show();
        $(this).siblings(".excluirCom").show();
    });

    //Excluir comentário
    $('.excluirCom').click(function () {
        if (confirm("Are you sure you want to delete this comment?")) {
            $(this).parent().next().children("input[name=actionCom]").val("excluir");
            $(this).parent().next().submit();
        }
    });

    //Adicionar Parágrafo
    $('#addPar').click(function () {
        var seq = parseInt($(this).prevAll("textarea:first").attr("name").slice(1)) + 1;
        $(this).prev().before('<label for="p' + seq + '">Paragraph ' + seq + ':</label><br><textarea name="p' + seq + '" id="p' + seq + '" required></textarea><br><br>');
        return false;
    });

    //Excluir Parágrafo
    $('#delPar').click(function () {
        if ($(this).prevAll("textarea:first").attr("name").slice(1) != "1") {
            $(this).prevAll("label:first, textarea:first, br:first, br:eq(1), br:eq(2)").remove();
        }
        return false;
    });

});
