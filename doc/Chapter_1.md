# Chapter 1 Facts, Rules and Queries

This chapter has two main goals:<br>
本章有两个主要目标:

1. To give some simple examples of Prolog programs.
  This will introduce us to the three basic constructs in Prolog: facts, rules, and queries.
  It will also introduce us to a number of other themes, like the role of logic in Prolog,
  and the idea of performing unification with the aid of variables.<br>
 给一些简单的Prolog程序的例子。这将向我们介绍Prolog中的三个基本结构:事实、规则和查询。
 它还将向我们介绍一些其他主题，比如逻辑在 Prolog 中的作用，以及在变量的帮助下执行合一的理念。
2. To begin the systematic study of Prolog by defining terms, atoms, variables and other syntactic concepts.<br>
 通过定义项、原子、变量和其他语法概念开始系统地学习 Prolog 语言。

(unification   n. 联合，统一；联合的行为、实例或过程)

## 1.1 Some Simple Examples (一些简单的例子)

There are only three basic constructs in Prolog: facts, rules, and queries. A collection of facts and rules is called a knowledge base (or a database) and Prolog programming is all about writing knowledge bases. That is, Prolog programs simply are knowledge bases, collections of facts and rules which describe some collection of relationships that we find interesting.

Prolog 中只有三种基本结构:事实(fact)、规则(rule)和查询(query)。事实和规则的集合称为知识库(或数据库)，而 Prolog 编程就是编写知识库。
也就是说，Prolog 程序只是知识库，是事实和规则的集合，它们描述了一些我们觉得有趣的关系集合。


