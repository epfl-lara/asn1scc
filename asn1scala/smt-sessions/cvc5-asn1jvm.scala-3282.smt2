; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74184 () Bool)

(assert start!74184)

(declare-fun mapIsEmpty!3552 () Bool)

(declare-fun mapRes!3553 () Bool)

(assert (=> mapIsEmpty!3552 mapRes!3553))

(declare-datatypes ((T!67009 0))(
  ( (T!67010 (val!591 Int)) )
))
(declare-datatypes ((array!21407 0))(
  ( (array!21408 (arr!10387 (Array (_ BitVec 32) T!67009)) (size!9295 (_ BitVec 32))) )
))
(declare-fun a1!451 () array!21407)

(declare-fun to!544 () (_ BitVec 32))

(declare-fun from!577 () (_ BitVec 32))

(declare-fun a2!451 () array!21407)

(assert (=> start!74184 (and (bvsle #b00000000000000000000000000000000 from!577) (bvsle from!577 to!544) (bvsle (size!9295 a1!451) (size!9295 a2!451)) (bvsle to!544 (size!9295 a1!451)) (not (= from!577 to!544)) (= (select (arr!10387 a1!451) from!577) (select (arr!10387 a2!451) from!577)) (bvsge (bvsub to!544 (bvadd #b00000000000000000000000000000001 from!577)) (bvsub to!544 from!577)))))

(assert (=> start!74184 true))

(declare-fun e!236414 () Bool)

(declare-fun array_inv!8828 (array!21407) Bool)

(assert (=> start!74184 (and (array_inv!8828 a1!451) e!236414)))

(declare-fun e!236415 () Bool)

(assert (=> start!74184 (and (array_inv!8828 a2!451) e!236415)))

(declare-fun b!327261 () Bool)

(declare-fun tp_is_empty!1183 () Bool)

(assert (=> b!327261 (= e!236414 (and tp_is_empty!1183 mapRes!3553))))

(declare-fun condMapEmpty!3553 () Bool)

(declare-fun mapDefault!3552 () T!67009)

