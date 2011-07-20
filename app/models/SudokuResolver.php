<?php
namespace SudokuResolver;
class SudokuResolver
{
	public static function resolve(SudokuBoard $unsolved)
	{
		$cmd = "/usr/bin/prolog -q -f prolog/sudoku.pl -g 'sudoku(".
    $unsolved->toString().
    ",_),halt.'";
		$output = exec($cmd);

    return SudokuBoard::fromString($output);
	}
}
?>
