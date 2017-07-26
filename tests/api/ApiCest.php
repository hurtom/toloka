<?php
class ApiCest
{
    public function tryApi(ApiTester $I)
    {
        $I->sendGET('/');
        $I->seeResponseCodeIs(200);
        //$I->seeResponseIsJson();
    }
}
