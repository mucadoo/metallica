<section>
    <article>
        <header id="head">
            <h1>Contato</h1>		
        </header>
        <form name="form">
            <p class="paragrafo">Entre em contato através do formulário abaixo:</p><br><br>
            <label for="firstname"> Seu nome:<br> </label>
            <input type="text" name="firstname" id="firstname"><br><br>
            <label for="email"> E-mail:<br> </label>
            <input type="text" name="email" id="email"><br><br>
            <label for="assunto">Assunto:<br> </label>
            <input type="text"  name="assunto" id="assunto">
            <p class="paragrafo" style="top:0px">Mensagem:</p><br>
            <textarea rows="10" cols="30" id="msg" style="top:-20px"></textarea><br>
            <input type="button"  onclick="myFunction();
                   "style="left:30px" value="Enviar" />
            <p id="demo" style="left:30px"></p>
        </form>
    </article>
</section>