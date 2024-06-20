; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50158 () Bool)

(assert start!50158)

(declare-fun i!756 () (_ BitVec 32))

(declare-fun nBits!593 () (_ BitVec 32))

(declare-datatypes ((array!12394 0))(
  ( (array!12395 (arr!6431 (Array (_ BitVec 32) (_ BitVec 8))) (size!5444 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9852 0))(
  ( (BitStream!9853 (buf!5919 array!12394) (currentByte!11025 (_ BitVec 32)) (currentBit!11020 (_ BitVec 32))) )
))
(declare-fun thiss!1848 () BitStream!9852)

(assert (=> start!50158 (and (bvsle #b00000000000000000000000000000000 i!756) (bvsle i!756 nBits!593) (bvsle nBits!593 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!5444 (buf!5919 thiss!1848))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!11025 thiss!1848)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!11020 thiss!1848)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!50158 true))

(declare-fun e!162865 () Bool)

(declare-fun inv!12 (BitStream!9852) Bool)

(assert (=> start!50158 (and (inv!12 thiss!1848) e!162865)))

(declare-fun b!235664 () Bool)

(declare-fun array_inv!5185 (array!12394) Bool)

(assert (=> b!235664 (= e!162865 (array_inv!5185 (buf!5919 thiss!1848)))))

(assert (= start!50158 b!235664))

(declare-fun m!358349 () Bool)

(assert (=> start!50158 m!358349))

(declare-fun m!358351 () Bool)

(assert (=> b!235664 m!358351))

(check-sat (not start!50158) (not b!235664))
(check-sat)
