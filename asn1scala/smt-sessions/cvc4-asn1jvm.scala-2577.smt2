; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64256 () Bool)

(assert start!64256)

(declare-fun mapNonEmpty!2187 () Bool)

(declare-fun mapRes!2187 () Bool)

(declare-fun tp!2187 () Bool)

(declare-fun tp_is_empty!677 () Bool)

(assert (=> mapNonEmpty!2187 (= mapRes!2187 (and tp!2187 tp_is_empty!677))))

(declare-datatypes ((T!52403 0))(
  ( (T!52404 (val!338 Int)) )
))
(declare-datatypes ((array!16959 0))(
  ( (array!16960 (arr!8325 (Array (_ BitVec 32) T!52403)) (size!7329 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!16959)

(declare-fun mapKey!2188 () (_ BitVec 32))

(declare-fun mapValue!2188 () T!52403)

(declare-fun mapRest!2188 () (Array (_ BitVec 32) T!52403))

(assert (=> mapNonEmpty!2187 (= (arr!8325 a1!596) (store mapRest!2188 mapKey!2188 mapValue!2188))))

(declare-fun res!238132 () Bool)

(declare-fun e!204932 () Bool)

(assert (=> start!64256 (=> (not res!238132) (not e!204932))))

(declare-fun a2!596 () array!16959)

(declare-fun from!722 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(assert (=> start!64256 (= res!238132 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7329 a1!596) (size!7329 a2!596)) (bvslt to!689 (size!7329 a1!596))))))

(assert (=> start!64256 e!204932))

(declare-fun e!204930 () Bool)

(declare-fun array_inv!6958 (array!16959) Bool)

(assert (=> start!64256 (and (array_inv!6958 a1!596) e!204930)))

(declare-fun e!204931 () Bool)

(assert (=> start!64256 (and (array_inv!6958 a2!596) e!204931)))

(assert (=> start!64256 true))

(declare-fun mapNonEmpty!2188 () Bool)

(declare-fun mapRes!2188 () Bool)

(declare-fun tp!2188 () Bool)

(assert (=> mapNonEmpty!2188 (= mapRes!2188 (and tp!2188 tp_is_empty!677))))

(declare-fun mapRest!2187 () (Array (_ BitVec 32) T!52403))

(declare-fun mapValue!2187 () T!52403)

(declare-fun mapKey!2187 () (_ BitVec 32))

(assert (=> mapNonEmpty!2188 (= (arr!8325 a2!596) (store mapRest!2187 mapKey!2187 mapValue!2187))))

(declare-fun b!288040 () Bool)

(assert (=> b!288040 (= e!204930 (and tp_is_empty!677 mapRes!2187))))

(declare-fun condMapEmpty!2187 () Bool)

(declare-fun mapDefault!2187 () T!52403)

