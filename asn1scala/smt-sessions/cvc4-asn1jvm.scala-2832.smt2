; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68510 () Bool)

(assert start!68510)

(declare-fun b!307784 () Bool)

(declare-fun e!221732 () Bool)

(declare-fun tp_is_empty!791 () Bool)

(declare-fun mapRes!2538 () Bool)

(assert (=> b!307784 (= e!221732 (and tp_is_empty!791 mapRes!2538))))

(declare-fun condMapEmpty!2537 () Bool)

(declare-datatypes ((T!57617 0))(
  ( (T!57618 (val!395 Int)) )
))
(declare-datatypes ((array!18655 0))(
  ( (array!18656 (arr!9165 (Array (_ BitVec 32) T!57617)) (size!8082 (_ BitVec 32))) )
))
(declare-fun a1!506 () array!18655)

(declare-fun mapDefault!2537 () T!57617)

