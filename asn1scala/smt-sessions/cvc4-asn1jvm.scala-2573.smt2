; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64232 () Bool)

(assert start!64232)

(declare-fun b!287737 () Bool)

(declare-fun res!237896 () Bool)

(declare-fun e!204797 () Bool)

(assert (=> b!287737 (=> (not res!237896) (not e!204797))))

(declare-fun i!953 () (_ BitVec 32))

(declare-fun from!722 () (_ BitVec 32))

(assert (=> b!287737 (= res!237896 (not (= i!953 from!722)))))

(declare-fun b!287738 () Bool)

(declare-fun res!237897 () Bool)

(assert (=> b!287738 (=> (not res!237897) (not e!204797))))

(declare-datatypes ((T!52299 0))(
  ( (T!52300 (val!326 Int)) )
))
(declare-datatypes ((array!16935 0))(
  ( (array!16936 (arr!8313 (Array (_ BitVec 32) T!52299)) (size!7317 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!16935)

(declare-fun a2!596 () array!16935)

(declare-fun to!689 () (_ BitVec 32))

(assert (=> b!287738 (= res!237897 (and (= (select (arr!8313 a1!596) to!689) (select (arr!8313 a2!596) to!689)) (bvsle from!722 i!953) (bvsle i!953 to!689)))))

(declare-fun mapNonEmpty!2115 () Bool)

(declare-fun mapRes!2115 () Bool)

(declare-fun tp!2115 () Bool)

(declare-fun tp_is_empty!653 () Bool)

(assert (=> mapNonEmpty!2115 (= mapRes!2115 (and tp!2115 tp_is_empty!653))))

(declare-fun mapValue!2116 () T!52299)

(declare-fun mapKey!2116 () (_ BitVec 32))

(declare-fun mapRest!2115 () (Array (_ BitVec 32) T!52299))

(assert (=> mapNonEmpty!2115 (= (arr!8313 a2!596) (store mapRest!2115 mapKey!2116 mapValue!2116))))

(declare-fun b!287739 () Bool)

(declare-fun res!237898 () Bool)

(assert (=> b!287739 (=> (not res!237898) (not e!204797))))

(declare-fun arrayRangesEq!1436 (array!16935 array!16935 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!287739 (= res!237898 (arrayRangesEq!1436 a1!596 a2!596 i!953 (bvadd #b00000000000000000000000000000001 to!689)))))

(declare-fun b!287740 () Bool)

(declare-fun e!204795 () Bool)

(declare-fun mapRes!2116 () Bool)

(assert (=> b!287740 (= e!204795 (and tp_is_empty!653 mapRes!2116))))

(declare-fun condMapEmpty!2115 () Bool)

(declare-fun mapDefault!2115 () T!52299)

