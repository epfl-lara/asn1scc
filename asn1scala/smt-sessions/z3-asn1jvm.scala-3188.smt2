; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73300 () Bool)

(assert start!73300)

(declare-fun res!267043 () Bool)

(declare-fun e!234640 () Bool)

(assert (=> start!73300 (=> (not res!267043) (not e!234640))))

(declare-datatypes ((array!21034 0))(
  ( (array!21035 (arr!10223 (Array (_ BitVec 32) (_ BitVec 8))) (size!9131 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14424 0))(
  ( (BitStream!14425 (buf!8273 array!21034) (currentByte!15350 (_ BitVec 32)) (currentBit!15345 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14424)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73300 (= res!267043 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9131 (buf!8273 thiss!877))) ((_ sign_extend 32) (currentByte!15350 thiss!877)) ((_ sign_extend 32) (currentBit!15345 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73300 e!234640))

(declare-fun e!234641 () Bool)

(declare-fun inv!12 (BitStream!14424) Bool)

(assert (=> start!73300 (and (inv!12 thiss!877) e!234641)))

(declare-fun b!325416 () Bool)

(assert (=> b!325416 (= e!234640 (and (bvsge (currentBit!15345 thiss!877) #b00000000000000000000000000000111) (= (bvand (currentByte!15350 thiss!877) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand (currentByte!15350 thiss!877) #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 (currentByte!15350 thiss!877)) #b10000000000000000000000000000000)))))))

(declare-fun b!325417 () Bool)

(declare-fun array_inv!8683 (array!21034) Bool)

(assert (=> b!325417 (= e!234641 (array_inv!8683 (buf!8273 thiss!877)))))

(assert (= (and start!73300 res!267043) b!325416))

(assert (= start!73300 b!325417))

(declare-fun m!463417 () Bool)

(assert (=> start!73300 m!463417))

(declare-fun m!463419 () Bool)

(assert (=> start!73300 m!463419))

(declare-fun m!463421 () Bool)

(assert (=> b!325417 m!463421))

(check-sat (not b!325417) (not start!73300))
(check-sat)
(get-model)

(declare-fun d!107250 () Bool)

(assert (=> d!107250 (= (array_inv!8683 (buf!8273 thiss!877)) (bvsge (size!9131 (buf!8273 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325417 d!107250))

(declare-fun d!107252 () Bool)

(assert (=> d!107252 (= (remainingBits!0 ((_ sign_extend 32) (size!9131 (buf!8273 thiss!877))) ((_ sign_extend 32) (currentByte!15350 thiss!877)) ((_ sign_extend 32) (currentBit!15345 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9131 (buf!8273 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15350 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15345 thiss!877)))))))

(assert (=> start!73300 d!107252))

(declare-fun d!107254 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!107254 (= (inv!12 thiss!877) (invariant!0 (currentBit!15345 thiss!877) (currentByte!15350 thiss!877) (size!9131 (buf!8273 thiss!877))))))

(declare-fun bs!28223 () Bool)

(assert (= bs!28223 d!107254))

(declare-fun m!463429 () Bool)

(assert (=> bs!28223 m!463429))

(assert (=> start!73300 d!107254))

(check-sat (not d!107254))
(check-sat)
