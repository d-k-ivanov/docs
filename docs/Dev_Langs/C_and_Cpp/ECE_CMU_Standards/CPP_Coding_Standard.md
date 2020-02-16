# C++ Coding Standard

## Resources

***

* [Design Stories](DesignStories.html)
* [OO Info Sources](http://www.sente.ch/cetus/software.html)
* [Unified Modeling Language (UML)](http://www.rational.com/uml/index.jtmpl)
* [OPEN Method](http://www.markv.com/OPEN/)
* [OO FAQ - All You Wanted to Know About OO](http://www.cyberdyne-object-sys.com/)
* [C++ FAQ LITE](http://www.parashift.com/c++-faq-lite/)
* [C++ Source Libraries](http://www.desy.de/user/projects/C++/Projects.html)
* [C++ Tutorials](http://www.desy.de/user/projects/C++/Learning.html)
* [ACE C++ Library](http://www.cs.wustl.edu/~schmidt/ACE-overview.html)
* [Collection of Other Standards](http://www.cs.umd.edu/users/cml/cstyle)
* [Design by Contract from Eiffle](http://www.eiffel.com/doc/manuals/technology/contract/)
* [C++ isn't Perfect, Here are Some Reasons Why](http://www.progsoc.uts.edu.au/~geldridg/cpp/cppcv3.html)
* [Doxygen](http://www.stack.nl/~dimitri/doxygen/) \- is a 'javadoc' like utility that extracts comments and relevant information from your C++/C programs and generates HTML pages from it.
* [Const Correctness](const.html) \- A very nice article on const correctness by Chad Loder.
* [Abraxis Code Check](http://www.abxsoft.com/) - A program for checking code for coding standard violations and other problems.

***

## Names

***

### Include Units in Names

If a variable represents time, weight, or some other unit then include the unit in the name so developers can more easily spot problems. For example:

```cpp
uint32 mTimeoutMsecs;
uint32 mMyWeightLbs;
```

Better yet is to make a variable into a class so bad conversions can be caught.

***

## Class Names

* Use upper case letters as word separators, lower case for the rest of a word
* First character in a name is upper case
* No underbars ('\_')

Of all the different naming strategies many people found this one the best compromise.

Example:

```cpp
class NameOneTwo

class Name
```  

* Name the class after what it is. If you can't think of what it is that is a clue you have not thought through the design well enough.
* Compound names of over three words are a clue your design may be confusing various entities in your system. Revisit your design. Try a CRC card session to see if your objects have more responsibilities than they should.
* Avoid the temptation of bringing the name of the class a class derives from into the derived class's name. A class should stand on its own. It doesn't matter what it derives from.
* Suffixes are sometimes helpful. For example, if your system uses agents then naming something DownloadAgent conveys real information.

***

### Class Library Names

* Now that name spaces are becoming more widely implemented, name spaces should be used to prevent class name conflicts among libraries from different vendors and groups.
* When not using name spaces, it's common to prevent class name clashes by prefixing class names with a unique string. Two characters is sufficient, but a longer length is fine.
* It is strongly recommended to use namespaces

Example:

John Johnson's complete data structure library could use _JJ_ as a prefix, so classes would be:

```cpp
class JjLinkList
{
}
```

***

### Method Names

* Use the same rule as for class names.

Of all the different naming strategies many people found this one the best compromise.

Example:

```cpp
class NameOneTwo
{
  public:
    int     DoIt();
    void    HandleError();
}
```

Usually every method and function performs an action, so the name should make clear what it does: CheckForErrors() instead of ErrorCheck(), DumpDataToFile() instead of DataFile(). This will also make functions and data objects more distinguishable.

Classes are often nouns. By making function names verbs and following other naming conventions programs can be read more naturally.

Suffixes are sometimes useful:

* _Max_ - to mean the maximum value something can have.
* _Cnt_ - the current count of a running count variable.
* _Key_ - key value.

For example: RetryMax to mean the maximum number of retries, RetryCnt to mean the current retry count.

Prefixes are sometimes useful:

* _Is_ - to ask a question about something. Whenever someone sees _Is_ they will know it's a question.
* _Get_ - get a value.
* _Set_ - set a value.

For example: `IsHitRetryLimit`.

***

### Class Attribute Names

* Attribute names should be prepended with the character 'a'.
* After the 'a' use the same rules as for class names.
* 'a' always precedes other name modifiers like 'p' for pointer.

Prepending 'a' prevents any conflict with method names. Often your methods and attribute names will be similar, especially for accessors.

Example:

```cpp
class NameOneTwo
{
public:
    int         VarAbc();
    int         ErrorNumber();
private:
    int         aVarAbc;
    int         aErrorNumber;
    String*     apName;
}
```

***

### Method Argument Names

* The first character should be lower case.
* All word beginnings after the first letter should be upper case as with class names.

You can always tell which variables are passed in variables.
You can use names similar to class names without conflicting with class names.

Example:

```cpp
class NameOneTwo
{
public:
   int StartYourEngines(
          Engine& rSomeEngine,
          Engine& rAnotherEngine);
}
```

***

### C++ File Extensions

In short: Use the _.hh_ extension for header files and _.cc_ for source files.

***

### C Function Names

* In a C++ project there should be very few C functions.
* For C functions use the GNU convention of all lower case letters with '\_' as the word delimiter.

It makes C functions very different from any C++ related names.

Example:

```cpp
int
some_bloody_function() {
}
```

***

### Make Names Fit

Names are the heart of programming. In the past people believed knowing someone's true name gave them magical power over that person. If you can think up the true name for something, you give yourself and the people coming after power over the code. Don't laugh!

A name is the result of a long deep thought process about the ecology it lives in. Only a programmer who understands the system as a whole can create a name that "fits" with the system. If the name is appropriate everything fits together naturally, relationships are clear, meaning is derivable, and reasoning from common human expectations works as expected.

If you find all your names could be Thing and DoIt then you should probably revisit your design.

### No All Upper Case Abbreviations

When confronted with a situation where you could use an all upper case abbreviation instead use an initial upper case letter followed by all lower case letters. No matter what.
People seem to have very different intuitions when making names containing abbreviations. It's best to settle on one strategy so the names are absolutely predictable.

Take for example _NetworkABCKey_.
Notice how the C from ABC and K from key are confused. Some people don't mind this and others just hate it so you'll find different policies in different code so you never know what to call something.

Example:

```cpp
   class FluidOz             // NOT FluidOZ
   class NetworkAbcKey       // NOT NetworkABCKey
```

***

### Variable Names on the Stack

* use all lower case letters
* use '\_' as the word separator.

With this approach the scope of the variable is clear in the code.
Now all variables look different and are identifiable in the code.

Example:

```cpp
int NameOneTwo::HandleError(int errorNumber) {
    int            error= OsErr();
    Time           time_of_error;
    ErrorProcessor error_processor;
}
```

***

### Pointer Variables

* pointers should be prepended by a 'p' in most cases
* place the _\*_ close to variable name not pointer type

Example:

```cpp
String *pName= new String;
String *pName, name, address; // note, only pName is a pointer.
```

***

### Reference Variables and Functions Returning References

* References should be prepended with 'r'.
* Const refs should not have 'r'.

The difference between variable types is clarified.
It establishes the difference between a method returning a modifiable object and the same method name returning a non-modifiable object.

Example:

```cpp
class Test
{
  public:
      void              DoSomething(StatusInfo& rStatus);
      StatusInfo&       rStatus();
      const StatusInfo& Status() const;

  private:
      StatusInfo&       arStatus;
}
```

***

### Global Variables

* Global variables should be prepended with a 'g'.

It's important to know the scope of a variable.

Example:

```cpp
Logger  gLog;
Logger* gpLog;
```

***

### Global Constants

* Global constants should be all caps with '\_' separators.

It's tradition for global constants to named this way. You must be careful to not conflict with other global _#define_s and enum labels.

Example:

```cpp
const int A_GLOBAL_CONSTANT= 5;
```

***

### Static Variables

* Static variables may be prepended with 's'.

It's important to know the scope of a variable.

Example:

```cpp
class Test
{
    public:
    private:
        static StatusInfo msStatus;
}
```

***

### Type Names

* When possible for types based on native types make a typedef.
* Typedef names should use the same naming policy as for a class with the word _Type_ appended.

Of all the different naming strategies many people found this one the best compromise.
Types are things so should use upper case letters. _Type_ is appended to make it clear this is not a class.

Example:

```cpp
typedef uint16  ModuleType;
typedef uint32  SystemType;
```

***

### Enum Names

* **Labels All Upper Case with '\_' Word Separators**

Example:

```cpp
enum PinStateType {
    PIN_OFF,
    PIN_ON
};
```

* **Enums as Constants without Class Scoping**

Sometimes people use enums as constants. When an enum is not embedded in a class make sure you use some sort of differentiating name before the label so as to prevent name clashes.

Example:

```cpp
enum PinStateType  {    // If _PIN_ was not prepended a conflict
   PIN_OFF,             // would occur as OFF and ON are probably
   PIN_ON               // already defined.
};
```

* **Enums with Class Scoping**

Just name the enum items what you wish and always qualify with the class name: Aclass::PIN\_OFF.

* **Make a Label for an Error State**

It's often useful to be able to say an enum is not in any of its _valid_ states. Make a label for an uninitialized or error state. Make it the first label if possible.

Example:

```cpp
enum { STATE_ERR,  STATE_OPEN, STATE_RUNNING, STATE_DYING};
```

***

### #define and Macro Names

* Put #defines and macros in all upper using '\_' separators.

This makes it very clear that the value is not alterable and in the case of macros, makes it clear that you are using a construct that requires care.
Some subtle errors can occur when macro names and enum labels use the same name.

Example:

```cpp
#define MAX(a,b) blah
#define IS_ERR(err) blah
```

***

## Required Methods for a Class

To be good citizens almost all classes should implement the following methods. If you don't have to define and implement any of the "required" methods they should still be represented in your class definition as comments.

* **Default Constructor**

If your class needs a constructor, make sure to provide one. You need one if during the operation of the class it creates something or does something that needs to be undone when the object dies. This includes creating memory, opening file descriptors, opening transactions etc.

If the default constructor is sufficient add a comment indicating that the compiler-generated version will be used.

If your default constructor has one or more optional arguments, add a comment indicating that it still functions as the default constructor.

* **Virtual Destructor**

If your class is intended to be derived from by other classes then make the destructor virtual.

* **Copy Constructor**

If your class is copyable, either define a copy constructor and assignment operator or add a comment indicating that the compiler-generated versions will be used.

If your class objects should not be copied, make the copy constructor and assignment operator private and don't define bodies for them. If you don't know whether the class objects should be copyable, then assume not unless and until the copy operations are needed.

* **Assignment Operator**

If your class is assignable, either define a assignment operator or add a comment indicating that the compiler-generated versions will be used.

If your objects should not be assigned, make the assignment operator private and don't define bodies for them. If you don't know whether the class objects should be assignable, then assume not.

Virtual destructors ensure objects will be completely destructed regardless of inheritance depth. You don't have to use a virtual destructor when:

* You don't expect a class to have descendants.
* An object must have a certain data layout and size.

A default constructor allows an object to be used in an array.
The copy constructor and assignment operator ensure an object is always properly constructed.

## The Law of The Big Three

A class with any of destructor, assignment operator, copy constructor generally needs all 3.

An example using default values:

```cpp
class Planet
{
public:
  // The following is the default constructor if
  // no arguments are supplied:
  //
  Planet(int radius= 5);
  
  // Use compiler-generated copy constructor, assignment, and destructor.
  // Planet(const Planet&);
  // Planet& operator=(const Planet&);
  // ~Planet();
};
```

***

## Formatting

***

### Braces _{}_ Policy

#### Brace Placement

Of the three major brace placement strategies the recommended one is here:

* Traditional Unix policy of placing the initial brace on the same line as the keyword and the trailing brace inline on its own line with the keyword:

```cpp
if (condition) {      while (condition) {
   ...                   ...
}                     }
```

#### When Braces are Needed

All if, while and do statements must either have braces or be on a single line.

#### Always Uses Braces Form

All if, while and do statements require braces even if there is only a single statement within the braces. For example:

```cpp
if (1 == somevalue) {
   somevalue = 2;
}
```

It ensures that when someone adds a line of code later there are already braces and they don't forget. It provides a more consistent look. This doesn't affect execution speed. It's easy to do.

#### One Line Form

```cpp
if (1 == somevalue) somevalue = 2;
```

It provides safety when adding new lines while maintainng a compact readable form.

#### Add Comments to Closing Braces

Adding a comment to closing braces can help when you are reading code because you don't have to find the begin brace to know what is going on.

```cpp
while(1) {
   if (valid) {
  
   } // if valid
   else {
   } // not valid

} // end forever
```

***

### Parens _()_ with Key Words and Functions Policy

* Do not put parens next to keywords. Put a space between.
* Do put parens next to function names.
* Do not use parens in return statements when it's not necessary.

Keywords are not functions. By putting parens next to keywords keywords and function names are made to look alike.

```cpp
if (condition) {
}

while (condition) {
}

strcpy(s, s1);

return 1;
```

***

### A Line Should Not Exceed 78 Characters

* Lines should not exceed 78 characters.

Even though with big monitors we stretch windows wide our printers can only print so wide. And we still need to print code.
The wider the window the fewer windows we can have on a screen. More windows is better than wider windows.
We even view and print diff output correctly on all terminals and printers.

***

### _If Then Else_ Formatting

#### Layout

It's up to the programmer. Different bracing styles will yield slightly different looks. One common approach is:

```cpp
if (condition) {
} else if (condition) {
} else {
}
```

If you have _else if_ statements then it is usually a good idea to always have an else block for finding unhandled cases. Maybe put a log message in the else even if there is no corrective action taken.

#### Condition Format

Always put the constant on the left hand side of an equality/inequality comparison. For example:

`if ( 6 == errorNum ) ...`

One reason is that if you leave out one of the = signs, the compiler will find the error for you. A second reason is that it puts the value you are looking for right up front where you can find it instead of buried at the end of your expression. It takes a little time to get used to this format, but then it really gets useful.

***

### _switch_ Formatting

* Falling through a case statement into the next case statement shall be permitted as long as a comment is included.
* The _default_ case should always be present and trigger an error if it should not be reached, yet is reached.
* If you need to create variables put all the code in a block.

Example:

```cpp
switch (...)
{
    case 1:
        ...
    // FALL THROUGH

    case 2:
    {
        int v;
        ...
    }
    break;

    default:
}
```

***

### Use of _goto,continue,break_ and _?:_

#### Goto

Goto statements should be used sparingly, as in any well-structured code. The goto debates are boring so we won't go into them here. The main place where they can be usefully employed is to break out of several levels of switch, for, and while nesting, although the need to do such a thing may indicate that the inner constructs should be broken out into a separate function, with a success/failure return code.

```cpp
for (...) {
    while (...) {
        ...
        if (disaster) {
            goto error;

    } }
}
...
error:
   clean up the mess
```

When a goto is necessary the accompanying label should be alone on a line and to the left of the code that follows. The goto should be commented (possibly in the block header) as to its utility and purpose.

#### Continue and Break

Continue and break are really disguised gotos so they are covered here.

Continue and break like goto should be used sparingly as they are magic in code. With a simple spell the reader is beamed to god knows where for some usually undocumented reason.

The two main problems with continue are:

* It may bypass the test condition
* It may bypass the increment/decrement expression

Consider the following example where both problems occur:

```cpp
while (TRUE) {
    ...
    // A lot of code
    ...
    if (/* some condition */) {
        continue;
    }
    ...
    // A lot of code
    ...
    if ( i++ > STOP_VALUE) break;
}
```

Note: "A lot of code" is necessary in order that the problem cannot be caught easily by the programmer.

From the above example, a further rule may be given: Mixing continue with break in the same loop is a sure way to disaster.

#### The ternary operator

The trouble is people usually try and stuff too much code in between the _?_ and _:_. Here are a couple of clarity rules to follow:

* Put the condition in parens so as to set it off from other code
* If possible, the actions for the test should be simple functions.
* Put the action for the then and else statement on a separate line unless it can be clearly put on one line.

Example:

```cpp
(condition) ? funct1() : func2();
```

or

```cpp
(condition)
    ? long statement
    : another long statement;
```

***

### One Statement Per Line

There should be only one statement per line unless the statements are very closely related.

The reasons are:

1. The code is easier to read. Use some white space too. Nothing better than to read code that is one line after another with no white space or comments.

### One Variable Per Line

Related to this is always define one variable per line:

**Not:**

```cpp
char **a, *x;
```

**Do**:

```cpp
char **a = 0;  // add doc
char  *x = 0;  // add doc
```

The reasons are:

1. Documentation can be added for the variable on the line.
2. It's clear that the variables are initialized.
3. Declarations are clear which reduces the probablity of declaring a pointer when you meant to declare just a char.

***

### Alignment of Declaration Blocks

* Block of declarations should be aligned.

Clarity.
Similarly blocks of initialization of variables should be tabulated.
The `&` and `\*` tokens should be adjacent to the the name, not the type.

Example:

```cpp
DWORD       aDword
DWORD      *apDword
char       *apChar
char        aChar

aDword      = 0;
apDword     = NULL;
apChar      = NULL;
aChar       = 0;
```

***

## Classes

***

### Naming Class Files

#### Class Definition in One File

Each class definition should be in its own file where each file is named directly after the class's name:

```cpp
ClassName.hh
```

#### Implementation in One File

In general each class should be implemented in one source file:

```cpp
ClassName.cc   // or whatever the extension is: cpp, c++
```

#### But When it Gets Really Big

If the source file gets too large or you want to avoid compiling templates all the time then add additional files named according to the following rule:

```cpp
ClassName_section.C
```

**section** is some name that identifies why the code is chunked together. The class name and section name are separated by '\_'.

***

### Class Layout

A common class layout is critical from a code comprehension point of view and for automatically generating documentation. C++ programmers, through a new set of tools, can enjoy the same level generated documentation Java programmers take for granted.

#### Class and Method Documentation

It is recommended a program like [Doxygen](http://www.doxygen.org/) be used to document C++ classes, method, variables, functions, and macros. The documentation can be extracted and put in places in a common area for all programmers to access. This saves programmers having to read through class headers. Documentation generation should be integrated with the build system where possible.

#### Required Methods Placeholders

This template has placeholders for [required methods](CppCodingStandard.html#req) . You can delete them or implement them.

***

### Ordering is: public, protected, private

Notice that the public interface is placed first in the class, protected next, and private last. The reasons are:

* programmers should care about a class's interface more than implementation
* when programmers need to use a class they need the interface not the implementation

It makes sense then to have the interface first. Placing implementation, the private section, first is a historical accident as the first examples used the private first layout. Over time emphasis has switched deemphasizing a class's interface over implementation details.

#### LIFECYCLE

The life cycle section is for methods that control the life cycle of an object. Typically these methods include constructors, destructors, and state machine methods.

#### OPERATORS

Place all operators in this section.

#### OPERATIONS

Place the bulk of a class's non access and inquiry method methods here. A programmer will look here for the meat of a class's interface.

#### ACCESS

Place attribute accessors here.

#### INQUIRY

These are the _Is\*_ methods. Whenever you have a question to ask about an object it can be asked via in _Is_ method. For example: IsOpen() will indicate if the object is open. A good strategy is instead of making a lot of access methods you can turn them around to be questions about the object thus reducing the exposure of internal structure. Without the IsOpen() method we might have had to do: if (STATE\_OPEN == State()) which is much uglier.

***

### What should go in public/protected/private

#### Public Section

Only put an object's interface in the public section. **DO NOT** expose any private data items in the public section. At least encapsulate access via access methods. Ideally your method interface should make most access methods unnecessary. Do not put data in the public interface.

#### Protected and Private Section

What should go into the protected section versus the private section is always a matter of debate.

##### All Protected

Some say there should be no private section and everything not in the public section should go in the protected section. After all, we should allow all our children to change anything they wish.

##### All Private

Another camp says by making the public interface virtual any derived class can change behavior without mucking with internals.

##### Wishy Washy

Rationally decide where elements should go and put them there. Not very helpful.

#### And the Winner Is

Keeping everything all private seems the easiest approach. By making the public methods virtual flexibility is preserved.

***

### Method Layout

The approach used is to place a comment block before each method that can be extracted by a tool and be made part of the class documentation. Here we'll use [Doxygen](http://www.doxygen.org) . See the Doxygen documentation for a list of attributes supported by the document generator.

#### Method Header

Follow Doxygen's way.

***

### Use of Namespaces

Namespaces are now commonly implemented by compilers. They should be used if you are sure your compiler supports them completely.

#### Naming Policy

There are two basic strategies for naming: root that name at some naming authority, like the company name and division name; try and make names globally independent.

#### Don't Globally Define using

Don't place "using namespace" directive at global scope in a header file. This can cause lots of magic invisible conflicts that are hard to track. Keep using statements to implementation files.

***

### Use Header File Guards

Include files should protect against multiple inclusion through the use of macros that "guard" the files.

#### When Not Using Namespces

```cpp
#ifndef filename_h
#define filename_h

#endif
```

The new line after the endif if is required by some compilers.

#### When Using Namespaces

If namespaces are used then to be completely safe:

```cpp
#ifndef namespace_filename_h
#define namespace_filename_h

#endif
```

1. Replace _filename_ with the name of the file being guarded. This should usually be the name of class contained in the file. Use the exact class name. Some standards say use all upper case. This is a mistake because someone could actually name a class the same as yours but using all upper letters. If the files end up be included together one file will prevent the other from being included and you will be one very confused puppy. It has happened!
2. Most standards put a leading **\_** and trailing **\_**. This is no longer valid as the C++ standard reserves leading \_ to compiler writers.
3. When the include file is not for a class then the file name should be used as the guard name.
4. Compilers differ on how comments are handled on preprocessor directives. Historically many compilers have not accepted comments on preprocessor directives.
5. Historically many compilers require a new line after last endif.

***

### Different Accessor Styles

#### Why Accessors

Access methods provide access to the physical or logical attributes of an object. Accessing an object's attributes directly as we do for C structures is greatly discouraged in C++. We disallow direct access to attributes to break dependencies, the reason we do most things. Directly accessing an attribute exposes implementation details about the object.

To see why ask yourself:

* What if the object decided to provide the attribute in a way other than physical containment?
* What if it had to do a database lookup for the attribute?
* What if a different object now contained the attribute?

If any of the above changed code would break. An object makes a contract with the user to provide access to a particular attribute; it should not promise how it gets those attributes. Accessing a physical attribute makes such a promise.

#### Accessors Considered Somewhat Harmful

At least in the public interface having accessors many times is an admission of failure, a failure to make an object's interface complete. At the protected or private level accessors are fine as these are the implementation levels of a class.

#### Implementing Accessors

There are three major idioms for creating accessors.

##### Get/Set

```cpp
class X
{
public:
    int     GetAge() const    { return aAge; }
    void    SetAge(int age)   { aAge= age; }
private:
    int aAge;
}
```

The problem with Get/Set is twofold:

* It's ugly. Get and Set are strewn throughout the code cluttering it up.
* It doesn't treat attributes as objects in their own right. An object will have an assignment operator. Why shouldn't age be an object and have its own assignment operator?

One benefit, that it shares with the _One Method Name_, is when used with messages the set method can transparently transform from native machine representations to network byte order.

##### One Method Name

```cpp
class X
{
public:
    int     Age() const     { return aAge; }
    void    Age(int age)    { aAge= age; }
private:
    int aAge;
}
```

Similar to Get/Set but cleaner. Use this approach when not using the _Attributes as Objects_ approach.

##### Attributes as Objects

```cpp
class X
{
public:
    int             Age() const     { return aAge; }
    int&            rAge()          { return aAge; }

    const String&   Name() const    { return aName; }
    String&         rName()         { return aName; }
private:
    int             aAge;
    String          aName;
}
```

The above two attribute examples shows the strength and weakness of the Attributes as Objects approach.

When using an int type, which is not a real object, the int is set directly because _rAge()_ returns a **reference**. The object can do no checking of the value or do any representation reformatting. For many simple attributes, however, these are not horrible restrictions. A way around this problem is to use a class wrapper around base types like int.

When an object is returned as reference its _\=_ operator is invoked to complete the assignment. For example:

   X x;
   x.rName()= "test";

This approach is also more consistent with the object philosophy: the object should do it. An object's _\=_ operator can do all the checks for the assignment and it's done once in one place, in the object, where it belongs. It's also clean from a name perspective.

When possible use this approach to attribute access.

***

### Initialize all Variables

* You shall always initialize variables. Always. Every time.

More problems than you can believe are eventually traced back to a pointer or variable left uninitialized. C++ tends to encourage this by spreading initialization to each constructor.

***

### Think About What Work to do in Constructors

Should you do work that can fail in constructors? If you have a compiler that does not support exceptions (or thread safe exceptions if it matters to you) then the answer is definitely no.### Do Work in Open

Do not do any real work in an object's constructor. Inside a constructor initialize variables only and/or do only actions that can't fail.

Create an Open() method for an object which completes construction. Open() should be called after object instantiation.

Example:

```cpp
class Device
{
    public:
        Device()    { /\* initialize and other stuff \*/ }
        int Open()  { return FAIL; }
};

Device dev;
if (FAIL == dev.Open()) exit(1);
```

#### Use Open Reasons

1. It is difficult to write exception safe code in constructor. It's possible to throw an exception and not destruct objects allocated in the constructor. Use of **auto\_ptr** can help prevent this problem.
2. Some compilers do not support thread safe exceptions on all platforms.
3. Virtual methods are not available in base classes. If the base class is expecting a virtual method implemented by derived classes to be available during construction then initialization must follow construction. This is common in frameworks.
4. Larger scale state machines may dictate when initialization should occur. An object may contain numerous other objects that may have complex initialization conditions. In this case we could wait to construct objects but then we always have to worry about null pointers.
5. If deletion is needed to free resources we still may want to keep the state around for debugging or statistics or as a supplier of information for other objects.

#### Do Work in Constructor

With exceptions work done in the constructor can signal failure so it is fine to perform real work in the constructor. This is the guru endorced approach as a matter of fact.

The constructor code must still be very careful not to leak resources in the constructor. It's possible to throw an exception and not destruct objects allocated in the constructor.

There is a pattern called **Resource Acquisition as Initialization** that says all initialization is performed in the constructor and released in the destructor. The idea is that this is a safer approach because it should reduce resource leaks.

***

### Be Careful Throwing Exceptions in Destructors

An object is presumably created to do something. Some of the changes made by an object should persist after an object dies (is destructed) and some changes should not. Take an object implementing a SQL query. If a database field is updated via the SQL object then that change should persist after the SQL objects dies. To do its work the SQL object probably created a database connection and allocated a bunch of memory. When the SQL object dies we want to close the database connection and deallocate the memory, otherwise if a lot of SQL objects are created we will run out of database connections and/or memory.

The logic might look like:

```cpp
Sql::~Sql()
{
   delete connection;
   delete buffer;
}
```

Let's say an exception is thrown while deleting the database connection. Will the buffer be deleted? No. Exceptions are basically non-local gotos with stack cleanup. The code for deleting the buffer will never be executed creating a gaping resource leak.

Special care must be taken to catch exceptions which may occur during object destruction. Special care must also be taken to fully destruct an object when it throws an exception.

***

## Documentation

***

### Comments Should Tell a Story

Consider your comments a story describing the system. Expect your comments to be extracted by a robot and formed into a man page. Class comments are one part of the story, method signature comments are another part of the story, method arguments another part, and method implementation yet another part. All these parts should weave together and inform someone else at another point of time just exactly what you did and why.

***

### Document Decisions

Comments should document decisions. At every point where you had a choice of what to do place a comment describing which choice you made and why.

***

### Use Headers

Use a document extraction system like [Doxygen](http://www.doxygen.org) . Other sections in this document describe how to use ccdoc to document a class and method.

These headers are structured in such a way as they can be parsed and extracted. They are not useless like normal headers. So take time to fill them out. If you do it right once no more documentation may be necessary.

***

### Make Gotchas Explicit

Explicitly comment variables changed out of the normal control flow or other code likely to break during maintenance. Embedded keywords are used to point out issues and potential problems. Consider a robot will parse your comments looking for keywords, stripping them out, and making a report so people can make a special effort where needed. For a complete list of Gotcha Keywords, please refer to [Doxygen](http://www.doxygen.org/) . Here are some useful ones:

#### Gotcha Keywords

* **@author:**      - specifies the author of the module
* **@version:**     - specifies the version of the module
* **@param:**       - specifies a parameter into a function
* **@return:**      - specifies what a function returns
* **@deprecated:**  - says that a function is not to be used anymore
* **@see:**         - creates a link in the documentation to the file/function/variable to consult to get a better understanding on what the current block of code does.
* **@todo:**        - what remains to be done
* **@bug:**         - report a bug found in the piece of code

#### Gotcha Formatting

* Make the gotcha keyword the first symbol in the comment.
* Comments may consist of multiple lines, but the first line should be a self-containing, meaningful summary.
* The writer's name and the date of the remark should be part of the comment. This information is in the source repository, but it can take a quite a while to find out when and by whom it was added. Often gotchas stick around longer than they should. Embedding date information allows other programmer to make this decision. Embedding who information lets us know who to ask.

Example:

```cpp
// :TODO: tmh 960810: possible performance problem
// We should really use a hash table here but for now we'll
// use a linear search.

// :KLUDGE: tmh 960810: possible unsafe type cast
// We need a cast here to recover the derived type. It should
// probably use a virtual method or template.
```

### Commenting function declarations

Functions headers should be in the file where they are declared. This means that most likely the functions will have a header in the .hh file. However, functions like main() with no explicit prototype declaration in the .hh file, should have a header in the .cn file.

***

### Include Statement Documentation

Include statements should be documented, telling the user why a particular file was included. If the file includes a class used by the class then it's useful to specify a class relationship:

* ISA
* HASA
* USES

Example:

```cpp
#ifndef XX_h
#define XX_h

// SYSTEM INCLUDES
//
#include #include
```

***

## Using Use Cases

A _use case_ is a generic description of an entire transaction involving several objects. A use case can also describe the behaviour of a set of objects, such as an organization. A use case model thus presents a collection of use cases and is typically used to specify the behavior of a whole application system together with one or more external actors that interact with the system.

An individual use case may have a name (although it is typically not a simple name). Its meaning is often written as an informal text description of the external actors and the sequences of events between objects that make up the transaction. Use cases can include other use cases as part of their behaviour.

### Requirements Capture

Use cases attempt to capture the requirements for a system in an understandable form. The idea is by running through a set of use case we can verify that the system is doing what it should be doing.

Have as many use cases as needed to describe what a system needs to accomplish.

### The Process

* Start by understanding the system you are trying to build.
* Create a set of use cases describing how the system is to be used by all its different audiences.
* Create a class and object model for the system.
* Run through all the use cases to make sure your model can handle all the cases. Update your model and create new use cases as necessary.

***

## Unified Modeling Language

The Unified Modeling Language is too large to present here. Fortunately you can see it at [Rational's](http://www.rational.com/ot/uml.html) web site. Since you do need a modeling language UML is a safe choice. It combines features from several methods into one unified language. Remember all languages and methods are open to local customization. If their language is too complex then use the parts you and your project feel they need and junk the rest.

***

## OPEN Method

[OPEN](http://www.markv.com/OPEN/) stands for **Object-oriented Process, Environment and Notation** and is a worthy if not superior competitor to UML. It is another group effort composed of basically all the people not in the UML group :-) Their web site has a good comparison of OPEN and UML.

My guess is UML will win out for marketing reasons. But it is good to have some competition going.

***

## Open/Closed Principle

The Open/Closed principle states a class must be open and closed where:

* open means a class has the ability to be extended.
* closed means a class is closed for modifications other than extension. The idea is once a class has been approved for use having gone through code reviews, unit tests, and other qualifying procedures, you don't want to change the class very much, just extend it.

The Open/Closed principle is a pitch for stability. A system is extended by adding new code not by changing already working code. Programmers often don't feel comfortable changing old code because it works! This principle just gives you an academic sounding justification for your fears :-)

In practice the Open/Closed principle simply means making good use of our old friends abstraction and polymorphism. Abstraction to factor out common processes and ideas. Inheritance to create an interface that must be adhered to by derived classes. In C++ we are talking about using abstract base classes. A lot.

***

## Design by Contract

The idea of design by contract is strongly related to LSP(Liskov substitution principle). A contract is a formal statement of what to expect from another party. In this case the contract is between pieces of code. An object and/or method states that it does X and you are supposed to believe it. For example, when you ask an object for its volume that's what you should get. And because volume is a verifiable attribute of a thing you could run a series of checks to verify volume is correct, that is, it satisfies its contract.

The contract is enforced in languages like Eiffel by pre and post condition statements that are actually part of the language. In other languages a bit of faith is needed.

Design by contract when coupled with language based verification mechanisms is a very powerful idea. It makes programming more like assembling spec'd parts.

***

## Complexity Management

***

### Layering

Layering is the primary technique for reducing complexity in a system. A system should be divided into layers. Layers should communicate between adjacent layers using well defined interfaces. When a layer uses a non-adjacent layer then a layering violation has occurred.

A layering violation simply means we have dependency between layers that is not controlled by a well defined interface. When one of the layers changes code could break. We don't want code to break so we want layers to work only with other adjacent layers.

Sometimes we need to jump layers for performance reasons. This is fine, but we should know we are doing it and document appropriately.

***

### Delegation

Delegation is the idea of a method using another object's method to do the real work. In some sense the top layer method is _a front_ for the other method. Delegation is a form of dependency breaking. The top layer method never has to change while it's implementation can change at will.

Delegation is an alternative to using inheritance for implementation purposes. One can use inheritance to define an interface and delegation to implement the interface.

Some people feel delegation is a more robust form of OO than using implementation inheritance. Delegation encourages the formation of abstract class interfaces and HASA relationships. Both of which encourage reuse and dependency breaking.

Example:

```cpp
class TestTaker
{
public:
    void WriteDownAnswer()   { mPaidTestTaker.WriteDownAnswer(); }
private:
    PaidTestTaker  mPaidTestTaker;
}
```

In this example a test taker delegates actually answering the question to a paid test taker. Not ethical but a definite example of delegation!

***

### Minimize Dependencies with Abstract Base Classes

One of the most important strategies in C++ is to remove dependencies among different subsystems. Abstract base classes (ABCs) are a solid technique for dependency removal.

An ABC is an abstraction of a common form such that it can be used to build more specific forms. An ABC is a common interface that is reusable across a broad range of similar classes. By specifying a common interface as long as a class conforming to that interface is used it doesn't really matter what is the type of the derived type. This breaks code dependencies. New classes, conforming to the interface, can be substituted in at will without breaking code. In C++ interfaces are specified by using base classes with virtual methods.

The above is a bit rambling because it's a hard idea to convey. So let's use an example: We are doing a GUI where things jump around on the screen. One approach is to do something like:

```cpp
class Frog
{
    public:
        void Jump();
}
class Bean
{
    public:
        void Jump();
}
```

The GUI folks could instantiate each object and call the Jump method of each object. The Jump method of each object contains the implementation of jumping behavior for that type of object. Obviously frogs and beans jump differently even though both can jump.

Unfortunately the owner of Bean didn't like the word Jump so they changed the method name to Leap. This broke the code in the GUI and one whole week was lost.

Then someone wanted to see a horse jump so a Horse class was added:

```cpp
class Horse
{
    public:
        void Jump();
}
```

The GUI people had to change their code again to add Horse.

Then someone updated Horse so that its Jump behavior was slightly different. Unfortunately this caused a total recompile of the GUI code and they were pissed.

Someone got the bright idea of trying to remove all the above dependencies using abstract base classes. They made one base class that specified an interface for jumping things:

```cpp
class Jumpable
{
    public:
        virtual void Jump() = 0;
}
```

Jumpable is a base class because other classes need to derive from it so they can get Jumpable's interface. It's an abstract base class because one or more of its methods has the _\= 0_ notation which means the method is a _pure virtual method_. Pure virtual methods **must** be implemented by derived classes. The compiler checks.

Not all methods in an ABC must be pure virtual, some may have an implementation. This is especially true when creating a base class encapsulating a process common to a lot of objects. For example, devices that must be opened, diagnostics run, booted, executed, and then closed on a certain event may create an ABC called Device that has a method called LifeCycle which calls all other methods in turn thus running through all phases of a device's life. Each device phase would have a pure virtual method in the base class requiring implementation by more specific devices. This way the process of using a device is made common but the specifics of a device are hidden behind a common interface.

Back to Jumpable. All the classes were changed to derive from Jumpable:

```cpp
class Frog : public Jumpable
{
    public:
        virtual void Jump() { ... }
}

// etc ...
```

We see an immediate benefit: we know all classes derived from Jumpable **must** have a Jump method. No one can go changing the name to Leap without the compiler complaining. One dependency broken.

Another benefit is that we can pass Jumpable objects to the GUI, not specific objects like Horse or Frog:

```cpp
class Gui
{
    public:
        void MakeJump(Jumpable*);
}

Gui gui;
Frog* pFrog= new Frog;

gui.MakeJump(pFrog);
```

Notice Gui doesn't even know it's making a frog jump, it just has a jumpable thing, that's all it cares about. When Gui calls the Jump method it will get the implementation for Frog's Jump method. Another dependency down. Gui doesn't have to know what kind of objects are jumping.

We also removed the recompile dependency. Because Gui doesn't contain any Frog objects it will not be recompiled when Frog changes.

### Downside

Wow! Great stuff! Yes but there are a few downsides:

#### Overhead for Virtual Methods

Virtual methods have a space and time penalty. It's not huge, but should be considered in design.

#### Make Everything an ABC

Sometimes people overdo it, making everything an ABC. The rule is make an ABC when you need one not when you might need one. It takes effort to design a good ABC, throwing in a virtual method doesn't an ABC make. Pick and choose your spots. When some process or some interface can be reused and people will actually make use of the reuse then make an ABC and don't look back.

***

### Liskov's Substitution Principle (LSP)

This principle states:

   All classes derived from a base class should be interchangeable
   when used as a base class.

The idea is users of a class should be able to count on similar behavior from all classes that derive from a base class. No special code should be necessary to qualify an object before using it. If you think about it violating LSP is also violating the Open/Closed principle because the code would have to be modified every time a derived class was added. It's also related to dependency management using abstract base classes

For example, if the Jump method of a Frog object implementing the Jumpable interface actually makes a call and orders pizza we can say its implementation is not in the spirit of Jump and probably all other objects implementing Jump. Before calling a Jump method a programmer would now have to check for the Frog type so it wouldn't screw up the system. We don't want this in programs. We want to use base classes and feel comfortable we will get consistent behaviour.

LSP is a very restrictive idea. It constrains implementors quite a bit. In general people support LSP and have LSP as a goal.

***

### Follow the Law of Demeter

The _Law of Demeter_ states that you shouldn't access a contained object directly from the containing object, you should use a method of the containing object that does what you want and accesses any of its objects as needed.

The purpose of this law is to break dependencies so implementations can change without breaking code. If an object wishes to remove one of its contained objects it won't be able to do so because some other object is using it. If instead the service was through an interface the object could change its implementation anytime without ill effect.

### Caveat

As for most laws the Law of Demeter should be ignored in certain cases. If you have a really high level object that contains a lot of subobjects, like a car contains thousands of parts, it can get absurd to created a method in car for every access to a subobject.

Example:

```cpp
class SunWorkstation
{
    public:
        void          UpVolume(int amount) { mSound.Up(amount); }
        SoundCard     mSound;

    private:
        GraphicsCard  mGraphics;
}

SunWorksation sun;

Do   : sun.UpVolume(1);
Don't: sun.mSound.Up(1);
```

***

## Miscellaneous

***

### Be Const Correct

C++ provides the _const_ key word to allow passing as parameters objects that cannot change to indicate when a method doesn't modify its object. Using const in all the right places is called "const correctness." It's hard at first, but using const really tightens up your coding style. Const correctness grows on you.

For more information see Const Correctness in the C++ FAQ.

***

### Use Streams

Programmers transitioning from C to C++ find stream IO strange preferring the familiarity of good old stdio. Printf and gang seem to be more convenient and are well understood.

#### Type Safety

Stdio is not type safe, which is one of the reasons you are using C++, right? Stream IO is type safe. That's one good reason to use streams.

#### Standard Interface

When you want to dump an object to a stream there is a standard way of doing it: with the _<<_ operator. This is not true of objects and stdio.

##### Interchangeablity of Streams

One of the more advanced reasons for using streams is that once an object can dump itself to a stream it can dump itself to any stream. One stream may go to the screen, but another stream may be a serial port or network connection. Good stuff.

##### Streams Got Better

Stream IO is not perfect. It is however a lot better than it used to be. Streams are now standardized, acceptably efficient, more reliable, and now there's lots of documentation on how to use streams.

##### Check Thread Safety

Some stream implementations are not yet thread safe. Make sure that yours is.

##### But Not Perfect

For an embedded target tight on memory streams do not make sense. Streams inline a lot of code so you might find the image larger than you wish. Experiment a little. Streams might work on your target.

***

### Use #if Not #ifdef

Use `#if MACRO not #ifdef MACRO`. Someone might write code like:

```cpp
#ifdef DEBUG
    temporary_debugger_break();
#endif
```

Someone else might compile the code with turned-of debug info like:

```bash
cc -c lurker.cc -DDEBUG=0
```

Alway use #if, if you have to use the preprocessor. This works fine, and does the right thing, even if DEBUG is not defined at all (!)

```cpp
#if DEBUG
    temporary_debugger_break();
#endif
```

If you really need to test whether a symbol is defined or not, test it with the defined() construct, which allows you to add more things later to the conditional without editing text that's already in the program:

```cpp
#if !defined(USER_NAME)
 #define USER_NAME "john smith"
#endif
```

***

### Commenting Out Large Code Blocks

Sometimes large blocks of code need to be commented out for testing.

#### Using #if 0

The easiest way to do this is with an #if 0 block:

```cpp
void
example()
{
  // great looking code

    #if 0
    // lots of code
    #endif

    // more code
}
```

You can't use **/\*\*/** style comments because comments can't contain comments and surely a large block of your code will contain a comment, won't it?

Don't use #ifdef as someone can unknowingly trigger ifdefs from the compiler command line.

#### Use Descriptive Macro Names Instead of 0

The problem with **#if 0**is that even day later you or anyone else has know idea why this code is commented out. Is it because a feature has been dropped? Is it because it was buggy? It didn't compile? Can it be added back? It's a mystery.

#### Use Descriptive Macro Names Instead of #if 0

```cpp
#if NOT\_YET\_IMPLEMENTED  

#if OBSOLETE

#if TEMP\_DISABLED
```

#### Add a Comment to Document Why

Add a short comment explaining why it is not implemented, obsolete or temporarily disabled.

***

### Don't Over Use Operators

C++ allows the overloading of all kinds of weird operators. Unless you are building a class directly related to math there are very few operators you should override. Only override an operator when the semantics will be clear to users.
Very few people will have the same intuition as you about what a particular operator will do.

***

### Short Methods

* Methods should limit themselves to a single page of code.

The idea is that the each method represents a technique for achieving a single objective.
Most arguments of inefficiency turn out to be false in the long run.
True function calls are slower than not, but there needs to a thought out decision (see premature optimization).

***

### No Magic Numbers

A magic number is a bare naked number used in source code. It's magic because no-one has a clue what it means including the author inside 3 months. For example:

```cpp
if      (22 == foo) { start_thermo_nuclear_war(); }
else if (19 == foo) { refund_lotso_money(); }
else if (16 == foo) { infinite_loop(); }
else                { cry_cause_im_lost(); }
```

In the above example what do 22 and 19 mean? If there was a number change or the numbers were just plain wrong how would you know? Instead of magic numbers use a real name that means something. You can use _#define_ or constants or enums as names. Which one is a design choice. For example:

```cpp
#define PRESIDENT_WENT_CRAZY  (22)
const int WE_GOOFED= 19;
enum {
    THEY_DIDNT_PAY= 16
};

if      (PRESIDENT_WENT_CRAZY == foo) { start_thermo_nuclear_war(); }
else if (WE_GOOFED            == foo) { refund_lotso_money(); }
else if (THEY_DIDNT_PAY       == foo) { infinite_loop(); }
else                                  { happy_days_i_know_why_im_here(); }
```

Now isn't that better? The const and enum options are preferable because when debugging the debugger has enough information to display both the value and the label. The #define option just shows up as a number in the debugger which is very inconvenient. The const option has the downside of allocating memory. Only you know if this matters for your application.

***

### Error Return Check Policy

* Check every system call for an error return, unless you know you wish to ignore errors. For example, _printf_ returns an error code but rarely would you check for its return code. In which case you can cast the return to **(void)** if you really care.
* Include the system error text for every system error message.
* Check every call to malloc or realloc unless you know your versions of these calls do the right thing. You might want to have your own wrapper for these calls, including new, so you can do the right thing always and developers don't have to make memory checks everywhere.

***

### To Use Enums or Not to Use Enums

C++ allows constant variables, which should deprecate the use of enums as constants. Unfortunately, in most compilers constants take space. Some compilers will remove constants, but not all. Constants taking space precludes them from being used in tight memory environments like embedded systems. Workstation users should use constants and ignore the rest of this discussion.

In general enums are preferred to _#define_ as enums are understood by the debugger.

Be aware enums are not of a guaranteed size. So if you have a type that can take a known range of values and it is transported in a message you can't use an enum as the type. Use the correct integer size and use constants or _#define_. Casting between integers and enums is very error prone as you could cast a value not in the enum.

#### A C++ Workaround

C++ allows static class variables. These variables are available anywhere and only the expected amount of space is taken.

Example:

```cpp
class Variables
{
public:
   static const int   A_VARIABLE;
   static const int   B_VARIABLE;
   static const int   C_VARIABLE;
}
```

***

### Macros

#### Don't Turn C++ into Pascal

Don't change syntax via macro substitution. It makes the program unintelligible to all but the perpetrator.

#### Replace Macros with Inline Functions

In C++ macros are not needed for code efficiency. Use inlines.

Example:

```cpp
#define  MAX(x,y) (((x) > (y) ? (x) : (y)) // Get the maximum
```

The macro above can be replaced for integers with the following inline function with no loss of efficiency:

```cpp
inline int
max(int x, int y)
{
    return (x > y ? x : y);
}
```

#### Be Careful of Side Effects

Macros should be used with caution because of the potential for error when invoked with an expression that has side effects.

Example:

```cpp
MAX(f(x),z++);
```

#### Always Wrap the Expression in Parenthesis

When putting expressions in macros always wrap the expression in parenthesis to avoid potential communitive operation abiguity.

Example:

```cpp
#define ADD(x,y) x + y
```

must be written as:

```cpp
#define ADD(x,y) ((x) + (y))
```

#### Make Macro Names Unique

Like global variables macros can conflict with macros from other packages.

1. Prepend macro names with package names.
2. Avoid simple and common names like MAX and MIN.

***

### The Bull of Boolean Types

Any project using source code from many sources knows the pain of multiple conflicting boolean types. The new C++ standard defines a native boolean type. Until all compilers support bool, and existing code is changed to use it, we must still deal with the cruel world.

The form of boolean most accurately matching the new standard is:

```cpp
typedef int     bool;
#define TRUE    1
#define FALSE   0
```

or

```cpp
const int TRUE  = 1;
const int FALSE = 0;
```

Note, the standard defines the names **true** and **false** not TRUE and FALSE. The all caps versions are used to not clash if the standard versions are available.

Even with these declarations, do not check a boolean value for equality with 1 (TRUE, YES, etc.); instead test for inequality with 0 (FALSE, NO, etc.). Most functions are guaranteed to return 0 if false, but only non-zero if true. Thus,

```cpp
if (TRUE == func()) { ...
```

must be written:

```cpp
if (FALSE != func()) { ...
```

***

### Usually Avoid Embedded Assignments

There is a time and a place for embedded assignment statements. In some constructs there is no better way to accomplish the results without making the code bulkier and less readable.

```cpp
while (EOF != (c = getchar()))
    {
        // process the character
    }
```

The ++ and -- operators count as assignment statements. So, for many purposes, do functions with side effects. Using embedded assignment statements to improve run-time performance is also possible. However, one should consider the tradeoff between increased speed and decreased maintainability that results when embedded assignments are used in artificial places. For example,

```cpp
a = b + c;
d = a + r;
```

should not be replaced by

```cpp
d = (a = b + c) + r;
```

even though the latter may save one cycle. In the long run the time difference between the two will decrease as the optimizer gains maturity, while the difference in ease of maintenance will increase as the human memory of what's going on in the latter piece of code begins to fade.

***

### Mixing C and C++

In order to be backward compatible with dumb linkers C++'s link time type safety is implemented by encoding type information in link symbols, a process called _name mangling_. This creates a problem when linking to C code as C function names are not mangled. When calling a C function from C++ the function name will be mangled unless you turn it off. Name mangling is turned off with the _extern "C"_ syntax. If you want to create a C function in C++ you must wrap it with the above syntax. If you want to call a C function in a C library from C++ you must wrap in the above syntax. Here are some examples:

#### Calling C Functions from C++

```cpp
extern "C" int strncpy(...);
extern "C" int my_great_function();
extern "C"
{
   int strncpy(...);
   int my_great_function();
};
```

#### Creating a C Function in C++

```cpp
extern "C" void
a_c_function_in_cplusplus(int a)
{
}
```

### _\_\_cplusplus_ Preprocessor Directive

If you have code that must compile in a C and C++ environment then you must use the _\_\_cplusplus_ preprocessor directive. For example:

```cpp
#ifdef __cplusplus

extern "C" some_function();

#else

extern some_function();

#endif
```

***

### Misc practices

This section contains some miscellaneous do's and don'ts.

* Don't use floating-point variables where discrete values are needed. Using a float for a loop counter is a great way to shoot yourself in the foot. Always test floating-point numbers as <= or >=, never use an exact comparison (== or !=).
* Compilers have bugs. Common trouble spots include structure assignment and bit fields. You cannot generally predict which bugs a compiler has. You could write a program that avoids all constructs that are known broken on all compilers. You won't be able to write anything useful, you might still encounter bugs, and the compiler might get fixed in the meanwhile. Thus, you should write \`\`around'' compiler bugs only when you are forced to use a particular buggy compiler.
* Do not rely on automatic beautifiers. The main person who benefits from good program style is the programmer him/herself, and especially in the early design of handwritten algorithms or pseudo-code. Automatic beautifiers can only be applied to complete, syntactically correct programs and hence are not available when the need for attention to white space and indentation is greatest. Programmers can do a better job of making clear the complete visual layout of a function or file, with the normal attention to detail of a careful programmer (in other words, some of the visual layout is dictated by intent rather than syntax and beautifiers cannot read minds). Sloppy programmers should learn to be careful programmers instead of relying on a beautifier to make their code readable. Finally, since beautifiers are non-trivial programs that must parse the source, a sophisticated beautifier is not worth the benefits gained by such a program. Beautifiers are best for gross formatting of machine-generated code.
* Accidental omission of the second `=` of the logical compare is a problem. The following is confusing and prone to error.

```cpp
if (abool= bbool) { ... }
```

Does the programmer really mean assignment here? Often yes, but usually no. The solution is to just not do it. Instead use explicit tests and avoid assignment with an implicit test. The recommended form is to do the assignment before doing the test:

```cpp
abool= bbool;
if (abool) { ... }
```

* Modern compilers will put variables in registers automatically. Use the register sparingly to indicate the variables that you think are most critical. In extreme cases, mark the 2-4 most critical values as register and mark the rest as REGISTER. The latter can be #defined to register on those machines with many registers.

***

### No Data Definitions in Header Files

Do not put data definitions in header files. for example:

```cpp
/*
 * aheader.h
 */
int x = 0;
```

1. It's bad magic to have space consuming code silently inserted through the innocent use of header files.
2. It's not common practice to define variables in the header file so it will not occur to devellopers to look for this when there are problems.
3. Consider defining the variable once in a .cc file and use an extern statement to reference it.
4. Consider using a singleton for access to the data.

***

### Make Functions Reentrant

Functions should not keep static variables that prevent a function from being reentrant. Functions can declare variables static. Some C library functions in the past, for example, kept a static buffer to use a temporary work area. Problems happen when the function is called one or more times at the same time. This can happen when multiple tasks are used or say from a signal handler. Using the static buffer caused results to overlap and become corrupted.

The moral is make your functions reentrant by not using static variables in a function. Besides, every machine has lots of RAM now so we don't worry about buffer space any more :-)
