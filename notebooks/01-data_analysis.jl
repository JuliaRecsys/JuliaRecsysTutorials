### A Pluto.jl notebook ###
# v0.14.7

using Markdown
using InteractiveUtils

# ╔═╡ aa3ce66e-bfc1-11eb-0b84-d52327b36835
begin
    import Pkg
    Pkg.activate(mktempdir())

    Pkg.add([
        Pkg.PackageSpec(name="Persa"),
        Pkg.PackageSpec(name="DatasetsCF"),
		Pkg.PackageSpec(name="Plots"),
    ])

	using Persa
	using DatasetsCF
	using Plots
	using Statistics
end

# ╔═╡ 80439522-196b-4b16-afab-3fdb5e5570ef
md"""
# Analisando o Dataset MovieLens 100k

O DatasetsCF.jl possui um conjunto de datasets para Sistema de Recomendação. Ele já possui a interação para o Persa.jl, assim, deixando transparente o seu carregamento para o usuário.

Primeiramente iremos carregar o dataset MovieLens.


"""

# ╔═╡ e7ef810f-937a-43dc-85e7-1b9af5e99de3
dataset = DatasetsCF.MovieLens()

# ╔═╡ 141466e7-55c4-4caa-b54c-1022854eb431
md"""
## Histograma das Avaliações

Uma análise comum é avaliar o comportamento das notas em um Sistema de Recomendação. Desta forma, iremos calcular o histograma das avaliações feitas dentro do conjunto de dados MovieLens 100k.
"""

# ╔═╡ 7ed9426a-278c-435c-9fa6-4dee5669501e
begin 
	ratings = []

	for (u,v,r) in dataset
		push!(ratings, r + 0)
	end
end

# ╔═╡ 7633ee22-6532-49b6-a6ad-d5234b33e993
histogram(ratings, bins=5, normalize=true, title = "Movielens 100k Ratings", xlabel="Ratings", ylabel="Quantity (%)", legend=false)

# ╔═╡ f06720a0-a207-4b5e-83d3-51ff323516bc
md"""
Essa distribuição é bem comum quando os items são filmes. A média global será:
"""

# ╔═╡ f5b4c313-7ca8-44b7-a51b-8a6b0bcfb4eb
global_mean = mean(ratings)

# ╔═╡ f6df9310-19aa-4a54-b1c6-b60d79ed580c
md"""
## Quantidade de Avaliações

Outra análise complementar é avaliarmos o comportamento dos usuários e dos items com relação à quantidade de avaliações que ele recebeu. Primeiramente iremos obter a quantidade de usuários e items do conjunto de dados.
"""

# ╔═╡ 9cda6d26-ab47-437d-87aa-bdfade0f6305
(users, items) = size(dataset)

# ╔═╡ 323b813c-b2de-4a19-b386-bda7f459637d
md"""
### Usuários
"""

# ╔═╡ f977cfd2-6e98-4dc1-bf53-66890ae40edd
begin
	qnt_user_ratings = zeros(users, 1)
	for (u,v,r) in dataset
		qnt_user_ratings[u,1] += 1;
	end
	
	values_user_ratings = sort(qnt_user_ratings[:,1], rev = true)
end;

# ╔═╡ d8497b41-436e-4a8b-8468-f8a78e76c657
plot(values_user_ratings, title = "Movielens 100k", xlabel="Users", ylabel="# Ratings", legend=false)

# ╔═╡ 9f4465a6-e491-4d62-89b4-f551ace84494
md"""
### Itens
"""

# ╔═╡ 519c39d4-fc00-4677-ac2b-2fa660592dc2
begin
	qnt_item_ratings = zeros(items, 1)
	for (u,v,r) in dataset
		qnt_item_ratings[v,1] += 1;
	end
	
	values_item_ratings = sort(qnt_item_ratings[:,1], rev = true)
end;

# ╔═╡ 355d95dc-4951-4657-b2b7-0709385e07b8
plot(values_item_ratings, title = "Movielens 100k", xlabel="Items", ylabel="# Ratings", legend=false)

# ╔═╡ Cell order:
# ╟─aa3ce66e-bfc1-11eb-0b84-d52327b36835
# ╟─80439522-196b-4b16-afab-3fdb5e5570ef
# ╠═e7ef810f-937a-43dc-85e7-1b9af5e99de3
# ╟─141466e7-55c4-4caa-b54c-1022854eb431
# ╠═7ed9426a-278c-435c-9fa6-4dee5669501e
# ╠═7633ee22-6532-49b6-a6ad-d5234b33e993
# ╟─f06720a0-a207-4b5e-83d3-51ff323516bc
# ╟─f5b4c313-7ca8-44b7-a51b-8a6b0bcfb4eb
# ╟─f6df9310-19aa-4a54-b1c6-b60d79ed580c
# ╠═9cda6d26-ab47-437d-87aa-bdfade0f6305
# ╟─323b813c-b2de-4a19-b386-bda7f459637d
# ╠═f977cfd2-6e98-4dc1-bf53-66890ae40edd
# ╠═d8497b41-436e-4a8b-8468-f8a78e76c657
# ╟─9f4465a6-e491-4d62-89b4-f551ace84494
# ╠═519c39d4-fc00-4677-ac2b-2fa660592dc2
# ╠═355d95dc-4951-4657-b2b7-0709385e07b8
