<?php
if (!isset($sessUsr)) {
    echo "<h1>You need to be logged in to access this page</h1>";
} else {
    ?>
    <section>
        <article>
            <header id="head">
                <h1 style="left:40px">Post Article</h1>
            </header>
            <form method="post" enctype="multipart/form-data">
                <label for="postNome">Name:</label><br>
                <input type="text" name="postNome" id="postNome" required><br><br>
                <label for="postImg">Image:</label><br>
                <input type="file" name="postImg" id="postImg" required><br><br>
                <label for="p1">Paragraph 1:</label><br>
                <textarea name="p1" id="p1" required></textarea><br><br>
                <button id="delPar">Delete Last Paragraph</button>
                <button id="addPar">Add Paragraph</button>
                <input type="submit" value="Post">
                <p id="demo" style="left:30px"></p>
            </form>
        </article>
    </section>
    <?php
}
?>