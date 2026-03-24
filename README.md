# Desafio Técnico: LH Nautical - Inteligência de Dados e Inventário

Este repositório contém a resolução do desafio técnico para o projeto **Lighthouse**. O objetivo principal foi aplicar técnicas de análise de dados, extração de insights estratégicos e modelagem preditiva para otimizar a operação da LH Nautical.

## 📌 Sobre o Projeto
A LH Nautical enfrenta desafios estratégicos no setor varejista náutico, especialmente na gestão de inventário de alto valor e na maximização de faturamento. Este projeto percorre todo o ciclo de vida do dado: desde a ingestão via SQL e tratamento em Python até a geração de dashboards e relatórios de insights.

## 🛠️ Tecnologias e Ferramentas
* **Linguagem:** Python 3.12
* **Bibliotecas:** Pandas, NumPy, Matplotlib
* **Banco de Dados:** SQL (Consultas estruturadas para análise de impacto)
* **Ambiente:** VS Code / Jupyter Notebooks

## 📂 Estrutura do Repositório
Para facilitar a avaliação, o projeto foi organizado da seguinte forma:
* `/data`: Bases de dados de vendas e produtos em formato .csv.
* `/notebooks`: Arquivo `analise_lighthouse.ipynb` contendo o raciocínio lógico e códigos de visualização.
* `/sql`: Arquivo `consultas_estratégicas.sql` com as queries de manipulação do banco de dados.
* `/docs`: Documentação detalhada e relatórios de insights estratégicos.
* `requirements.txt`: Lista de dependências para reprodução do ambiente.

## 🚀 Principais Etapas Desenvolvidas

### 1. Ingestão e Cálculo de Impacto Financeiro (SQL & Python)
Foi desenvolvida uma lógica para identificar os produtos com maior impacto financeiro negativo na operação. 
* **Premissa de Negócio:** Conforme as diretrizes do desafio, foi aplicada uma taxa de câmbio referencial (5.35) para converter os custos em USD e compará-los ao faturamento em BRL.
* **Integridade de Dados:** Aplicação de agrupamentos e limpeza de duplicatas para garantir que os valores consolidados refletissem a realidade da operação.

### 2. Tratamento e Qualidade de Dados
Foco na padronização de formatos e tratamento de valores nulos. Foi garantida a integridade da série temporal utilizando técnicas de *zero-padding*, assegurando que métricas de demanda não fossem distorcidas por dias sem vendas.

### 3. Modelagem de Previsão (Baseline)
Implementação de um modelo de **Média Móvel de 7 dias** para itens críticos como o Motor de Popa Yamaha 155HP.
* **Prevenção de Bias:** Uso da função `.shift(1)` para evitar *Data Leakage*, garantindo uma simulação real de previsão futura.
* **Validação:** Aplicação da métrica MAE (Erro Médio Absoluto) para validar a performance do modelo.

## 📈 Insights e Visão de Negócio
A análise identificou que o modelo de média móvel, embora eficaz como baseline, apresenta um atraso natural em picos de demanda. A recomendação estratégica para a LH Nautical é a evolução para modelos sazonais que antecipem o aumento de estoque antes de períodos de alta temporada.

## 👩‍💻 Sobre a Autora
**Bruna Medeiros Brandão**
Atualmente em transição de carreira para a área de **Dados**, com sólida base em Administração. Esta bagagem me permite interpretar dados como ativos estratégicos, focando sempre na geração de valor para o negócio.

