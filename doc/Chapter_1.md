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

There are only three basic constructs in Prolog: facts, rules, and queries. A collection of facts and rules is called a knowledge base (or a database) and Prolog programming is all about writing knowledge bases. That is, Prolog programs simply are knowledge bases, collections of facts and rules which describe some collection of relationships that we find interesting.<br/>
Prolog 中只有三种基本结构:事实(fact)、规则(rule)和查询(query)。事实和规则的集合称为知识库(或数据库)，而 Prolog 编程就是编写知识库。
也就是说，Prolog 程序只是知识库，是事实和规则的集合，它们描述了一些我们觉得有趣的关系集合。


So how do we use a Prolog program? By posing queries. That is, by asking questions about the information stored in the knowledge base.<br/>
那么我们如何使用Prolog程序呢?通过提出疑问。也就是说，通过询问有关知识库中存储的信息的问题。

Now this probably sounds rather strange. It’s certainly not obvious that it has much to do with programming at all. After all, isn’t programming all about telling a computer what to do? But as we shall see, the Prolog way of programming makes a lot of sense, at least for certain tasks; for example, it is useful in computational linguistics and Artificial Intelligence (AI). But instead of saying more about Prolog in general terms, let’s jump right in and start writing some simple knowledge bases; this is not just the best way of learning Prolog, it’s the only way.<br>
这听起来可能很奇怪。当然，它与编程有很大关系并不明显。毕竟，编程不就是告诉计算机该做什么吗? 但正如我们将看到的，Prolog的编程方式很有意义，至少对于某些任务; 例如，它在计算语言学和人工智能(AI)中很有用。但是，与其从一般的角度讨论Prolog，不如让我们直接开始编写一些简单的知识库;这不仅是学习Prolog最好的方法，也是唯一的方法。

### Knowledge Base 1 (知识库1)

Knowledge Base 1 (KB1) is simply a collection of facts. Facts are used to state things that are unconditionally true of some situation of interest. For example, we can state that Mia, Jody, and Yolanda are women, that Jody plays air guitar, and that a party is taking place, using the following five facts:

```Prolog
  woman(mia).
  woman(jody).
  woman(yolanda).
  playsAirGuitar(jody).
  party.
```

[Links to SWISH](https://swish.swi-prolog.org/?restore=false&code=woman(mia).%0Awoman(jody).%0Awoman(yolanda).%0AplaysAirGuitar(jody).%0Aparty.&examples=%3F-%20woman(mia).%0A%3F-%20playsAirGuitar(jody).%0A%3F-%20playsAirGuitar(mia).%0A%3)







