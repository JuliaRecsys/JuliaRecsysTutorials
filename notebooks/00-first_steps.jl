### A Pluto.jl notebook ###
# v0.14.7

using Markdown
using InteractiveUtils

# ╔═╡ 4605da8e-bf1c-11eb-1be1-13b99165b934
begin
	using Persa
	using DatasetsCF
	using Plots
end

# ╔═╡ 6f37c1e5-e90a-445f-bf42-a69ce48dafe3
md"""

# First Steps

O ambiente JuliaRecsys possui um conjunto de ferramentas para trabalhar com Sistemas de Recomendação usando a linguagem Julia.

No caso da filtragem colaborativa, o pacote Persa.jl é a base de todos os outros. Nele é contido um conjunto de interfaces básicas para todos os demais pacotes.

## Analisando um Dataset

O DatasetsCF.jl possui um conjunto de datasets para Sistema de Recomendação. Ele já possui a interação para o Persa.jl, assim, deixando transparente o seu carregamento para o usuário.

Primeiramente iremos carregar o dataset MovieLens.


"""

# ╔═╡ 6df6d23c-46c2-4775-b269-c817b48e2d6d
dataset = DatasetsCF.MovieLens()

# ╔═╡ feb8db18-f6eb-470a-b6fe-ff423a43bad2
md"""
Agora será realizado exibido o histograma de notas desse dataset
"""

# ╔═╡ cc807b5a-34fb-4ea4-99f4-f3b20cd9605e
begin 
	ratings = []

	for (u,v,r) in dataset
		push!(ratings, r + 0)
	end
end

# ╔═╡ 55e6cb45-fc5e-4df7-ae53-47dd9419aaf4
histogram(ratings, bins=5, normalize=true, title = "Movielens 100k Ratings", xlabel="Ratings", ylabel="Quantity (%)", legend=false)

# ╔═╡ 6594457c-7ca3-4e28-b80f-3aea147ba2a4
md"""
## Definindo o modelo preditivo
Será criado um modelo que irá sortear aleatoriamente o valor da nota para qualquer usuário sobre um item.

Será necessário definir o modelo
"""

# ╔═╡ 37a964a6-4658-488d-b6c5-5e1f844be660
begin 
	struct RandomModel{T} <: Persa.Model{T}
		preference::Persa.Preference{T}
		users::Int
		items::Int
	end
	
	RandomModel(dataset::Persa.Dataset) = RandomModel(dataset.preference, Persa.users(dataset), Persa.items(dataset))
end

# ╔═╡ 87597c4f-4efa-46d7-9389-41eb1c2b5884
Persa.predict(model::RandomModel, user::Int, item::Int) = rand(model.preference.possibles)

# ╔═╡ 51fc82de-2f1b-403b-8a40-9b54260d919b
model = RandomModel(dataset)

# ╔═╡ fd667702-d282-4b5f-bd63-98fce091b530
typeof(model[1,1])

# ╔═╡ 675780a5-2d10-4c7b-8e5c-29bd0381c359
begin
	error = 0
	
	for (u,v,r) in dataset
		error += abs(model[u,v] - r)
	end
	
	mae = error ./ length(dataset)
end

# ╔═╡ Cell order:
# ╠═4605da8e-bf1c-11eb-1be1-13b99165b934
# ╟─6f37c1e5-e90a-445f-bf42-a69ce48dafe3
# ╠═6df6d23c-46c2-4775-b269-c817b48e2d6d
# ╟─feb8db18-f6eb-470a-b6fe-ff423a43bad2
# ╠═cc807b5a-34fb-4ea4-99f4-f3b20cd9605e
# ╠═55e6cb45-fc5e-4df7-ae53-47dd9419aaf4
# ╟─6594457c-7ca3-4e28-b80f-3aea147ba2a4
# ╠═37a964a6-4658-488d-b6c5-5e1f844be660
# ╠═87597c4f-4efa-46d7-9389-41eb1c2b5884
# ╠═51fc82de-2f1b-403b-8a40-9b54260d919b
# ╠═fd667702-d282-4b5f-bd63-98fce091b530
# ╠═675780a5-2d10-4c7b-8e5c-29bd0381c359
