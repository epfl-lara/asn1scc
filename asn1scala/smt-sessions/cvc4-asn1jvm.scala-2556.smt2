; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64114 () Bool)

(assert start!64114)

(declare-fun res!237058 () Bool)

(declare-fun e!204209 () Bool)

(assert (=> start!64114 (=> (not res!237058) (not e!204209))))

(declare-datatypes ((T!51857 0))(
  ( (T!51858 (val!275 Int)) )
))
(declare-datatypes ((array!16830 0))(
  ( (array!16831 (arr!8262 (Array (_ BitVec 32) T!51857)) (size!7266 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16830)

(declare-fun from!773 () (_ BitVec 32))

(declare-fun a1!647 () array!16830)

(declare-fun mid!71 () (_ BitVec 32))

(declare-fun a3!68 () array!16830)

(declare-fun to!740 () (_ BitVec 32))

(assert (=> start!64114 (= res!237058 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7266 a1!647) (size!7266 a2!647)) (bvsle (size!7266 a2!647) (size!7266 a3!68)) (bvsle mid!71 (size!7266 a1!647)) (bvsle to!740 (size!7266 a2!647))))))

(assert (=> start!64114 e!204209))

(declare-fun e!204207 () Bool)

(declare-fun array_inv!6920 (array!16830) Bool)

(assert (=> start!64114 (and (array_inv!6920 a2!647) e!204207)))

(assert (=> start!64114 true))

(declare-fun e!204208 () Bool)

(assert (=> start!64114 (and (array_inv!6920 a1!647) e!204208)))

(declare-fun e!204210 () Bool)

(assert (=> start!64114 (and (array_inv!6920 a3!68) e!204210)))

(declare-fun mapNonEmpty!1747 () Bool)

(declare-fun mapRes!1747 () Bool)

(declare-fun tp!1748 () Bool)

(declare-fun tp_is_empty!551 () Bool)

(assert (=> mapNonEmpty!1747 (= mapRes!1747 (and tp!1748 tp_is_empty!551))))

(declare-fun mapRest!1748 () (Array (_ BitVec 32) T!51857))

(declare-fun mapKey!1748 () (_ BitVec 32))

(declare-fun mapValue!1749 () T!51857)

(assert (=> mapNonEmpty!1747 (= (arr!8262 a3!68) (store mapRest!1748 mapKey!1748 mapValue!1749))))

(declare-fun b!286536 () Bool)

(declare-fun res!237056 () Bool)

(assert (=> b!286536 (=> (not res!237056) (not e!204209))))

(declare-fun arrayRangesEq!1404 (array!16830 array!16830 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!286536 (= res!237056 (arrayRangesEq!1404 a1!647 a2!647 from!773 mid!71))))

(declare-fun b!286537 () Bool)

(declare-fun res!237053 () Bool)

(assert (=> b!286537 (=> (not res!237053) (not e!204209))))

(declare-fun i!964 () (_ BitVec 32))

(assert (=> b!286537 (= res!237053 (arrayRangesEq!1404 a2!647 a3!68 i!964 to!740))))

(declare-fun mapNonEmpty!1748 () Bool)

(declare-fun mapRes!1749 () Bool)

(declare-fun tp!1749 () Bool)

(assert (=> mapNonEmpty!1748 (= mapRes!1749 (and tp!1749 tp_is_empty!551))))

(declare-fun mapRest!1749 () (Array (_ BitVec 32) T!51857))

(declare-fun mapValue!1748 () T!51857)

(declare-fun mapKey!1749 () (_ BitVec 32))

(assert (=> mapNonEmpty!1748 (= (arr!8262 a2!647) (store mapRest!1749 mapKey!1749 mapValue!1748))))

(declare-fun b!286538 () Bool)

(assert (=> b!286538 (= e!204210 (and tp_is_empty!551 mapRes!1747))))

(declare-fun condMapEmpty!1747 () Bool)

(declare-fun mapDefault!1748 () T!51857)

