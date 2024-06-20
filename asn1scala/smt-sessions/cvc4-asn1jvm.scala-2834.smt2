; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68522 () Bool)

(assert start!68522)

(declare-fun res!252614 () Bool)

(declare-fun e!221796 () Bool)

(assert (=> start!68522 (=> (not res!252614) (not e!221796))))

(declare-fun fromSlice!46 () (_ BitVec 32))

(declare-fun toSlice!46 () (_ BitVec 32))

(declare-datatypes ((T!57669 0))(
  ( (T!57670 (val!401 Int)) )
))
(declare-datatypes ((array!18667 0))(
  ( (array!18668 (arr!9171 (Array (_ BitVec 32) T!57669)) (size!8088 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18667)

(declare-fun to!617 () (_ BitVec 32))

(declare-fun a1!524 () array!18667)

(declare-fun from!650 () (_ BitVec 32))

(assert (=> start!68522 (= res!252614 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8088 a1!524) (size!8088 a2!524)) (bvsle to!617 (size!8088 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68522 e!221796))

(assert (=> start!68522 true))

(declare-fun e!221795 () Bool)

(declare-fun array_inv!7691 (array!18667) Bool)

(assert (=> start!68522 (and (array_inv!7691 a2!524) e!221795)))

(declare-fun e!221794 () Bool)

(assert (=> start!68522 (and (array_inv!7691 a1!524) e!221794)))

(declare-fun i!932 () (_ BitVec 32))

(declare-fun b!307895 () Bool)

(assert (=> b!307895 (= e!221796 (and (bvsle fromSlice!46 i!932) (bvsle i!932 to!617) (bvsgt #b00000000000000000000000000000000 i!932)))))

(declare-fun mapNonEmpty!2573 () Bool)

(declare-fun mapRes!2574 () Bool)

(declare-fun tp!2574 () Bool)

(declare-fun tp_is_empty!803 () Bool)

(assert (=> mapNonEmpty!2573 (= mapRes!2574 (and tp!2574 tp_is_empty!803))))

(declare-fun mapRest!2574 () (Array (_ BitVec 32) T!57669))

(declare-fun mapKey!2574 () (_ BitVec 32))

(declare-fun mapValue!2573 () T!57669)

(assert (=> mapNonEmpty!2573 (= (arr!9171 a1!524) (store mapRest!2574 mapKey!2574 mapValue!2573))))

(declare-fun mapIsEmpty!2573 () Bool)

(assert (=> mapIsEmpty!2573 mapRes!2574))

(declare-fun b!307896 () Bool)

(assert (=> b!307896 (= e!221794 (and tp_is_empty!803 mapRes!2574))))

(declare-fun condMapEmpty!2574 () Bool)

(declare-fun mapDefault!2573 () T!57669)

