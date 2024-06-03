<?php

namespace App\Controller;

use App\Repository\BookRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Attribute\Route;

class BookController extends AbstractController
{
    public function __construct(private readonly BookRepository $bookRepository)
    {
    }

    #[Route('/books', name: 'all', methods: ['GET'])]
    public function all(): JsonResponse
    {
        $data = $this->bookRepository->findAll();

        return $this->json($data);
    }

    #[Route('/books/{id}', name: 'book', methods: ['GET'])]
    public function getById(): JsonResponse
    {
        return $this->json(
            [
                'message' => 'Welcome to your new controller!',
                'path' => 'src/Controller/BookController.php',
            ]
        );
    }
}
