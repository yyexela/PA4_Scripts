#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#define BUFF_SIZE 100
#define SCORES 100

// Reads a line from 'input_file' and stores the result in buffer 'line'
// Returns 0 on successful read of line, 1 otherwise
int read_line(char * line, FILE * input_file){
	if(fgets(line, BUFF_SIZE, input_file) != NULL){
		long bytes = strlen(line);
		// Replace newline with null-terminating character
		if(bytes != 0){
			if( line[bytes-1] == '\n')
				line[bytes-1] = '\0';
		}
		return 0;
	}
	return 1;
}

int main(){
    FILE * fd = fopen("score.txt", "r+");
    float scores[SCORES];
    char buff[BUFF_SIZE];

    int index = 0;
    while(read_line((char *) buff, fd) == 0){
        scores[index] = strtof(buff, NULL);
        index++;
    }

    float avg = 0;
    for(int i = 0; i < index; i++){
        avg += scores[i];
    }
    printf("Average of %d scores is %f\n", index, (avg)/(index+0.0));
}
