<?php

use Behat\Behat\Context\ClosuredContextInterface,
    Behat\Behat\Context\TranslatedContextInterface,
    Behat\Behat\Context\BehatContext,
    Behat\Behat\Exception\PendingException;
use Behat\Gherkin\Node\PyStringNode,
    Behat\Gherkin\Node\TableNode;
use SudokuResolver\SudokuBoard,
    SudokuResolver\SudokuResolver;

//
// Require 3rd-party libraries here:
//
//   require_once 'PHPUnit/Autoload.php';
//   require_once 'PHPUnit/Framework/Assert/Functions.php';
//
require_once 'app/models/SudokuBoard.php';
require_once 'app/models/SudokuResolver.php';

/**
 * Features context.
 */
class FeatureContext extends BehatContext
{
  /**
   * Initializes context.
   * Every scenario gets it's own context object.
   *
   * @param   array   $parameters     context parameters (set them up through behat.yml)
   */
  public function __construct(array $parameters)
  {
    // Initialize your context here
  }

  private $boardStore;

  /**
   * @When /^I enter the following partially completed sudoku to the resolver:$/
   */
  public function iEnterTheFollowingPartiallyCompletedSudokuToTheResolver(TableNode $sudokuBoard)
  {
    $board = array();
    foreach ($sudokuBoard->getHash() as $row) {
      $sudokurow = array(
        $row['a'],
        $row['b'],
        $row['c'],
        $row['d'],
        $row['e'],
        $row['f'],
        $row['g'],
        $row['h'],
        $row['i']
        );
      $board[] = $sudokurow;
    }
    $this->boardStore = SudokuBoard::fromArray($board);
  }

  /**
   * @Then /^the resolver should solve the sudoku like this:$/
   */
  public function theResolverShouldSolveTheSudokuLikeThis(TableNode $sudokuBoard)
  {
    $expected = array();
    foreach ($sudokuBoard->getHash() as $row) {
      $sudokurow = array(
        $row['a'],
        $row['b'],
        $row['c'],
        $row['d'],
        $row['e'],
        $row['f'],
        $row['g'],
        $row['h'],
        $row['i']
        );
      $expected[] = $sudokurow;
    }
    $expectedBoard = SudokuBoard::fromArray($expected);
    $actualBoard = SudokuResolver::resolve($this->boardStore);
    if ((string) $expectedBoard->toString() !== $actualBoard->toString()) {
      throw new Exception(
          "Actual board is:\n" . $actualBoard->toString()
          );
    }
  }
}
