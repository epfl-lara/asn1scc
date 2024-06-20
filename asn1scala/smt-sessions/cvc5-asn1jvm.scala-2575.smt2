; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64240 () Bool)

(assert start!64240)

(declare-fun b!287824 () Bool)

(declare-fun e!204833 () Bool)

(declare-fun from!722 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(assert (=> b!287824 (= e!204833 (bvsle from!722 (bvadd #b00000000000000000000000000000001 to!689)))))

(declare-datatypes ((T!52347 0))(
  ( (T!52348 (val!330 Int)) )
))
(declare-datatypes ((array!16943 0))(
  ( (array!16944 (arr!8317 (Array (_ BitVec 32) T!52347)) (size!7321 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!16943)

(declare-fun a2!596 () array!16943)

(declare-fun arrayRangesEq!1439 (array!16943 array!16943 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!287824 (arrayRangesEq!1439 a1!596 a2!596 from!722 (bvadd #b00000000000000000000000000000001 to!689))))

(declare-fun i!953 () (_ BitVec 32))

(declare-datatypes ((Unit!19987 0))(
  ( (Unit!19988) )
))
(declare-fun lt!418779 () Unit!19987)

(declare-fun rec!79 (array!16943 array!16943 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19987)

(assert (=> b!287824 (= lt!418779 (rec!79 a1!596 a2!596 from!722 to!689 (bvsub i!953 #b00000000000000000000000000000001)))))

(declare-fun b!287825 () Bool)

(declare-fun res!237959 () Bool)

(declare-fun e!204835 () Bool)

(assert (=> b!287825 (=> (not res!237959) (not e!204835))))

(assert (=> b!287825 (= res!237959 (not (= i!953 from!722)))))

(declare-fun b!287826 () Bool)

(declare-fun res!237964 () Bool)

(assert (=> b!287826 (=> (not res!237964) (not e!204835))))

(assert (=> b!287826 (= res!237964 (arrayRangesEq!1439 a1!596 a2!596 i!953 (bvadd #b00000000000000000000000000000001 to!689)))))

(declare-fun res!237961 () Bool)

(assert (=> start!64240 (=> (not res!237961) (not e!204835))))

(assert (=> start!64240 (= res!237961 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7321 a1!596) (size!7321 a2!596)) (bvslt to!689 (size!7321 a1!596))))))

(assert (=> start!64240 e!204835))

(declare-fun e!204834 () Bool)

(declare-fun array_inv!6953 (array!16943) Bool)

(assert (=> start!64240 (and (array_inv!6953 a1!596) e!204834)))

(declare-fun e!204836 () Bool)

(assert (=> start!64240 (and (array_inv!6953 a2!596) e!204836)))

(assert (=> start!64240 true))

(declare-fun mapIsEmpty!2139 () Bool)

(declare-fun mapRes!2140 () Bool)

(assert (=> mapIsEmpty!2139 mapRes!2140))

(declare-fun b!287827 () Bool)

(declare-fun res!237963 () Bool)

(assert (=> b!287827 (=> (not res!237963) (not e!204835))))

(assert (=> b!287827 (= res!237963 (arrayRangesEq!1439 a1!596 a2!596 from!722 to!689))))

(declare-fun mapIsEmpty!2140 () Bool)

(declare-fun mapRes!2139 () Bool)

(assert (=> mapIsEmpty!2140 mapRes!2139))

(declare-fun b!287828 () Bool)

(declare-fun res!237958 () Bool)

(assert (=> b!287828 (=> (not res!237958) (not e!204835))))

(assert (=> b!287828 (= res!237958 (and (= (select (arr!8317 a1!596) to!689) (select (arr!8317 a2!596) to!689)) (bvsle from!722 i!953) (bvsle i!953 to!689)))))

(declare-fun mapNonEmpty!2139 () Bool)

(declare-fun tp!2140 () Bool)

(declare-fun tp_is_empty!661 () Bool)

(assert (=> mapNonEmpty!2139 (= mapRes!2139 (and tp!2140 tp_is_empty!661))))

(declare-fun mapValue!2139 () T!52347)

(declare-fun mapRest!2139 () (Array (_ BitVec 32) T!52347))

(declare-fun mapKey!2140 () (_ BitVec 32))

(assert (=> mapNonEmpty!2139 (= (arr!8317 a1!596) (store mapRest!2139 mapKey!2140 mapValue!2139))))

(declare-fun b!287829 () Bool)

(declare-fun res!237960 () Bool)

(assert (=> b!287829 (=> res!237960 e!204833)))

(assert (=> b!287829 (= res!237960 (not (arrayRangesEq!1439 a1!596 a2!596 (bvsub i!953 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!689))))))

(declare-fun b!287830 () Bool)

(assert (=> b!287830 (= e!204834 (and tp_is_empty!661 mapRes!2139))))

(declare-fun condMapEmpty!2139 () Bool)

(declare-fun mapDefault!2140 () T!52347)

