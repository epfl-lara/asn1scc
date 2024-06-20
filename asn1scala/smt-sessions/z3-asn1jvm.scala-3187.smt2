; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73270 () Bool)

(assert start!73270)

(declare-fun res!267030 () Bool)

(declare-fun e!234615 () Bool)

(assert (=> start!73270 (=> (not res!267030) (not e!234615))))

(declare-datatypes ((array!21025 0))(
  ( (array!21026 (arr!10220 (Array (_ BitVec 32) (_ BitVec 8))) (size!9128 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14418 0))(
  ( (BitStream!14419 (buf!8270 array!21025) (currentByte!15341 (_ BitVec 32)) (currentBit!15336 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14418)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73270 (= res!267030 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9128 (buf!8270 thiss!877))) ((_ sign_extend 32) (currentByte!15341 thiss!877)) ((_ sign_extend 32) (currentBit!15336 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73270 e!234615))

(declare-fun e!234614 () Bool)

(declare-fun inv!12 (BitStream!14418) Bool)

(assert (=> start!73270 (and (inv!12 thiss!877) e!234614)))

(declare-fun b!325394 () Bool)

(declare-fun res!267031 () Bool)

(assert (=> b!325394 (=> (not res!267031) (not e!234615))))

(assert (=> b!325394 (= res!267031 (bvsge (currentBit!15336 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!325395 () Bool)

(assert (=> b!325395 (= e!234615 (not (inv!12 (BitStream!14419 (buf!8270 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15341 thiss!877)) #b00000000000000000000000000000000))))))

(declare-fun b!325396 () Bool)

(declare-fun array_inv!8680 (array!21025) Bool)

(assert (=> b!325396 (= e!234614 (array_inv!8680 (buf!8270 thiss!877)))))

(assert (= (and start!73270 res!267030) b!325394))

(assert (= (and b!325394 res!267031) b!325395))

(assert (= start!73270 b!325396))

(declare-fun m!463383 () Bool)

(assert (=> start!73270 m!463383))

(declare-fun m!463385 () Bool)

(assert (=> start!73270 m!463385))

(declare-fun m!463387 () Bool)

(assert (=> b!325395 m!463387))

(declare-fun m!463389 () Bool)

(assert (=> b!325396 m!463389))

(check-sat (not start!73270) (not b!325396) (not b!325395))
(check-sat)
(get-model)

(declare-fun d!107212 () Bool)

(assert (=> d!107212 (= (remainingBits!0 ((_ sign_extend 32) (size!9128 (buf!8270 thiss!877))) ((_ sign_extend 32) (currentByte!15341 thiss!877)) ((_ sign_extend 32) (currentBit!15336 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9128 (buf!8270 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15341 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15336 thiss!877)))))))

(assert (=> start!73270 d!107212))

(declare-fun d!107216 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!107216 (= (inv!12 thiss!877) (invariant!0 (currentBit!15336 thiss!877) (currentByte!15341 thiss!877) (size!9128 (buf!8270 thiss!877))))))

(declare-fun bs!28214 () Bool)

(assert (= bs!28214 d!107216))

(declare-fun m!463399 () Bool)

(assert (=> bs!28214 m!463399))

(assert (=> start!73270 d!107216))

(declare-fun d!107222 () Bool)

(assert (=> d!107222 (= (array_inv!8680 (buf!8270 thiss!877)) (bvsge (size!9128 (buf!8270 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325396 d!107222))

(declare-fun d!107226 () Bool)

(assert (=> d!107226 (= (inv!12 (BitStream!14419 (buf!8270 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15341 thiss!877)) #b00000000000000000000000000000000)) (invariant!0 (currentBit!15336 (BitStream!14419 (buf!8270 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15341 thiss!877)) #b00000000000000000000000000000000)) (currentByte!15341 (BitStream!14419 (buf!8270 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15341 thiss!877)) #b00000000000000000000000000000000)) (size!9128 (buf!8270 (BitStream!14419 (buf!8270 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15341 thiss!877)) #b00000000000000000000000000000000)))))))

(declare-fun bs!28215 () Bool)

(assert (= bs!28215 d!107226))

(declare-fun m!463401 () Bool)

(assert (=> bs!28215 m!463401))

(assert (=> b!325395 d!107226))

(check-sat (not d!107226) (not d!107216))
(check-sat)
(get-model)

(declare-fun d!107244 () Bool)

(assert (=> d!107244 (= (invariant!0 (currentBit!15336 (BitStream!14419 (buf!8270 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15341 thiss!877)) #b00000000000000000000000000000000)) (currentByte!15341 (BitStream!14419 (buf!8270 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15341 thiss!877)) #b00000000000000000000000000000000)) (size!9128 (buf!8270 (BitStream!14419 (buf!8270 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15341 thiss!877)) #b00000000000000000000000000000000)))) (and (bvsge (currentBit!15336 (BitStream!14419 (buf!8270 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15341 thiss!877)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (bvslt (currentBit!15336 (BitStream!14419 (buf!8270 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15341 thiss!877)) #b00000000000000000000000000000000)) #b00000000000000000000000000001000) (bvsge (currentByte!15341 (BitStream!14419 (buf!8270 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15341 thiss!877)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (or (bvslt (currentByte!15341 (BitStream!14419 (buf!8270 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15341 thiss!877)) #b00000000000000000000000000000000)) (size!9128 (buf!8270 (BitStream!14419 (buf!8270 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15341 thiss!877)) #b00000000000000000000000000000000)))) (and (= (currentBit!15336 (BitStream!14419 (buf!8270 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15341 thiss!877)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (= (currentByte!15341 (BitStream!14419 (buf!8270 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15341 thiss!877)) #b00000000000000000000000000000000)) (size!9128 (buf!8270 (BitStream!14419 (buf!8270 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15341 thiss!877)) #b00000000000000000000000000000000))))))))))

(assert (=> d!107226 d!107244))

(declare-fun d!107246 () Bool)

(assert (=> d!107246 (= (invariant!0 (currentBit!15336 thiss!877) (currentByte!15341 thiss!877) (size!9128 (buf!8270 thiss!877))) (and (bvsge (currentBit!15336 thiss!877) #b00000000000000000000000000000000) (bvslt (currentBit!15336 thiss!877) #b00000000000000000000000000001000) (bvsge (currentByte!15341 thiss!877) #b00000000000000000000000000000000) (or (bvslt (currentByte!15341 thiss!877) (size!9128 (buf!8270 thiss!877))) (and (= (currentBit!15336 thiss!877) #b00000000000000000000000000000000) (= (currentByte!15341 thiss!877) (size!9128 (buf!8270 thiss!877)))))))))

(assert (=> d!107216 d!107246))

(check-sat)
