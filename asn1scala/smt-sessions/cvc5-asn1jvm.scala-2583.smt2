; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64288 () Bool)

(assert start!64288)

(declare-fun mapNonEmpty!2283 () Bool)

(declare-fun mapRes!2284 () Bool)

(declare-fun tp!2284 () Bool)

(declare-fun tp_is_empty!709 () Bool)

(assert (=> mapNonEmpty!2283 (= mapRes!2284 (and tp!2284 tp_is_empty!709))))

(declare-datatypes ((T!52555 0))(
  ( (T!52556 (val!354 Int)) )
))
(declare-datatypes ((array!16991 0))(
  ( (array!16992 (arr!8341 (Array (_ BitVec 32) T!52555)) (size!7345 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!16991)

(declare-fun mapValue!2284 () T!52555)

(declare-fun mapKey!2284 () (_ BitVec 32))

(declare-fun mapRest!2283 () (Array (_ BitVec 32) T!52555))

(assert (=> mapNonEmpty!2283 (= (arr!8341 a1!596) (store mapRest!2283 mapKey!2284 mapValue!2284))))

(declare-fun b!288322 () Bool)

(declare-fun res!238314 () Bool)

(declare-fun e!205074 () Bool)

(assert (=> b!288322 (=> (not res!238314) (not e!205074))))

(declare-fun a2!596 () array!16991)

(declare-fun from!722 () (_ BitVec 32))

(declare-fun i!953 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(assert (=> b!288322 (= res!238314 (and (= (select (arr!8341 a1!596) to!689) (select (arr!8341 a2!596) to!689)) (bvsle from!722 i!953) (bvsle i!953 to!689)))))

(declare-fun mapNonEmpty!2284 () Bool)

(declare-fun mapRes!2283 () Bool)

(declare-fun tp!2283 () Bool)

(assert (=> mapNonEmpty!2284 (= mapRes!2283 (and tp!2283 tp_is_empty!709))))

(declare-fun mapKey!2283 () (_ BitVec 32))

(declare-fun mapValue!2283 () T!52555)

(declare-fun mapRest!2284 () (Array (_ BitVec 32) T!52555))

(assert (=> mapNonEmpty!2284 (= (arr!8341 a2!596) (store mapRest!2284 mapKey!2283 mapValue!2283))))

(declare-fun b!288323 () Bool)

(declare-fun res!238313 () Bool)

(assert (=> b!288323 (=> (not res!238313) (not e!205074))))

(declare-fun arrayRangesEq!1453 (array!16991 array!16991 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288323 (= res!238313 (arrayRangesEq!1453 a1!596 a2!596 i!953 (bvadd #b00000000000000000000000000000001 to!689)))))

(declare-fun b!288324 () Bool)

(assert (=> b!288324 (= e!205074 (and (not (= i!953 from!722)) (bvsgt to!689 (size!7345 a1!596))))))

(declare-fun b!288325 () Bool)

(declare-fun e!205076 () Bool)

(assert (=> b!288325 (= e!205076 (and tp_is_empty!709 mapRes!2283))))

(declare-fun condMapEmpty!2283 () Bool)

(declare-fun mapDefault!2283 () T!52555)

