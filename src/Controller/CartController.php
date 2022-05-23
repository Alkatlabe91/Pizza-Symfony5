<?php

namespace App\Controller;


use App\Entity\User;
use App\Entity\Order;
use App\Entity\Pizza;
use App\Form\OrderType;
use App\Repository\UserRepository;
use App\Repository\OrderRepository;
use App\Repository\PizzaRepository;
use App\Repository\CategoryRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Security\Core\Security;
use MercurySeries\FlashyBundle\FlashyNotifier;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class CartController extends AbstractController
{

    private $security;
     public function __construct(Security $security)
     {
         $this->security = $security;
     }

    /**
     * @Route("/order/{id}", name="order");
     */
    public function order(EntityManagerInterface $em, Request $request, Pizza $pizza, ManagerRegistry $managerRegistry, FlashyNotifier $flashyNotifier)
    {

        $pizzaName = $pizza->getName();
        
        $em = $managerRegistry->getManager();
        $order = new Order();

        $order->setStatus("in progress");

        $form = $this->createForm(OrderType::class, $order);
        $form->handleRequest($request);

        $order->setPizza($pizza);

        if ($form->isSubmitted() && $form->isValid()) {
            $order->setUser($this->security->getUser());
            $em->persist($order);
            $em->flush();
            $flashyNotifier->success('We have received your order');
            return $this->redirectToRoute('pizza_homepage');
        }
        return $this->render('cart/index.html.twig', [
            'orderform' => $form->createView(),
            'pizza' => $pizzaName,
            
        ]);
    }
    /**
     * @Route("/overview", name="order_show");
     */
    public function orderShow(OrderRepository $orderRepository, EntityManagerInterface $em, UserRepository $usersRepository, UserInterface $user):Response
    {
        
        $users = $usersRepository->findAll();
 ;
        $user = $this->getUser()->getOrders();
        
        return $this->render('cart/orderShow.html.twig',[
 
            'user' => $user,
          
        ]);
    }
}
