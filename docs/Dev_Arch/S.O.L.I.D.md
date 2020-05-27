## Single responsibility principle

The single responsibility principle is a computer programming principle that states that every module, class, or function should have responsibility over a single part of the functionality provided by the software, and that responsibility should be entirely encapsulated by the class. All its services should be narrowly aligned with that responsibility. Robert C. Martin expresses the principle as, "A class should have only one reason to change", although, because of confusion around the word "reason" he more recently stated "This principle is about people.(Actor)"

## Open–closed principle

In object-oriented programming, **the open/closed principle** states "software entities (classes, modules, functions, etc.) should be open for extension, but closed for modification"; that is, such an entity can allow its behaviour to be extended without modifying its source code.
The name open/closed principle has been used in two ways. Both ways use generalizations (for instance, inheritance or delegate functions) to resolve the apparent dilemma, but the goals, techniques, and results are different.

## Liskov substitution principle

Liskov's notion of a behavioural subtype defines a notion of substitutability for objects; that is, if S is a subtype of T, then objects of type T in a program may be replaced with objects of type S without altering any of the desirable properties of that program (e.g. correctness).

Behavioural subtyping is a stronger notion than typical subtyping of functions defined in type theory, which relies only on the contravariance of argument types and covariance of the return type. Behavioural subtyping is undecidable in general: if q is the property "method for x always terminates", then it is impossible for a program (e.g. a compiler) to verify that it holds true for some subtype S of T, even if q does hold for T. Nonetheless, the principle is useful in reasoning about the design of class hierarchies.

Liskov's principle imposes some standard requirements on signatures that have been adopted in newer object-oriented programming languages (usually at the level of classes rather than types; see nominal vs. structural subtyping for the distinction):

Contravariance of method arguments in the subtype.
Covariance of return types in the subtype.
No new exceptions should be thrown by methods of the subtype, except where those exceptions are themselves subtypes of exceptions thrown by the methods of the supertype.
In addition to the signature requirements, the subtype must meet a number of behavioural conditions. These are detailed in a terminology resembling that of design by contract methodology, leading to some restrictions on how contracts can interact with inheritance:

Preconditions cannot be strengthened in a subtype.
Postconditions cannot be weakened in a subtype.
Invariants of the supertype must be preserved in a subtype.
History constraint (the "history rule"). Objects are regarded as being modifiable only through their methods (encapsulation). Because subtypes may introduce methods that are not present in the supertype, the introduction of these methods may allow state changes in the subtype that are not permissible in the supertype. The history constraint prohibits this. It was the novel element introduced by Liskov and Wing. A violation of this constraint can be exemplified by defining a mutable point as a subtype of an immutable point. This is a violation of the history constraint, because in the history of the immutable point, the state is always the same after creation, so it cannot include the history of a mutable point in general. Fields added to the subtype may however be safely modified because they are not observable through the supertype methods. Thus, one can derive a circle with fixed center but mutable radius from immutable point without violating LSP.

## Interface segregation principle

In the field of software engineering, the **interface-segregation principle (ISP)** states that no client should be forced to depend on methods it does not use. ISP splits interfaces that are very large into smaller and more specific ones so that clients will only have to know about the methods that are of interest to them. Such shrunken interfaces are also called role interfaces. ISP is intended to keep a system decoupled and thus easier to refactor, change, and redeploy. ISP is one of the five SOLID principles of object-oriented design, similar to the High Cohesion Principle of GRASP.

## Dependency inversion principle

The **dependency inversion principle** is a specific form of decoupling software modules. When following this principle, the conventional dependency relationships established from high-level, policy-setting modules to low-level, dependency modules are reversed, thus rendering high-level modules independent of the low-level module implementation details.

The principle states:

* High-level modules should not depend on low-level modules. Both should depend on abstractions (e.g. interfaces).

* Abstractions should not depend on details. Details (concrete implementations) should depend on abstractions.

* By dictating that both high-level and low-level objects must depend on the same abstraction, this design principle inverts the way some people may think about object-oriented programming.

The idea behind points A and B of this principle is that when designing the interaction between a high-level module and a low-level one, the interaction should be thought of as an abstract interaction between them. This not only has implications on the design of the high-level module, but also on the low-level one: the low-level one should be designed with the interaction in mind and it may be necessary to change its usage interface.

In many cases, thinking about the interaction in itself as an abstract concept allows the coupling of the components to be reduced without introducing additional coding patterns, allowing only a lighter and less implementation dependent interaction schema.

When the discovered abstract interaction schema(s) between two modules is/are generic and generalization makes sense, this design principle also leads to the following dependency inversion coding pattern.
