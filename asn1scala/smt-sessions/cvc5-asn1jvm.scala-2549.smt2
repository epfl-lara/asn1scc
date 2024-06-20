; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64064 () Bool)

(assert start!64064)

(declare-fun mapNonEmpty!1535 () Bool)

(declare-fun mapRes!1537 () Bool)

(declare-fun tp!1536 () Bool)

(declare-fun tp_is_empty!505 () Bool)

(assert (=> mapNonEmpty!1535 (= mapRes!1537 (and tp!1536 tp_is_empty!505))))

(declare-datatypes ((T!51671 0))(
  ( (T!51672 (val!252 Int)) )
))
(declare-fun mapRest!1537 () (Array (_ BitVec 32) T!51671))

(declare-fun mapKey!1536 () (_ BitVec 32))

(declare-fun mapValue!1536 () T!51671)

(declare-datatypes ((array!16783 0))(
  ( (array!16784 (arr!8239 (Array (_ BitVec 32) T!51671)) (size!7243 (_ BitVec 32))) )
))
(declare-fun a3!68 () array!16783)

(assert (=> mapNonEmpty!1535 (= (arr!8239 a3!68) (store mapRest!1537 mapKey!1536 mapValue!1536))))

(declare-fun b!285804 () Bool)

(declare-fun res!236533 () Bool)

(declare-fun e!203918 () Bool)

(assert (=> b!285804 (=> (not res!236533) (not e!203918))))

(declare-fun i!964 () (_ BitVec 32))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun a1!647 () array!16783)

(declare-fun arrayRangesEq!1385 (array!16783 array!16783 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!285804 (= res!236533 (arrayRangesEq!1385 a1!647 a3!68 from!773 i!964))))

(declare-fun b!285805 () Bool)

(declare-fun e!203920 () Bool)

(declare-fun mapRes!1536 () Bool)

(assert (=> b!285805 (= e!203920 (and tp_is_empty!505 mapRes!1536))))

(declare-fun condMapEmpty!1535 () Bool)

(declare-fun mapDefault!1536 () T!51671)

