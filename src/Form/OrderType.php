<?php

namespace App\Form;

use App\Entity\Size;
use App\Entity\Order;
use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;

class OrderType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('fname', TextType::class , ['label' => 'First name'])
            ->add('sname', TextType::class, ['label' => 'Surname'])
            ->add('address', TextType::class, ['label' => 'Address'])
            ->add('city')
            ->add('zipcode')
            ->add('status')
            ->add('size', EntityType::class,[
                'class' => Size::class,
                'choice_label' => 'name',
            ])
            // ->add('userId', 'null', array('data'=>$options['id']))

            // ->add('userId', null, [
            //     'help' => 'form.order.id.help',
            //     'help_translation_parameters' => [
            //         '%company%' => 'ACME Inc.',
            //     ],
            // ]);
            
            // ->add('userId',  EntityType::class, [
            //     'class' => User::class,
            //     'choice_value' => 'id',])
          
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Order::class,
        ]);
    }
}
