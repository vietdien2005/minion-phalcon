<?php

namespace Controllers\Api;

/**
 * Class RestController.
 * Base class for all controllers for REST API.
 *
 * @package Api\Controller
 */
class RestController extends \Application\Mvc\Controller
{

    /**
     * Render data from payload
     *
     * @throws \Api\Exception\NotImplementedException
     *
     * @return \Phalcon\Http\ResponseInterface
     */
    protected function render(\Models\Api\Payload $payload)
    {
        $format = $this->request->getQuery('format', null, 'json');

        switch ($format)
        {
            case 'json':
                $contentType = 'application/json';
                $encoding = 'UTF-8';
                $content = json_encode($payload->toArray());
                break;
            default:
                throw new \Api\Exception\NotImplementedException(
                    sprintf('Requested format %s is not supported yet.', $format)
                );
                break;
        }

//        $this->response->setStatusCode(200, 'OK');
        $this->response->setContentType($contentType, $encoding);
        $this->response->setContent($content);

        return $this->response->send();
    }
}
