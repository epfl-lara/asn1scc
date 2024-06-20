; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64340 () Bool)

(assert start!64340)

(declare-fun b!288862 () Bool)

(declare-fun e!205327 () Bool)

(declare-fun tp_is_empty!755 () Bool)

(declare-fun mapRes!2425 () Bool)

(assert (=> b!288862 (= e!205327 (and tp_is_empty!755 mapRes!2425))))

(declare-fun condMapEmpty!2425 () Bool)

(declare-datatypes ((T!52741 0))(
  ( (T!52742 (val!377 Int)) )
))
(declare-datatypes ((array!17038 0))(
  ( (array!17039 (arr!8364 (Array (_ BitVec 32) T!52741)) (size!7368 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!17038)

(declare-fun mapDefault!2425 () T!52741)

