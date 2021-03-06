# Регулярные выражения

Регулярные выражения записываются **/**_между двумя слешами_**/**.
Они проверяют, соответствует ли строка заданному шаблону.
Для того, чтобы понять, как с ними работать, проще всего обратиться к примерам использования соответствующих кванторов.


## Кванторы

Кванторы | Назначение | Выражение | Находит
-------- | ---------- | --------- | -------
1fд | символ | /1fд/ | <ins>1</ins>0; <ins>f</ins>s; as<ins>д</ins>
\| | или | /12\|56/ | <ins>12</ins>3; 4<ins>56</ins>
* | ≥0 | /ar*/ | <ins>a</ins>; <ins>ar</ins>; <ins>arr</ins>; <ins>arrr</ins>
+ | ≥1 | /ar+/ | a; <ins>ar</ins>; <ins>arr</ins>; <ins>arrr</ins>
[...] | диапазон | /[A-Z][a-b1-2]/  | Aa; Cb; X2; ...
(...) | группа (к содержимому можно обращаться по ссылке типа \1, \2, ...) | /Ва(ся\|ня\|лера)/ | Вася; Ваня; Валера; ...
(?:...) | группа (к содержимому нельзя обращаться) | –//– | –//–
{n} | количество | /[ijk]{2}/ | ij; ik; ii; kj; ...
{n,m} | количество от n до m | /[ijk]{2,4}/ | ij; ikii; kjj; ...
{n,} | количество от n | /[ijk]{2,}/ | ij; ikijki; kjj; ...
. | любой символ, кроме переноса строки |  |
? | может быть, а может и не быть | /вы?ход/ | вход; выход
\b | граница слова | /\b\w+\b/g | все слова
$ | конец строки (исключая перенос строки) | /\w+bar$/ | foobar; woobar; ...
^ | начало строки | /^foo\w+/ | football; food; ...
^ | не (в диапазоне) | /[^\d]+/ | всё, пока не встретится число

Все перечисленные кванторы становятся символами, если они экранируются слешем **\\**.


## Краткие обозначения

Обозначение | Заменяет
----------- | --------
\s | пробел, таб или перенос строки
\w | [a-zA-Z0-9]
\d | [0-9]
\S | [^\s]
\W | [^\w]
\D | [^\d]


## Модификаторы

После регулярного выражения (после второго слеша) могут следовать модификаторы.

Модификатор | Назначение | Выражение | Находит
----------- | ---------- | --------- | -------
i | нечувствительность к регистру | /[a-z]+/i | <ins>Anna</ins> <ins>and</ins> <ins>rIchArD</ins>
g | всевозможные совпадения (не только первое) | /a/ig | <ins>A</ins>r<ins>a</ins>r<ins>a</ins>t
m | многострочность | /^[\w\s]+end$/gm | <ins>The end</ins><br>Almost done<br><ins>The very end</ins>


## Примеры выражений
Назначение | Выражение
---------- | ---------
Имя | /[\w\s]+/
E-Mail | /^[\w_\.]+@\w+\.\w{2,6}$/i
Пароль, в котором хотя бы 1 цифра, 1 строчная и 1 заглавная буквы | /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}/

## Источники
- [x] https://www.codeschool.com/courses/breaking-the-ice-with-regular-expressions
- [ ] https://www.lynda.com/Regular-Expressions-tutorials/Using-Regular-Expressions/85870-2.html
- [ ] https://regex101.com
- [ ] http://rubular.com
- [ ] http://learnpython.org/en/Regular_Expressions
- [ ] http://eloquentjavascript.net/09_regexp.html
- [ ] http://www.w3schools.com/jsref/jsref_obj_regexp.asp
- [ ] http://www.lunametrics.com/blog/2006/08/13/regular-expressions-part-i-escaping-with-a-backslash/
- [ ] Oracle Regular Expressions Pocket Reference
- [ ] https://www.pluralsight.com/search?q=regex&categories=all
- [x] http://www.exlab.net/tools/sheets/regexp.html
- [ ] https://ru.wikipedia.org/wiki/Символы-джокеры