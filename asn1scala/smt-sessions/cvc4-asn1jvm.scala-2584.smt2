; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64298 () Bool)

(assert start!64298)

(declare-fun mapIsEmpty!2313 () Bool)

(declare-fun mapRes!2313 () Bool)

(assert (=> mapIsEmpty!2313 mapRes!2313))

(declare-fun b!288412 () Bool)

(declare-fun e!205120 () Bool)

(declare-fun tp_is_empty!719 () Bool)

(assert (=> b!288412 (= e!205120 (and tp_is_empty!719 mapRes!2313))))

(declare-fun condMapEmpty!2314 () Bool)

(declare-datatypes ((T!52585 0))(
  ( (T!52586 (val!359 Int)) )
))
(declare-datatypes ((array!17001 0))(
  ( (array!17002 (arr!8346 (Array (_ BitVec 32) T!52585)) (size!7350 (_ BitVec 32))) )
))
(declare-fun a2!596 () array!17001)

(declare-fun mapDefault!2313 () T!52585)

