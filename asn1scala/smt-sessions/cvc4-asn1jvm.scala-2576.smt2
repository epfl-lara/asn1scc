; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64250 () Bool)

(assert start!64250)

(declare-fun b!287959 () Bool)

(declare-fun res!238068 () Bool)

(declare-fun e!204893 () Bool)

(assert (=> b!287959 (=> (not res!238068) (not e!204893))))

(declare-fun i!953 () (_ BitVec 32))

(declare-fun from!722 () (_ BitVec 32))

(assert (=> b!287959 (= res!238068 (not (= i!953 from!722)))))

(declare-fun mapNonEmpty!2169 () Bool)

(declare-fun mapRes!2169 () Bool)

(declare-fun tp!2169 () Bool)

(declare-fun tp_is_empty!671 () Bool)

(assert (=> mapNonEmpty!2169 (= mapRes!2169 (and tp!2169 tp_is_empty!671))))

(declare-datatypes ((T!52377 0))(
  ( (T!52378 (val!335 Int)) )
))
(declare-datatypes ((array!16953 0))(
  ( (array!16954 (arr!8322 (Array (_ BitVec 32) T!52377)) (size!7326 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!16953)

(declare-fun mapRest!2170 () (Array (_ BitVec 32) T!52377))

(declare-fun mapValue!2169 () T!52377)

(declare-fun mapKey!2170 () (_ BitVec 32))

(assert (=> mapNonEmpty!2169 (= (arr!8322 a1!596) (store mapRest!2170 mapKey!2170 mapValue!2169))))

(declare-fun mapIsEmpty!2169 () Bool)

(declare-fun mapRes!2170 () Bool)

(assert (=> mapIsEmpty!2169 mapRes!2170))

(declare-fun mapNonEmpty!2170 () Bool)

(declare-fun tp!2170 () Bool)

(assert (=> mapNonEmpty!2170 (= mapRes!2170 (and tp!2170 tp_is_empty!671))))

(declare-fun a2!596 () array!16953)

(declare-fun mapValue!2170 () T!52377)

(declare-fun mapKey!2169 () (_ BitVec 32))

(declare-fun mapRest!2169 () (Array (_ BitVec 32) T!52377))

(assert (=> mapNonEmpty!2170 (= (arr!8322 a2!596) (store mapRest!2169 mapKey!2169 mapValue!2170))))

(declare-fun b!287960 () Bool)

(declare-fun e!204896 () Bool)

(assert (=> b!287960 (= e!204896 (and tp_is_empty!671 mapRes!2170))))

(declare-fun condMapEmpty!2170 () Bool)

(declare-fun mapDefault!2169 () T!52377)

