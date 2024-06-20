; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64216 () Bool)

(assert start!64216)

(declare-fun res!237805 () Bool)

(declare-fun e!204725 () Bool)

(assert (=> start!64216 (=> (not res!237805) (not e!204725))))

(declare-datatypes ((T!52243 0))(
  ( (T!52244 (val!318 Int)) )
))
(declare-datatypes ((array!16919 0))(
  ( (array!16920 (arr!8305 (Array (_ BitVec 32) T!52243)) (size!7309 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!16919)

(declare-fun a2!596 () array!16919)

(declare-fun from!722 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(assert (=> start!64216 (= res!237805 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7309 a1!596) (size!7309 a2!596)) (bvslt to!689 (size!7309 a1!596))))))

(assert (=> start!64216 e!204725))

(declare-fun e!204724 () Bool)

(declare-fun array_inv!6947 (array!16919) Bool)

(assert (=> start!64216 (and (array_inv!6947 a1!596) e!204724)))

(declare-fun e!204723 () Bool)

(assert (=> start!64216 (and (array_inv!6947 a2!596) e!204723)))

(assert (=> start!64216 true))

(declare-fun mapNonEmpty!2067 () Bool)

(declare-fun mapRes!2067 () Bool)

(declare-fun tp!2068 () Bool)

(declare-fun tp_is_empty!637 () Bool)

(assert (=> mapNonEmpty!2067 (= mapRes!2067 (and tp!2068 tp_is_empty!637))))

(declare-fun mapKey!2068 () (_ BitVec 32))

(declare-fun mapValue!2068 () T!52243)

(declare-fun mapRest!2067 () (Array (_ BitVec 32) T!52243))

(assert (=> mapNonEmpty!2067 (= (arr!8305 a1!596) (store mapRest!2067 mapKey!2068 mapValue!2068))))

(declare-fun mapNonEmpty!2068 () Bool)

(declare-fun mapRes!2068 () Bool)

(declare-fun tp!2067 () Bool)

(assert (=> mapNonEmpty!2068 (= mapRes!2068 (and tp!2067 tp_is_empty!637))))

(declare-fun mapValue!2067 () T!52243)

(declare-fun mapRest!2068 () (Array (_ BitVec 32) T!52243))

(declare-fun mapKey!2067 () (_ BitVec 32))

(assert (=> mapNonEmpty!2068 (= (arr!8305 a2!596) (store mapRest!2068 mapKey!2067 mapValue!2067))))

(declare-fun i!953 () (_ BitVec 32))

(declare-fun b!287598 () Bool)

(assert (=> b!287598 (= e!204725 (and (= (select (arr!8305 a1!596) to!689) (select (arr!8305 a2!596) to!689)) (bvsle from!722 i!953) (bvsle i!953 to!689) (or (bvsgt #b00000000000000000000000000000000 i!953) (bvsgt i!953 (bvadd #b00000000000000000000000000000001 to!689)))))))

(declare-fun b!287599 () Bool)

(declare-fun res!237804 () Bool)

(assert (=> b!287599 (=> (not res!237804) (not e!204725))))

(declare-fun arrayRangesEq!1432 (array!16919 array!16919 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!287599 (= res!237804 (arrayRangesEq!1432 a1!596 a2!596 from!722 to!689))))

(declare-fun mapIsEmpty!2067 () Bool)

(assert (=> mapIsEmpty!2067 mapRes!2067))

(declare-fun mapIsEmpty!2068 () Bool)

(assert (=> mapIsEmpty!2068 mapRes!2068))

(declare-fun b!287600 () Bool)

(assert (=> b!287600 (= e!204723 (and tp_is_empty!637 mapRes!2068))))

(declare-fun condMapEmpty!2068 () Bool)

(declare-fun mapDefault!2068 () T!52243)

