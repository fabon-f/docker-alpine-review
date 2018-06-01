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
