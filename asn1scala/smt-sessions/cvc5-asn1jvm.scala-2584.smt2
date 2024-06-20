; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64294 () Bool)

(assert start!64294)

(declare-fun mapIsEmpty!2301 () Bool)

(declare-fun mapRes!2302 () Bool)

(assert (=> mapIsEmpty!2301 mapRes!2302))

(declare-fun mapNonEmpty!2301 () Bool)

(declare-fun mapRes!2301 () Bool)

(declare-fun tp!2301 () Bool)

(declare-fun tp_is_empty!715 () Bool)

(assert (=> mapNonEmpty!2301 (= mapRes!2301 (and tp!2301 tp_is_empty!715))))

(declare-datatypes ((T!52581 0))(
  ( (T!52582 (val!357 Int)) )
))
(declare-datatypes ((array!16997 0))(
  ( (array!16998 (arr!8344 (Array (_ BitVec 32) T!52581)) (size!7348 (_ BitVec 32))) )
))
(declare-fun a2!596 () array!16997)

(declare-fun mapKey!2302 () (_ BitVec 32))

(declare-fun mapRest!2302 () (Array (_ BitVec 32) T!52581))

(declare-fun mapValue!2302 () T!52581)

(assert (=> mapNonEmpty!2301 (= (arr!8344 a2!596) (store mapRest!2302 mapKey!2302 mapValue!2302))))

(declare-fun a1!596 () array!16997)

(declare-fun from!722 () (_ BitVec 32))

(declare-fun e!205102 () Bool)

(declare-fun i!953 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(declare-fun b!288376 () Bool)

(assert (=> b!288376 (= e!205102 (and (not (= i!953 from!722)) (bvsle to!689 (size!7348 a1!596)) (bvsgt from!722 (bvsub i!953 #b00000000000000000000000000000001))))))

(declare-fun b!288377 () Bool)

(declare-fun res!238350 () Bool)

(assert (=> b!288377 (=> (not res!238350) (not e!205102))))

(assert (=> b!288377 (= res!238350 (and (= (select (arr!8344 a1!596) to!689) (select (arr!8344 a2!596) to!689)) (bvsle from!722 i!953) (bvsle i!953 to!689)))))

(declare-fun mapNonEmpty!2302 () Bool)

(declare-fun tp!2302 () Bool)

(assert (=> mapNonEmpty!2302 (= mapRes!2302 (and tp!2302 tp_is_empty!715))))

(declare-fun mapRest!2301 () (Array (_ BitVec 32) T!52581))

(declare-fun mapKey!2301 () (_ BitVec 32))

(declare-fun mapValue!2301 () T!52581)

(assert (=> mapNonEmpty!2302 (= (arr!8344 a1!596) (store mapRest!2301 mapKey!2301 mapValue!2301))))

(declare-fun b!288378 () Bool)

(declare-fun res!238348 () Bool)

(assert (=> b!288378 (=> (not res!238348) (not e!205102))))

(declare-fun arrayRangesEq!1456 (array!16997 array!16997 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288378 (= res!238348 (arrayRangesEq!1456 a1!596 a2!596 from!722 to!689))))

(declare-fun b!288379 () Bool)

(declare-fun e!205103 () Bool)

(assert (=> b!288379 (= e!205103 (and tp_is_empty!715 mapRes!2302))))

(declare-fun condMapEmpty!2302 () Bool)

(declare-fun mapDefault!2301 () T!52581)

