<?php
use SudokuResolver\SudokuResolver,
    SudokuResolver\SudokuBoard;

require('/usr/local/lib/php/smarty/Smarty.class.php');
require_once 'app/models/SudokuBoard.php';
require_once 'app/models/SudokuResolver.php';

$smarty = new Smarty();

$smarty->setTemplateDir('./smarty/templates');
$smarty->setCompileDir('./smarty/templates_c');
$smarty->setCacheDir('./smarty/cache');
$smarty->setConfigDir('./smarty/configs');

function post_req(&$smarty)
{
  $board = array();
  
  for ($i=1; $i<10; $i++) {
    $board[$i] = array();
    for ($j=1; $j<10; $j++) {
      if ($_POST["$i$j"]) {
        $board[$i][] = (int) $_POST["$i$j"];
      } else {
        $board[$i][] = '';
      }
    }
  }
  $solved = SudokuResolver::resolve(SudokuBoard::fromArray($board));
  $smarty->assign('solved', $solved->toArray());

  $smarty->display('solved.tpl');
}

function get_req(&$smarty)
{
  $smarty->display('index.tpl');
}

switch ($_SERVER['REQUEST_METHOD']) {
  case 'POST':
    post_req($smarty);
    break;
  case 'GET':
    get_req($smarty);
    break;
}

?>
