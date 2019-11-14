cd /home/pi/.attract/romlists
rm Favorites.tag

clear
echo
echo "Este script va a generar una nueva lista de juegos llamada Favorites.txt."
echo 
echo "Esta nueva lista contendrá todos los juegos que hayas marcado como favoritos de todos los los sistemas distintos."
echo
sleep 5

echo
echo "Renombrando el viejo fichero de Favorites.txt ....."
sleep 5
mv Favorites.txt Favorites.txt.backup

echo
echo "Recopilación de lista de archivos de favoritos etiquetados ....."
sleep 5

echo
echo "Generando nuevo fichero de Favorites.txt ....."
sleep 5
echo

ls *.tag > tagfiles

while read filename
do
echo "Using ${filename} ....."
echo

  while read gamename
  do
    romlist=`echo ${filename} |cut -f1 -d '.'`
    echo "     Searching ${romlist}.txt for ${gamename} ....."
    cat "${romlist}.txt"|egrep "^${gamename};" >> Favorites.txt
    cat "${romlist}.txt"|grep "[;]${gamename}[;]" >> Favorites.txt
  done < "${filename}"

sleep 5
echo
done < tagfiles

rm tagfiles

cat Favorites.txt |sort -u > tmp_favorites.txt
mv tmp_favorites.txt Favorites.txt

echo "Finalizada la creacion del nuevo fichero de Favorites.txt ....."
echo
echo

echo "Con esta nueva lista de rom, cree una nueva pantalla y elija Favoritos como la lista de rom."
echo    
echo "Es posible que debas actualizar periódicamente la lista de Favoritos a medida que agregues nuevos juegos a favoritos."
echo
echo
sleep 10
echo 
