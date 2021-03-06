= test

//graph[sin_x][gnuplot]{
plot sin(x)
//}

//graph[foo][graphviz]{
graph {
    a -- b;
    b -- c;
    a -- c;
    d -- c;
    e -- c;
    e -- a;
}
//}

//graph[hoge][blockdiag]{
blockdiag {
   A -> B -> C -> D;
   A -> E -> F -> G;
}
//}

//graph[fuga][aafigure]{
+---------+  +---------+  +---------+
|Object 1 |  |Object 2 |  |Object 3 |
+----+----+  +----+----+  +----+----+
     |            |            |
     |            |            |
     X            |            |
     X----------->X            |
     X            X            |
     X<-----------X            |
     X            |            |
     X            |            |
     X------------------------>X
     |            |            X
     X----------->X            X---+
     X            X            X   |
     |            |            X<--+
     X<------------------------X
     X            |            |
     |            |            |
     |            |            |
//}

//graph[uml_seq][plantuml]{
@startuml
Alice -> Bob: Authentication Request
Bob --> Alice: Authentication Response

Alice -> Bob: Another authentication Request
Alice <-- Bob: another authentication Response
@enduml
//}

//graph[class_diag][plantuml]{
@startuml
class Dummy {
  String data
  void methods()
}

class Flight {
   flightNumber : Integer
   departureTime : Date
}
@enduml
//}

化学反応がいくつかの段階を経て進むとき、最も遅い段階を@<idx>{律速段階}と呼ぶ。
ある化学反応が、それと同時に起こりうる他の化学反応より優先的に起こるとき、その性質を@<idx>{選択性}と呼ぶ。
とくに鏡像異性体を作り分ける合成法を@<idx>{不斉合成}と呼ぶ。

//list[main][main()][c]{
int main(int argc, char **argv)
{
    puts("OK");
    return 0;
}
//}
