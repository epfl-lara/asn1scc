; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24524 () Bool)

(assert start!24524)

(declare-fun b!124571 () Bool)

(declare-fun e!81710 () Bool)

(declare-fun tp_is_empty!103 () Bool)

(declare-fun mapRes!312 () Bool)

(assert (=> b!124571 (= e!81710 (and tp_is_empty!103 mapRes!312))))

(declare-fun condMapEmpty!312 () Bool)

(declare-datatypes ((T!16869 0))(
  ( (T!16870 (val!51 Int)) )
))
(declare-datatypes ((array!5492 0))(
  ( (array!5493 (arr!3078 (Array (_ BitVec 32) T!16869)) (size!2485 (_ BitVec 32))) )
))
(declare-fun a2!447 () array!5492)

(declare-fun mapDefault!312 () T!16869)

