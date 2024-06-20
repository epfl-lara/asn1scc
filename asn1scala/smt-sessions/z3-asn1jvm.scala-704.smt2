; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19856 () Bool)

(assert start!19856)

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-datatypes ((array!4629 0))(
  ( (array!4630 (arr!2707 (Array (_ BitVec 32) (_ BitVec 8))) (size!2114 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3702 0))(
  ( (BitStream!3703 (buf!2471 array!4629) (currentByte!4907 (_ BitVec 32)) (currentBit!4902 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3702)

(assert (=> start!19856 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!2114 (buf!2471 thiss!1305))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4907 thiss!1305)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4902 thiss!1305)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!19856 true))

(declare-fun e!64775 () Bool)

(declare-fun inv!12 (BitStream!3702) Bool)

(assert (=> start!19856 (and (inv!12 thiss!1305) e!64775)))

(declare-fun b!99050 () Bool)

(declare-fun array_inv!1916 (array!4629) Bool)

(assert (=> b!99050 (= e!64775 (array_inv!1916 (buf!2471 thiss!1305)))))

(assert (= start!19856 b!99050))

(declare-fun m!144481 () Bool)

(assert (=> start!19856 m!144481))

(declare-fun m!144483 () Bool)

(assert (=> b!99050 m!144483))

(check-sat (not start!19856) (not b!99050))
(check-sat)
