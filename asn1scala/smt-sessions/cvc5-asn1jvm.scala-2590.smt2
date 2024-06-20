; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64336 () Bool)

(assert start!64336)

(declare-fun b!288808 () Bool)

(declare-fun e!205304 () Bool)

(declare-fun tp_is_empty!751 () Bool)

(declare-fun mapRes!2414 () Bool)

(assert (=> b!288808 (= e!205304 (and tp_is_empty!751 mapRes!2414))))

(declare-fun condMapEmpty!2414 () Bool)

(declare-datatypes ((T!52737 0))(
  ( (T!52738 (val!375 Int)) )
))
(declare-datatypes ((array!17034 0))(
  ( (array!17035 (arr!8362 (Array (_ BitVec 32) T!52737)) (size!7366 (_ BitVec 32))) )
))
(declare-fun a2!596 () array!17034)

(declare-fun mapDefault!2413 () T!52737)

