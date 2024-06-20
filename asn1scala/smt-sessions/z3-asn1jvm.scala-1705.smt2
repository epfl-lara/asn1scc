; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47236 () Bool)

(assert start!47236)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-datatypes ((array!11218 0))(
  ( (array!11219 (arr!5879 (Array (_ BitVec 32) (_ BitVec 8))) (size!4922 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11218)

(assert (=> start!47236 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4922 arr!308)) (not (= (bvand to!496 #b10000000000000000000000000000000) (bvand i!761 #b10000000000000000000000000000000))) (not (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000))))))

(assert (=> start!47236 true))

(declare-fun array_inv!4663 (array!11218) Bool)

(assert (=> start!47236 (array_inv!4663 arr!308)))

(declare-fun bs!18699 () Bool)

(assert (= bs!18699 start!47236))

(declare-fun m!346589 () Bool)

(assert (=> bs!18699 m!346589))

(check-sat (not start!47236))
(check-sat)
