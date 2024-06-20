; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68672 () Bool)

(assert start!68672)

(declare-fun res!254070 () Bool)

(declare-fun e!222712 () Bool)

(assert (=> start!68672 (=> (not res!254070) (not e!222712))))

(declare-datatypes ((T!58267 0))(
  ( (T!58268 (val!470 Int)) )
))
(declare-datatypes ((array!18807 0))(
  ( (array!18808 (arr!9240 (Array (_ BitVec 32) T!58267)) (size!8157 (_ BitVec 32))) )
))
(declare-fun a2!555 () array!18807)

(declare-fun a1!555 () array!18807)

(declare-fun at!230 () (_ BitVec 32))

(declare-fun from!681 () (_ BitVec 32))

(declare-fun to!648 () (_ BitVec 32))

(assert (=> start!68672 (= res!254070 (and (bvsle #b00000000000000000000000000000000 from!681) (bvsle from!681 to!648) (bvsle (size!8157 a1!555) (size!8157 a2!555)) (bvsle to!648 (size!8157 a1!555)) (bvsle from!681 at!230) (bvslt at!230 to!648)))))

(assert (=> start!68672 e!222712))

(declare-fun e!222713 () Bool)

(declare-fun array_inv!7729 (array!18807) Bool)

(assert (=> start!68672 (and (array_inv!7729 a2!555) e!222713)))

(declare-fun e!222711 () Bool)

(assert (=> start!68672 (and (array_inv!7729 a1!555) e!222711)))

(assert (=> start!68672 true))

(declare-fun b!309770 () Bool)

(declare-fun tp_is_empty!941 () Bool)

(declare-fun mapRes!2995 () Bool)

(assert (=> b!309770 (= e!222711 (and tp_is_empty!941 mapRes!2995))))

(declare-fun condMapEmpty!2996 () Bool)

(declare-fun mapDefault!2996 () T!58267)

