# 🍔 Sistema Hamburgueria - Flutter + SQLite

Este é um aplicativo mobile desenvolvido com **Flutter** como parte de um teste técnico.  
O objetivo do app é simular um sistema de pedidos de uma hamburgueria, permitindo que o usuário selecione produtos, visualize descontos automáticos e finalize pedidos que são salvos localmente em **SQLite**.

---

## 📦 Tecnologias Utilizadas

| Tecnologia | Descrição |
|------------|-----------|
| **Flutter** | Framework UI para desenvolvimento mobile multiplataforma |
| **Dart** | Linguagem de programação utilizada com Flutter |
| **Sqflite** | Biblioteca para uso de banco de dados SQLite local |
| **Path** | Biblioteca auxiliar para construção de caminhos seguros no sistema de arquivos |
| **Material Design** | Componentes visuais nativos do Flutter |

---

## 🧠 Funcionalidades

- ✅ Listagem de itens do cardápio (sanduíche, fritas, refrigerante)
- ✅ Adição limitada: apenas 1 item por tipo (regra de negócio)
- ✅ Aplicação automática de desconto conforme combinação de itens:
  - Sanduíche + Fritas + Refrigerante → **20%**
  - Sanduíche + Refrigerante → **15%**
  - Sanduíche + Fritas → **10%**
- ✅ Campo de entrada para o nome do cliente
- ✅ Carrinho com total, desconto e valor final
- ✅ Contador dinâmico de itens no botão de carrinho
- ✅ Alerta de confirmação de pedido com nome do cliente
- ✅ Salvamento do pedido localmente no banco de dados SQLite
- ✅ Carrinho é limpo automaticamente após finalizar o pedido

## 🚫 Regras de Negócio Aplicadas
✅ O usuário não pode selecionar mais de um item por tipo (ex: não pode adicionar 2 refrigerantes)

✅ O botão "Finalizar Pedido" só é habilitado quando há itens selecionados e o nome do cliente está preenchido

✅ Os descontos são aplicados automaticamente com base na combinação de itens

## ✨ Possibilidades Futuras (não implementadas neste teste)
Tela de histórico de pedidos salvos
Remoção ou edição de itens no carrinho
Integração com API online (Firebase, Supabase, etc.)
Persistência de preferências do usuário
Autenticação de cliente

## 📌 Observações
✅ O projeto foi desenvolvido inteiramente com Flutter e Dart

✅ Nenhuma dependência externa para backend foi utilizada

✅ Totalmente funcional em modo offline

## Status do Projeto
✅ Finalizado e pronto para avaliação.


