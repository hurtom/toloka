<?php

class UserLoginCest
{
    const TOPMENU_SELECTOR = '.topmenu';

    public function _before(AcceptanceTester $I)
    {
    }

    public function _after(AcceptanceTester $I)
    {
    }

    public function canLogin(AcceptanceTester $I)
    {
        $I->wantTo('login to website');
        $I->amOnPage('/login.php');
        $I->fillField('login_username', 'admin');
        $I->fillField('login_password', 'admin');
        $I->click('login');
        $I->dontSeeElement('.error');
        $I->see('Домашня');
        $I->see('Ласкаво просимо', self::TOPMENU_SELECTOR);
        $I->see('admin', self::TOPMENU_SELECTOR);
        $I->see('Вихід', self::TOPMENU_SELECTOR);
    }

    public function canLoginOnFrontpage(AcceptanceTester $I)
    {
        $I->wantTo('login to website from the frontpage');
        $I->amOnPage('/');
        $I->see('Ім\'я користувача');
        $I->see('Пароль');
        $I->fillField('login_username', 'admin');
        $I->fillField('login_password', 'admin');
        $I->click('login');
        $I->dontSeeElement('.error');
        $I->see('Домашня');
        $I->see('Ласкаво просимо', self::TOPMENU_SELECTOR);
        $I->see('admin', self::TOPMENU_SELECTOR);
        $I->see('Вихід', self::TOPMENU_SELECTOR);
    }
}
