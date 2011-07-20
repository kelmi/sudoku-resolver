<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
   "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <title>Sudoku Resolver</title>
  </head>
  <body>
    <h3>Sudoku Resolver</h3>
    <p>One solution for your sudoku.</p>
    <table>
    {foreach $solved as $row}
      <tr>
      {foreach $row as $cell}
        <td>{$cell}</td>
      {/foreach}
      </tr>
    {/foreach}
    </table>
  </body>
</html>

