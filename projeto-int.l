%{

/* TRABALHO 1 - Analisador léxico que pondera os sentimentos em um texto
    Onde: próximo de 0 é ruim e próximo de 1 é excelente 
    Este analisador se aplica a qualquer tipo de review (filmes, jogos, etc.)
    Desenvolvido para a ferramenta Flex*/    

    int positive = 0, negative = 0;
    float result = 0;
%}

POSITIVE (adorable|amazing|approve|awesome|accepted|acclaimed|admire|agreeable|attractive|brilliant|beautiful|cool|cute|charming|creative|divine|enthusiastic|excellent|efficient|elegant|exciting|fabulous|funny|fine|friendly|familiar|fun|generous|good|great|genius|glamorous|gorgeous|genuine|graceful|handsome|honored|healthy|harmonious|honorable|innovate|intelligent|ideal|impressive|innovative|intuitive|independent|inventive|knowledgeable|legendary|lovely|marvelous|masterful|miraculous|natural|nice|okay|pretty|proud|perfect|pleasurable|polished|powerful|phenomenal|popular|productive|quality|quiet|remarkable|robust|refined|respected|safe|stupendous|satisfactory|simple|special|sucess|surprising|secure|stunning|successful|superb|truthful|tops|unreal|upstanding|vibrant|vigorous|victorious|virtuous|wonderful|wow|well)

NEGATIVE (abysmal|adverse|alarming|annoy|atrocious|awful|bad|banal|barbed|boring|broken|clumsy|collapse|confused|corrupt|corrosive|crazy|creepy|cruel|damage|damaging|dead|deformed|deplorable|depressed|dirty|disiease|disgusting|dreadful|enraged|evil|fail|faulty|gross|hard|hate|horrible|ill|immature|imperfect|infernal|insane|jealous|malicious|missing|nasty|naughty|negative|nonsense|old|perturb|poor|prejudice|questionable|reject|repugnant|repulsive|rude|sad|savage|scare|severe|smely|stupid|tense|terrible|terrifying|ugly|unfair|unfavorable|unsatisfactory|unwanted|upset|wicked|yell)

%%

{POSITIVE} {positive++;}
{NEGATIVE} {negative++;}
.

%%

int main(argc, argv)
int argc;
char **argv;
{
    if(argc > 1){
        if(!(yyin = fopen(argv[1], "r"))){
            perror(argv[1]);
            return(1);
        }
    }
    yylex();
    result = positive + negative; 
    printf("Result: %f per cent\n", result = (float)((positive)/result)*100);
    return 0;
}