; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24548 () Bool)

(assert start!24548)

(declare-fun mapIsEmpty!372 () Bool)

(declare-fun mapRes!372 () Bool)

(assert (=> mapIsEmpty!372 mapRes!372))

(declare-fun b!124630 () Bool)

(declare-fun e!81767 () Bool)

(declare-fun tp_is_empty!125 () Bool)

(assert (=> b!124630 (= e!81767 (and tp_is_empty!125 mapRes!372))))

(declare-fun condMapEmpty!373 () Bool)

(declare-datatypes ((T!16951 0))(
  ( (T!16952 (val!62 Int)) )
))
(declare-datatypes ((array!5515 0))(
  ( (array!5516 (arr!3089 (Array (_ BitVec 32) T!16951)) (size!2496 (_ BitVec 32))) )
))
(declare-fun a1!447 () array!5515)

(declare-fun mapDefault!372 () T!16951)

