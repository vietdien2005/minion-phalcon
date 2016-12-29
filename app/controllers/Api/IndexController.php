<?php

namespace Controllers\Api;

/**
 * Class IndexController.
 *
 * @package Api\Controller
 */
class IndexController extends \Api\Controller\RestController
{
    /**
     * API start page.
     *
     * @throws \Api\Exception\NotImplementedException
     */
    public function indexAction()
    {
        $payload = new \Models\Api\Payload('Welcome to api for minion-cms!');

        $this->render($payload);
    }
}
