; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47234 () Bool)

(assert start!47234)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-datatypes ((array!11216 0))(
  ( (array!11217 (arr!5878 (Array (_ BitVec 32) (_ BitVec 8))) (size!4921 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11216)

(assert (=> start!47234 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4921 arr!308)) (not (= (bvand to!496 #b10000000000000000000000000000000) (bvand i!761 #b10000000000000000000000000000000))) (not (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000))))))

(assert (=> start!47234 true))

(declare-fun array_inv!4662 (array!11216) Bool)

(assert (=> start!47234 (array_inv!4662 arr!308)))

(declare-fun bs!18698 () Bool)

(assert (= bs!18698 start!47234))

(declare-fun m!346587 () Bool)

(assert (=> bs!18698 m!346587))

(push 1)

(assert (not start!47234))

(check-sat)

(pop 1)

(push 1)

(check-sat)

