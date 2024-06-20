; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64330 () Bool)

(assert start!64330)

(declare-fun res!238609 () Bool)

(declare-fun e!205269 () Bool)

(assert (=> start!64330 (=> (not res!238609) (not e!205269))))

(declare-datatypes ((T!52711 0))(
  ( (T!52712 (val!372 Int)) )
))
(declare-datatypes ((array!17028 0))(
  ( (array!17029 (arr!8359 (Array (_ BitVec 32) T!52711)) (size!7363 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!17028)

(declare-fun a2!596 () array!17028)

(declare-fun from!722 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(assert (=> start!64330 (= res!238609 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7363 a1!596) (size!7363 a2!596)) (bvslt to!689 (size!7363 a1!596))))))

(assert (=> start!64330 e!205269))

(declare-fun e!205268 () Bool)

(declare-fun array_inv!6977 (array!17028) Bool)

(assert (=> start!64330 (and (array_inv!6977 a1!596) e!205268)))

(declare-fun e!205266 () Bool)

(assert (=> start!64330 (and (array_inv!6977 a2!596) e!205266)))

(assert (=> start!64330 true))

(declare-fun mapIsEmpty!2395 () Bool)

(declare-fun mapRes!2396 () Bool)

(assert (=> mapIsEmpty!2395 mapRes!2396))

(declare-fun b!288727 () Bool)

(declare-fun res!238612 () Bool)

(assert (=> b!288727 (=> (not res!238612) (not e!205269))))

(declare-fun arrayRangesEq!1468 (array!17028 array!17028 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288727 (= res!238612 (arrayRangesEq!1468 a1!596 a2!596 from!722 to!689))))

(declare-fun b!288728 () Bool)

(declare-fun res!238608 () Bool)

(assert (=> b!288728 (=> (not res!238608) (not e!205269))))

(declare-fun i!953 () (_ BitVec 32))

(assert (=> b!288728 (= res!238608 (and (= (select (arr!8359 a1!596) to!689) (select (arr!8359 a2!596) to!689)) (bvsle from!722 i!953) (bvsle i!953 to!689)))))

(declare-fun b!288729 () Bool)

(declare-fun res!238607 () Bool)

(assert (=> b!288729 (=> (not res!238607) (not e!205269))))

(assert (=> b!288729 (= res!238607 (not (= i!953 from!722)))))

(declare-fun b!288730 () Bool)

(declare-fun res!238611 () Bool)

(declare-fun e!205267 () Bool)

(assert (=> b!288730 (=> res!238611 e!205267)))

(assert (=> b!288730 (= res!238611 (not (arrayRangesEq!1468 a1!596 a2!596 (bvsub i!953 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!689))))))

(declare-fun b!288731 () Bool)

(assert (=> b!288731 (= e!205269 (not e!205267))))

(declare-fun res!238610 () Bool)

(assert (=> b!288731 (=> res!238610 e!205267)))

(assert (=> b!288731 (= res!238610 (or (bvsgt from!722 (bvsub i!953 #b00000000000000000000000000000001)) (bvsgt (bvsub i!953 #b00000000000000000000000000000001) to!689)))))

(assert (=> b!288731 (= (select (arr!8359 a1!596) (bvsub i!953 #b00000000000000000000000000000001)) (select (arr!8359 a2!596) (bvsub i!953 #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!20011 0))(
  ( (Unit!20012) )
))
(declare-fun lt!418872 () Unit!20011)

(declare-fun arrayRangesEqImpliesEq!211 (array!17028 array!17028 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20011)

(assert (=> b!288731 (= lt!418872 (arrayRangesEqImpliesEq!211 a1!596 a2!596 from!722 (bvsub i!953 #b00000000000000000000000000000001) to!689))))

(declare-fun mapNonEmpty!2395 () Bool)

(declare-fun mapRes!2395 () Bool)

(declare-fun tp!2396 () Bool)

(declare-fun tp_is_empty!745 () Bool)

(assert (=> mapNonEmpty!2395 (= mapRes!2395 (and tp!2396 tp_is_empty!745))))

(declare-fun mapValue!2396 () T!52711)

(declare-fun mapKey!2396 () (_ BitVec 32))

(declare-fun mapRest!2395 () (Array (_ BitVec 32) T!52711))

(assert (=> mapNonEmpty!2395 (= (arr!8359 a1!596) (store mapRest!2395 mapKey!2396 mapValue!2396))))

(declare-fun b!288732 () Bool)

(assert (=> b!288732 (= e!205267 (or (not (= (bvand to!689 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand to!689 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 to!689) #b10000000000000000000000000000000))))))

(assert (=> b!288732 (arrayRangesEq!1468 a1!596 a2!596 from!722 (bvadd #b00000000000000000000000000000001 to!689))))

(declare-fun lt!418871 () Unit!20011)

(declare-fun rec!85 (array!17028 array!17028 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20011)

(assert (=> b!288732 (= lt!418871 (rec!85 a1!596 a2!596 from!722 to!689 (bvsub i!953 #b00000000000000000000000000000001)))))

(declare-fun b!288733 () Bool)

(declare-fun res!238613 () Bool)

(assert (=> b!288733 (=> (not res!238613) (not e!205269))))

(assert (=> b!288733 (= res!238613 (arrayRangesEq!1468 a1!596 a2!596 i!953 (bvadd #b00000000000000000000000000000001 to!689)))))

(declare-fun b!288734 () Bool)

(assert (=> b!288734 (= e!205268 (and tp_is_empty!745 mapRes!2395))))

(declare-fun condMapEmpty!2395 () Bool)

(declare-fun mapDefault!2396 () T!52711)

