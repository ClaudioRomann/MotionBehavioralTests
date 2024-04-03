<?php

declare(strict_types=1);

namespace Tests\Support;

use Codeception\Attribute\Given;
use Codeception\Attribute\When;
use Codeception\Attribute\Then;

/**
 * Inherited Methods
 * @method void wantTo($text)
 * @method void wantToTest($text)
 * @method void execute($callable)
 * @method void expectTo($prediction)
 * @method void expect($prediction)
 * @method void amGoingTo($argumentation)
 * @method void am($role)
 * @method void lookForwardTo($achieveValue)
 * @method void comment($description)
 * @method void pause($vars = [])
 *
 * @SuppressWarnings(PHPMD)
*/
class AcceptanceTester extends \Codeception\Actor
{
    use _generated\AcceptanceTesterActions;

    /**
     * @Given I am on the login page
     */
    public function iAmOnTheLoginPage()
    {
        $this->amOnPage('/');
        $this->waitForElementVisible('#app-logo', 10);
    }

    /**
     * @When I click Login button
     */
    public function iClickLoginButton()
    {
        $this->click('#login-button-btnWrap');
        $this->wait(10);
    }

    /**
     * @Then I should see :arg1
     */
    public function iShouldSee($arg1)
    {
        $this->waitForElementVisible('#ext-gen1547 > div:nth-child(1) > span:nth-child(4)', 10);
    }

    /**
     * @When I fill in Email-Address with :arg1 shortName
     */
    public function iFillInEmailAddressWithShortName($arg1)
    {
        $this->fillField('#textfield-1013-inputEl', $arg1);
    }

    /**
     * @When I fill in Password with :arg1
     */
    public function iFillInPasswordWith($arg1)
    {
        $this->fillField('#textfield-1014-inputEl', $arg1);
    }

    /**
     * @When I click on the Dispatching link
     */
    public function iClickOnTheDispatchingLink()
    {
        $this->click('div.ws-component-item:nth-child(1) > div:nth-child(1) > div:nth-child(3)');
    }

}
