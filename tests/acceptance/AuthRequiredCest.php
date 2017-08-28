<?php

class AuthRequiredCest
{
    protected function login(AcceptanceTester $I)
    {
        $I->wantTo('login to website');
        $I->amOnPage('/login.php');
        $I->fillField('login_username', 'admin');
        $I->fillField('login_password', 'admin');
        $I->click('login');
        //$I->see('Домашня');
    }
}
