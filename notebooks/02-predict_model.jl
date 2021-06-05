### A Pluto.jl notebook ###
# v0.14.7

using Markdown
using InteractiveUtils

# ╔═╡ f2de0410-47ae-40e8-ab2d-3101295081d9
begin
    import Pkg
    Pkg.activate(mktempdir())

    Pkg.add([
        Pkg.PackageSpec(name="Persa"),
        Pkg.PackageSpec(name="DatasetsCF"),
    ])

	using Persa
	using DatasetsCF
end

# ╔═╡ cd84808c-bfc1-11eb-163a-915025008dd6
md"""
# Modelo de Previsão para Filtragem Colaborativa

Uma das principais tarefas de Sistemas de Recomendação é criar um modelo preditivo em que irá prever o gosto do usuário sobre o item. Desta forma, iremos utilizar o framework Persa.jl para criarmos um modelo preditivo simples.

## Definindo o modelo preditivo
Será criado um modelo que irá sortear aleatoriamente o valor da nota para qualquer usuário sobre um item.

Será necessário definir o modelo
"""

# ╔═╡ 627bde5f-f660-48d6-8c8c-dc25547fd5c6
begin 
	struct RandomModel{T} <: Persa.Model{T}
		preference::Persa.Preference{T}
		users::Int
		items::Int
	end
	
	RandomModel(dataset::Persa.Dataset) = RandomModel(dataset.preference, Persa.users(dataset), Persa.items(dataset))
end

# ╔═╡ 8434774c-e314-409f-8275-e970a4c4415a
Persa.predict(model::RandomModel, user::Int, item::Int) = rand(model.preference.possibles)

# ╔═╡ 53eb2aa5-77c7-4c7c-98d9-292d8f156613


# ╔═╡ fa7e11c2-54cf-4292-a5cb-fdb32c9afa2a


# ╔═╡ Cell order:
# ╟─f2de0410-47ae-40e8-ab2d-3101295081d9
# ╟─cd84808c-bfc1-11eb-163a-915025008dd6
# ╠═627bde5f-f660-48d6-8c8c-dc25547fd5c6
# ╠═8434774c-e314-409f-8275-e970a4c4415a
# ╠═53eb2aa5-77c7-4c7c-98d9-292d8f156613
# ╠═fa7e11c2-54cf-4292-a5cb-fdb32c9afa2a
