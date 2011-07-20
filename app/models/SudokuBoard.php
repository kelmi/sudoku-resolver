<?php
namespace SudokuResolver;

class SudokuBoard
{
  public static function fromString($board)
  {
    (string) $board;
    $sb = new SudokuBoard();
    $sb->stringInitialize($board);
    return $sb;
  }

  public static function fromArray(array $board)
  {
    $sb = new SudokuBoard();
    $sb->arrayInitialize($board);
    return $sb;
  }

  public function toString()
  {
    $arr = array();
    foreach ($this->board as $cell) {
      if ($cell) {
        $arr[] = $cell;
      } else {
        $arr[] = '_';
      }
    }
    $boardString = implode(',', $arr);
    
    return "[".$boardString."]";
  }

  public function toArray()
  {
    $arr = array();
    $i = 0;
    $arr[$i] = array();
    $len = count($this->board);
    for ($j=0; $j<$len; $j++) {
      if ($j % 9 == 0 && $j != 0) {
        $i++;
        $arr[$i] = array();
      }
      $arr[$i][] = $this->board[$j];
    }
    return $arr;
  }

  private function stringInitialize($s)
  {
    (string) $s;
    $trimmed = trim($s, '][');
    $this->board = explode(',', $trimmed);
  }

  /**
   * @param $a, a 9x9 array
   */
  private function arrayInitialize(array $a)
  {
    $this->board = array();
    array($a);
    foreach ($a as $row) {
      array($row);
      foreach ($row as $cell) {
        $this->board[] = $cell;
      }
    }
  }

  private $board;

}
?>
