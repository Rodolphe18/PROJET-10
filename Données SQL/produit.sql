INSERT INTO public.produit (id_produit, id_categorie, reference_article, libelle, ingredients, taille, recette, prix_unitaire_ht, tva) VALUES
(1, 1, '2005/914/776', 'pizza_reine', 'mozzarella, jambon, oignon, tomates, champignons', 'XL', 'couper le jambon et les champignons, mettre sur la pate avec les tomates', 13, 20),
(2, 1, '2019/904/099', 'pizza_calzone', 'mozzarella, jambon, oignon, tomates, oeufs', 'M', 'couper le jambon, casser les oeufs et mettre sur la pate avec les tomates', 13, 20),
(3, 1, '2020/714/008', 'pizza_hawaienne', 'mozzarella, jambon, ananas, tomates', 'S', 'couper le jambon et les ananas, mettre sur la pate avec les tomates', 13, 20),
(4, 2, '2021/833/089', 'ICE TEA', null, null, null, 4, 20); 

SELECT * FROM produit; 