; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64082 () Bool)

(assert start!64082)

(declare-fun b!286083 () Bool)

(declare-fun res!236727 () Bool)

(declare-fun e!204027 () Bool)

(assert (=> b!286083 (=> (not res!236727) (not e!204027))))

(declare-datatypes ((T!51749 0))(
  ( (T!51750 (val!261 Int)) )
))
(declare-datatypes ((array!16801 0))(
  ( (array!16802 (arr!8248 (Array (_ BitVec 32) T!51749)) (size!7252 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16801)

(declare-fun i!964 () (_ BitVec 32))

(declare-fun a3!68 () array!16801)

(declare-fun to!740 () (_ BitVec 32))

(declare-fun arrayRangesEq!1392 (array!16801 array!16801 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!286083 (= res!236727 (arrayRangesEq!1392 a2!647 a3!68 i!964 to!740))))

(declare-fun mapIsEmpty!1616 () Bool)

(declare-fun mapRes!1618 () Bool)

(assert (=> mapIsEmpty!1616 mapRes!1618))

(declare-fun mapNonEmpty!1616 () Bool)

(declare-fun mapRes!1617 () Bool)

(declare-fun tp!1617 () Bool)

(declare-fun tp_is_empty!523 () Bool)

(assert (=> mapNonEmpty!1616 (= mapRes!1617 (and tp!1617 tp_is_empty!523))))

(declare-fun mapValue!1618 () T!51749)

(declare-fun mapKey!1618 () (_ BitVec 32))

(declare-fun mapRest!1618 () (Array (_ BitVec 32) T!51749))

(declare-fun a1!647 () array!16801)

(assert (=> mapNonEmpty!1616 (= (arr!8248 a1!647) (store mapRest!1618 mapKey!1618 mapValue!1618))))

(declare-fun mapNonEmpty!1617 () Bool)

(declare-fun mapRes!1616 () Bool)

(declare-fun tp!1618 () Bool)

(assert (=> mapNonEmpty!1617 (= mapRes!1616 (and tp!1618 tp_is_empty!523))))

(declare-fun mapKey!1616 () (_ BitVec 32))

(declare-fun mapRest!1616 () (Array (_ BitVec 32) T!51749))

(declare-fun mapValue!1616 () T!51749)

(assert (=> mapNonEmpty!1617 (= (arr!8248 a2!647) (store mapRest!1616 mapKey!1616 mapValue!1616))))

(declare-fun b!286084 () Bool)

(declare-fun res!236730 () Bool)

(assert (=> b!286084 (=> (not res!236730) (not e!204027))))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun mid!71 () (_ BitVec 32))

(assert (=> b!286084 (= res!236730 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun mapIsEmpty!1618 () Bool)

(assert (=> mapIsEmpty!1618 mapRes!1616))

(declare-fun mapNonEmpty!1618 () Bool)

(declare-fun tp!1616 () Bool)

(assert (=> mapNonEmpty!1618 (= mapRes!1618 (and tp!1616 tp_is_empty!523))))

(declare-fun mapKey!1617 () (_ BitVec 32))

(declare-fun mapValue!1617 () T!51749)

(declare-fun mapRest!1617 () (Array (_ BitVec 32) T!51749))

(assert (=> mapNonEmpty!1618 (= (arr!8248 a3!68) (store mapRest!1617 mapKey!1617 mapValue!1617))))

(declare-fun b!286085 () Bool)

(declare-fun res!236729 () Bool)

(assert (=> b!286085 (=> (not res!236729) (not e!204027))))

(assert (=> b!286085 (= res!236729 (arrayRangesEq!1392 a2!647 a3!68 from!773 to!740))))

(declare-fun b!286086 () Bool)

(declare-fun e!204028 () Bool)

(assert (=> b!286086 (= e!204028 (and tp_is_empty!523 mapRes!1618))))

(declare-fun condMapEmpty!1618 () Bool)

(declare-fun mapDefault!1618 () T!51749)

