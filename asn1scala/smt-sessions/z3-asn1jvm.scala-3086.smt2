; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71046 () Bool)

(assert start!71046)

(declare-fun res!263512 () Bool)

(declare-fun e!231005 () Bool)

(assert (=> start!71046 (=> (not res!263512) (not e!231005))))

(declare-fun nBits!542 () (_ BitVec 32))

(declare-datatypes ((array!20276 0))(
  ( (array!20277 (arr!9929 (Array (_ BitVec 32) (_ BitVec 8))) (size!8837 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13836 0))(
  ( (BitStream!13837 (buf!7979 array!20276) (currentByte!14714 (_ BitVec 32)) (currentBit!14709 (_ BitVec 32))) )
))
(declare-fun thiss!1780 () BitStream!13836)

(assert (=> start!71046 (= res!263512 (and (bvsge nBits!542 #b00000000000000000000000000000000) (bvsle nBits!542 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8837 (buf!7979 thiss!1780))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14714 thiss!1780)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14709 thiss!1780)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8837 (buf!7979 thiss!1780))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14714 thiss!1780)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14709 thiss!1780)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!71046 e!231005))

(assert (=> start!71046 true))

(declare-fun e!231004 () Bool)

(declare-fun inv!12 (BitStream!13836) Bool)

(assert (=> start!71046 (and (inv!12 thiss!1780) e!231004)))

(declare-fun b!320813 () Bool)

(declare-fun res!263511 () Bool)

(assert (=> b!320813 (=> (not res!263511) (not e!231005))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!320813 (= res!263511 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14709 thiss!1780))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14714 thiss!1780))) ((_ extract 31 0) ((_ sign_extend 32) (size!8837 (buf!7979 thiss!1780))))))))

(declare-fun b!320814 () Bool)

(assert (=> b!320814 (= e!231005 (bvslt ((_ sign_extend 32) nBits!542) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!320815 () Bool)

(declare-fun array_inv!8389 (array!20276) Bool)

(assert (=> b!320815 (= e!231004 (array_inv!8389 (buf!7979 thiss!1780)))))

(assert (= (and start!71046 res!263512) b!320813))

(assert (= (and b!320813 res!263511) b!320814))

(assert (= start!71046 b!320815))

(declare-fun m!459183 () Bool)

(assert (=> start!71046 m!459183))

(declare-fun m!459185 () Bool)

(assert (=> b!320813 m!459185))

(declare-fun m!459187 () Bool)

(assert (=> b!320815 m!459187))

(check-sat (not b!320813) (not start!71046) (not b!320815))
(check-sat)
