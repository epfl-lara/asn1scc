; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64050 () Bool)

(assert start!64050)

(declare-fun b!285518 () Bool)

(declare-fun res!236307 () Bool)

(declare-fun e!203818 () Bool)

(assert (=> b!285518 (=> (not res!236307) (not e!203818))))

(declare-fun i!964 () (_ BitVec 32))

(declare-fun mid!71 () (_ BitVec 32))

(assert (=> b!285518 (= res!236307 (not (= i!964 mid!71)))))

(declare-fun b!285519 () Bool)

(declare-fun res!236315 () Bool)

(assert (=> b!285519 (=> (not res!236315) (not e!203818))))

(declare-fun from!773 () (_ BitVec 32))

(assert (=> b!285519 (= res!236315 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun b!285520 () Bool)

(declare-fun res!236316 () Bool)

(assert (=> b!285520 (=> (not res!236316) (not e!203818))))

(declare-datatypes ((T!51597 0))(
  ( (T!51598 (val!245 Int)) )
))
(declare-datatypes ((array!16769 0))(
  ( (array!16770 (arr!8232 (Array (_ BitVec 32) T!51597)) (size!7236 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16769)

(declare-fun a1!647 () array!16769)

(declare-fun arrayRangesEq!1378 (array!16769 array!16769 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!285520 (= res!236316 (arrayRangesEq!1378 a1!647 a2!647 i!964 mid!71))))

(declare-fun res!236310 () Bool)

(assert (=> start!64050 (=> (not res!236310) (not e!203818))))

(declare-fun a3!68 () array!16769)

(declare-fun to!740 () (_ BitVec 32))

(assert (=> start!64050 (= res!236310 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7236 a1!647) (size!7236 a2!647)) (bvsle (size!7236 a2!647) (size!7236 a3!68)) (bvsle mid!71 (size!7236 a1!647)) (bvsle to!740 (size!7236 a2!647))))))

(assert (=> start!64050 e!203818))

(declare-fun e!203814 () Bool)

(declare-fun array_inv!6905 (array!16769) Bool)

(assert (=> start!64050 (and (array_inv!6905 a2!647) e!203814)))

(assert (=> start!64050 true))

(declare-fun e!203815 () Bool)

(assert (=> start!64050 (and (array_inv!6905 a1!647) e!203815)))

(declare-fun e!203816 () Bool)

(assert (=> start!64050 (and (array_inv!6905 a3!68) e!203816)))

(declare-fun mapNonEmpty!1472 () Bool)

(declare-fun mapRes!1472 () Bool)

(declare-fun tp!1474 () Bool)

(declare-fun tp_is_empty!491 () Bool)

(assert (=> mapNonEmpty!1472 (= mapRes!1472 (and tp!1474 tp_is_empty!491))))

(declare-fun mapKey!1473 () (_ BitVec 32))

(declare-fun mapValue!1474 () T!51597)

(declare-fun mapRest!1472 () (Array (_ BitVec 32) T!51597))

(assert (=> mapNonEmpty!1472 (= (arr!8232 a1!647) (store mapRest!1472 mapKey!1473 mapValue!1474))))

(declare-fun b!285521 () Bool)

(declare-fun mapRes!1474 () Bool)

(assert (=> b!285521 (= e!203816 (and tp_is_empty!491 mapRes!1474))))

(declare-fun condMapEmpty!1474 () Bool)

(declare-fun mapDefault!1473 () T!51597)

