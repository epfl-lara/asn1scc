; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68488 () Bool)

(assert start!68488)

(declare-fun mapIsEmpty!2479 () Bool)

(declare-fun mapRes!2480 () Bool)

(assert (=> mapIsEmpty!2479 mapRes!2480))

(declare-fun b!307630 () Bool)

(declare-fun e!221641 () Bool)

(declare-fun tp_is_empty!773 () Bool)

(declare-fun mapRes!2479 () Bool)

(assert (=> b!307630 (= e!221641 (and tp_is_empty!773 mapRes!2479))))

(declare-fun condMapEmpty!2480 () Bool)

(declare-datatypes ((T!57539 0))(
  ( (T!57540 (val!386 Int)) )
))
(declare-datatypes ((array!18636 0))(
  ( (array!18637 (arr!9156 (Array (_ BitVec 32) T!57539)) (size!8073 (_ BitVec 32))) )
))
(declare-fun a2!506 () array!18636)

(declare-fun mapDefault!2480 () T!57539)

