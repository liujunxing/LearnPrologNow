# Chapter 1 Facts, Rules and Queries

This chapter has two main goals:<br>
本章有两个主要目标:

1. To give some simple examples of Prolog programs.
  This will introduce us to the three basic constructs in Prolog: facts, rules, and queries.
  It will also introduce us to a number of other themes, like the role of logic in Prolog,
  and the idea of performing unification with the aid of variables.<br>
 给出一些简单的Prolog程序的例子。这将向我们介绍Prolog中的三个基本结构:事实(Fact)、规则(Rule)和查询(Query)。
 它还将向我们介绍一些其他主题，比如逻辑在 Prolog 中的作用，以及在变量的帮助下执行合一(Unification)的理念。
2. To begin the systematic study of Prolog by defining terms, atoms, variables and other syntactic concepts.<br>
 通过定义项、原子、变量和其他语法概念开始系统地学习 Prolog 语言。

(unification   n. 联合，统一；联合的行为、实例或过程<br>
 unify    v.（使）联合，（使）统一；使协调)


## 1.1 Some Simple Examples (一些简单的例子)

There are only three basic constructs in Prolog: facts, rules, and queries. A collection of facts and rules is called a knowledge base (or a database) and Prolog programming is all about writing knowledge bases. That is, Prolog programs simply are knowledge bases, collections of facts and rules which describe some collection of relationships that we find interesting.<br/>
Prolog 中只有三种基本结构: 事实、规则和查询。事实和规则的集合称为知识库(或数据库)，而 Prolog 编程就是编写知识库。
也就是说，Prolog 程序只是知识库，是事实和规则的集合，它们描述了一些我们觉得有趣的关系集合。


So how do we use a Prolog program? By posing queries. That is, by asking questions about the information stored in the knowledge base.<br/>
那么我们如何使用Prolog程序呢?通过提出疑问。也就是说，通过询问有关知识库中存储的信息的问题。

Now this probably sounds rather strange. It’s certainly not obvious that it has much to do with programming at all. After all, isn’t programming all about telling a computer what to do? But as we shall see, the Prolog way of programming makes a lot of sense, at least for certain tasks; for example, it is useful in computational linguistics and Artificial Intelligence (AI). But instead of saying more about Prolog in general terms, let’s jump right in and start writing some simple knowledge bases; this is not just the best way of learning Prolog, it’s the only way.<br>
这听起来可能很奇怪。当然，它与编程有很大关系并不明显。毕竟，编程不就是告诉计算机该做什么吗? 但正如我们将看到的，Prolog的编程方式很有意义，至少对于某些任务; 例如，它在计算语言学和人工智能(AI)中很有用。但是，与其从一般的角度讨论Prolog，不如让我们直接开始编写一些简单的知识库;这不仅是学习Prolog最好的方法，也是唯一的方法。

### Knowledge Base 1 (知识库1)

Knowledge Base 1 (KB1) is simply a collection of facts. Facts are used to state things that are unconditionally true of some situation of interest. For example, we can state that Mia, Jody, and Yolanda are women, that Jody plays air guitar, and that a party is taking place, using the following five facts:<br>
知识库1 (KB1)只是事实的集合。事实是用来陈述在某些感兴趣的情况下无条件真实的事物。例如，我们可以陈述 Mia, Jody和Yolanda是女性，Jody弹空气吉他，并且正在举行派对，使用以下五个事实:

```Prolog
  woman(mia).
  woman(jody).
  woman(yolanda).
  playsAirGuitar(jody).
  party.
```

[[Download](./ch1/kb1.pl)] [[Links to SWISH](https://swish.swi-prolog.org/?restore=false&code=woman(mia).%0Awoman(jody).%0Awoman(yolanda).%0AplaysAirGuitar(jody).%0Aparty.&examples=%3F-%20woman(mia).%0A%3F-%20playsAirGuitar(jody).%0A%3F-%20playsAirGuitar(mia).%0A%3)]

This collection of facts is KB1. It is our first example of a Prolog program. Note that the names mia , jody , and yolanda , the properties woman and playsAirGuitar , and the proposition party have been written so that the first letter is in lower-case. This is important; we will see why a little later on.<br>
这组事实是KB1。这是Prolog程序的第一个例子。注意，mia、jody和yolanda、性质 woman和playsAirGuitar以及命题 party的第一个字母都是小写的。这很重要; 稍后我们会看到原因。

How can we use KB1? By posing queries. That is, by asking questions about the information KB1 contains. Here are some examples. We can ask Prolog whether Mia is a woman by posing the query:<br>
如何使用KB1? 通过提出问题(查询)。也就是说，通过询问有关 KB1 所包含的信息的问题。这里有一些例子。我们可以问 Prolog Mia 是不是 woman，方法是:

`?- woman(mia).`

Prolog will answer

`yes`

for the obvious reason that this is one of the facts explicitly recorded in KB1. Incidentally, we don’t type in the ?- . This symbol (or something like it, depending on the implementation of Prolog you are using) is the prompt symbol that the Prolog interpreter displays when it is waiting to evaluate a query. We just type in the actual query (for example woman(mia) ) followed by . (a full stop). The full stop is important. If you don’t type it, Prolog won’t start working on the query.<br>
原因很明显，这是 KB1 中明确记录的事实之一。顺便说一下，我们不输入 `?-`。这个符号(或类似的东西，取决于您正在使用的Prolog的实现)是Prolog解释器在等待计算查询时显示的提示符号。我们只需输入实际的查询(例如，`woman(mia)`)，然后输入 `.`(英文句号)。句号很重要。如果您不输入它，Prolog将不会开始处理查询。

Similarly, we can ask whether Jody plays air guitar by posing the following query:

`?- playsAirGuitar(jody).`

Prolog will again answer yes, because this is one of the facts in KB1. However, suppose we ask whether Mia plays air guitar:

`?- playsAirGuitar(mia).`

We will get the answer

`no`

Why? Well, first of all, this is not a fact in KB1. Moreover, KB1 is extremely simple, and contains no other information (such as the rules we will learn about shortly) which might help Prolog try to infer (that is, deduce) whether Mia plays air guitar. So Prolog correctly concludes that playsAirGuitar(mia) does not follow from KB1.

Here are two important examples. First, suppose we pose the query:

`?- playsAirGuitar(vincent).`

Again Prolog answers no. Why? Well, this query is about a person (Vincent) that it has no information about, so it (correctly) concludes that playsAirGuitar(vincent) cannot be deduced from the information in KB1.

Similarly, suppose we pose the query:

`?- tatooed(jody).`

Again Prolog will answer no. Why? Well, this query is about a property (being tatooed) that it has no information about, so once again it (correctly) concludes that the query cannot be deduced from the information in KB1. (Actually, some Prolog implementations will respond to this query with an error message, telling you that the predicate or procedure tatooed is not defined; we will soon introduce the notion of predicates.)

Needless to say, we can also make queries concerning propositions. For example, if we pose the query

`?- party.`

then Prolog will respond

`yes`

and if we pose the query

`?- rockConcert.`

then Prolog will respond

`no`

exactly as we would expect.


### Knowledge Base 2 (知识库2)

Here is KB2, our second knowledge base:

```Prolog
  happy(yolanda).
  listens2Music(mia).
  listens2Music(yolanda):- happy(yolanda).
  playsAirGuitar(mia):- listens2Music(mia).
  playsAirGuitar(yolanda):- listens2Music(yolanda).
```

[[Download](./ch1/kb2.pl)] [[Links To SWISH](https://swish.swi-prolog.org/?restore=false&code=happy(yolanda).%0Alistens2Music(mia).%0Alistens2Music(yolanda)%3A-%20happy(yolanda).%0AplaysAirGuitar(mia)%3A-%20listens2Music(mia).%0AplaysAirGuitar(yolanda)%3A-%20listens2Music(yolanda).&examples=%3F-%20playsAirGuitar(mia).%0A%3F-%20playsAirGuitar(yolanda).%0A)]

There are two facts in KB2, `listens2Music(mia)` and `happy(yolanda)` . The last three items it contains are rules.

Rules state information that is conditionally true of the situation of interest. For example, the first rule says that Yolanda listens to music if she is happy, and the last rule says that Yolanda plays air guitar if she listens to music. More generally, the `:-` should be read as “if”, or “is implied by”. The part on the left hand side of the `:-` is called the head of the rule, the part on the right hand side is called the body. So in general rules say: if the body of the rule is true, then the head of the rule is true too. And now for the key point:<br>
规则(rule)陈述的信息在感兴趣的情况下有条件地为真。例如，第一条规则说，如果尤兰达快乐，她就听音乐，最后一条规则说，如果尤兰达听音乐，她就弹空气吉他。更一般地说，`:-` 应该读作“if”(如果)，或者“is implied by”(由...确定)。`:-` 左边的部分称为规则头(head)，右边的部分称为规则体(body)。在一般规则中，如果规则主体为真，那么规则的头部也为真。现在是关键点:

If a knowledge base contains a rule `head :- body`, and Prolog knows that body follows from the information in the knowledge base, then Prolog can infer head.<br>
如果知识库中包含“head:- body”的规则，并且 Prolog 知道 body 符合知识库中的信息，那么 Prolog 就可以推断出head。

This fundamental deduction step is called modus ponens.<br>
这个基本的演绎(推导)步骤被称为“假言推理法”。

Let’s consider an example. Suppose we ask whether Mia plays air guitar:

`?- playsAirGuitar(mia).`

Prolog will respond yes. Why? Well, although it can’t find playsAirGuitar(mia) as a fact explicitly recorded in KB2, it can find the rule

`playsAirGuitar(mia) :- listens2Music(mia).`

Moreover, KB2 also contains the fact listens2Music(mia) . Hence Prolog can use the rule of modus ponens to deduce that playsAirGuitar(mia) .

Our next example shows that Prolog can chain together uses of modus ponens. Suppose we ask:

`?- playsAirGuitar(yolanda).`

Prolog would respond yes. Why? Well, first of all, by using the fact happy(yolanda) and the rule

`listens2Music(yolanda):- happy(yolanda).`

Prolog can deduce the new fact listens2Music(yolanda) . This new fact is not explicitly recorded in the knowledge base — it is only implicitly present (it is inferred knowledge). Nonetheless, Prolog can then use it just like an explicitly recorded fact. In particular, from this inferred fact and the rule

`playsAirGuitar(yolanda):- listens2Music(yolanda).`

it can deduce playsAirGuitar(yolanda) , which is what we asked it. Summing up: any fact produced by an application of modus ponens can be used as input to further rules. By chaining together applications of modus ponens in this way, Prolog is able to retrieve information that logically follows from the rules and facts recorded in the knowledge base.

The facts and rules contained in a knowledge base are called clauses. Thus KB2 contains five clauses, namely three rules and two facts. Another way of looking at KB2 is to say that it consists of three predicates (or procedures). The three predicates are:

`listens2Music`<br>
`happy`<br>
`playsAirGuitar`

The happy predicate is defined using a single clause (a fact). The listens2Music and playsAirGuitar predicates are each defined using two clauses (in one case, two rules, and in the other case, one rule and one fact). It is a good idea to think about Prolog programs in terms of the predicates they contain. In essence, the predicates are the concepts we find important, and the various clauses we write down concerning them are our attempts to pin down what they mean and how they are inter-related.

One final remark. We can view a fact as a rule with an empty body. That is, we can think of facts as conditionals that do not have any antecedent conditions, or degenerate rules.<br>
最后说一句。我们可以把一个事实看作是一个规则，而它的主体是空的。也就是说，我们可以将事实视为没有任何先决条件或退化规则的条件。


### Knowledge Base 3 (知识库3)

KB3, our third knowledge base, consists of five clauses:

```Prolog
  happy(vincent).
  listens2Music(butch).
  playsAirGuitar(vincent):-
    listens2Music(vincent),
    happy(vincent).
  playsAirGuitar(butch):-
    happy(butch).
  playsAirGuitar(butch):-
    listens2Music(butch).
```

[[Download](./ch1/kb3.pl)]

There are two facts, happy(vincent) and listens2Music(butch) , and three rules.

KB3 defines the same three predicates as KB2 (namely happy , listens2Music , and playsAirGuitar ) but it defines them differently. In particular, the three rules that define the playsAirGuitar predicate introduce some new ideas. First, note that the rule

```Prolog
  playsAirGuitar(vincent):-
    listens2Music(vincent),
    happy(vincent).
```

has two items in its body, or (to use the standard terminology) two goals. So, what exactly does this rule mean? The most important thing to note is the comma , that separates the goal listens2Music(vincent) and the goal happy(vincent) in the rule’s body. This is the way logical conjunction is expressed in Prolog (that is, the comma means and ). So this rule says: “Vincent plays air guitar if he listens to music and he is happy”.

Thus, if we posed the query

`?- playsAirGuitar(vincent).`

Prolog would answer no. This is because while KB3 contains happy(vincent) , it does not explicitly contain the information listens2Music(vincent) , and this fact cannot be deduced either. So KB3 only fulfils one of the two preconditions needed to establish playsAirGuitar(vincent) , and our query fails.

Incidentally, the spacing used in this rule is irrelevant. For example, we could have written it as

```prolog
  playsAirGuitar(vincent):- happy(vincent),
                           listens2Music(vincent).
```

and it would have meant exactly the same thing. Prolog offers us a lot of freedom in the way we set out knowledge bases, and we can take advantage of this to keep our code readable.

Next, note that KB3 contains two rules with exactly the same head, namely:

```prolog
playsAirGuitar(butch):-
  happy(butch).
playsAirGuitar(butch):-
  listens2Music(butch).
```

This is a way of stating that Butch plays air guitar either if he listens to music, or if he is happy. That is, listing multiple rules with the same head is a way of expressing logical disjunction (that is, it is a way of saying or ). So if we posed the query

`?- playsAirGuitar(butch).`

Prolog would answer yes. For although the first of these rules will not help (KB3 does not allow Prolog to conclude that happy(butch) ), KB3 does contain listens2Music(butch) and this means Prolog can apply modus ponens using the rule

```prolog
playsAirGuitar(butch):-
   listens2Music(butch).
```

to conclude that playsAirGuitar(butch) .

There is another way of expressing disjunction in Prolog. We could replace the pair of rules given above by the single rule

```prolog
playsAirGuitar(butch):-
   happy(butch);
   listens2Music(butch).
```

That is, the semicolon `;` is the Prolog symbol for or `,` so this single rule means exactly the same thing as the previous pair of rules. Is it better to use multiple rules or the semicolon? That depends. On the one hand, extensive use of semicolon can make Prolog code hard to read. On the other hand, the semicolon is more efficient as Prolog only has to deal with one rule.

It should now be clear that Prolog has something to do with logic: after all, the :- means implication, the , means conjunction, and the ; means disjunction. (What about negation? That is a whole other story. We’ll be discussing it in Chapter  10 .) Moreover, we have seen that a standard logical proof rule (modus ponens) plays an important role in Prolog programming. So we are already beginning to understand why “Prolog” is short for “Programming with logic”.

### Knowledge Base 4 (知识库4)

Here is KB4, our fourth knowledge base:

```prolog
woman(mia).
woman(jody).
woman(yolanda).

loves(vincent,mia).
loves(marsellus,mia).
loves(pumpkin,honey_bunny).
loves(honey_bunny,pumpkin).
```

[[Download](./ch1/kb4.pl)]

Now, this is a pretty boring knowledge base. There are no rules, only a collection of facts. Ok, we are seeing a relation that has two names as arguments for the first time (namely the loves relation), but, let’s face it, that’s a rather predictable idea.

No, the novelty this time lies not in the knowledge base, it lies in the queries we are going to pose. In particular, for the first time we’re going to make use of variables . Here’s an example:

`?- woman(X).`

The `X` is a variable (in fact, any word beginning with an upper-case letter is a Prolog variable, which is why we had to be careful to use lower-case initial letters in our earlier examples). Now a variable isn’t a name, rather it’s a placeholder for information. That is, this query asks Prolog: tell me which of the individuals you know about is a woman.

Prolog answers this query by working its way through KB4, from top to bottom, trying to unify (or match) the expression `woman(X)` with the information KB4 contains. Now the first item in the knowledge base is woman(mia) . So, Prolog unifies X with mia , thus making the query agree perfectly with this first item. (Incidentally, there’s a lot of different terminology for this process: we can also say that Prolog instantiates X to mia , or that it binds X to mia .) Prolog then reports back to us as follows:

`X = mia`

That is, it not only says that there is information about at least one woman in KB4, it actually tells us who she is. It didn’t just say yes, it actually gave us the variable binding (or variable instantiation) that led to success.

But that’s not the end of the story. The whole point of variables is that they can stand for, or unify with, different things. And there is information about other women in the knowledge base. We can access this information by typing a semicolon:

`X = mia ;`

Remember that `;` means or `,` so this query means: are there any alternatives ? So Prolog begins working through the knowledge base again (it remembers where it got up to last time and starts from there) and sees that if it unifies X with jody , then the query agrees perfectly with the second entry in the knowledge base. So it responds:

`X = mia ;`<br>
`X = jody`

It’s telling us that there is information about a second woman in KB4, and (once again) it actually gives us the value that led to success. And of course, if we press ; a second time, Prolog returns the answer

`X = mia ;`<br>
`X = jody ;`<br>
`X = yolanda`

But what happens if we press ; a third time? Prolog responds no. No other unifications are possible. There are no other facts starting with the symbol woman . The last four entries in the knowledge base concern the love relation, and there is no way that such entries can be unified with a query of the form woman(X) .

Let’s try a more complicated query, namely

`?- loves(marsellus,X), woman(X).`

Now, remember that , means and , so this query says: is there any individual X such that Marsellus loves X and X is a woman ? If you look at the knowledge base you’ll see that there is: Mia is a woman (fact 1) and Marsellus loves Mia (fact 5). And in fact, Prolog is capable of working this out. That is, it can search through the knowledge base and work out that if it unifies X with Mia, then both conjuncts of the query are satisfied (we’ll learn in the following chapter how Prolog does this). So Prolog returns the answer

`X = mia`

The business of unifying variables with information in the knowledge base is the heart of Prolog. As we’ll learn, there are many interesting ideas in Prolog — but when you get right down to it, it’s Prolog’s ability to perform unification and return the values of the variable bindings to us that is crucial.

### Knowledge Base 5 (知识库5)

Well, we’ve introduced variables, but so far we’ve only used them in queries. But variables not only can be used in knowledge bases, it’s only when we start to do so that we can write truly interesting programs. Here’s a simple example, the knowledge base KB5:

```prolog
loves(vincent,mia).
loves(marsellus,mia).
loves(pumpkin,honey_bunny).
loves(honey_bunny,pumpkin).

jealous(X,Y):- loves(X,Z), loves(Y,Z).  % jealous:嫉妒的
```

[[Download](./ch1/kb5.pl)]

KB5 contains four facts about the loves relation and one rule. (Incidentally, the blank line between the facts and the rule has no meaning: it’s simply there to increase the readability. As we said earlier, Prolog gives us a great deal of freedom in the way we format knowledge bases.) But this rule is by far the most interesting one we have seen so far: it contains three variables (note that X , Y , and Z are all upper-case letters). What does it say?

In effect, it is defining a concept of jealousy. It says that an individual X will be jealous of an individual Y if there is some individual Z that X loves, and Y loves that same individual Z too. (Ok, so jealousy isn’t as straightforward as this in the real world.) The key thing to note is that this is a general statement: it is not stated in terms of mia , or pumpkin , or anyone in particular — it’s a conditional statement about everybody in our little world.

Suppose we pose the query:

`?- jealous(marsellus,W).`

This query asks: can you find an individual W such that Marsellus is jealous of W ? Vincent is such an individual. If you check the definition of jealousy, you’ll see that Marsellus must be jealous of Vincent, because they both love the same woman, namely Mia. So Prolog will return the value

`W = vincent`

Now some questions for you . First, are there any other jealous people in KB5? Furthermore, suppose we wanted Prolog to tell us about all the jealous people: what query would we pose? Do any of the answers surprise you? Do any seem silly?

