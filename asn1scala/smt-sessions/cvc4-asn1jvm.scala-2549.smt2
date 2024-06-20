; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64068 () Bool)

(assert start!64068)

(declare-fun b!285864 () Bool)

(declare-fun res!236572 () Bool)

(declare-fun e!203943 () Bool)

(assert (=> b!285864 (=> (not res!236572) (not e!203943))))

(declare-datatypes ((T!51675 0))(
  ( (T!51676 (val!254 Int)) )
))
(declare-datatypes ((array!16787 0))(
  ( (array!16788 (arr!8241 (Array (_ BitVec 32) T!51675)) (size!7245 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16787)

(declare-fun i!964 () (_ BitVec 32))

(declare-fun a3!68 () array!16787)

(declare-fun to!740 () (_ BitVec 32))

(declare-fun arrayRangesEq!1387 (array!16787 array!16787 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!285864 (= res!236572 (arrayRangesEq!1387 a2!647 a3!68 i!964 to!740))))

(declare-fun mapNonEmpty!1553 () Bool)

(declare-fun mapRes!1555 () Bool)

(declare-fun tp!1553 () Bool)

(declare-fun tp_is_empty!509 () Bool)

(assert (=> mapNonEmpty!1553 (= mapRes!1555 (and tp!1553 tp_is_empty!509))))

(declare-fun mapValue!1555 () T!51675)

(declare-fun mapKey!1555 () (_ BitVec 32))

(declare-fun mapRest!1555 () (Array (_ BitVec 32) T!51675))

(declare-fun a1!647 () array!16787)

(assert (=> mapNonEmpty!1553 (= (arr!8241 a1!647) (store mapRest!1555 mapKey!1555 mapValue!1555))))

(declare-fun mapNonEmpty!1554 () Bool)

(declare-fun mapRes!1553 () Bool)

(declare-fun tp!1555 () Bool)

(assert (=> mapNonEmpty!1554 (= mapRes!1553 (and tp!1555 tp_is_empty!509))))

(declare-fun mapValue!1553 () T!51675)

(declare-fun mapKey!1553 () (_ BitVec 32))

(declare-fun mapRest!1553 () (Array (_ BitVec 32) T!51675))

(assert (=> mapNonEmpty!1554 (= (arr!8241 a2!647) (store mapRest!1553 mapKey!1553 mapValue!1553))))

(declare-fun res!236577 () Bool)

(assert (=> start!64068 (=> (not res!236577) (not e!203943))))

(declare-fun mid!71 () (_ BitVec 32))

(declare-fun from!773 () (_ BitVec 32))

(assert (=> start!64068 (= res!236577 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7245 a1!647) (size!7245 a2!647)) (bvsle (size!7245 a2!647) (size!7245 a3!68)) (bvsle mid!71 (size!7245 a1!647)) (bvsle to!740 (size!7245 a2!647))))))

(assert (=> start!64068 e!203943))

(declare-fun e!203942 () Bool)

(declare-fun array_inv!6909 (array!16787) Bool)

(assert (=> start!64068 (and (array_inv!6909 a2!647) e!203942)))

(assert (=> start!64068 true))

(declare-fun e!203944 () Bool)

(assert (=> start!64068 (and (array_inv!6909 a1!647) e!203944)))

(declare-fun e!203941 () Bool)

(assert (=> start!64068 (and (array_inv!6909 a3!68) e!203941)))

(declare-fun b!285865 () Bool)

(declare-fun res!236575 () Bool)

(assert (=> b!285865 (=> (not res!236575) (not e!203943))))

(assert (=> b!285865 (= res!236575 (arrayRangesEq!1387 a1!647 a2!647 i!964 mid!71))))

(declare-fun b!285866 () Bool)

(declare-fun mapRes!1554 () Bool)

(assert (=> b!285866 (= e!203941 (and tp_is_empty!509 mapRes!1554))))

(declare-fun condMapEmpty!1553 () Bool)

(declare-fun mapDefault!1555 () T!51675)

