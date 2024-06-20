; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24556 () Bool)

(assert start!24556)

(declare-fun mapIsEmpty!394 () Bool)

(declare-fun mapRes!395 () Bool)

(assert (=> mapIsEmpty!394 mapRes!395))

(declare-fun b!124650 () Bool)

(declare-fun e!81784 () Bool)

(declare-fun tp_is_empty!131 () Bool)

(declare-fun mapRes!394 () Bool)

(assert (=> b!124650 (= e!81784 (and tp_is_empty!131 mapRes!394))))

(declare-fun condMapEmpty!395 () Bool)

(declare-datatypes ((T!16977 0))(
  ( (T!16978 (val!65 Int)) )
))
(declare-datatypes ((array!5522 0))(
  ( (array!5523 (arr!3092 (Array (_ BitVec 32) T!16977)) (size!2499 (_ BitVec 32))) )
))
(declare-fun a2!447 () array!5522)

(declare-fun mapDefault!394 () T!16977)

