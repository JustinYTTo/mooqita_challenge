#!/bin/bash

# Assumes the index.html file will be created in the "website" directory, which in turn is
# located in the same directory of this shell script.
IndexFile=website/index.html

# Further assumes the 150 images are all in the "images" directory under the "website"
# directory, i.e. following the original file structure of the tar ball file.
ls website/images > filenames.txt
names=filenames.txt
recode utf-8..ISO-8859-15 $names

# Checks if an index file is already at the location.  If so, renames it to index_backup
# just in case things go wrong.

[[ -e website/index.html ]] && (mv website/index.html website/index_backup.html)

# Puts in the starting parts of the html file

(
cat <<ADDHTMLHEADER
<!doctype html>
<html>
  <head>
    <title>Mooqita Challenge!</title>
  </head>
  <body>
   <center>
    <h1>MATH COLLECTION</h1>
   </center>

  <table border="5" bordercolor="red" align="center">
    <tr>
        <th colspan="3">PICTURES</th> 
    </tr>
ADDHTMLHEADER
) > $IndexFile

# Puts in links to the image files, assuming a new row every three images.  A variable "count" is set to facilitate the adding of the <tr> and </tr> lines
# once every three images
count=0
while read filenames; do
	if [[ $(($count % 3)) -eq 0 ]]; then
		echo '<tr>' | cat >> $IndexFile
	fi
	if [[ $filenames = *.svg ]]; then
		echo '<td>' | cat >> $IndexFile
		cat "website/images/$filenames" >> $IndexFile
		echo '</th>' | cat >> $IndexFile
	else
		echo '<td><img src="images/'$filenames'" alt="" border=3 height=100 width=300></th>' | cat >> $IndexFile
	fi
	if [[ $(($count % 3)) -eq 2 ]]; then
		echo '</tr>' | cat >> $IndexFile
	fi
	count=$(($count + 1))
done < $names

# Puts in the remaining parts of the html file
(
cat <<ADDHTMLFOOTER
    </tr>
  </table>
  </body>
</html>
ADDHTMLFOOTER
) >> $IndexFile

# Clears the temporary filenames.txt file
rm $names


# Reports completion and exit
echo 'Index.html file compiled. Please check the results in the "website" directory.'
exit 0
