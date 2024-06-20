; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64312 () Bool)

(assert start!64312)

(declare-fun b!288560 () Bool)

(declare-fun res!238482 () Bool)

(declare-fun e!205186 () Bool)

(assert (=> b!288560 (=> (not res!238482) (not e!205186))))

(declare-datatypes ((T!52659 0))(
  ( (T!52660 (val!366 Int)) )
))
(declare-datatypes ((array!17015 0))(
  ( (array!17016 (arr!8353 (Array (_ BitVec 32) T!52659)) (size!7357 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!17015)

(declare-fun a2!596 () array!17015)

(declare-fun from!722 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(declare-fun arrayRangesEq!1463 (array!17015 array!17015 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288560 (= res!238482 (arrayRangesEq!1463 a1!596 a2!596 from!722 to!689))))

(declare-fun e!205184 () Bool)

(declare-fun b!288561 () Bool)

(declare-fun i!953 () (_ BitVec 32))

(assert (=> b!288561 (= e!205184 (arrayRangesEq!1463 a1!596 a2!596 (bvsub i!953 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!689)))))

(declare-fun mapNonEmpty!2355 () Bool)

(declare-fun mapRes!2356 () Bool)

(declare-fun tp!2355 () Bool)

(declare-fun tp_is_empty!733 () Bool)

(assert (=> mapNonEmpty!2355 (= mapRes!2356 (and tp!2355 tp_is_empty!733))))

(declare-fun mapValue!2356 () T!52659)

(declare-fun mapKey!2355 () (_ BitVec 32))

(declare-fun mapRest!2355 () (Array (_ BitVec 32) T!52659))

(assert (=> mapNonEmpty!2355 (= (arr!8353 a2!596) (store mapRest!2355 mapKey!2355 mapValue!2356))))

(declare-fun mapIsEmpty!2355 () Bool)

(declare-fun mapRes!2355 () Bool)

(assert (=> mapIsEmpty!2355 mapRes!2355))

(declare-fun b!288562 () Bool)

(declare-fun e!205185 () Bool)

(assert (=> b!288562 (= e!205185 (and tp_is_empty!733 mapRes!2356))))

(declare-fun condMapEmpty!2356 () Bool)

(declare-fun mapDefault!2355 () T!52659)

