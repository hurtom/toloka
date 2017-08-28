<?php

class UserEditProfileCest extends AuthRequiredCest
{
    public function _before(AcceptanceTester $I)
    {
    }

    public function _after(AcceptanceTester $I)
    {
    }

    /**
     * Test if user can set empty user_birthday
     *
     * @see https://github.com/hurtom/toloka/issues/56
     *
     * @before login
     * @depends UserLoginCest:canLogin
     * @param AcceptanceTester $I
     */
    public function setEmptyBirthday(AcceptanceTester $I)
    {
        $I->wantTo('set user birthday to an empty string');
        $I->amOnPage('/profile.php?mode=editprofile');
        $I->see('Редагувати профіль');

        $I->fillField('user_birthday', '');
        $I->click('submit');
        $I->see('Ваш профіль оновлено');
    }

    /**
     * Test if user can set regular non-empty user_birthday
     *
     * Date strings supposed to be in ISO format `YYYY-MM-DD`,
     * eg. `1970-01-01`
     *
     * @see https://github.com/hurtom/toloka/issues/56
     *
     * @before login
     * @depends UserLoginCest:canLogin
     * @param AcceptanceTester $I
     */
    public function setNotEmptyBirthday(AcceptanceTester $I)
    {
        $I->wantTo('set user birthday to a regular non-empty date string');
        $I->amOnPage('/profile.php?mode=editprofile');
        $I->see('Редагувати профіль');

        $I->fillField('user_birthday', '1988-01-01');
        $I->click('submit');
        $I->see('Ваш профіль оновлено');
    }

    /**
     * Test wrong value(s) for user_birthday
     *
     * @before login
     * @depends UserLoginCest:canLogin
     * @param AcceptanceTester $I
     */
    public function setInvalidBirthday(AcceptanceTester $I)
    {
        $I->wantTo('set user birthday to an invalid date string');
        $I->amOnPage('/profile.php?mode=editprofile');
        $I->see('Редагувати профіль');

        $I->fillField('user_birthday', '0001-01-01');
        $I->click('submit');
        $I->seeElement('.error');

        $I->fillField('user_birthday', '01-01-0001');
        $I->click('submit');
        $I->seeElement('.error');

        // With current validation of date(s) in TP2 values like
        //    * `0000`
        //    * `XX-XX-YYYY`
        // will cause 500 server error
        $I->amOnPage('/profile.php?mode=editprofile');
        $I->fillField('user_birthday', '0001');
        $I->click('submit');
        $I->seeResponseCodeIs(500);

        $I->amOnPage('/profile.php?mode=editprofile');
        $I->fillField('user_birthday', '31-12-1988');
        $I->click('submit');
        $I->seeResponseCodeIs(500);

        $I->amOnPage('/profile.php?mode=editprofile');
        $I->fillField('user_birthday', '12-31-1988');
        $I->click('submit');
        $I->seeResponseCodeIs(500);
    }

    /**
     * Test zero-date '0000-00-00' for user_birthday
     *
     * @before login
     * @depends UserLoginCest:canLogin
     * @param AcceptanceTester $I
     */
    public function setZeroDateBirthday(AcceptanceTester $I)
    {
        $I->wantTo('set user birthday to a zero-date string');
        $I->amOnPage('/profile.php?mode=editprofile');
        $I->see('Редагувати профіль');

        $I->fillField('user_birthday', '0000-00-00');
        $I->click('submit');
        $I->see('Ваш профіль оновлено');
    }
}
