<?php

namespace Controllers\Admin;

use Application\Mvc\Controller;
use Models\Admin\AdminUser;
use Requests\Admin\LoginForm;
use Phalcon\Mvc\View;

class IndexController extends Controller
{

    public function indexAction()
    {
        $this->setAdminEnvironment();
        $this->view->languages_disabled = true;

        $auth = $this->session->get('auth');
        if (!$auth || !isset($auth->admin_session) || !$auth->admin_session) {
            $this->flash->notice($this->helper->at('Log in please'));
            $this->redirect($this->url->get() . 'admin/index/login');
        }

        $admin = AdminUser::findFirst("login = 'admin'");
        if ($admin) {
            $this->flash->warning($this->helper->at('Found admin'));
        }

        $this->view->bello = 'Minion';

        $this->helper->title($this->helper->at('MinionCms Dashboard'), true);

        $this->helper->activeMenu()->setActive('admin-home');

    }

    public function loginAction()
    {
        $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);

        $form = new LoginForm();

        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                if ($form->isValid($this->request->getPost())) {
                    $login = $this->request->getPost('login', 'string');
                    $password = $this->request->getPost('password', 'string');
                    $user = AdminUser::findFirst("login='$login'");
                    if ($user) {
                        if ($user->checkPassword($password)) {
                            if ($user->isActive()) {
                                $this->session->set('auth', $user->getAuthData());
                                $this->flash->success($this->helper->translate("Welcome to the administrative control panel!"));
                                return $this->redirect($this->url->get() . 'admin');
                            } else {
                                $this->flash->error($this->helper->translate("User is not activated yet"));
                            }
                        } else {
                            $this->flash->error($this->helper->translate("Incorrect login or password"));
                        }
                    } else {
                        $this->flash->error($this->helper->translate("Incorrect login or password"));
                    }
                } else {
                    foreach ($form->getMessages() as $message) {
                        $this->flash->error($message);
                    }
                }
            } else {
                $this->flash->error($this->helper->translate("Security errors"));
            }
        }

        $this->view->form = $form;

    }

    public function logoutAction()
    {
        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                $this->session->remove('auth');
            } else {
                $this->flash->error("Security errors");
            }
        } else {
            $this->flash->error("Security errors");
        }
        $this->redirect($this->url->get());
    }

}
