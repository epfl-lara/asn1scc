; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64016 () Bool)

(assert start!64016)

(declare-fun mapNonEmpty!1319 () Bool)

(declare-fun mapRes!1320 () Bool)

(declare-fun tp!1320 () Bool)

(declare-fun tp_is_empty!457 () Bool)

(assert (=> mapNonEmpty!1319 (= mapRes!1320 (and tp!1320 tp_is_empty!457))))

(declare-datatypes ((T!51463 0))(
  ( (T!51464 (val!228 Int)) )
))
(declare-fun mapRest!1319 () (Array (_ BitVec 32) T!51463))

(declare-fun mapKey!1319 () (_ BitVec 32))

(declare-fun mapValue!1321 () T!51463)

(declare-datatypes ((array!16735 0))(
  ( (array!16736 (arr!8215 (Array (_ BitVec 32) T!51463)) (size!7219 (_ BitVec 32))) )
))
(declare-fun a3!68 () array!16735)

(assert (=> mapNonEmpty!1319 (= (arr!8215 a3!68) (store mapRest!1319 mapKey!1319 mapValue!1321))))

(declare-fun b!284940 () Bool)

(declare-fun res!235887 () Bool)

(declare-fun e!203602 () Bool)

(assert (=> b!284940 (=> (not res!235887) (not e!203602))))

(declare-fun i!964 () (_ BitVec 32))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun a1!647 () array!16735)

(declare-fun arrayRangesEq!1363 (array!16735 array!16735 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!284940 (= res!235887 (arrayRangesEq!1363 a1!647 a3!68 from!773 i!964))))

(declare-fun mapIsEmpty!1319 () Bool)

(declare-fun mapRes!1321 () Bool)

(assert (=> mapIsEmpty!1319 mapRes!1321))

(declare-fun mapNonEmpty!1320 () Bool)

(declare-fun tp!1321 () Bool)

(assert (=> mapNonEmpty!1320 (= mapRes!1321 (and tp!1321 tp_is_empty!457))))

(declare-fun mapValue!1319 () T!51463)

(declare-fun mapRest!1321 () (Array (_ BitVec 32) T!51463))

(declare-fun mapKey!1320 () (_ BitVec 32))

(assert (=> mapNonEmpty!1320 (= (arr!8215 a1!647) (store mapRest!1321 mapKey!1320 mapValue!1319))))

(declare-fun b!284941 () Bool)

(declare-fun e!203605 () Bool)

(declare-fun mapRes!1319 () Bool)

(assert (=> b!284941 (= e!203605 (and tp_is_empty!457 mapRes!1319))))

(declare-fun condMapEmpty!1320 () Bool)

(declare-fun a2!647 () array!16735)

(declare-fun mapDefault!1321 () T!51463)

