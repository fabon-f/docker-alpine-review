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

#@# //graph[hoge][blockdiag]{
#@# blockdiag {
#@#    A -> B -> C -> D;
#@#    A -> E -> F -> G;
#@# }
#@# //}
#@#
#@# //graph[fuga][aafigure]{
#@# .. aafig::
#@#     :textual:
#@#
#@#         /---------\
#@#         |  Start  |
#@#         \----+----/
#@#              |
#@#              V
#@#         +----+----+
#@#         |  Init   |
#@#         +----+----+
#@#              |
#@#              +<-----------+
#@#              |            |
#@#              V            |
#@#         +----+----+       |
#@#         | Process |       |
#@#         +----+----+       |
#@#              |            |
#@#              V            |
#@#         +----+----+  yes  |
#@#         |  more?  +-------+
#@#         +----+----+
#@#              | no
#@#              V
#@#         /----+----\
#@#         |   End   |
#@#         \---------/
#@#
#@# //}
