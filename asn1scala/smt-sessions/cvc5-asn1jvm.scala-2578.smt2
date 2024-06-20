; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64258 () Bool)

(assert start!64258)

(declare-fun b!288057 () Bool)

(declare-fun e!204940 () Bool)

(declare-fun tp_is_empty!679 () Bool)

(declare-fun mapRes!2193 () Bool)

(assert (=> b!288057 (= e!204940 (and tp_is_empty!679 mapRes!2193))))

(declare-fun condMapEmpty!2193 () Bool)

(declare-datatypes ((T!52425 0))(
  ( (T!52426 (val!339 Int)) )
))
(declare-datatypes ((array!16961 0))(
  ( (array!16962 (arr!8326 (Array (_ BitVec 32) T!52425)) (size!7330 (_ BitVec 32))) )
))
(declare-fun a2!596 () array!16961)

(declare-fun mapDefault!2193 () T!52425)

