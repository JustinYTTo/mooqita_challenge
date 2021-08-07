# mooqita_challenge
MIDS-1D Challenge

How to use the code

(1) Download the "mooqita.sh" file, place it in the same directory as the "website" folder which is from the tar ball file.
(2) The "images" folder should be insider the "website" folder, i.e. no changes are made to the file structure after decompressing the tar ball file.
(3) Open the terminal and run the "mooqita.sh" file, the index.html file will be created inside the "website" folder, ready for use.

Challenge questions

Question 1

Exchange one of the images in the sample index.html and see if you can display that in the
browser. Did you need to restart the server to do that? Why or why not?

Answer 1

Restarting the server is not needed, just a refresh in the browser accessing the webpage is enough. The reason is that each cell in the table shown in the html file just points towards the location of the image file.  Upon exchanging the image links of, say, the first two cells in the html file (and then saving the change in the html file), refreshing the browser is enough to have it reload the html file and load in the images at their new locations.


Question 2

How can you look up the process ID of your server? Document the command line used and the output.

Answer 2

(i) Open up another instance of the terminal (since the existing one is running the darkhttpd process)
(ii) Command in the new terminal: ps -e | grep darkhttpd
(iii) Output: 47338 pts/1 00:00:00 darkhttpd

Outstanding issues:
- The image "Síť jehlanu.png" still failed to load even though the encording has been changed to ISO-8859-2 which covers Czech characters

Issue with sub-optimal(?) solution:
- Showing svg files - by reading (using cat) the svg files and then extracting all codes therein and just put it in the table.  The file now shows properly but the size is a bit off.  But still, the table is still in three columns, so it propbably fits the criteria...?


