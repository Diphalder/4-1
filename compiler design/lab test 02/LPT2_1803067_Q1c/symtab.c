#include "symtab.h"
#include <stdio.h>

list_t *head = NULL;
extern int lineno; 

void insert(char* name, int type)
{
    if(search(name)==NULL)
    {
        list_t* temp = (list_t*)malloc(sizeof(list_t));

        strcpy(temp->st_name, name);
        temp->st_type = type;

        printf("In line no :%d, Inserting  \"%s\" with type  \"%s\" in symbol table.\n", lineno, name, typename[type]);

        temp->next = head;
        head = temp;
    }
    else
    {
        printf("In line no :%d, Same variable  \"%s\" is declared more than once.\n", lineno, name);
    }
}

list_t* search(char *name)
{
    list_t* current = head;

    while(current!=NULL)
    {
       if(strcmp(name, current->st_name)!=0)
        current = current->next;
       else
        break;
    }

    return current;
}

int idcheck(char* name)
{
    if(search(name)==NULL)
    {
        printf("In line no :%d, ID \"%s\" is not declared.\n", lineno, name);
        return 0;
    }
    else
    {
        return 1;
    }
}


int idcheck2(char* name)
{
    if(search(name)==NULL)
    {
        
        return 0;
    }
    else
    {
        printf("In line no :%d, ID \"%s\" is Already exist.\n", lineno, name);
        return 1;
    }
}



int gettype(char *name)
{
    list_t* temp = search(name);

    if(temp==NULL)
    {
        printf("In line no :%d, ID \"%s\" is not declared.\n", lineno, name);
        return UNDEF_TYPE;
    }
    else
        return temp->st_type;
}

int typecheck(int type1, int type2)
{
    if(type1==INT_TYPE && type2==INT_TYPE)
        return INT_TYPE;
    else if (type1==REAL_TYPE && type2==REAL_TYPE)
        return REAL_TYPE;
    else if (type1==CHAR_TYPE && type2==CHAR_TYPE)
        return CHAR_TYPE;
    else
    {
        if (type1 > 3 || type1 < 0) type1 = 0;
        if (type2 > 3 || type2 < 0) type2 = 0;

        printf("In line no :%d, Data type  \"%s\" is not matched with Data type  \"%s\".\n", lineno, typename[type1], typename[type2]);
        return UNDEF_TYPE;
    }
}

