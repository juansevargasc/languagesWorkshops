%{

/*C code*/

%}


%%
if    printf("GOODBYE\n");
.                ;
%%

int yywrap(void)
{
    return 1;
}
