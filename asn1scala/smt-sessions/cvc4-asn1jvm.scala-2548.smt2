; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64062 () Bool)

(assert start!64062)

(declare-fun mapNonEmpty!1526 () Bool)

(declare-fun mapRes!1526 () Bool)

(declare-fun tp!1528 () Bool)

(declare-fun tp_is_empty!503 () Bool)

(assert (=> mapNonEmpty!1526 (= mapRes!1526 (and tp!1528 tp_is_empty!503))))

(declare-datatypes ((T!51649 0))(
  ( (T!51650 (val!251 Int)) )
))
(declare-datatypes ((array!16781 0))(
  ( (array!16782 (arr!8238 (Array (_ BitVec 32) T!51649)) (size!7242 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16781)

(declare-fun mapKey!1527 () (_ BitVec 32))

(declare-fun mapValue!1527 () T!51649)

(declare-fun mapRest!1527 () (Array (_ BitVec 32) T!51649))

(assert (=> mapNonEmpty!1526 (= (arr!8238 a2!647) (store mapRest!1527 mapKey!1527 mapValue!1527))))

(declare-fun b!285771 () Bool)

(declare-fun res!236513 () Bool)

(declare-fun e!203906 () Bool)

(assert (=> b!285771 (=> (not res!236513) (not e!203906))))

(declare-fun i!964 () (_ BitVec 32))

(declare-fun mid!71 () (_ BitVec 32))

(assert (=> b!285771 (= res!236513 (not (= i!964 mid!71)))))

(declare-fun b!285772 () Bool)

(declare-fun e!203904 () Bool)

(assert (=> b!285772 (= e!203904 true)))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun a1!647 () array!16781)

(declare-fun a3!68 () array!16781)

(declare-fun arrayRangesEq!1384 (array!16781 array!16781 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!285772 (arrayRangesEq!1384 a1!647 a3!68 from!773 mid!71)))

(declare-datatypes ((Unit!19939 0))(
  ( (Unit!19940) )
))
(declare-fun lt!418631 () Unit!19939)

(declare-fun to!740 () (_ BitVec 32))

(declare-fun rec!67 (array!16781 array!16781 array!16781 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19939)

(assert (=> b!285772 (= lt!418631 (rec!67 a1!647 a2!647 a3!68 from!773 mid!71 to!740 (bvadd #b00000000000000000000000000000001 i!964)))))

(declare-fun mapIsEmpty!1526 () Bool)

(declare-fun mapRes!1527 () Bool)

(assert (=> mapIsEmpty!1526 mapRes!1527))

(declare-fun b!285773 () Bool)

(declare-fun res!236508 () Bool)

(assert (=> b!285773 (=> (not res!236508) (not e!203906))))

(assert (=> b!285773 (= res!236508 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun b!285774 () Bool)

(declare-fun res!236514 () Bool)

(assert (=> b!285774 (=> res!236514 e!203904)))

(assert (=> b!285774 (= res!236514 (not (arrayRangesEq!1384 a1!647 a2!647 (bvadd #b00000000000000000000000000000001 i!964) mid!71)))))

(declare-fun b!285775 () Bool)

(declare-fun res!236510 () Bool)

(assert (=> b!285775 (=> res!236510 e!203904)))

(assert (=> b!285775 (= res!236510 (not (arrayRangesEq!1384 a2!647 a3!68 (bvadd #b00000000000000000000000000000001 i!964) to!740)))))

(declare-fun b!285776 () Bool)

(declare-fun e!203905 () Bool)

(declare-fun mapRes!1528 () Bool)

(assert (=> b!285776 (= e!203905 (and tp_is_empty!503 mapRes!1528))))

(declare-fun condMapEmpty!1527 () Bool)

(declare-fun mapDefault!1528 () T!51649)

