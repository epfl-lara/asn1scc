; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68506 () Bool)

(assert start!68506)

(declare-fun mapIsEmpty!2525 () Bool)

(declare-fun mapRes!2526 () Bool)

(assert (=> mapIsEmpty!2525 mapRes!2526))

(declare-fun res!252512 () Bool)

(declare-fun e!221715 () Bool)

(assert (=> start!68506 (=> (not res!252512) (not e!221715))))

(declare-fun from!632 () (_ BitVec 32))

(declare-fun fromSlice!41 () (_ BitVec 32))

(declare-fun toSlice!41 () (_ BitVec 32))

(declare-datatypes ((T!57613 0))(
  ( (T!57614 (val!393 Int)) )
))
(declare-datatypes ((array!18651 0))(
  ( (array!18652 (arr!9163 (Array (_ BitVec 32) T!57613)) (size!8080 (_ BitVec 32))) )
))
(declare-fun a1!506 () array!18651)

(declare-fun to!599 () (_ BitVec 32))

(declare-fun a2!506 () array!18651)

(assert (=> start!68506 (= res!252512 (and (bvsle #b00000000000000000000000000000000 from!632) (bvsle from!632 to!599) (bvsle (size!8080 a1!506) (size!8080 a2!506)) (bvsle to!599 (size!8080 a1!506)) (bvsle from!632 fromSlice!41) (bvsle fromSlice!41 toSlice!41) (bvsle toSlice!41 to!599)))))

(assert (=> start!68506 e!221715))

(assert (=> start!68506 true))

(declare-fun e!221714 () Bool)

(declare-fun array_inv!7686 (array!18651) Bool)

(assert (=> start!68506 (and (array_inv!7686 a1!506) e!221714)))

(declare-fun e!221713 () Bool)

(assert (=> start!68506 (and (array_inv!7686 a2!506) e!221713)))

(declare-fun b!307742 () Bool)

(declare-fun res!252511 () Bool)

(assert (=> b!307742 (=> (not res!252511) (not e!221715))))

(declare-fun arrayRangesEq!1704 (array!18651 array!18651 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!307742 (= res!252511 (arrayRangesEq!1704 a1!506 a2!506 to!599 to!599))))

(declare-fun b!307743 () Bool)

(declare-fun tp_is_empty!787 () Bool)

(assert (=> b!307743 (= e!221714 (and tp_is_empty!787 mapRes!2526))))

(declare-fun condMapEmpty!2526 () Bool)

(declare-fun mapDefault!2526 () T!57613)

