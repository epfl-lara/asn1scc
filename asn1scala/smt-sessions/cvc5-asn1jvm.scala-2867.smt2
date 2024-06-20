; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68736 () Bool)

(assert start!68736)

(declare-fun mapIsEmpty!3171 () Bool)

(declare-fun mapRes!3171 () Bool)

(assert (=> mapIsEmpty!3171 mapRes!3171))

(declare-fun res!254420 () Bool)

(declare-fun e!222983 () Bool)

(assert (=> start!68736 (=> (not res!254420) (not e!222983))))

(declare-fun at!235 () (_ BitVec 32))

(declare-fun to!659 () (_ BitVec 32))

(declare-datatypes ((T!58523 0))(
  ( (T!58524 (val!498 Int)) )
))
(declare-datatypes ((array!18865 0))(
  ( (array!18866 (arr!9268 (Array (_ BitVec 32) T!58523)) (size!8185 (_ BitVec 32))) )
))
(declare-fun a1!566 () array!18865)

(declare-fun from!692 () (_ BitVec 32))

(declare-fun a2!566 () array!18865)

(assert (=> start!68736 (= res!254420 (and (bvsle #b00000000000000000000000000000000 from!692) (bvsle from!692 to!659) (bvsle (size!8185 a1!566) (size!8185 a2!566)) (bvsle to!659 (size!8185 a1!566)) (bvsle from!692 at!235) (bvslt at!235 to!659)))))

(assert (=> start!68736 e!222983))

(assert (=> start!68736 true))

(declare-fun e!222982 () Bool)

(declare-fun array_inv!7747 (array!18865) Bool)

(assert (=> start!68736 (and (array_inv!7747 a2!566) e!222982)))

(declare-fun e!222981 () Bool)

(assert (=> start!68736 (and (array_inv!7747 a1!566) e!222981)))

(declare-fun b!310289 () Bool)

(declare-fun res!254421 () Bool)

(assert (=> b!310289 (=> (not res!254421) (not e!222983))))

(declare-fun i!943 () (_ BitVec 32))

(declare-fun arrayRangesEq!1781 (array!18865 array!18865 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!310289 (= res!254421 (arrayRangesEq!1781 a1!566 a2!566 i!943 to!659))))

(declare-fun b!310290 () Bool)

(declare-fun tp_is_empty!997 () Bool)

(assert (=> b!310290 (= e!222981 (and tp_is_empty!997 mapRes!3171))))

(declare-fun condMapEmpty!3171 () Bool)

(declare-fun mapDefault!3171 () T!58523)

