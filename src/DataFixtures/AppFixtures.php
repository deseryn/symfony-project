<?php

namespace App\DataFixtures;

use App\Entity\MicroPost;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        // $product = new Product();
        // $manager->persist($product);
        $microPost1 = new MicroPost();
        $microPost1->setTitle('Micropost 1');
        $microPost1->setText('text 1');
        $microPost1->setCreated(new \DateTime());
        $manager->persist($microPost1);

        $microPost2 = new MicroPost();
        $microPost2->setTitle('Micropost 2');
        $microPost2->setText('text 2');
        $microPost2->setCreated(new \DateTime());
        $manager->persist($microPost2);

        $manager->flush();
    }
}
