; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47238 () Bool)

(assert start!47238)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-datatypes ((array!11220 0))(
  ( (array!11221 (arr!5880 (Array (_ BitVec 32) (_ BitVec 8))) (size!4923 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11220)

(assert (=> start!47238 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4923 arr!308)) (not (= (bvand to!496 #b10000000000000000000000000000000) (bvand i!761 #b10000000000000000000000000000000))) (not (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000))))))

(assert (=> start!47238 true))

(declare-fun array_inv!4664 (array!11220) Bool)

(assert (=> start!47238 (array_inv!4664 arr!308)))

(declare-fun bs!18700 () Bool)

(assert (= bs!18700 start!47238))

(declare-fun m!346591 () Bool)

(assert (=> bs!18700 m!346591))

(push 1)

(assert (not start!47238))

(check-sat)

