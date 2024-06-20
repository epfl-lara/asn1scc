; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64080 () Bool)

(assert start!64080)

(declare-fun res!236712 () Bool)

(declare-fun e!204013 () Bool)

(assert (=> start!64080 (=> (not res!236712) (not e!204013))))

(declare-datatypes ((T!51727 0))(
  ( (T!51728 (val!260 Int)) )
))
(declare-datatypes ((array!16799 0))(
  ( (array!16800 (arr!8247 (Array (_ BitVec 32) T!51727)) (size!7251 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16799)

(declare-fun mid!71 () (_ BitVec 32))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun a1!647 () array!16799)

(declare-fun a3!68 () array!16799)

(declare-fun to!740 () (_ BitVec 32))

(assert (=> start!64080 (= res!236712 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7251 a1!647) (size!7251 a2!647)) (bvsle (size!7251 a2!647) (size!7251 a3!68)) (bvsle mid!71 (size!7251 a1!647)) (bvsle to!740 (size!7251 a2!647))))))

(assert (=> start!64080 e!204013))

(declare-fun e!204014 () Bool)

(declare-fun array_inv!6912 (array!16799) Bool)

(assert (=> start!64080 (and (array_inv!6912 a2!647) e!204014)))

(assert (=> start!64080 true))

(declare-fun e!204015 () Bool)

(assert (=> start!64080 (and (array_inv!6912 a1!647) e!204015)))

(declare-fun e!204016 () Bool)

(assert (=> start!64080 (and (array_inv!6912 a3!68) e!204016)))

(declare-fun mapNonEmpty!1607 () Bool)

(declare-fun mapRes!1609 () Bool)

(declare-fun tp!1607 () Bool)

(declare-fun tp_is_empty!521 () Bool)

(assert (=> mapNonEmpty!1607 (= mapRes!1609 (and tp!1607 tp_is_empty!521))))

(declare-fun mapRest!1609 () (Array (_ BitVec 32) T!51727))

(declare-fun mapValue!1609 () T!51727)

(declare-fun mapKey!1607 () (_ BitVec 32))

(assert (=> mapNonEmpty!1607 (= (arr!8247 a3!68) (store mapRest!1609 mapKey!1607 mapValue!1609))))

(declare-fun b!286052 () Bool)

(declare-fun mapRes!1607 () Bool)

(assert (=> b!286052 (= e!204015 (and tp_is_empty!521 mapRes!1607))))

(declare-fun condMapEmpty!1608 () Bool)

(declare-fun mapDefault!1609 () T!51727)

