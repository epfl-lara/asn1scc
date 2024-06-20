; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64094 () Bool)

(assert start!64094)

(declare-fun b!286263 () Bool)

(declare-fun res!236855 () Bool)

(declare-fun e!204100 () Bool)

(assert (=> b!286263 (=> (not res!236855) (not e!204100))))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun i!964 () (_ BitVec 32))

(declare-fun mid!71 () (_ BitVec 32))

(assert (=> b!286263 (= res!236855 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun mapNonEmpty!1670 () Bool)

(declare-fun mapRes!1671 () Bool)

(declare-fun tp!1672 () Bool)

(declare-fun tp_is_empty!535 () Bool)

(assert (=> mapNonEmpty!1670 (= mapRes!1671 (and tp!1672 tp_is_empty!535))))

(declare-fun mapKey!1672 () (_ BitVec 32))

(declare-datatypes ((T!51801 0))(
  ( (T!51802 (val!267 Int)) )
))
(declare-fun mapRest!1672 () (Array (_ BitVec 32) T!51801))

(declare-fun mapValue!1672 () T!51801)

(declare-datatypes ((array!16813 0))(
  ( (array!16814 (arr!8254 (Array (_ BitVec 32) T!51801)) (size!7258 (_ BitVec 32))) )
))
(declare-fun a1!647 () array!16813)

(assert (=> mapNonEmpty!1670 (= (arr!8254 a1!647) (store mapRest!1672 mapKey!1672 mapValue!1672))))

(declare-fun b!286264 () Bool)

(declare-fun res!236859 () Bool)

(assert (=> b!286264 (=> (not res!236859) (not e!204100))))

(declare-fun a2!647 () array!16813)

(declare-fun a3!68 () array!16813)

(declare-fun to!740 () (_ BitVec 32))

(declare-fun arrayRangesEq!1397 (array!16813 array!16813 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!286264 (= res!236859 (arrayRangesEq!1397 a2!647 a3!68 from!773 to!740))))

(declare-fun b!286265 () Bool)

(assert (=> b!286265 (= e!204100 (and (not (= i!964 mid!71)) (bvsle (size!7258 a1!647) (size!7258 a3!68)) (bvslt i!964 (size!7258 a1!647)) (not (= (select (arr!8254 a1!647) i!964) (select (arr!8254 a3!68) i!964)))))))

(declare-fun mapNonEmpty!1671 () Bool)

(declare-fun mapRes!1670 () Bool)

(declare-fun tp!1671 () Bool)

(assert (=> mapNonEmpty!1671 (= mapRes!1670 (and tp!1671 tp_is_empty!535))))

(declare-fun mapRest!1671 () (Array (_ BitVec 32) T!51801))

(declare-fun mapValue!1670 () T!51801)

(declare-fun mapKey!1671 () (_ BitVec 32))

(assert (=> mapNonEmpty!1671 (= (arr!8254 a3!68) (store mapRest!1671 mapKey!1671 mapValue!1670))))

(declare-fun mapIsEmpty!1670 () Bool)

(assert (=> mapIsEmpty!1670 mapRes!1671))

(declare-fun b!286267 () Bool)

(declare-fun res!236858 () Bool)

(assert (=> b!286267 (=> (not res!236858) (not e!204100))))

(assert (=> b!286267 (= res!236858 (arrayRangesEq!1397 a1!647 a3!68 from!773 i!964))))

(declare-fun b!286268 () Bool)

(declare-fun e!204099 () Bool)

(assert (=> b!286268 (= e!204099 (and tp_is_empty!535 mapRes!1671))))

(declare-fun condMapEmpty!1672 () Bool)

(declare-fun mapDefault!1671 () T!51801)

