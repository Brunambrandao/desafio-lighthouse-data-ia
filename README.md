# Desafio Técnico: LH Nautical - Inteligência de Dados e Inventário

Este repositório contém a resolução do desafio técnico para o projeto **Lighthouse**. O objetivo principal foi aplicar técnicas de análise de dados, previsão de demanda e sistemas de recomendação para otimizar a operação da LH Nautical.

## 📌 Sobre o Projeto
A LH Nautical enfrenta desafios estratégicos no setor varejista náutico: a necessidade de prever a demanda para itens de alto valor e a oportunidade de aumentar o faturamento através de sugestões inteligentes de produtos. Este projeto percorre todo o ciclo de vida do dado, desde a extração e limpeza até a modelagem analítica preditiva.

## 🛠️ Tecnologias e Ferramentas
* **Linguagem:** Python 3.12
* **Bibliotecas:** Pandas, NumPy
* **Análise Estatística:** Scipy / Sklearn (Similaridade de Cosseno e Correlação de Pearson)
* **Ambiente:** VS Code (Jupyter Notebooks)

## 📂 Estrutura do Repositório
* `/data`: Bases de dados de vendas e produtos em formato .csv.
* `/notebooks`: Arquivo `analise.ipynb` com o raciocínio lógico e códigos desenvolvidos.
* `/docs`: Documentação detalhada e relatórios de insights.

## 🚀 Principais Etapas Desenvolvidas

### 1. Tratamento e Qualidade de Dados
Foco na padronização de formatos de data (Padrão Brasileiro e ISO) e tratamento de valores nulos. Garanti a integridade da série temporal utilizando técnicas de *zero-padding*, assegurando que dias sem vendas fossem contabilizados corretamente para não distorcer as métricas.

### 2. Modelagem de Previsão (Baseline)
Implementação de um modelo de **Média Móvel de 7 dias** para o Motor de Popa Yamaha 155HP.
* **Prevenção de Bias:** Aplicação rigorosa da função `.shift(1)` para evitar o *Data Leakage*, garantindo que o modelo use apenas informações passadas para prever o futuro.
* **Validação:** Utilização da métrica MAE (Erro Médio Absoluto) para medir a performance do modelo no período de teste (Janeiro/2024).

### 3. Motor de Recomendação
Desenvolvimento de uma vitrine inteligente baseada em **Filtragem Colaborativa Item-Item**.
* Construção de uma matriz de interação binária (Usuário x Produto).
* Cálculo de similaridade para identificar o item ideal para venda cruzada com o GPS Garmin Vortex.

## 📈 Insights e Visão de Negócio
A análise demonstrou que modelos baseados em médias móveis possuem um atraso natural em relação aos picos de demanda. Como recomendação estratégica, sugeri a evolução para modelos que considerem a sazonalidade do setor náutico, permitindo que a Marina antecipe estoques antes de períodos de alta, como o verão.

## 👩‍💻 Sobre mim e Motivação
Atualmente em transição de carreira para a área de **Dados**, trago comigo uma sólida base em Administração e Design de Produto. Essa bagagem me permite interpretar dados não apenas como números, mas como ativos estratégicos para o negócio.

Encaro este desafio como uma oportunidade de demonstrar minha capacidade de aprendizado acelerado, organização técnica e compromisso com a qualidade das entregas. Meu objetivo é aplicar essa dedicação para somar ao time da Lighthouse.

## ✍️ Autora
Bruna Medeiros Brandão