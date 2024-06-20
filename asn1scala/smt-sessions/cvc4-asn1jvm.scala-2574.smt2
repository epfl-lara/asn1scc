; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64238 () Bool)

(assert start!64238)

(declare-fun res!237942 () Bool)

(declare-fun e!204822 () Bool)

(assert (=> start!64238 (=> (not res!237942) (not e!204822))))

(declare-datatypes ((T!52325 0))(
  ( (T!52326 (val!329 Int)) )
))
(declare-datatypes ((array!16941 0))(
  ( (array!16942 (arr!8316 (Array (_ BitVec 32) T!52325)) (size!7320 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!16941)

(declare-fun a2!596 () array!16941)

(declare-fun from!722 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(assert (=> start!64238 (= res!237942 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7320 a1!596) (size!7320 a2!596)) (bvslt to!689 (size!7320 a1!596))))))

(assert (=> start!64238 e!204822))

(declare-fun e!204824 () Bool)

(declare-fun array_inv!6952 (array!16941) Bool)

(assert (=> start!64238 (and (array_inv!6952 a1!596) e!204824)))

(declare-fun e!204823 () Bool)

(assert (=> start!64238 (and (array_inv!6952 a2!596) e!204823)))

(assert (=> start!64238 true))

(declare-fun mapIsEmpty!2133 () Bool)

(declare-fun mapRes!2134 () Bool)

(assert (=> mapIsEmpty!2133 mapRes!2134))

(declare-fun mapIsEmpty!2134 () Bool)

(declare-fun mapRes!2133 () Bool)

(assert (=> mapIsEmpty!2134 mapRes!2133))

(declare-fun b!287799 () Bool)

(assert (=> b!287799 (= e!204822 (not true))))

(declare-fun i!953 () (_ BitVec 32))

(assert (=> b!287799 (= (select (arr!8316 a1!596) (bvsub i!953 #b00000000000000000000000000000001)) (select (arr!8316 a2!596) (bvsub i!953 #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!19985 0))(
  ( (Unit!19986) )
))
(declare-fun lt!418773 () Unit!19985)

(declare-fun arrayRangesEqImpliesEq!200 (array!16941 array!16941 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19985)

(assert (=> b!287799 (= lt!418773 (arrayRangesEqImpliesEq!200 a1!596 a2!596 from!722 (bvsub i!953 #b00000000000000000000000000000001) to!689))))

(declare-fun mapNonEmpty!2133 () Bool)

(declare-fun tp!2133 () Bool)

(declare-fun tp_is_empty!659 () Bool)

(assert (=> mapNonEmpty!2133 (= mapRes!2134 (and tp!2133 tp_is_empty!659))))

(declare-fun mapKey!2134 () (_ BitVec 32))

(declare-fun mapValue!2134 () T!52325)

(declare-fun mapRest!2133 () (Array (_ BitVec 32) T!52325))

(assert (=> mapNonEmpty!2133 (= (arr!8316 a2!596) (store mapRest!2133 mapKey!2134 mapValue!2134))))

(declare-fun b!287800 () Bool)

(declare-fun res!237943 () Bool)

(assert (=> b!287800 (=> (not res!237943) (not e!204822))))

(assert (=> b!287800 (= res!237943 (and (= (select (arr!8316 a1!596) to!689) (select (arr!8316 a2!596) to!689)) (bvsle from!722 i!953) (bvsle i!953 to!689)))))

(declare-fun b!287801 () Bool)

(declare-fun res!237940 () Bool)

(assert (=> b!287801 (=> (not res!237940) (not e!204822))))

(assert (=> b!287801 (= res!237940 (not (= i!953 from!722)))))

(declare-fun b!287802 () Bool)

(declare-fun res!237939 () Bool)

(assert (=> b!287802 (=> (not res!237939) (not e!204822))))

(declare-fun arrayRangesEq!1438 (array!16941 array!16941 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!287802 (= res!237939 (arrayRangesEq!1438 a1!596 a2!596 from!722 to!689))))

(declare-fun b!287803 () Bool)

(assert (=> b!287803 (= e!204824 (and tp_is_empty!659 mapRes!2133))))

(declare-fun condMapEmpty!2134 () Bool)

(declare-fun mapDefault!2133 () T!52325)

