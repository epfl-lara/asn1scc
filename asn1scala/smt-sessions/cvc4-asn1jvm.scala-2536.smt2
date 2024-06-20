; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63990 () Bool)

(assert start!63990)

(declare-fun mapNonEmpty!1202 () Bool)

(declare-fun mapRes!1202 () Bool)

(declare-fun tp!1202 () Bool)

(declare-fun tp_is_empty!431 () Bool)

(assert (=> mapNonEmpty!1202 (= mapRes!1202 (and tp!1202 tp_is_empty!431))))

(declare-datatypes ((T!51337 0))(
  ( (T!51338 (val!215 Int)) )
))
(declare-datatypes ((array!16709 0))(
  ( (array!16710 (arr!8202 (Array (_ BitVec 32) T!51337)) (size!7206 (_ BitVec 32))) )
))
(declare-fun a2!623 () array!16709)

(declare-fun mapRest!1204 () (Array (_ BitVec 32) T!51337))

(declare-fun mapValue!1204 () T!51337)

(declare-fun mapKey!1202 () (_ BitVec 32))

(assert (=> mapNonEmpty!1202 (= (arr!8202 a2!623) (store mapRest!1204 mapKey!1202 mapValue!1204))))

(declare-fun b!284625 () Bool)

(declare-fun res!235683 () Bool)

(declare-fun e!203449 () Bool)

(assert (=> b!284625 (=> (not res!235683) (not e!203449))))

(declare-fun a1!623 () array!16709)

(declare-fun mid!66 () (_ BitVec 32))

(declare-fun from!749 () (_ BitVec 32))

(declare-fun arrayRangesEq!1356 (array!16709 array!16709 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!284625 (= res!235683 (arrayRangesEq!1356 a1!623 a2!623 from!749 mid!66))))

(declare-fun mapIsEmpty!1203 () Bool)

(declare-fun mapRes!1203 () Bool)

(assert (=> mapIsEmpty!1203 mapRes!1203))

(declare-fun mapNonEmpty!1203 () Bool)

(declare-fun mapRes!1204 () Bool)

(declare-fun tp!1203 () Bool)

(assert (=> mapNonEmpty!1203 (= mapRes!1204 (and tp!1203 tp_is_empty!431))))

(declare-fun mapRest!1203 () (Array (_ BitVec 32) T!51337))

(declare-fun mapKey!1203 () (_ BitVec 32))

(declare-fun mapValue!1203 () T!51337)

(assert (=> mapNonEmpty!1203 (= (arr!8202 a1!623) (store mapRest!1203 mapKey!1203 mapValue!1203))))

(declare-fun b!284626 () Bool)

(declare-fun res!235686 () Bool)

(assert (=> b!284626 (=> (not res!235686) (not e!203449))))

(declare-fun a3!63 () array!16709)

(assert (=> b!284626 (= res!235686 (arrayRangesEq!1356 a1!623 a3!63 from!749 from!749))))

(declare-fun b!284627 () Bool)

(declare-fun e!203447 () Bool)

(assert (=> b!284627 (= e!203447 (and tp_is_empty!431 mapRes!1202))))

(declare-fun condMapEmpty!1202 () Bool)

(declare-fun mapDefault!1202 () T!51337)

