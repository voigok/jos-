import pandas as pd
import matplotlib.pyplot as plt


f = pd.read_csv("filmes.csv")


linhas, colunas = f.shape
print(f"Quantidade de linhas: {linhas}, Quantidade de colunas: {colunas}")


tipos_dados = f.dtypes
print("Tipos de dados:\n", tipos_dados)


valores_unicos = {col: f[col].unique() for col in f.columns}
print("Valores únicos em cada coluna:\n", valores_unicos)


colunas_tabela = f.columns.tolist()
print("Colunas na tabela:\n", colunas_tabela)



generos_count = f['genero'].value_counts()
print("Quantidade de filmes por gênero:\n", generos_count)


filme_maior_media = f.loc[f['nota'].idxmax()]
print("Filme com a maior média:\n", filme_maior_media)


filme_menor_media = f.loc[f['nota'].idxmin()]
print("Filme com a menor média:\n", filme_menor_media)


media_notas = f.groupby('titulo')['nota'].mean().reset_index()
media_notas.columns = ['titulo', 'media_nota']


media_notas_ordenada = media_notas.sort_values(by='media_nota', ascending=False)
print("Tabela de médias de notas ordenada:\n", media_notas_ordenada)

maior_nota = f['nota'].max()
menor_nota = f['nota'].min()
print(f"Maior nota: {maior_nota}, Menor nota: {menor_nota}")


filme_mais_avaliacoes = f['titulo'].value_counts().idxmax()
print("Filme com mais avaliações:", filme_mais_avaliacoes)


plt.figure(figsize=(10, 6))
generos_count.plot(kind='bar')
plt.title('Distribuição de Filmes por Gênero')
plt.xlabel('Gênero')
plt.ylabel('Quantidade de Filmes')
plt.xticks(rotation=45)
plt.show()