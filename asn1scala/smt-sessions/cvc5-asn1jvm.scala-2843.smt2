; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68572 () Bool)

(assert start!68572)

(declare-fun mapIsEmpty!2723 () Bool)

(declare-fun mapRes!2724 () Bool)

(assert (=> mapIsEmpty!2723 mapRes!2724))

(declare-fun mapNonEmpty!2723 () Bool)

(declare-fun mapRes!2723 () Bool)

(declare-fun tp!2724 () Bool)

(declare-fun tp_is_empty!853 () Bool)

(assert (=> mapNonEmpty!2723 (= mapRes!2723 (and tp!2724 tp_is_empty!853))))

(declare-fun mapKey!2724 () (_ BitVec 32))

(declare-datatypes ((T!57899 0))(
  ( (T!57900 (val!426 Int)) )
))
(declare-fun mapRest!2724 () (Array (_ BitVec 32) T!57899))

(declare-datatypes ((array!18717 0))(
  ( (array!18718 (arr!9196 (Array (_ BitVec 32) T!57899)) (size!8113 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18717)

(declare-fun mapValue!2723 () T!57899)

(assert (=> mapNonEmpty!2723 (= (arr!9196 a2!524) (store mapRest!2724 mapKey!2724 mapValue!2723))))

(declare-fun mapIsEmpty!2724 () Bool)

(assert (=> mapIsEmpty!2724 mapRes!2723))

(declare-fun b!308537 () Bool)

(declare-fun res!253106 () Bool)

(declare-fun e!222098 () Bool)

(assert (=> b!308537 (=> (not res!253106) (not e!222098))))

(declare-fun e!222100 () Bool)

(assert (=> b!308537 (= res!253106 e!222100)))

(declare-fun res!253113 () Bool)

(assert (=> b!308537 (=> res!253113 e!222100)))

(declare-fun i!932 () (_ BitVec 32))

(declare-fun toSlice!46 () (_ BitVec 32))

(assert (=> b!308537 (= res!253113 (bvsgt i!932 toSlice!46))))

(declare-fun res!253108 () Bool)

(assert (=> start!68572 (=> (not res!253108) (not e!222098))))

(declare-fun fromSlice!46 () (_ BitVec 32))

(declare-fun from!650 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(declare-fun a1!524 () array!18717)

(assert (=> start!68572 (= res!253108 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8113 a1!524) (size!8113 a2!524)) (bvsle to!617 (size!8113 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68572 e!222098))

(assert (=> start!68572 true))

(declare-fun e!222097 () Bool)

(declare-fun array_inv!7704 (array!18717) Bool)

(assert (=> start!68572 (and (array_inv!7704 a2!524) e!222097)))

(declare-fun e!222101 () Bool)

(assert (=> start!68572 (and (array_inv!7704 a1!524) e!222101)))

(declare-fun b!308538 () Bool)

(declare-fun e!222102 () Bool)

(assert (=> b!308538 (= e!222102 true)))

(declare-fun arrayRangesEq!1729 (array!18717 array!18717 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!308538 (arrayRangesEq!1729 a1!524 a2!524 fromSlice!46 toSlice!46)))

(declare-datatypes ((Unit!21465 0))(
  ( (Unit!21466) )
))
(declare-fun lt!440319 () Unit!21465)

(declare-fun rec!97 (array!18717 array!18717 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21465)

(assert (=> b!308538 (= lt!440319 (rec!97 a1!524 a2!524 from!650 fromSlice!46 to!617 toSlice!46 (bvsub i!932 #b00000000000000000000000000000001)))))

(declare-fun mapNonEmpty!2724 () Bool)

(declare-fun tp!2723 () Bool)

(assert (=> mapNonEmpty!2724 (= mapRes!2724 (and tp!2723 tp_is_empty!853))))

(declare-fun mapKey!2723 () (_ BitVec 32))

(declare-fun mapValue!2724 () T!57899)

(declare-fun mapRest!2723 () (Array (_ BitVec 32) T!57899))

(assert (=> mapNonEmpty!2724 (= (arr!9196 a1!524) (store mapRest!2723 mapKey!2723 mapValue!2724))))

(declare-fun b!308539 () Bool)

(declare-fun e!222099 () Bool)

(assert (=> b!308539 (= e!222099 (not (arrayRangesEq!1729 a1!524 a2!524 (bvsub i!932 #b00000000000000000000000000000001) toSlice!46)))))

(declare-fun b!308540 () Bool)

(assert (=> b!308540 (= e!222101 (and tp_is_empty!853 mapRes!2724))))

(declare-fun condMapEmpty!2724 () Bool)

(declare-fun mapDefault!2724 () T!57899)

