<?php

namespace App\Controller;

use App\Entity\Order;
use App\Entity\Pizza;
use App\Form\OrderType;
use App\Repository\PizzaRepository;
use App\Repository\CategoryRepository;
use MercurySeries\FlashyBundle\FlashyNotifier;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;



class HomeController extends AbstractController
{
    // private $categoryRepository;

    // public function __construct(CategoryRepository $categoryRepository)
    // {
    //     $this->$categoryRepository = $categoryRepository;
    // }

    #[Route('/', name: 'pizza_homepage')]
    public function index(CategoryRepository $categoryRepository): Response
    {

        $title = 'Pizza Sopranos';
        $categories = $categoryRepository->findAll();

        return $this->render('pizza/homepage.html.twig', ['categories' => $categories,  'title' => $title,]);
    }


    /**
     * @Route("/category/{id}", name="show_category")
     */

    public function showCategory(CategoryRepository $categoryRepository, $id)
    {

        $title = 'Category';
        $category = $categoryRepository->find($id);
        return $this->render('pizza/viewCategories.html.twig', [
            'category' => $category,
            'title' => $title,

        ]);
    }

    /**
     * @Route("/product/{id}", name="show_product")
     */

    public function showProduct(PizzaRepository $pizzaRepository, $id)
    {

        $title = 'Pizza';
        $product = $pizzaRepository->find($id);
        return $this->render('pizza/viewProduct.html.twig', [
            'product' => $product,

            'title' => $title,

        ]);
    }
}
