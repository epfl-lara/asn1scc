; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68484 () Bool)

(assert start!68484)

(declare-fun res!252405 () Bool)

(declare-fun e!221619 () Bool)

(assert (=> start!68484 (=> (not res!252405) (not e!221619))))

(declare-fun from!632 () (_ BitVec 32))

(declare-fun fromSlice!41 () (_ BitVec 32))

(declare-fun toSlice!41 () (_ BitVec 32))

(declare-datatypes ((T!57535 0))(
  ( (T!57536 (val!384 Int)) )
))
(declare-datatypes ((array!18632 0))(
  ( (array!18633 (arr!9154 (Array (_ BitVec 32) T!57535)) (size!8071 (_ BitVec 32))) )
))
(declare-fun a1!506 () array!18632)

(declare-fun to!599 () (_ BitVec 32))

(declare-fun a2!506 () array!18632)

(assert (=> start!68484 (= res!252405 (and (bvsle #b00000000000000000000000000000000 from!632) (bvsle from!632 to!599) (bvsle (size!8071 a1!506) (size!8071 a2!506)) (bvsle to!599 (size!8071 a1!506)) (bvsle from!632 fromSlice!41) (bvsle fromSlice!41 toSlice!41) (bvsle toSlice!41 to!599)))))

(assert (=> start!68484 e!221619))

(assert (=> start!68484 true))

(declare-fun e!221618 () Bool)

(declare-fun array_inv!7680 (array!18632) Bool)

(assert (=> start!68484 (and (array_inv!7680 a1!506) e!221618)))

(declare-fun e!221617 () Bool)

(assert (=> start!68484 (and (array_inv!7680 a2!506) e!221617)))

(declare-fun b!307581 () Bool)

(declare-fun res!252404 () Bool)

(assert (=> b!307581 (=> (not res!252404) (not e!221619))))

(declare-fun e!221620 () Bool)

(assert (=> b!307581 (= res!252404 e!221620)))

(declare-fun res!252408 () Bool)

(assert (=> b!307581 (=> res!252408 e!221620)))

(assert (=> b!307581 (= res!252408 (bvsgt to!599 toSlice!41))))

(declare-fun mapNonEmpty!2467 () Bool)

(declare-fun mapRes!2468 () Bool)

(declare-fun tp!2467 () Bool)

(declare-fun tp_is_empty!769 () Bool)

(assert (=> mapNonEmpty!2467 (= mapRes!2468 (and tp!2467 tp_is_empty!769))))

(declare-fun mapValue!2467 () T!57535)

(declare-fun mapKey!2468 () (_ BitVec 32))

(declare-fun mapRest!2468 () (Array (_ BitVec 32) T!57535))

(assert (=> mapNonEmpty!2467 (= (arr!9154 a1!506) (store mapRest!2468 mapKey!2468 mapValue!2467))))

(declare-fun mapIsEmpty!2467 () Bool)

(assert (=> mapIsEmpty!2467 mapRes!2468))

(declare-fun mapIsEmpty!2468 () Bool)

(declare-fun mapRes!2467 () Bool)

(assert (=> mapIsEmpty!2468 mapRes!2467))

(declare-fun b!307582 () Bool)

(assert (=> b!307582 (= e!221618 (and tp_is_empty!769 mapRes!2468))))

(declare-fun condMapEmpty!2468 () Bool)

(declare-fun mapDefault!2468 () T!57535)

