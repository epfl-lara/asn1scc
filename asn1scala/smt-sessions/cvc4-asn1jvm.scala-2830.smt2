; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68494 () Bool)

(assert start!68494)

(declare-fun mapIsEmpty!2497 () Bool)

(declare-fun mapRes!2498 () Bool)

(assert (=> mapIsEmpty!2497 mapRes!2498))

(declare-fun mapNonEmpty!2497 () Bool)

(declare-fun mapRes!2497 () Bool)

(declare-fun tp!2498 () Bool)

(declare-fun tp_is_empty!779 () Bool)

(assert (=> mapNonEmpty!2497 (= mapRes!2497 (and tp!2498 tp_is_empty!779))))

(declare-datatypes ((T!57565 0))(
  ( (T!57566 (val!389 Int)) )
))
(declare-fun mapRest!2497 () (Array (_ BitVec 32) T!57565))

(declare-fun mapKey!2497 () (_ BitVec 32))

(declare-fun mapValue!2498 () T!57565)

(declare-datatypes ((array!18642 0))(
  ( (array!18643 (arr!9159 (Array (_ BitVec 32) T!57565)) (size!8076 (_ BitVec 32))) )
))
(declare-fun a2!506 () array!18642)

(assert (=> mapNonEmpty!2497 (= (arr!9159 a2!506) (store mapRest!2497 mapKey!2497 mapValue!2498))))

(declare-fun res!252461 () Bool)

(declare-fun e!221671 () Bool)

(assert (=> start!68494 (=> (not res!252461) (not e!221671))))

(declare-fun from!632 () (_ BitVec 32))

(declare-fun fromSlice!41 () (_ BitVec 32))

(declare-fun toSlice!41 () (_ BitVec 32))

(declare-fun a1!506 () array!18642)

(declare-fun to!599 () (_ BitVec 32))

(assert (=> start!68494 (= res!252461 (and (bvsle #b00000000000000000000000000000000 from!632) (bvsle from!632 to!599) (bvsle (size!8076 a1!506) (size!8076 a2!506)) (bvsle to!599 (size!8076 a1!506)) (bvsle from!632 fromSlice!41) (bvsle fromSlice!41 toSlice!41) (bvsle toSlice!41 to!599)))))

(assert (=> start!68494 e!221671))

(assert (=> start!68494 true))

(declare-fun e!221670 () Bool)

(declare-fun array_inv!7683 (array!18642) Bool)

(assert (=> start!68494 (and (array_inv!7683 a1!506) e!221670)))

(declare-fun e!221669 () Bool)

(assert (=> start!68494 (and (array_inv!7683 a2!506) e!221669)))

(declare-fun b!307669 () Bool)

(declare-fun res!252462 () Bool)

(assert (=> b!307669 (=> (not res!252462) (not e!221671))))

(declare-fun arrayRangesEq!1701 (array!18642 array!18642 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!307669 (= res!252462 (arrayRangesEq!1701 a1!506 a2!506 from!632 to!599))))

(declare-fun b!307670 () Bool)

(assert (=> b!307670 (= e!221669 (and tp_is_empty!779 mapRes!2497))))

(declare-fun condMapEmpty!2498 () Bool)

(declare-fun mapDefault!2497 () T!57565)

