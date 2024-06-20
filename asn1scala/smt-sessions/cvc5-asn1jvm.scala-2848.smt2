; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68602 () Bool)

(assert start!68602)

(declare-fun res!253466 () Bool)

(declare-fun e!222309 () Bool)

(assert (=> start!68602 (=> (not res!253466) (not e!222309))))

(declare-fun fromSlice!46 () (_ BitVec 32))

(declare-fun toSlice!46 () (_ BitVec 32))

(declare-datatypes ((T!58029 0))(
  ( (T!58030 (val!441 Int)) )
))
(declare-datatypes ((array!18747 0))(
  ( (array!18748 (arr!9211 (Array (_ BitVec 32) T!58029)) (size!8128 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18747)

(declare-fun from!650 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(declare-fun a1!524 () array!18747)

(assert (=> start!68602 (= res!253466 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8128 a1!524) (size!8128 a2!524)) (bvsle to!617 (size!8128 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68602 e!222309))

(assert (=> start!68602 true))

(declare-fun e!222311 () Bool)

(declare-fun array_inv!7713 (array!18747) Bool)

(assert (=> start!68602 (and (array_inv!7713 a2!524) e!222311)))

(declare-fun e!222312 () Bool)

(assert (=> start!68602 (and (array_inv!7713 a1!524) e!222312)))

(declare-fun b!308986 () Bool)

(declare-fun tp_is_empty!883 () Bool)

(declare-fun mapRes!2813 () Bool)

(assert (=> b!308986 (= e!222312 (and tp_is_empty!883 mapRes!2813))))

(declare-fun condMapEmpty!2813 () Bool)

(declare-fun mapDefault!2814 () T!58029)

