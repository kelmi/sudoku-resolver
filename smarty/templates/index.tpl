<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
   "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <title>Sudoku Resolver</title>
  </head>
  <body>
    <h3>Sudoku Resolver</h3>
    <p>Fill in the sudoku table below, leave as many blank cells as you need.</p>
    <form method="POST" action="index.php">
    <table>
    {for $i = 1 to 9}
      <tr>
      {for $j = 1 to 9}
        <td><input type="text" size="2" name="{$i}{$j}"/></td>
      {/for}
      </tr>
    {/for}
    </table>
    <input type="submit" value="Submit"/>
    </form>
  </body>
</html>
