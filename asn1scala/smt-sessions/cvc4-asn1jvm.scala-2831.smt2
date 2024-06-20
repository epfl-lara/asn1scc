; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68500 () Bool)

(assert start!68500)

(declare-fun mapNonEmpty!2515 () Bool)

(declare-fun mapRes!2515 () Bool)

(declare-fun tp!2515 () Bool)

(declare-fun tp_is_empty!785 () Bool)

(assert (=> mapNonEmpty!2515 (= mapRes!2515 (and tp!2515 tp_is_empty!785))))

(declare-fun mapKey!2516 () (_ BitVec 32))

(declare-datatypes ((T!57591 0))(
  ( (T!57592 (val!392 Int)) )
))
(declare-fun mapRest!2515 () (Array (_ BitVec 32) T!57591))

(declare-datatypes ((array!18648 0))(
  ( (array!18649 (arr!9162 (Array (_ BitVec 32) T!57591)) (size!8079 (_ BitVec 32))) )
))
(declare-fun a1!506 () array!18648)

(declare-fun mapValue!2515 () T!57591)

(assert (=> mapNonEmpty!2515 (= (arr!9162 a1!506) (store mapRest!2515 mapKey!2516 mapValue!2515))))

(declare-fun mapIsEmpty!2515 () Bool)

(assert (=> mapIsEmpty!2515 mapRes!2515))

(declare-fun res!252488 () Bool)

(declare-fun e!221697 () Bool)

(assert (=> start!68500 (=> (not res!252488) (not e!221697))))

(declare-fun from!632 () (_ BitVec 32))

(declare-fun fromSlice!41 () (_ BitVec 32))

(declare-fun toSlice!41 () (_ BitVec 32))

(declare-fun to!599 () (_ BitVec 32))

(declare-fun a2!506 () array!18648)

(assert (=> start!68500 (= res!252488 (and (bvsle #b00000000000000000000000000000000 from!632) (bvsle from!632 to!599) (bvsle (size!8079 a1!506) (size!8079 a2!506)) (bvsle to!599 (size!8079 a1!506)) (bvsle from!632 fromSlice!41) (bvsle fromSlice!41 toSlice!41) (bvsle toSlice!41 to!599)))))

(assert (=> start!68500 e!221697))

(assert (=> start!68500 true))

(declare-fun e!221698 () Bool)

(declare-fun array_inv!7685 (array!18648) Bool)

(assert (=> start!68500 (and (array_inv!7685 a1!506) e!221698)))

(declare-fun e!221696 () Bool)

(assert (=> start!68500 (and (array_inv!7685 a2!506) e!221696)))

(declare-fun mapNonEmpty!2516 () Bool)

(declare-fun mapRes!2516 () Bool)

(declare-fun tp!2516 () Bool)

(assert (=> mapNonEmpty!2516 (= mapRes!2516 (and tp!2516 tp_is_empty!785))))

(declare-fun mapValue!2516 () T!57591)

(declare-fun mapKey!2515 () (_ BitVec 32))

(declare-fun mapRest!2516 () (Array (_ BitVec 32) T!57591))

(assert (=> mapNonEmpty!2516 (= (arr!9162 a2!506) (store mapRest!2516 mapKey!2515 mapValue!2516))))

(declare-fun b!307713 () Bool)

(assert (=> b!307713 (= e!221698 (and tp_is_empty!785 mapRes!2515))))

(declare-fun condMapEmpty!2516 () Bool)

(declare-fun mapDefault!2516 () T!57591)

