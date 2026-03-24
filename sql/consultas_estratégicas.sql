-- PROJETO LIGHTHOUSE - ANÁLISE ESTRATÉGICA DE VENDAS E IMPACTO FINANCEIRO
-- Desenvolvedora: Bruna Medeiros Brandão

-- 1. CRIAÇÃO DO BANCO DE DADOS E TABELAS
CREATE DATABASE IF NOT EXISTS lighthouse_projeto;
USE lighthouse_projeto;

-- Tabela de Produtos (Dimensão)
CREATE TABLE IF NOT EXISTS produtos (
    code VARCHAR(50) PRIMARY KEY,
    name VARCHAR(255),
    price DECIMAL(10,2), -- Preço de custo original em USD
    actual_category VARCHAR(100)
);

-- Tabela de Vendas (Fato)
CREATE TABLE IF NOT EXISTS vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_product VARCHAR(50),
    qtd INT,
    total DECIMAL(10,2), -- Faturamento total em BRL
    FOREIGN KEY (id_product) REFERENCES produtos(code)
);

-- 2. CONSULTA DE VERIFICAÇÃO DE INTEGRIDADE
-- Verifica se há produtos vendidos que não constam no cadastro de produtos
SELECT DISTINCT v.id_product 
FROM vendas v
LEFT JOIN produtos p ON v.id_product = p.code
WHERE p.code IS NULL;

-- 3. CÁLCULO DO IMPACTO FINANCEIRO POR PRODUTO (CÂMBIO 5.35)
-- Esta consulta identifica os produtos que geraram maior impacto negativo
-- Cálculo: Faturamento em BRL - (Custo em USD * Taxa de Câmbio * Quantidade)
SELECT 
    p.code AS id_produto,
    p.name AS nome_produto,
    SUM(v.total) AS faturamento_total_brl,
    SUM(v.qtd) AS quantidade_vendida,
    ROUND(SUM(v.total) - SUM(p.price * 5.35 * v.qtd), 2) AS impacto_financeiro_brl
FROM vendas v
JOIN produtos p ON v.id_product = p.code
GROUP BY p.code, p.name
ORDER BY impacto_financeiro_brl ASC
LIMIT 10;

-- 4. ANÁLISE POR CATEGORIA
-- Identifica quais categorias estão mais expostas à variação cambial
SELECT 
    p.actual_category AS categoria,
    COUNT(v.id_venda) AS volume_vendas,
    SUM(v.total) AS receita_brl,
    ROUND(SUM(v.total) - SUM(p.price * 5.35 * v.qtd), 2) AS saldo_financeiro_brl
FROM vendas v
JOIN produtos p ON v.id_product = p.code
GROUP BY p.actual_category
ORDER BY saldo_financeiro_brl ASC;

-- 5. RESUMO CONSOLIDADO PARA O RELATÓRIO
-- Valor total do impacto financeiro negativo identificado na operação
SELECT 
    ROUND(SUM(v.total) - SUM(p.price * 5.35 * v.qtd), 2) AS impacto_total_consolidado_brl
FROM vendas v
JOIN produtos p ON v.id_product = p.code;