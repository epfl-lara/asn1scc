; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68476 () Bool)

(assert start!68476)

(declare-fun b!307485 () Bool)

(declare-fun res!252334 () Bool)

(declare-fun e!221572 () Bool)

(assert (=> b!307485 (=> (not res!252334) (not e!221572))))

(declare-datatypes ((T!57487 0))(
  ( (T!57488 (val!380 Int)) )
))
(declare-datatypes ((array!18624 0))(
  ( (array!18625 (arr!9150 (Array (_ BitVec 32) T!57487)) (size!8067 (_ BitVec 32))) )
))
(declare-fun a1!506 () array!18624)

(declare-fun to!599 () (_ BitVec 32))

(declare-fun a2!506 () array!18624)

(declare-fun arrayRangesEq!1696 (array!18624 array!18624 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!307485 (= res!252334 (arrayRangesEq!1696 a1!506 a2!506 to!599 to!599))))

(declare-fun mapNonEmpty!2443 () Bool)

(declare-fun mapRes!2444 () Bool)

(declare-fun tp!2444 () Bool)

(declare-fun tp_is_empty!761 () Bool)

(assert (=> mapNonEmpty!2443 (= mapRes!2444 (and tp!2444 tp_is_empty!761))))

(declare-fun mapValue!2443 () T!57487)

(declare-fun mapRest!2443 () (Array (_ BitVec 32) T!57487))

(declare-fun mapKey!2444 () (_ BitVec 32))

(assert (=> mapNonEmpty!2443 (= (arr!9150 a1!506) (store mapRest!2443 mapKey!2444 mapValue!2443))))

(declare-fun b!307486 () Bool)

(declare-fun res!252331 () Bool)

(assert (=> b!307486 (=> (not res!252331) (not e!221572))))

(declare-fun e!221570 () Bool)

(assert (=> b!307486 (= res!252331 e!221570)))

(declare-fun res!252335 () Bool)

(assert (=> b!307486 (=> res!252335 e!221570)))

(declare-fun toSlice!41 () (_ BitVec 32))

(assert (=> b!307486 (= res!252335 (bvsgt to!599 toSlice!41))))

(declare-fun mapIsEmpty!2443 () Bool)

(assert (=> mapIsEmpty!2443 mapRes!2444))

(declare-fun mapNonEmpty!2444 () Bool)

(declare-fun mapRes!2443 () Bool)

(declare-fun tp!2443 () Bool)

(assert (=> mapNonEmpty!2444 (= mapRes!2443 (and tp!2443 tp_is_empty!761))))

(declare-fun mapKey!2443 () (_ BitVec 32))

(declare-fun mapRest!2444 () (Array (_ BitVec 32) T!57487))

(declare-fun mapValue!2444 () T!57487)

(assert (=> mapNonEmpty!2444 (= (arr!9150 a2!506) (store mapRest!2444 mapKey!2443 mapValue!2444))))

(declare-fun b!307487 () Bool)

(declare-fun res!252336 () Bool)

(assert (=> b!307487 (=> (not res!252336) (not e!221572))))

(declare-fun fromSlice!41 () (_ BitVec 32))

(assert (=> b!307487 (= res!252336 (bvsle fromSlice!41 to!599))))

(declare-fun b!307488 () Bool)

(declare-fun e!221571 () Bool)

(assert (=> b!307488 (= e!221571 (and tp_is_empty!761 mapRes!2443))))

(declare-fun condMapEmpty!2444 () Bool)

(declare-fun mapDefault!2444 () T!57487)

