programa
{
    /*
      Sistema de produtos em Portugol.
      Usa vetor de tamanho fixo, laços, bubble sort e simulação de categorias únicas.
    */

    funcao inicio()
    {
        inteiro quantidade, i, j, total_categorias
        cadeia nomes[100], categorias[100], categorias_unicas[100], texto_temp
        real precos[100], limite, real_temp
        real menor_preco, maior_preco, soma_precos, media_precos
        logico existe

        escreva("Quantos produtos deseja cadastrar (1 a 100)? ")
        leia(quantidade)

        enquanto (quantidade < 1 ou quantidade > 100)
        {
            escreva("Digite uma quantidade entre 1 e 100: ")
            leia(quantidade)
        }

        para (i = 0; i < quantidade; i++)
        {
            escreva("\nProduto ", i + 1, "\n")
            escreva("Nome: ")
            leia(nomes[i])
            escreva("Preço: ")
            leia(precos[i])
            escreva("Categoria: ")
            leia(categorias[i])
        }

        escreva("\nMostrar produtos acima de qual preço? ")
        leia(limite)

        escreva("\n--- Produtos acima do limite ---\n")
        para (i = 0; i < quantidade; i++)
        {
            se (precos[i] > limite)
            {
                escreva(nomes[i], " - R$ ", precos[i], "\n")
            }
        }

        // Bubble sort crescente: troca nome, preço e categoria juntos.
        para (i = 0; i < quantidade - 1; i++)
        {
            para (j = 0; j < quantidade - 1 - i; j++)
            {
                se (precos[j] > precos[j + 1])
                {
                    real_temp = precos[j]
                    precos[j] = precos[j + 1]
                    precos[j + 1] = real_temp

                    texto_temp = nomes[j]
                    nomes[j] = nomes[j + 1]
                    nomes[j + 1] = texto_temp

                    texto_temp = categorias[j]
                    categorias[j] = categorias[j + 1]
                    categorias[j + 1] = texto_temp
                }
            }
        }

        escreva("\n--- Produtos por preço crescente ---\n")
        para (i = 0; i < quantidade; i++)
        {
            escreva(nomes[i], " - R$ ", precos[i], "\n")
        }

        escreva("\n--- Produtos por preço decrescente ---\n")
        para (i = quantidade - 1; i >= 0; i--)
        {
            escreva(nomes[i], " - R$ ", precos[i], "\n")
        }

        // Simula um conjunto, ignorando categorias já armazenadas.
        total_categorias = 0
        para (i = 0; i < quantidade; i++)
        {
            existe = falso
            para (j = 0; j < total_categorias; j++)
            {
                se (categorias[i] == categorias_unicas[j])
                {
                    existe = verdadeiro
                }
            }

            se (existe == falso)
            {
                categorias_unicas[total_categorias] = categorias[i]
                total_categorias = total_categorias + 1
            }
        }

        escreva("\n--- Categorias únicas ---\n")
        para (i = 0; i < total_categorias; i++)
        {
            escreva(categorias_unicas[i], "\n")
        }

        menor_preco = precos[0]
        maior_preco = precos[0]
        soma_precos = 0

        para (i = 0; i < quantidade; i++)
        {
            soma_precos = soma_precos + precos[i]
            se (precos[i] < menor_preco)
            {
                menor_preco = precos[i]
            }
            se (precos[i] > maior_preco)
            {
                maior_preco = precos[i]
            }
        }

        media_precos = soma_precos / quantidade

        // Equivalente conceitual à tupla (menor, maior, média) do Python.
        escreva("\n--- Relatório final ---\n")
        escreva("Menor preço: R$ ", menor_preco, "\n")
        escreva("Maior preço: R$ ", maior_preco, "\n")
        escreva("Média dos preços: R$ ", media_precos, "\n")
    }
}
