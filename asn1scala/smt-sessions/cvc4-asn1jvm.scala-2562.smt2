; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64162 () Bool)

(assert start!64162)

(declare-fun to!673 () (_ BitVec 32))

(declare-fun from!706 () (_ BitVec 32))

(declare-datatypes ((T!52013 0))(
  ( (T!52014 (val!293 Int)) )
))
(declare-datatypes ((array!16868 0))(
  ( (array!16869 (arr!8280 (Array (_ BitVec 32) T!52013)) (size!7284 (_ BitVec 32))) )
))
(declare-fun a2!580 () array!16868)

(declare-fun a1!580 () array!16868)

(assert (=> start!64162 (and (bvsle #b00000000000000000000000000000000 from!706) (bvsle from!706 to!673) (bvsle (size!7284 a1!580) (size!7284 a2!580)) (bvslt to!673 (size!7284 a1!580)) (bvsgt to!673 (size!7284 a1!580)))))

(assert (=> start!64162 true))

(declare-fun e!204488 () Bool)

(declare-fun array_inv!6932 (array!16868) Bool)

(assert (=> start!64162 (and (array_inv!6932 a1!580) e!204488)))

(declare-fun e!204487 () Bool)

(assert (=> start!64162 (and (array_inv!6932 a2!580) e!204487)))

(declare-fun mapIsEmpty!1911 () Bool)

(declare-fun mapRes!1912 () Bool)

(assert (=> mapIsEmpty!1911 mapRes!1912))

(declare-fun mapNonEmpty!1911 () Bool)

(declare-fun tp!1912 () Bool)

(declare-fun tp_is_empty!587 () Bool)

(assert (=> mapNonEmpty!1911 (= mapRes!1912 (and tp!1912 tp_is_empty!587))))

(declare-fun mapValue!1912 () T!52013)

(declare-fun mapKey!1911 () (_ BitVec 32))

(declare-fun mapRest!1911 () (Array (_ BitVec 32) T!52013))

(assert (=> mapNonEmpty!1911 (= (arr!8280 a1!580) (store mapRest!1911 mapKey!1911 mapValue!1912))))

(declare-fun b!287187 () Bool)

(assert (=> b!287187 (= e!204488 (and tp_is_empty!587 mapRes!1912))))

(declare-fun condMapEmpty!1911 () Bool)

(declare-fun mapDefault!1911 () T!52013)

