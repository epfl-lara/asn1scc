; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68588 () Bool)

(assert start!68588)

(declare-fun mapNonEmpty!2771 () Bool)

(declare-fun mapRes!2772 () Bool)

(declare-fun tp!2771 () Bool)

(declare-fun tp_is_empty!869 () Bool)

(assert (=> mapNonEmpty!2771 (= mapRes!2772 (and tp!2771 tp_is_empty!869))))

(declare-datatypes ((T!57955 0))(
  ( (T!57956 (val!434 Int)) )
))
(declare-fun mapValue!2772 () T!57955)

(declare-fun mapRest!2772 () (Array (_ BitVec 32) T!57955))

(declare-fun mapKey!2772 () (_ BitVec 32))

(declare-datatypes ((array!18733 0))(
  ( (array!18734 (arr!9204 (Array (_ BitVec 32) T!57955)) (size!8121 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18733)

(assert (=> mapNonEmpty!2771 (= (arr!9204 a2!524) (store mapRest!2772 mapKey!2772 mapValue!2772))))

(declare-fun mapNonEmpty!2772 () Bool)

(declare-fun mapRes!2771 () Bool)

(declare-fun tp!2772 () Bool)

(assert (=> mapNonEmpty!2772 (= mapRes!2771 (and tp!2772 tp_is_empty!869))))

(declare-fun mapKey!2771 () (_ BitVec 32))

(declare-fun mapRest!2771 () (Array (_ BitVec 32) T!57955))

(declare-fun mapValue!2771 () T!57955)

(declare-fun a1!524 () array!18733)

(assert (=> mapNonEmpty!2772 (= (arr!9204 a1!524) (store mapRest!2771 mapKey!2771 mapValue!2771))))

(declare-fun b!308809 () Bool)

(declare-fun res!253330 () Bool)

(declare-fun e!222226 () Bool)

(assert (=> b!308809 (=> (not res!253330) (not e!222226))))

(declare-fun from!650 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(declare-fun arrayRangesEq!1736 (array!18733 array!18733 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!308809 (= res!253330 (arrayRangesEq!1736 a1!524 a2!524 from!650 to!617))))

(declare-fun b!308811 () Bool)

(declare-fun e!222228 () Bool)

(assert (=> b!308811 (= e!222228 (and tp_is_empty!869 mapRes!2771))))

(declare-fun condMapEmpty!2772 () Bool)

(declare-fun mapDefault!2772 () T!57955)

