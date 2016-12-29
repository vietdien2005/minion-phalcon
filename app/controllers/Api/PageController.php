<?php

namespace Controllers\Api;

/**
 * Class PageController.
 * Class is responsible for handling Page entity via REST API.
 *
 * @package Api\Controller
 */
class PageController extends \Api\Controller\RestController
{
    /**
     * Action responsible to display info about single page entity.
     *
     * @return \Phalcon\Http\ResponseInterface
     * @throws \Api\Exception\NotImplementedException
     */
    public function getAction()
    {
        //get entity from storage
        $pageId = (int) $this->request->getQuery('pageId');
        $page = \Models\Page\Page::findFirst($pageId);
        if (!$pageId || !$page) {
            return $this->render(new \Api\Model\Payload(null, sprintf('Page with id: %s was not found.', $pageId)));
        }

        //filter required data for display
        $filter = new \Api\Filter\Page();
        $payload = new \Models\Api\Payload($filter->filter($page));

        return $this->render($payload);
    }

    /**
     * Action responsible to display a list of pages with required data.
     *
     * @return \Phalcon\Http\ResponseInterface
     * @throws \Api\Exception\NotImplementedException
     */
    public function listAction()
    {
        $pages = \Models\Page\Page::find();
        $filter = new \Api\Filter\PagesList();
        $payload = new \Models\Api\Payload($filter->filter($pages));

        return $this->render($payload);
    }
}
