; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64276 () Bool)

(assert start!64276)

(declare-fun mapIsEmpty!2247 () Bool)

(declare-fun mapRes!2247 () Bool)

(assert (=> mapIsEmpty!2247 mapRes!2247))

(declare-fun b!288208 () Bool)

(declare-fun e!205020 () Bool)

(declare-fun tp_is_empty!697 () Bool)

(declare-fun mapRes!2248 () Bool)

(assert (=> b!288208 (= e!205020 (and tp_is_empty!697 mapRes!2248))))

(declare-fun condMapEmpty!2247 () Bool)

(declare-datatypes ((T!52503 0))(
  ( (T!52504 (val!348 Int)) )
))
(declare-datatypes ((array!16979 0))(
  ( (array!16980 (arr!8335 (Array (_ BitVec 32) T!52503)) (size!7339 (_ BitVec 32))) )
))
(declare-fun a2!596 () array!16979)

(declare-fun mapDefault!2248 () T!52503)

