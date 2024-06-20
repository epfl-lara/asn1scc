; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51214 () Bool)

(assert start!51214)

(declare-datatypes ((array!12801 0))(
  ( (array!12802 (arr!6611 (Array (_ BitVec 32) (_ BitVec 8))) (size!5624 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10170 0))(
  ( (BitStream!10171 (buf!6078 array!12801) (currentByte!11270 (_ BitVec 32)) (currentBit!11265 (_ BitVec 32))) )
))
(declare-fun thiss!1857 () BitStream!10170)

(assert (=> start!51214 (or (bvsgt ((_ sign_extend 32) (size!5624 (buf!6078 thiss!1857))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!11270 thiss!1857)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!11265 thiss!1857)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!165268 () Bool)

(declare-fun inv!12 (BitStream!10170) Bool)

(assert (=> start!51214 (and (inv!12 thiss!1857) e!165268)))

(declare-fun b!239099 () Bool)

(declare-fun array_inv!5365 (array!12801) Bool)

(assert (=> b!239099 (= e!165268 (array_inv!5365 (buf!6078 thiss!1857)))))

(assert (= start!51214 b!239099))

(declare-fun m!361117 () Bool)

(assert (=> start!51214 m!361117))

(declare-fun m!361119 () Bool)

(assert (=> b!239099 m!361119))

(check-sat (not start!51214) (not b!239099))
(check-sat)
