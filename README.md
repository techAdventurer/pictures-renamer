# pictures-renamer

Bash script to rename pictures and videos according to their creation date. Useful to merge pictures from multiple sources.

## How it works

Basically, the scripts extracts the "Creation Date" exif metadata from the picture using the exif-tool command, then renames the file to include this information (i.e. `ExamplePicture_2021-09-05_22h02m13s.JPG`). This assumes the date and time metadata are accurate.

To avoid erasing files by overwriting them, if two pictures have the same Creation Date, the script will append a random hexadecimal string to the name of the file.

It is **highly recommended** to copy the files to be renamed to another folder, `cd` into it, then execute the script in the current directory.

The script will ask for a subject (what the pictures are about, without spaces) and a file extension (used in the *for* loop).
