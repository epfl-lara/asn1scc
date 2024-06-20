; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24586 () Bool)

(assert start!24586)

(declare-fun mapIsEmpty!480 () Bool)

(declare-fun mapRes!480 () Bool)

(assert (=> mapIsEmpty!480 mapRes!480))

(declare-fun b!124732 () Bool)

(declare-fun e!81862 () Bool)

(declare-fun tp_is_empty!157 () Bool)

(declare-fun mapRes!481 () Bool)

(assert (=> b!124732 (= e!81862 (and tp_is_empty!157 mapRes!481))))

(declare-fun condMapEmpty!480 () Bool)

(declare-datatypes ((T!17103 0))(
  ( (T!17104 (val!78 Int)) )
))
(declare-datatypes ((array!5550 0))(
  ( (array!5551 (arr!3105 (Array (_ BitVec 32) T!17103)) (size!2512 (_ BitVec 32))) )
))
(declare-fun a2!447 () array!5550)

(declare-fun mapDefault!481 () T!17103)

