 

#    Imprime en consola Hello World.
echo 'Hello World'

#    Crea un directorio nuevo llamado new_dir.
mkdir new_dir

#    Elimina ese directorio.
rm -rf new_dir

#    Copia el archivo sed.txt dentro de la carpeta lorem a la carpeta lorem-copy.
cp lorem/sed.txt lorem-copy/sed.txt 

#    Copia los otros dos archivos de la carpeta lorem a la carpeta lorem-copy en una sola línea mediante ;.
cp lorem/at.txt lorem-copy/; cp lorem/lorem.txt lorem-copy/

#    Mruestra el contenido del archivo sed.txt dentro de la carpeta lorem.
cat lorem/sed.txt # prints in console
less lorem/sed.txt # opens and tries to read

#    Muestra el contenido de los archivos at.txt y lorem.txt dentro de la carpeta lorem.
cat lorem/at.txt ; cat lorem/lorem.txt

#    Visualiza las primeras 3 líneas del archivo sed.txt dentro de la carpeta lorem-copy
cat lorem-copy/sed.txt | head -n3

#    Visualiza las ultimas 3 líneas del archivo sed.txt dentro de la carpeta lorem-copy
cat lorem-copy/sed.txt | tail -n3

#    Añade Homo homini lupus. al final de archivo sed.txt dentro de la carpeta lorem-copy.
echo 'Homo homini lupus.' >> lorem-copy/sed.txt # Using the >> operator

#    Visualiza las últimas 3 líneas del archivo sed.txt dentro de la carpeta lorem-copy. Deberías ver ahora Homo homini lupus..
cat lorem-copy/sed.txt | tail -n3

#    Sustituye todas las apariciones de et por ET del archivo at.txt dentro de la carpeta lorem-copy. Deberás usar sed.
# !!!! DANGER: The use of the -i switch with any version of sed has certain filesystem security implications and is inadvisable in any script which you plan to distribute in any way.
# !!!! More info : https://lists.gnu.org/archive/html/bug-gnu-utils/2013-09/msg00000.html
sed -i 's/et/ET/g' lorem-copy/at.txt 

#    Encuentra al usuario activo en el sistema.
who
w     # more detailed output

#    Encuentra dónde estás en tu sistema de ficheros.
pwd

#    Lista los archivos que terminan por .txt en la carpeta lorem.
find . -type f -name '*.txt'

#    Cuenta el número de líneas que tiene el archivo sed.txt dentro de la carpeta lorem.
wc -l lorem/sed.txt # use wordcount and the -l lines flag

#    Cuenta el número de archivos que empiezan por lorem que están en este directorio y en directorios internos.
find . -name 'lorem*'

#    Encuentra todas las apariciones de et en at.txt dentro de la carpeta lorem.
grep et lorem/at.txt # muestra todo el texto en stdout, marcando en color rojo las apariciones
grep -i et lorem/at.txt  # ignores upper and lower cases
grep -o et lorem/at.txt  # prints one line per match, with the matched characters
grep -o -i et lorem/at.txt # ignores upper and lower cases, one match per line

#   Cuenta el número de apariciones del string et en at.txt dentro de la carpeta lorem.
grep -o et lorem/at.txt | wc -l # pipeline to output the NUMBER of occurrences (10)

#    Cuenta el número de apariciones del string et en todos los archivos del directorio lorem-copy.
grep -o et lorem-copy/* # prints a line for each match, specifying each file on which it matched.
grep -o -i et lorem-copy/*  # same as above but ignores the upper and lowercase
grep -o et lorem-copy/* | wc -l # pipeline to print the NUMBER of ocurrences
grep -o -i et lorem-copy/* | wc -l # same as above but ignores the upper and lowercase

   #####################
 ######################
## Bonus
#
#   Almacena en una variable name tu nombre.
NAME='ROBERTO' 
# NAME = 'ROBERTO' # NO VA A FUNCIONAR CON ESPACIOS

#    Imprime esa variable.
echo $ROBERTO

#     Crea un directorio nuevo que se llame como el contenido de la variable name.
mkdir $NAME

#     Elimina ese directorio.
rm -rf $NAME

#     Por cada archivo dentro de la carpeta lorem imprime el número de carácteres que tienen sus nombres. Intenta primero mostrar los archivos mediante un bucle for
#         Imprime los ficheros
for f in lorem/*;  do echo $f; done  # Imprime la ruta a cada archivo en la carpeta lorem/*
#         Imprime las longitudes de los nombres de los ficheros
cd lorem; for f in *; do echo ${#f}; done; cd ..
#         Imprime outputs con la siguiente estructura: lorem has 5 characters lenght
cd lorem; for f in *; do echo $f 'has '${#f} 'characters length'; done; cd ..


#     Muestra los procesos de forma jerárquica que se están ejecutando en tu ordenador:
#         Usando el comando top o htop
top
#         Usando el comando ps con argumentos
ps

#     Muestra información sobre tu procesador por pantalla
cat /proc/cpuinfo
cat /proc/cpuinfo | grep 'core id' # count how many cores in processor
lscpu
lshw
# more: https://www.binarytides.com/linux-cpu-information/

#     Crea 3 alias y haz que estén disponibles cada vez que inicias sesión
# https://linuxize.com/post/how-to-create-bash-aliases/
echo alias python='python3' >> ~/.bashrc
echo alias pip='pip3' >> ~/.bashrc
echo alias tgz='tar -czvf' >> ~/.bashrc
# OPTIONAL :
# source ~/.bash_profile # changes the bash profile from whatever it was and uses ~/.bash_profile

#     Comprime las carpetas lorem y lorem-copy en un archivo llamado lorem-compressed.tar.gz
tar -czvf lorem-compressed.tar.gz lorem/ lorem-copy/
# OPTIONAL (using new alias): 
# tgz lorem-compressed.tar.gz lorem/ lorem-copy/

#     Descomprime el archivo lorem-compressed.tar.gz en la carpeta lorem-uncompressed
FOLDER='lorem-uncompressed'; mkdir $FOLDER; tar -xzvf lorem-compressed.tar.gz -C $FOLDER/
