; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64316 () Bool)

(assert start!64316)

(declare-fun b!288608 () Bool)

(declare-fun e!205208 () Bool)

(declare-fun tp_is_empty!737 () Bool)

(declare-fun mapRes!2368 () Bool)

(assert (=> b!288608 (= e!205208 (and tp_is_empty!737 mapRes!2368))))

(declare-fun condMapEmpty!2368 () Bool)

(declare-datatypes ((T!52663 0))(
  ( (T!52664 (val!368 Int)) )
))
(declare-datatypes ((array!17019 0))(
  ( (array!17020 (arr!8355 (Array (_ BitVec 32) T!52663)) (size!7359 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!17019)

(declare-fun mapDefault!2367 () T!52663)

