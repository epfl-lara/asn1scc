; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64306 () Bool)

(assert start!64306)

(declare-fun res!238433 () Bool)

(declare-fun e!205156 () Bool)

(assert (=> start!64306 (=> (not res!238433) (not e!205156))))

(declare-datatypes ((T!52633 0))(
  ( (T!52634 (val!363 Int)) )
))
(declare-datatypes ((array!17009 0))(
  ( (array!17010 (arr!8350 (Array (_ BitVec 32) T!52633)) (size!7354 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!17009)

(declare-fun a2!596 () array!17009)

(declare-fun from!722 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(assert (=> start!64306 (= res!238433 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7354 a1!596) (size!7354 a2!596)) (bvslt to!689 (size!7354 a1!596))))))

(assert (=> start!64306 e!205156))

(declare-fun e!205157 () Bool)

(declare-fun array_inv!6972 (array!17009) Bool)

(assert (=> start!64306 (and (array_inv!6972 a1!596) e!205157)))

(declare-fun e!205155 () Bool)

(assert (=> start!64306 (and (array_inv!6972 a2!596) e!205155)))

(assert (=> start!64306 true))

(declare-fun mapNonEmpty!2337 () Bool)

(declare-fun mapRes!2337 () Bool)

(declare-fun tp!2337 () Bool)

(declare-fun tp_is_empty!727 () Bool)

(assert (=> mapNonEmpty!2337 (= mapRes!2337 (and tp!2337 tp_is_empty!727))))

(declare-fun mapValue!2337 () T!52633)

(declare-fun mapRest!2337 () (Array (_ BitVec 32) T!52633))

(declare-fun mapKey!2337 () (_ BitVec 32))

(assert (=> mapNonEmpty!2337 (= (arr!8350 a1!596) (store mapRest!2337 mapKey!2337 mapValue!2337))))

(declare-fun b!288495 () Bool)

(declare-fun res!238432 () Bool)

(assert (=> b!288495 (=> (not res!238432) (not e!205156))))

(declare-fun i!953 () (_ BitVec 32))

(declare-fun arrayRangesEq!1460 (array!17009 array!17009 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288495 (= res!238432 (arrayRangesEq!1460 a1!596 a2!596 i!953 (bvadd #b00000000000000000000000000000001 to!689)))))

(declare-fun b!288496 () Bool)

(declare-fun res!238434 () Bool)

(assert (=> b!288496 (=> (not res!238434) (not e!205156))))

(assert (=> b!288496 (= res!238434 (and (= (select (arr!8350 a1!596) to!689) (select (arr!8350 a2!596) to!689)) (bvsle from!722 i!953) (bvsle i!953 to!689)))))

(declare-fun b!288497 () Bool)

(assert (=> b!288497 (= e!205156 (not (and (bvsle from!722 (bvsub i!953 #b00000000000000000000000000000001)) (bvsle (bvsub i!953 #b00000000000000000000000000000001) to!689))))))

(assert (=> b!288497 (= (select (arr!8350 a1!596) (bvsub i!953 #b00000000000000000000000000000001)) (select (arr!8350 a2!596) (bvsub i!953 #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!20001 0))(
  ( (Unit!20002) )
))
(declare-fun lt!418839 () Unit!20001)

(declare-fun arrayRangesEqImpliesEq!206 (array!17009 array!17009 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20001)

(assert (=> b!288497 (= lt!418839 (arrayRangesEqImpliesEq!206 a1!596 a2!596 from!722 (bvsub i!953 #b00000000000000000000000000000001) to!689))))

(declare-fun mapNonEmpty!2338 () Bool)

(declare-fun mapRes!2338 () Bool)

(declare-fun tp!2338 () Bool)

(assert (=> mapNonEmpty!2338 (= mapRes!2338 (and tp!2338 tp_is_empty!727))))

(declare-fun mapKey!2338 () (_ BitVec 32))

(declare-fun mapValue!2338 () T!52633)

(declare-fun mapRest!2338 () (Array (_ BitVec 32) T!52633))

(assert (=> mapNonEmpty!2338 (= (arr!8350 a2!596) (store mapRest!2338 mapKey!2338 mapValue!2338))))

(declare-fun mapIsEmpty!2337 () Bool)

(assert (=> mapIsEmpty!2337 mapRes!2337))

(declare-fun b!288498 () Bool)

(declare-fun res!238431 () Bool)

(assert (=> b!288498 (=> (not res!238431) (not e!205156))))

(assert (=> b!288498 (= res!238431 (not (= i!953 from!722)))))

(declare-fun b!288499 () Bool)

(assert (=> b!288499 (= e!205155 (and tp_is_empty!727 mapRes!2338))))

(declare-fun condMapEmpty!2338 () Bool)

(declare-fun mapDefault!2338 () T!52633)

