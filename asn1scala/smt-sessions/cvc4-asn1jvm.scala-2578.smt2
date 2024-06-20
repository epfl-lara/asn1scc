; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64262 () Bool)

(assert start!64262)

(declare-fun res!238149 () Bool)

(declare-fun e!204958 () Bool)

(assert (=> start!64262 (=> (not res!238149) (not e!204958))))

(declare-datatypes ((T!52429 0))(
  ( (T!52430 (val!341 Int)) )
))
(declare-datatypes ((array!16965 0))(
  ( (array!16966 (arr!8328 (Array (_ BitVec 32) T!52429)) (size!7332 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!16965)

(declare-fun a2!596 () array!16965)

(declare-fun from!722 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(assert (=> start!64262 (= res!238149 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7332 a1!596) (size!7332 a2!596)) (bvslt to!689 (size!7332 a1!596))))))

(assert (=> start!64262 e!204958))

(declare-fun e!204957 () Bool)

(declare-fun array_inv!6960 (array!16965) Bool)

(assert (=> start!64262 (and (array_inv!6960 a1!596) e!204957)))

(declare-fun e!204959 () Bool)

(assert (=> start!64262 (and (array_inv!6960 a2!596) e!204959)))

(assert (=> start!64262 true))

(declare-fun mapIsEmpty!2205 () Bool)

(declare-fun mapRes!2205 () Bool)

(assert (=> mapIsEmpty!2205 mapRes!2205))

(declare-fun mapNonEmpty!2205 () Bool)

(declare-fun tp!2206 () Bool)

(declare-fun tp_is_empty!683 () Bool)

(assert (=> mapNonEmpty!2205 (= mapRes!2205 (and tp!2206 tp_is_empty!683))))

(declare-fun mapValue!2206 () T!52429)

(declare-fun mapRest!2206 () (Array (_ BitVec 32) T!52429))

(declare-fun mapKey!2206 () (_ BitVec 32))

(assert (=> mapNonEmpty!2205 (= (arr!8328 a2!596) (store mapRest!2206 mapKey!2206 mapValue!2206))))

(declare-fun mapNonEmpty!2206 () Bool)

(declare-fun mapRes!2206 () Bool)

(declare-fun tp!2205 () Bool)

(assert (=> mapNonEmpty!2206 (= mapRes!2206 (and tp!2205 tp_is_empty!683))))

(declare-fun mapKey!2205 () (_ BitVec 32))

(declare-fun mapValue!2205 () T!52429)

(declare-fun mapRest!2205 () (Array (_ BitVec 32) T!52429))

(assert (=> mapNonEmpty!2206 (= (arr!8328 a1!596) (store mapRest!2205 mapKey!2205 mapValue!2205))))

(declare-fun mapIsEmpty!2206 () Bool)

(assert (=> mapIsEmpty!2206 mapRes!2206))

(declare-fun b!288081 () Bool)

(declare-fun i!953 () (_ BitVec 32))

(assert (=> b!288081 (= e!204958 (and (= (select (arr!8328 a1!596) to!689) (select (arr!8328 a2!596) to!689)) (bvsle from!722 i!953) (bvsle i!953 to!689) (= (bvand to!689 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand to!689 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 to!689) #b10000000000000000000000000000000)))))))

(declare-fun b!288082 () Bool)

(declare-fun res!238150 () Bool)

(assert (=> b!288082 (=> (not res!238150) (not e!204958))))

(declare-fun arrayRangesEq!1446 (array!16965 array!16965 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288082 (= res!238150 (arrayRangesEq!1446 a1!596 a2!596 from!722 to!689))))

(declare-fun b!288083 () Bool)

(assert (=> b!288083 (= e!204957 (and tp_is_empty!683 mapRes!2206))))

(declare-fun condMapEmpty!2205 () Bool)

(declare-fun mapDefault!2206 () T!52429)

