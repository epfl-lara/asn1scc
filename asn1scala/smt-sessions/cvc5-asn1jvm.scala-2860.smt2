; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68686 () Bool)

(assert start!68686)

(declare-fun b!309876 () Bool)

(declare-fun e!222775 () Bool)

(declare-fun to!659 () (_ BitVec 32))

(declare-fun i!943 () (_ BitVec 32))

(assert (=> b!309876 (= e!222775 (bvslt (bvsub to!659 i!943) #b00000000000000000000000000000000))))

(declare-fun res!254137 () Bool)

(assert (=> start!68686 (=> (not res!254137) (not e!222775))))

(declare-fun at!235 () (_ BitVec 32))

(declare-datatypes ((T!58341 0))(
  ( (T!58342 (val!477 Int)) )
))
(declare-datatypes ((array!18821 0))(
  ( (array!18822 (arr!9247 (Array (_ BitVec 32) T!58341)) (size!8164 (_ BitVec 32))) )
))
(declare-fun a2!566 () array!18821)

(declare-fun a1!566 () array!18821)

(declare-fun from!692 () (_ BitVec 32))

(assert (=> start!68686 (= res!254137 (and (bvsle #b00000000000000000000000000000000 from!692) (bvsle from!692 to!659) (bvsle (size!8164 a1!566) (size!8164 a2!566)) (bvsle to!659 (size!8164 a1!566)) (bvsle from!692 at!235) (bvslt at!235 to!659)))))

(assert (=> start!68686 e!222775))

(assert (=> start!68686 true))

(declare-fun e!222776 () Bool)

(declare-fun array_inv!7733 (array!18821) Bool)

(assert (=> start!68686 (and (array_inv!7733 a2!566) e!222776)))

(declare-fun e!222774 () Bool)

(assert (=> start!68686 (and (array_inv!7733 a1!566) e!222774)))

(declare-fun b!309877 () Bool)

(declare-fun tp_is_empty!955 () Bool)

(declare-fun mapRes!3038 () Bool)

(assert (=> b!309877 (= e!222776 (and tp_is_empty!955 mapRes!3038))))

(declare-fun condMapEmpty!3037 () Bool)

(declare-fun mapDefault!3037 () T!58341)

