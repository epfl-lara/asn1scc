; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68530 () Bool)

(assert start!68530)

(declare-fun toSlice!46 () (_ BitVec 32))

(declare-fun e!221831 () Bool)

(declare-fun b!307965 () Bool)

(declare-fun i!932 () (_ BitVec 32))

(declare-datatypes ((T!57717 0))(
  ( (T!57718 (val!405 Int)) )
))
(declare-datatypes ((array!18675 0))(
  ( (array!18676 (arr!9175 (Array (_ BitVec 32) T!57717)) (size!8092 (_ BitVec 32))) )
))
(declare-fun a1!524 () array!18675)

(assert (=> b!307965 (= e!221831 (and (bvsle i!932 toSlice!46) (bvsle #b00000000000000000000000000000000 i!932) (bvsgt toSlice!46 (size!8092 a1!524))))))

(declare-fun mapIsEmpty!2597 () Bool)

(declare-fun mapRes!2597 () Bool)

(assert (=> mapIsEmpty!2597 mapRes!2597))

(declare-fun res!252660 () Bool)

(assert (=> start!68530 (=> (not res!252660) (not e!221831))))

(declare-fun fromSlice!46 () (_ BitVec 32))

(declare-fun a2!524 () array!18675)

(declare-fun from!650 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(assert (=> start!68530 (= res!252660 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8092 a1!524) (size!8092 a2!524)) (bvsle to!617 (size!8092 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68530 e!221831))

(assert (=> start!68530 true))

(declare-fun e!221832 () Bool)

(declare-fun array_inv!7693 (array!18675) Bool)

(assert (=> start!68530 (and (array_inv!7693 a2!524) e!221832)))

(declare-fun e!221830 () Bool)

(assert (=> start!68530 (and (array_inv!7693 a1!524) e!221830)))

(declare-fun mapNonEmpty!2597 () Bool)

(declare-fun mapRes!2598 () Bool)

(declare-fun tp!2597 () Bool)

(declare-fun tp_is_empty!811 () Bool)

(assert (=> mapNonEmpty!2597 (= mapRes!2598 (and tp!2597 tp_is_empty!811))))

(declare-fun mapValue!2597 () T!57717)

(declare-fun mapKey!2598 () (_ BitVec 32))

(declare-fun mapRest!2597 () (Array (_ BitVec 32) T!57717))

(assert (=> mapNonEmpty!2597 (= (arr!9175 a2!524) (store mapRest!2597 mapKey!2598 mapValue!2597))))

(declare-fun b!307966 () Bool)

(declare-fun res!252662 () Bool)

(assert (=> b!307966 (=> (not res!252662) (not e!221831))))

(assert (=> b!307966 (= res!252662 (and (bvsle fromSlice!46 i!932) (bvsle i!932 to!617)))))

(declare-fun mapIsEmpty!2598 () Bool)

(assert (=> mapIsEmpty!2598 mapRes!2598))

(declare-fun mapNonEmpty!2598 () Bool)

(declare-fun tp!2598 () Bool)

(assert (=> mapNonEmpty!2598 (= mapRes!2597 (and tp!2598 tp_is_empty!811))))

(declare-fun mapRest!2598 () (Array (_ BitVec 32) T!57717))

(declare-fun mapKey!2597 () (_ BitVec 32))

(declare-fun mapValue!2598 () T!57717)

(assert (=> mapNonEmpty!2598 (= (arr!9175 a1!524) (store mapRest!2598 mapKey!2597 mapValue!2598))))

(declare-fun b!307967 () Bool)

(declare-fun res!252659 () Bool)

(assert (=> b!307967 (=> (not res!252659) (not e!221831))))

(declare-fun arrayRangesEq!1713 (array!18675 array!18675 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!307967 (= res!252659 (arrayRangesEq!1713 a1!524 a2!524 from!650 to!617))))

(declare-fun b!307968 () Bool)

(assert (=> b!307968 (= e!221832 (and tp_is_empty!811 mapRes!2598))))

(declare-fun condMapEmpty!2598 () Bool)

(declare-fun mapDefault!2598 () T!57717)

