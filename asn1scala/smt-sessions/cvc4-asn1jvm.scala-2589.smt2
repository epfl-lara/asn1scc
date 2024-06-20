; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64334 () Bool)

(assert start!64334)

(declare-fun res!238649 () Bool)

(declare-fun e!205292 () Bool)

(assert (=> start!64334 (=> (not res!238649) (not e!205292))))

(declare-datatypes ((T!52715 0))(
  ( (T!52716 (val!374 Int)) )
))
(declare-datatypes ((array!17032 0))(
  ( (array!17033 (arr!8361 (Array (_ BitVec 32) T!52715)) (size!7365 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!17032)

(declare-fun a2!596 () array!17032)

(declare-fun from!722 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(assert (=> start!64334 (= res!238649 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7365 a1!596) (size!7365 a2!596)) (bvslt to!689 (size!7365 a1!596))))))

(assert (=> start!64334 e!205292))

(declare-fun e!205290 () Bool)

(declare-fun array_inv!6979 (array!17032) Bool)

(assert (=> start!64334 (and (array_inv!6979 a1!596) e!205290)))

(declare-fun e!205293 () Bool)

(assert (=> start!64334 (and (array_inv!6979 a2!596) e!205293)))

(assert (=> start!64334 true))

(declare-fun b!288781 () Bool)

(declare-fun res!238651 () Bool)

(assert (=> b!288781 (=> (not res!238651) (not e!205292))))

(declare-fun arrayRangesEq!1470 (array!17032 array!17032 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288781 (= res!238651 (arrayRangesEq!1470 a1!596 a2!596 from!722 to!689))))

(declare-fun b!288782 () Bool)

(declare-fun res!238655 () Bool)

(assert (=> b!288782 (=> (not res!238655) (not e!205292))))

(declare-fun i!953 () (_ BitVec 32))

(assert (=> b!288782 (= res!238655 (and (= (select (arr!8361 a1!596) to!689) (select (arr!8361 a2!596) to!689)) (bvsle from!722 i!953) (bvsle i!953 to!689)))))

(declare-fun b!288783 () Bool)

(declare-fun res!238654 () Bool)

(assert (=> b!288783 (=> (not res!238654) (not e!205292))))

(assert (=> b!288783 (= res!238654 (not (= i!953 from!722)))))

(declare-fun b!288784 () Bool)

(declare-fun e!205291 () Bool)

(assert (=> b!288784 (= e!205291 (or (not (= (bvand to!689 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand to!689 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 to!689) #b10000000000000000000000000000000))))))

(assert (=> b!288784 (arrayRangesEq!1470 a1!596 a2!596 from!722 (bvadd #b00000000000000000000000000000001 to!689))))

(declare-datatypes ((Unit!20015 0))(
  ( (Unit!20016) )
))
(declare-fun lt!418884 () Unit!20015)

(declare-fun rec!87 (array!17032 array!17032 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20015)

(assert (=> b!288784 (= lt!418884 (rec!87 a1!596 a2!596 from!722 to!689 (bvsub i!953 #b00000000000000000000000000000001)))))

(declare-fun mapNonEmpty!2407 () Bool)

(declare-fun mapRes!2407 () Bool)

(declare-fun tp!2407 () Bool)

(declare-fun tp_is_empty!749 () Bool)

(assert (=> mapNonEmpty!2407 (= mapRes!2407 (and tp!2407 tp_is_empty!749))))

(declare-fun mapKey!2408 () (_ BitVec 32))

(declare-fun mapValue!2407 () T!52715)

(declare-fun mapRest!2408 () (Array (_ BitVec 32) T!52715))

(assert (=> mapNonEmpty!2407 (= (arr!8361 a2!596) (store mapRest!2408 mapKey!2408 mapValue!2407))))

(declare-fun b!288785 () Bool)

(assert (=> b!288785 (= e!205293 (and tp_is_empty!749 mapRes!2407))))

(declare-fun condMapEmpty!2408 () Bool)

(declare-fun mapDefault!2407 () T!52715)

