# UNIX + bash (Bourne Again Shell) — основной язык терминала


# Работа с терминалом
# ⌘ + T — создать новую вкладку
# ⌘ + K — очистить сообщения
# ↑, ↓ — переместиться по истории использованных команд
# ctrl + a — переместить каретку в начало строки
# ctrl + e — переместить каретку в конец строки
# alt + click — переместить каретку в место по клику
# tab — автозаполнение команд или имён файлов
# tab + tab — список возможных команд или имён файлов
# q; x; esc; ctrl + x; ctrl + q — выход
# ctrl + c — принудительное завершение процесса
# ctrl + v -> [клавиша на клавиатуре] — ввести символ, соответствующий нажатой клавишей

# Переменные
# задаются следующим образом:
a=Hello
b="Hello World"
c=42
VAR123=$(pwd) # команда, доступная по переменной
# и вызываются так:
$VAR123
# также переменные можно использовать внутри "двойных кавычек"
# позволить другим программам использовать переменную
export VAR
# переменным можно задавать параметры с помощью команды declare
declare -i d=123 # целое число
declare -r e=234 # константа (только чтение)
declare -l f="iGor" # igor
declare -u g="iGor" # IGOR
# системные переменные — http://www.tldp.org/LDP/abs/html/internalvariables.html
$PATH # здесь находятся все пути к командам
$PS1 # то, что находится перед стокой ввода
$HOME # папка текущего пользователя
$SHELL # папка, где находится оболочка
$PWD # текущая папка
$MACHTYPE # тип ЭВМ
$HOSTNAME # имя системы
$BASH_VERSION # версия Bash
$SECONDS # время (в секундах), в течение которого работала сессия
$0 # имя скрипта

# Массивы
arr=("item_1" "item_2" "item_3")
${arr[0]} # обращение к элементу массива
${arr[@]} # обращение ко всему массиву
${arr[@]: -1} # обращение к последнему элементу массива
arr[3]="item_4" # задать значение элементу массива
arr+=("item_5") # добавить элемент в конец массива
# Ассоциативные массивы
declare -A arr
arr[color]=blue
arr["complicated key"]="complicated value"
${arr["complicated key"]} # "complicated value"

# Команды
# команда — это, по сути, ссылка на программу, которая исполняется при вызове команды. вот 4 идентичные записи
echo Hi \(1\)
echo 'Hi (1)'
echo "Hi (1)"
/bin/echo "Hi (1)"
# все пути описаны в переменной $PATH (разделены двоеточием и ищутся по заданному порядку)
# все команды выполняются по структуре
команда опции аргументы
# например
echo -n 'Hello' ' World!'
# несколько однобуквенных опций могут быть записаны вместе; то есть
-a -b -c
# то же, что и
-abc
# у опций также могут быть параметры. и чтобы не путаться, их можно не разделять пробелом с самими опциями, например чтобы
# написать символами "#" слово
banner -w50 'iGor'
# команды можно писать друг за другом через точку с запятой
echo -n 'Hello'; echo ' World!'

# документация по командам
man
  -k # краткое описание
    <команда>
## краткое описание
whatis <команда>
## краткое описание
apropos <команда|часть_команды>

# местонахождение
whereis <команда>
which <команда>

# общие опции для всех команд
<команда>
  -v # версия команды
  --version # версия команды
  --help # помощь по использованию команды

# "очистка" экрана
clear

# вывести на экран
echo
  -n # после ввода не переносить строку
    'Hello World!'
    {1..10} # 1 2 3 4 5 6 7 8 9 10
    {A..D}  # A B C D
# вывод с параметрами — http://wiki.bash-hackers.org/commands/builtin/printf
printf "%s, %d" "String" "42"

# путь к текущей папке (print (или present) working directory)
pwd

# всё, что находится в папке (list the content of the current directory)
ls # в текущей папке
ls <название папки>
  # Параметры
  -a # все (в том числе и скрытые) файлы (all)
  -l # отображение списком
    drwxrwxrwx # первый символ определяет тип объекта (d — папка; - — файл)
  -h # размеры файлов отображаются удобнее
  -1 | wc -l # количество файлов в текущей папке
  *.txt # все текстовые файлы

# перейти в папку <название папки> (change directory)
cd
  /  # корень файловой системы
  ~  # папка текущего пользователя
  .. # родительский каталог
  /home # абсолютный путь
  folder_name   # относительный путь
  "folder name" # относительный путь

# создать папку <название папки> (make directory)
mkdir
  <название папки>
  -p path/to/folder # создание подпапок при отсутствии
  -v # сообщение о том, какая папка была создана

# создать файл
touch
  file.txt
  {apple, banana, cherry, durian} # несколько файлов
  file_{1..1000} # 1000 файлов с порядковой нумерацией
  file_{1..1000}{A..C} # 3000 файлов

# редактировать файл
nano
  file.txt

# копирование файла
cp
  copy.txt to.txt
  -R copy to # копировать одну папку в другую вместе с содержимым
  -n # без замены
  -f # с заменой (по умолчанию)
  -i # спрашивать о замене
  -v # отчёт

# перемещение файла
mv
  move.txt to.txt # переименование файла
  move.txt to     # перемещение файла в папку to
  -n # без замены
  -f # с заменой (по умолчанию)
  -i # спрашивать о замене
  -v # отчёт

# удаление файла
rm
  file.txt
  -R folder # удалить папку и её содержимое
  * # удалить всё

# удаление пустой папки
rmdir
  folder

# ссылка на файл
ln
  file.txt linkname    # работает даже при удалении или перемещении файла
  -s file.txt linkname # не работает при удалении или перемещении файла
  -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl # позволяет открывать документы с помощью Sublime Text командой subl

# чтение файла
cat <file.txt>  # показывает содержимое файла в консоли
more <file.txt> # с указанием прогресса
less <file.txt> # показывает содержимое файла в редакторе
  -M # появляется информация о текущей строчке
  -N # добавляются номера строчек
head <file.txt> # только верхняя часть файла
tail <file.txt> # только нижняя часть файла
  -f # обновление файла при изменениях в нём

# поиск файлов и папок
find folder
  -name "file.txt" # поиск по имени
    -and -not -path *keyword* # исключая пути, содержащие keyword
  -depth 1 # глубина поиска по папке
  -print0 # нормально отображает имя файла (с пробелами, например)
# можно задавать шаблон поиска (wildcard) с помощью символов-джокеров:
*  # 0 или больше символов
?  # любой символ
[] # любой символ из диапазона в скобках

# вывести имя текущего пользователя
whoami

# вывести все группы, которым принадлежит пользователь
groups

# изменение владельца
chown
  username:staff <file/folder> # сменить владельца
  -R username:staff <folder> # изменить пользователя папки и её содержимого

# буквенная запись привелегий
rwxrw-r-- # права для user (rwx) group (rw-) other (r--)
# r (read)
# w (write)
# x (execute)

# численная запись привелегий
# r = 4
# w = 2
# x = 1
## тогда
rwxrw-r-- = 764


# изменение привелегий
chmod
  ugo=rwx <file/folder> # разрешить всё всем
  a=rwx <file/folder> # разрешить всё всем
  777 <file/folder> # разрешить всё всем
  755 <file/folder> # пользователю можно всё, а группам и остальным — только читать и исполнять
  u=rwx,g=rw,o=r <file/folder> # задать права каждому типу
  ug+w <file/folder> # разрешить запись для user и group
  o-w <file/folder> # запретить запись для other
  -R <folder> # изменить права для папки и её содержимого

# переменные
$HOME # рабочая папка пользователя

## скрыть файл или папку
chflags hidden <path/to/file/or/folder>
## показать файл или папку
chflags nohidden <path/to/file/or/folder>

# выполнить команду от имени администратора root (substitute user and do)
sudo
  -k # снова будет запрашивать пароль (пароль не запрашивается в течение 5 минут бездействия)
  -u username # выполнить команду от имени пользователя username

# информация обо всех, кто может пользоваться командой sudo находится в файле /etc/sudoers


# текущая дата и время
date
# текущее время и время последней сессии
uptime
# текущие пользователи
users
# все текущие пользователи на компе (включая finder и terminal)
who
# имя операционной системы
uname
  -p # процессор
# хост
hostname
# домен
domainname

# свободное место на дисках
df
  -h # по-человечески (честно)
  -H # по-человечески (с точки зрения железа; чуть завышенные значения, так как байты считаются иначе)
# использование диска
du folder
  -a # все папки и файлы
  -h # по-человечески
  -d 1 # глубина поиска (подробность отображения)

# статус текущего процесса (на текущий момент)
ps
  -a # подробное описание всех подпроцессов
  a # подробное описание всех подпроцессов (другое отображение)
  aux # подробное описание всех процессов
# мониторинг запущенных процессов (q - выйти; h - помощь)
top
  -n 10 # количество отображаемых процессов
  -o cpu # сортировка по использованию процессора
  -s 3 # период обновления информации
  -U iGor # выбрать только процессы, запущенные указанным пользователем
# завершение процесса по PID (Process ID)
kill PID # (не всегда слушается)
  -9 # принудительное завершение процесса

# посчитать слова в текстовом файле
wc file.txt # lines words symbols file.txt
# сортировка строк в текстовом файле
sort file.txt
  -r # в обратном порядке
  -u # исключение повторяющихся строк
# исключение повторяющихся строк, следующих друг за другом
uniq file.txt
  -d # вывод повторяющихся строк
  -u # удаление даже тех строк, которые были продублированы (и копию и оригинал)

# календарь
cal # текущий месяц
  12 1992 # конкретный месяц конкретного года
  -y 2017 # календарь на целый год
# перевёрнутый календарь
ncal

# калькулятор
bc # отдельная программа (scale=10 — число знаков после запятой)
expr # команда в терминале
  1 + 1 # 2
  2 \* 2 # 4

# конвертер единиц измерения
units # как отдельная программа
  '2 liters' 'quarts' # как команда

# все использованные команды записываются в файл ~/.bash_history
# также доступ к истории можно получить с помощью команды
history
  -d 12 # удалить строчку из истории
  -c # очистить историю
# можно мгновенно запустить команду из истории
!1 # с начала
!-2 # с конца
!! # последняя запущенная команда
!echo # последняя запущенная команда echo (с последними аргументами)
!$ # аргументы последней запущенной команды

# запись (с заменой) вывода команды в файл
echo "Hello World" > file.txt
cat file_1.txt file_2.txt > file_1_2.txt # объединить файлы
echo "Hello World" >> file.txt # добавить в конец файла
cat file_1.txt >> file_2.txt # добавить содержимое одного файла в конец другого

# чтение из файла (содержимое файла принимается в качестве аргумента)
sort < file.txt
# чтение находится в приоритете перед записью. поэтому можно сделать так
sort < file.txt > sorted_file.txt # отсортировать file.txt и записать в sorted_file.txt
(sort < file.txt) > sorted_file.txt # то же самое
# многострочный вывод (HERE)
<<- EndOfText
  Text
  Text
  Text
EndOfText

# pipe — поток (конвейер); поочерёдное выполнение команд, причём то, что получается на выходе одной команды цепочки, принимается на вход следующей
echo "Hello World" | wc # посчитать слова и символы в "Hello World"
cat file.txt | sort | uniq > new_file.txt # отсортировать файл, а затем исключить повторяющиеся строки и записать в файл
ps aux | less # отображать статистку с возможностью прокрутки

# команды могут выполняться как нормально, так и с ошибкой
# оба результата можно идентифицировать и задавать им разные команды в дальнейшем, например
cp -v * some_folder 1>success.txt 2>error.txt &>log.txt # сообщения о файлах, которые не удалось скопировать отправятся в error.txt (standard error), а остальные — в success.txt (standard success); всё вместе отправляется в log.txt (standard output)

# /dev/null — файл, который всегда остаётся пустым (в него ничего нельзя записать); он нужен, если вывод программы не имеет значения
ls -la > /dev/null # ничего не выведет

# использовать вывод предыдущей команды как аргумент
echo 'file.txt' | xargs wc # считает уже не строку, а файл
echo 'file.txt' | xargs -t wc # показать, что конкретно происходит
echo 'file_1.txt file_1.txt' | xargs -n1 wc # аргументы разделяются не пробелом, табами и переносами строк
ls | xargs -0 -n1 wc # запускать каждый аргумент (как слово) по отдельности (после n ставится количество запускаемых аргументов)
head file.txt | xargs -L1 # запускать каждый аргумент (как строку) по отдельности
cat file.txt | xargs -I {} echo "new line: {}" # использовать каждый аргумент в определённом месте. аналогично можно пользоваться любым уникальным сочетанием символов
cat file.txt | xargs -I :LINE: echo "new line: :LINE:"

# сразу после запуска сессии терминал выполняет все команды, прописанные в файле ~/.bash_profile
# непосредственно перед завершением сессии терминал выполняет все команды, прописанные в файле ~/.bash_logout

# создать свои команды или переопределить старые
alias # список всех своих команд
  ll='ls -lahG'  # задание команды
# забыть команду (помнит только в течение одной сессии)
unalias ll

# запустить команды из файла
source ~/.bashrc

# поиск регулярным выражением по файлу
grep
  'regexp' file.txt # возвращает строчку с совпадением
  # опции
  -i # поиск нечувствителен к регистру
  -w # только слова (а не части слов)
  -v # вместо возврата найденных строк, возвращается всё, кроме найденных слов
  -n # номера строк
  -c # посчитать количество совпадений
  -R # поиск по папке
  -Rh # показывает только совпадения (без путей к файлам)
  -Rl # показывает только файлы с совпадениями
  -RL # показывает только файлы без совпадений
  --color # раскрашивает найденные совпадения
# удобно использовать в пайпах
ps aux | grep Applications

# замена
tr ',' ';' < file.txt # заменить все запятые на точку с запятой в файле
  # опции для одного регулярного выражения
  -d [:digit:] # удалить найденные символы
  -dc [:digit:] # удалить всё, кроме найденных символов
  -s [:digit:] # удалить повторения найденных символов
  -sc [:digit:] # удалить повторения всего, кроме найденных символов
  -ds [:digit:] [:alpha:] # удаляет все числа и все повторяющиеся буквы
echo '2354431' | tr '12345' 'ABCDE' # BCEDDCA
echo 'This is ROT-13 encrypted.' | tr 'A-Za-z' 'N-ZA-Mn-za-m' # вместо i-того символа замещается (i+13)й
# две следующих записи идентичны
tr '1234' 'ab'
tr '1234' 'abbb'
# примеры использования
tr -dc [:print:] < file1 > file2 # удалить все непечатные символы
tr -d '\015\032' < win_file > unix_file # удалить переносы строк Windows
tr -s ' ' < file1 > file2 # удалить все двойные пробелы

# замена по выражениям (а не по символам, как в tr)
sed
   's/regex_1/regex_2/' file.txt # s — substitution; regex_1 — search string; regex_2 — replacement string; разделитель можно использовать любой (берётся тот, который указывается первым)
   's|regex_1|regex_2|g' # глобальный поиск по строке (не только первое совпадение)
   -e 's|regex_1|regex_2|' -e 's:regex_3:regex_4:' # несколько замен сразу
   -E 's|regex_1|regex_2|' # расширенные регулярные выражения
echo 'upstream' | sed 's/up/down/' # downstream (только первое совпадение)
# примеры использования
echo "Igor Polyakov" | sed -E 's/([A-Za-z]+) ([A-Za-z]+)/\2, \1/' # Polyakov, Igor
sed -E 's/<[^<>]>//g' index.html # убирает все HTML теги

# выборка значений по шаблону
awk
  {'print $12'} # возвращает 12-е поле строки

# вырезать информацию из файла по строкам
cut
  -c 2-10 file.txt # диапазон символов каждой строки файла
  -c 1-3,6-11 file.txt # несколько диапазонов
  -f 2,6 file.tsv # поля, отделённые табами (по умолчанию)
  -f 2,6 file.csv -d ',' # другой разделитель
  -b # байты
# примеры использования
ls -lahG | cut -c 2-10,29-33,47- # более аккуратный вывод списка файлов и папок
ps aux | cut -c 11-15,72- # только PID и название процесса

# сравнение двух файлов
diff file1 file2
  # опции
  -i # нечувствительность к регистру
  -b # игнорирование невидимых символов (типа пробела)
  -w # игнорирование пробелов
  -B # игнорирование пустых строк
  -r # сравнить папки
  -s # показывать одинаковые файлы
  -c # наглядно показывает различия в каждом файле
  -y # наглядно показывает различия в совместном файле
  -u # отображает строки файлов друг напротив друга
  -q # просто сообщает о том, что файлы различны
diff file1 file2 | diffstat # показывает статус изменений в файле

sleep 3 # ожидание (задержка) в секундах


# Фишки для macOS
# В терминал можно перетащить папку и тогда введётся путь к этой папке.
# открыть файл, папку в Finder или ссылку
open
  -a calculator # открыть приложение
  -a Photoshop xxx.jpg # открыть файл приложением
# работа с буфером обмена (Clipboard)
pbcopy < # копировать в буфео обмена (буферы обмена могут быть разными. уточнить можно с помощью опции -pboard)
pbpaste > # вставить из буфера обмена
# сделать скриншот и сохранить в файл
screencapture ~/Desktop/1.png # снимок всех экранов сразу
  -m # только основной монитор
  -i # область экрана
  -C # показать курсор
  -t # формат (расширение) выходного файла
  -T 3 # задержка (в секундах)
  -P # открыть файл в предпросмотре
  -M # открыть файл в почтовом сообщении
  -c # сохранить в буфере обмена
## выключить компьютер
sudo shutdown
  # режимы
  -h # выключить (halt)
  -r # перезагрузить (reboot)
  -s # сон (sleep)
  # задержка
  now # сейчас
  +1  # через минуту
  yymmddhhmm # в определённую дату
# проговаривание текста
say "text"
  -v Katya # кто будет произносить фразу (VoiceOver)
  -f file.txt # воспроизвести из файла
  -o voice.aiff # записать речь в файл
# поиск Spotlight (включая мета-информацию)
mdfind
  "smth" # по всей файловой системе
  "smth -nth" # исключить из поиска
  -onlyin folder # искать в конкретной папке
  -interpret # искать в точности то, что задано в поиске
  -name # только в именах файлов
  # поиск по конкретной метаинформации
  'kMDItemFSName == "file.txt"'
  'kMDItemFSCreationDate >= $time.today'
    # другие форматы времени
    # $time.today(-2)
    # $time.now(-30000)
    # $time.this_week(-1)
    # $time.iso(2017-01-01 12:45:00 -0000)
mdls file.txt # показать всю метаинформацию файла
# запуск программы на AppleScript
osascript
  -e 'set volume output muted true' # исполнение кода
  apple.scpt # исполнение кода из файла
# настройки (находятся в папке ~/Library/Preferences)
defaults
  # формат domain — com.companyname.appname
  read <domain> <key>
  write <domain> <key> <value>
# примеры популярных настроек
defaults write com.apple.finder ShowAllFiles true # показывать скрытые файлы в Finder
defaults write com.apple.finder _FXShowPosixPathInTitle -bool TRUE # показывать путь в Finder
defaults write com.apple.screencapture type PNG # задать формат скриншотов (PNG, BMP, GIF, JPEG, PDF, PICT, PSD, SGI, TGA, TIFF)
defaults write com.apple.screencapture location "/Users/iGor/Desktop" # задать путь, куда будут сохраняться скриншоты
sudo defaults write com.apple.loginwindow DesktopPicture "/path/to/picture" # картинка при входе в систему (во время выбора пользователя)


# Скрипты на Bash
# Расширение скрипта — .sh
# Скрипт должен начинаться со следующей строки
#!/bin/bash
# здесь "#!" — так называемый 'Hashbang' или 'Shebang'; а "/bin/bash" — компилятор Bash
# запустить скрипт из терминала можно с помощью команды
bash script.sh
# или
sh script.sh
# но поскольку в начале файла прописано "#!/bin/bash", то можно просто запустить следующим образом:
./script.sh # файл при этом должен быть исполняемым; если это не так, то делаем
chmod +x script.sh
# при этом скрипту как и команде можно послать аргументы, которые доступны в скрипте по переменным
$1, $2, ... # каждый аргумент, соответственно
$@ # все аргументы (массив)
$# # число аргументов
# Опции (флаги) для скрипта
while getopts :a:b:cde option; do # далее комментарии будут касательно ":a:b:cde"
  case $option in
    a) varA=$OPTARG;; # Для символов "a:" — передаётся значение флага: "-a value"
    b) varB=$OPTARG;; # Для символов "b:"
    c) echo "Передана опция c";; # Для символа "c" — без значения
    d) echo "Передана опция d";; # Для символа "d"
    e) echo "Передана опция e";; # Для символа "e"
    ?) echo "Не понимаю, о чём речь. Что ещё за $OPTARG?";; # Для первого символа ":" — если передана опция, не предусмотренная скриптом
  esac
done
# ниже есть объяснение тому, что тут написано

# Математические операции производятся внутри следующей конструкции
(( expr ))
# математические операторы
+ # сложение
- # вычитание
/ # деление (результат будет целочисленным; для работы с вещественными числами можно воспользоваться командой bc)
% # остаток от деления
* # умножение
** # возведение в степень
++
--
+=
-=
*=
/=

# Логические операции производятся внутри следующей конструкции
[[ expr ]] # 1 — FALSE; 0 — TRUE (для проверки истинности выражения можно после него поставить echo $?)
# Логические операторы
# для сравнения строк
<
>
<=
>=
==, =
!=
=~ # содержание в строке комбинации, соответствующей регулярному выражению (например, [[ "The 42 is the answer" =~ [0-9]+ ]])
# для сравнения чисел
-lt
-gt
-le
-ge
-eq
-ne
# другие операторы
&& # и
|| # или
! # не
-z # null? — переменная пустая?
-n # не null? — переменная непустая?

# Работа со строками
# пусть STR — переменная со строкой. тогда
${#STR} # количество символов
${STR:3} # символы с 3-го по последний
${STR: -3} # символы с 3-го с конца по последний
${STR:3:4} # 4 символа, начиная с 3-го
${STR/cat/dog} # замена первого cat на dog
${STR//cat/dog} # замена всех cat на dog
${STR/#cat/dog} # замена cat на dog, если cat стоит в начале строки
${STR/%cat/dog} # замена cat на dog, если cat стоит в конце строки

# Цвет
# Способ №1
\033[31;43;5m Перекрашенный текст \033[0m
# Цвет        Текст  Фон    Стиль        Код
# чёрный      30     40     сбросить     0
# красный     31     41     яркий        1
# зелёный     32     42     тусклый      2
# жёлтый      33     43     подчеркнуть  4
# синий       34     44     мигать       5
# малиновый   35     45     обратный     7
# голубой     36     46     спрятать     8
# белый       37     47

# Способ №2
tput
  setaf [0-7] # цвет текста
  setab [0-7] # цвет фона
  sgv0 # сбросить
  bold # яркий
  dim # тусклый
  smul # подчеркнуть
  blink # мигать
  rev # обратный
man terminfo # узнать больше о цветах и стилях

# Условный оператор
if [[ condition ]]; then # условие можно записывать так
  # expr_1
elif [ condition ]; then # так
  # expr_2
elif condition # или так
  then
  # expr_3
else
  # expr_4
fi
# case
case $VAR in
  regexp_1) echo 1;;
  regexp_2) echo 2;;
  *) echo 3;;
esac

# Циклы
# while
while [[ condition ]]; do
  #statements
done
# until (while [[ ! condition ]])
until [[ condition ]]; do
  #statements
done
# for
for i in 1 2 3; do # можно пользоваться интервалами, массивами или командами, например $(ls)
  #statements
done
# другой вариант
for (( i = 0; i < 10; i++ )); do
  #statements
done
# отображение элементов ассоциативного массива
for i in "${!arr[@]}"; do
  echo "$i: ${arr[$i]}" # $i — ключ; ${arr[$i]} — значение
done

# Функции
function funcname {
  # body
  $1 # первый аргумент
  $2 # второй аргумент
}
funcname arg_1 arg_2 # использование функции
# функция с любым числом переменных
function funcname {
  i=1
  for j in $@; do
    echo $i: $f # просто выводим все параметры
    ((i+=1))
  done
}

# ожидание ввода пользователя
read varname # результат ввода запишется в переменную varname
  -p "Сколько будет три плюс четыре? " answer # дополнительная информация при ожидании
  -s password # вводимая информация не видна
# предложение вариантов ответа
select option in "apple" "windows"
do
  echo "You really like $option? Emm..."
  break
done

# Программы
# Midnight Commander (файловый менеджер внутри терминала) — http://www.vivapage.info/midnight-commander-mac-os-x/


# Источники
# [x] [Базовые знания по работе в среде Unix и основы Bash](https://www.lynda.com/Mac-OS-X-10-6-tutorials/Unix-for-Mac-OS-X-Users/78546-2.html)
# [x] [Скрипты на Bash](https://www.lynda.com/Bash-tutorials/Up-Running-Bash-Scripting/142989-2.html)
# [ ] [The Linux Documentation Project](http://www.tldp.org/LDP/abs/html/gotchas.html)
# [ ] [Bash Hackers](http://wiki.bash-hackers.org/doku.php)
# [ ] [Bash manual](http://www.gnu.org/software/bash/manual/bash.html)
# [Регулярные выражения](Regular Expressions.md)
# [AppleScript](AppleScript.scpt)