; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68472 () Bool)

(assert start!68472)

(declare-fun res!252296 () Bool)

(declare-fun e!221548 () Bool)

(assert (=> start!68472 (=> (not res!252296) (not e!221548))))

(declare-fun from!632 () (_ BitVec 32))

(declare-fun fromSlice!41 () (_ BitVec 32))

(declare-fun toSlice!41 () (_ BitVec 32))

(declare-datatypes ((T!57483 0))(
  ( (T!57484 (val!378 Int)) )
))
(declare-datatypes ((array!18620 0))(
  ( (array!18621 (arr!9148 (Array (_ BitVec 32) T!57483)) (size!8065 (_ BitVec 32))) )
))
(declare-fun a1!506 () array!18620)

(declare-fun a2!506 () array!18620)

(declare-fun to!599 () (_ BitVec 32))

(assert (=> start!68472 (= res!252296 (and (bvsle #b00000000000000000000000000000000 from!632) (bvsle from!632 to!599) (bvsle (size!8065 a1!506) (size!8065 a2!506)) (bvsle to!599 (size!8065 a1!506)) (bvsle from!632 fromSlice!41) (bvsle fromSlice!41 toSlice!41) (bvsle toSlice!41 to!599)))))

(assert (=> start!68472 e!221548))

(assert (=> start!68472 true))

(declare-fun e!221545 () Bool)

(declare-fun array_inv!7677 (array!18620) Bool)

(assert (=> start!68472 (and (array_inv!7677 a1!506) e!221545)))

(declare-fun e!221546 () Bool)

(assert (=> start!68472 (and (array_inv!7677 a2!506) e!221546)))

(declare-fun b!307437 () Bool)

(declare-fun res!252298 () Bool)

(assert (=> b!307437 (=> (not res!252298) (not e!221548))))

(declare-fun arrayRangesEq!1694 (array!18620 array!18620 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!307437 (= res!252298 (arrayRangesEq!1694 a1!506 a2!506 from!632 to!599))))

(declare-fun b!307438 () Bool)

(declare-fun tp_is_empty!757 () Bool)

(declare-fun mapRes!2431 () Bool)

(assert (=> b!307438 (= e!221546 (and tp_is_empty!757 mapRes!2431))))

(declare-fun condMapEmpty!2431 () Bool)

(declare-fun mapDefault!2431 () T!57483)

