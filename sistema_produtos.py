"""Sistema simples de cadastro e análise de produtos."""


def cadastrar_produtos():
    """Lê produtos e guarda nome, preço e categoria em uma lista."""
    produtos = []
    quantidade = int(input("Quantos produtos deseja cadastrar? "))

    for indice in range(quantidade):
        print(f"\nProduto {indice + 1}")
        nome = input("Nome: ").strip()
        preco = float(input("Preço: R$ ").replace(",", "."))
        categoria = input("Categoria: ").strip()
        produtos.append({"nome": nome, "preco": preco, "categoria": categoria})

    return produtos


def main():
    """Executa o cadastro, as consultas e o relatório."""
    produtos = cadastrar_produtos()

    if not produtos:
        print("Nenhum produto foi cadastrado.")
        return

    limite = float(input("\nMostrar produtos acima de qual preço? R$ ").replace(",", "."))
    filtrados = [produto for produto in produtos if produto["preco"] > limite]

    crescente = produtos.copy()
    crescente.sort(key=lambda produto: produto["preco"])
    decrescente = sorted(produtos, key=lambda produto: produto["preco"], reverse=True)

    categorias = set(produto["categoria"] for produto in produtos)

    precos = [produto["preco"] for produto in produtos]
    estatisticas = (min(precos), max(precos), sum(precos) / len(precos))

    print("\n========== RELATÓRIO DE PRODUTOS ==========")
    print("\nTodos os produtos:")
    for produto in produtos:
        print(f"- {produto['nome']} | R$ {produto['preco']:.2f} | Categoria: {produto['categoria']}")

    print(f"\nProdutos com preço acima de R$ {limite:.2f}:")
    if filtrados:
        for produto in filtrados:
            print(f"- {produto['nome']}: R$ {produto['preco']:.2f}")
    else:
        print("Nenhum produto encontrado.")

    print("\nProdutos por preço crescente:")
    for produto in crescente:
        print(f"- {produto['nome']}: R$ {produto['preco']:.2f}")

    print("\nProdutos por preço decrescente:")
    for produto in decrescente:
        print(f"- {produto['nome']}: R$ {produto['preco']:.2f}")

    print("\nCategorias únicas:")
    print(", ".join(sorted(categorias)))

    menor, maior, media = estatisticas
    print("\nEstatísticas:")
    print(f"Menor preço: R$ {menor:.2f}")
    print(f"Maior preço: R$ {maior:.2f}")
    print(f"Média dos preços: R$ {media:.2f}")


if __name__ == "__main__":
    main()
