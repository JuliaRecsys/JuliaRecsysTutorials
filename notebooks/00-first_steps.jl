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

## Funcionamento Básico

A ideia da filtragem colaborativa é utilizar os padrões das avaliações feitas pelo usuário sobre os item para a realizar a predição dos seus gostos para a realização da recomendação. Desta forma, podemos representar a filtragem colaborativa através de uma matriz de usuário-item.

| _        |  Item #1 |  Item #2 |  Item #3 |
|:---------|:--------:|:--------:|:--------:|
|  User #1 |    4     |          |    2     |
|  User #2 |    4     |    5     |    3     |
|  User #3 |    3     |    4     |          |
|  User #4 |          |    5     |    4     |


O Persa.jl define várias interfaces para manipular essa matriz. Contudo, o funcionamento interno não precisa ser necessariamente armazenado como uma matriz, visto que é muito comum que os conjuntos de dados possuam uma esparsidade muito alta.

Iremos utilizar o DatasetsCF.jl para carregar o dataset MovieLens 100k.
"""

# ╔═╡ 6df6d23c-46c2-4775-b269-c817b48e2d6d
dataset = DatasetsCF.MovieLens()

# ╔═╡ feb8db18-f6eb-470a-b6fe-ff423a43bad2
md"""
Podemos navegar no dataset como se fosse uma navegação da matriz usuário-item. Iremos obter a nota do usuário 1 para o item 1.
"""

# ╔═╡ cc807b5a-34fb-4ea4-99f4-f3b20cd9605e
rating = dataset[1,1]

# ╔═╡ 137adc82-3f52-4042-b460-ca626ab1749d
md"""
Como foi falado, a esparsidade dessa matriz é alta. É comum que o usuário não explicitou uma avaliação para aquele item. 

Segue um exemplo desse caso.
"""

# ╔═╡ 29a262eb-a890-4b81-a1f6-636405ca12b6
missing_rating = dataset[150,131]

# ╔═╡ 55e6cb45-fc5e-4df7-ae53-47dd9419aaf4
md"""
Também é possível utilizar os mecanismos de slice para obter as notas do usuário ou do item.

No caso abaixo, iremos pegar todas as avaliações do usuário 1.
"""

# ╔═╡ c84c72de-a86b-4b73-b361-7cff738bf55b
user_ratings = dataset[1,:]

# ╔═╡ 0686b19d-654b-4b6c-b185-298831893190
md"""
Podemos pegar também as avaliações dos usuário 1 à 100 do item 5.
"""

# ╔═╡ a4f303c4-e764-4247-944f-3e4e018aab7d
item_ratings = dataset[1:100, 5]

# ╔═╡ Cell order:
# ╟─4605da8e-bf1c-11eb-1be1-13b99165b934
# ╟─6f37c1e5-e90a-445f-bf42-a69ce48dafe3
# ╠═6df6d23c-46c2-4775-b269-c817b48e2d6d
# ╟─feb8db18-f6eb-470a-b6fe-ff423a43bad2
# ╠═cc807b5a-34fb-4ea4-99f4-f3b20cd9605e
# ╟─137adc82-3f52-4042-b460-ca626ab1749d
# ╠═29a262eb-a890-4b81-a1f6-636405ca12b6
# ╟─55e6cb45-fc5e-4df7-ae53-47dd9419aaf4
# ╠═c84c72de-a86b-4b73-b361-7cff738bf55b
# ╟─0686b19d-654b-4b6c-b185-298831893190
# ╠═a4f303c4-e764-4247-944f-3e4e018aab7d
