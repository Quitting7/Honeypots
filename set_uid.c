#include <stdio.h>

// Testing SETUID
// echo "wow" > file.txt && sudo chown root file.txt && sudo chgrp root file.txt && sudo chmod 744 file.txt
// gcc set_uid.c && sudo chown root a.out && sudo chgrp root a.out && sudo chmod +s a.out


int main()
{

   FILE *fp;
   char buff[255];

   fp = fopen("file.txt", "r");
   fscanf(fp, "%s", buff);
   printf("1 : %s\n", buff );
   fclose(fp);

	return 0;
}
