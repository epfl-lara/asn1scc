; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64234 () Bool)

(assert start!64234)

(declare-fun mapIsEmpty!2121 () Bool)

(declare-fun mapRes!2122 () Bool)

(assert (=> mapIsEmpty!2121 mapRes!2122))

(declare-fun b!287757 () Bool)

(declare-fun res!237910 () Bool)

(declare-fun e!204805 () Bool)

(assert (=> b!287757 (=> (not res!237910) (not e!204805))))

(declare-fun i!953 () (_ BitVec 32))

(declare-fun from!722 () (_ BitVec 32))

(assert (=> b!287757 (= res!237910 (not (= i!953 from!722)))))

(declare-fun b!287758 () Bool)

(declare-fun e!204806 () Bool)

(declare-fun tp_is_empty!655 () Bool)

(assert (=> b!287758 (= e!204806 (and tp_is_empty!655 mapRes!2122))))

(declare-fun condMapEmpty!2122 () Bool)

(declare-datatypes ((T!52321 0))(
  ( (T!52322 (val!327 Int)) )
))
(declare-datatypes ((array!16937 0))(
  ( (array!16938 (arr!8314 (Array (_ BitVec 32) T!52321)) (size!7318 (_ BitVec 32))) )
))
(declare-fun a2!596 () array!16937)

(declare-fun mapDefault!2121 () T!52321)

