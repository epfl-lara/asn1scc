; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57110 () Bool)

(assert start!57110)

(declare-fun b!261894 () Bool)

(declare-fun e!182306 () Bool)

(declare-fun tp_is_empty!185 () Bool)

(declare-fun mapRes!520 () Bool)

(assert (=> b!261894 (= e!182306 (and tp_is_empty!185 mapRes!520))))

(declare-fun condMapEmpty!520 () Bool)

(declare-datatypes ((T!45251 0))(
  ( (T!45252 (val!92 Int)) )
))
(declare-datatypes ((array!14527 0))(
  ( (array!14528 (arr!7326 (Array (_ BitVec 32) T!45251)) (size!6339 (_ BitVec 32))) )
))
(declare-fun a!411 () array!14527)

(declare-fun mapDefault!520 () T!45251)

