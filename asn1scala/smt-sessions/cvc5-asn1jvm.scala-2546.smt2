; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64046 () Bool)

(assert start!64046)

(declare-fun b!285434 () Bool)

(declare-fun res!236244 () Bool)

(declare-fun e!203786 () Bool)

(assert (=> b!285434 (=> (not res!236244) (not e!203786))))

(declare-datatypes ((T!51593 0))(
  ( (T!51594 (val!243 Int)) )
))
(declare-datatypes ((array!16765 0))(
  ( (array!16766 (arr!8230 (Array (_ BitVec 32) T!51593)) (size!7234 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16765)

(declare-fun from!773 () (_ BitVec 32))

(declare-fun a3!68 () array!16765)

(declare-fun to!740 () (_ BitVec 32))

(declare-fun arrayRangesEq!1376 (array!16765 array!16765 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!285434 (= res!236244 (arrayRangesEq!1376 a2!647 a3!68 from!773 to!740))))

(declare-fun mapIsEmpty!1454 () Bool)

(declare-fun mapRes!1456 () Bool)

(assert (=> mapIsEmpty!1454 mapRes!1456))

(declare-fun mapIsEmpty!1455 () Bool)

(declare-fun mapRes!1454 () Bool)

(assert (=> mapIsEmpty!1455 mapRes!1454))

(declare-fun b!285435 () Bool)

(declare-fun e!203787 () Bool)

(assert (=> b!285435 (= e!203786 (not e!203787))))

(declare-fun res!236247 () Bool)

(assert (=> b!285435 (=> res!236247 e!203787)))

(declare-fun i!964 () (_ BitVec 32))

(declare-fun mid!71 () (_ BitVec 32))

(assert (=> b!285435 (= res!236247 (or (bvsgt from!773 (bvadd #b00000000000000000000000000000001 i!964)) (bvsgt (bvadd #b00000000000000000000000000000001 i!964) mid!71)))))

(declare-fun a1!647 () array!16765)

(assert (=> b!285435 (arrayRangesEq!1376 a1!647 a3!68 from!773 (bvadd #b00000000000000000000000000000001 i!964))))

(declare-datatypes ((Unit!19931 0))(
  ( (Unit!19932) )
))
(declare-fun lt!418583 () Unit!19931)

(declare-fun arrayRangesEqAppend!8 (array!16765 array!16765 (_ BitVec 32) (_ BitVec 32)) Unit!19931)

(assert (=> b!285435 (= lt!418583 (arrayRangesEqAppend!8 a1!647 a3!68 from!773 i!964))))

(declare-fun res!236248 () Bool)

(assert (=> start!64046 (=> (not res!236248) (not e!203786))))

(assert (=> start!64046 (= res!236248 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7234 a1!647) (size!7234 a2!647)) (bvsle (size!7234 a2!647) (size!7234 a3!68)) (bvsle mid!71 (size!7234 a1!647)) (bvsle to!740 (size!7234 a2!647))))))

(assert (=> start!64046 e!203786))

(declare-fun e!203784 () Bool)

(declare-fun array_inv!6903 (array!16765) Bool)

(assert (=> start!64046 (and (array_inv!6903 a2!647) e!203784)))

(assert (=> start!64046 true))

(declare-fun e!203788 () Bool)

(assert (=> start!64046 (and (array_inv!6903 a1!647) e!203788)))

(declare-fun e!203785 () Bool)

(assert (=> start!64046 (and (array_inv!6903 a3!68) e!203785)))

(declare-fun b!285436 () Bool)

(declare-fun res!236241 () Bool)

(assert (=> b!285436 (=> (not res!236241) (not e!203786))))

(assert (=> b!285436 (= res!236241 (arrayRangesEq!1376 a1!647 a2!647 i!964 mid!71))))

(declare-fun b!285437 () Bool)

(declare-fun res!236240 () Bool)

(assert (=> b!285437 (=> (not res!236240) (not e!203786))))

(assert (=> b!285437 (= res!236240 (arrayRangesEq!1376 a1!647 a3!68 from!773 i!964))))

(declare-fun b!285438 () Bool)

(assert (=> b!285438 (= e!203787 true)))

(assert (=> b!285438 (arrayRangesEq!1376 a1!647 a3!68 from!773 mid!71)))

(declare-fun lt!418584 () Unit!19931)

(declare-fun rec!63 (array!16765 array!16765 array!16765 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19931)

(assert (=> b!285438 (= lt!418584 (rec!63 a1!647 a2!647 a3!68 from!773 mid!71 to!740 (bvadd #b00000000000000000000000000000001 i!964)))))

(declare-fun b!285439 () Bool)

(declare-fun res!236250 () Bool)

(assert (=> b!285439 (=> (not res!236250) (not e!203786))))

(assert (=> b!285439 (= res!236250 (arrayRangesEq!1376 a2!647 a3!68 i!964 to!740))))

(declare-fun mapNonEmpty!1454 () Bool)

(declare-fun tp!1454 () Bool)

(declare-fun tp_is_empty!487 () Bool)

(assert (=> mapNonEmpty!1454 (= mapRes!1456 (and tp!1454 tp_is_empty!487))))

(declare-fun mapKey!1455 () (_ BitVec 32))

(declare-fun mapValue!1455 () T!51593)

(declare-fun mapRest!1456 () (Array (_ BitVec 32) T!51593))

(assert (=> mapNonEmpty!1454 (= (arr!8230 a2!647) (store mapRest!1456 mapKey!1455 mapValue!1455))))

(declare-fun b!285440 () Bool)

(declare-fun res!236242 () Bool)

(assert (=> b!285440 (=> (not res!236242) (not e!203786))))

(assert (=> b!285440 (= res!236242 (arrayRangesEq!1376 a1!647 a2!647 from!773 mid!71))))

(declare-fun mapNonEmpty!1455 () Bool)

(declare-fun mapRes!1455 () Bool)

(declare-fun tp!1455 () Bool)

(assert (=> mapNonEmpty!1455 (= mapRes!1455 (and tp!1455 tp_is_empty!487))))

(declare-fun mapKey!1454 () (_ BitVec 32))

(declare-fun mapValue!1454 () T!51593)

(declare-fun mapRest!1454 () (Array (_ BitVec 32) T!51593))

(assert (=> mapNonEmpty!1455 (= (arr!8230 a3!68) (store mapRest!1454 mapKey!1454 mapValue!1454))))

(declare-fun b!285441 () Bool)

(declare-fun res!236246 () Bool)

(assert (=> b!285441 (=> (not res!236246) (not e!203786))))

(assert (=> b!285441 (= res!236246 (not (= i!964 mid!71)))))

(declare-fun mapIsEmpty!1456 () Bool)

(assert (=> mapIsEmpty!1456 mapRes!1455))

(declare-fun b!285442 () Bool)

(assert (=> b!285442 (= e!203784 (and tp_is_empty!487 mapRes!1456))))

(declare-fun condMapEmpty!1456 () Bool)

(declare-fun mapDefault!1456 () T!51593)

