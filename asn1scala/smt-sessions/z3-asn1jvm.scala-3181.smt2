; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73114 () Bool)

(assert start!73114)

(declare-fun res!266865 () Bool)

(declare-fun e!234410 () Bool)

(assert (=> start!73114 (=> (not res!266865) (not e!234410))))

(declare-datatypes ((array!20974 0))(
  ( (array!20975 (arr!10202 (Array (_ BitVec 32) (_ BitVec 8))) (size!9110 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14382 0))(
  ( (BitStream!14383 (buf!8252 array!20974) (currentByte!15293 (_ BitVec 32)) (currentBit!15288 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14382)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73114 (= res!266865 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9110 (buf!8252 thiss!877))) ((_ sign_extend 32) (currentByte!15293 thiss!877)) ((_ sign_extend 32) (currentBit!15288 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73114 e!234410))

(declare-fun e!234411 () Bool)

(declare-fun inv!12 (BitStream!14382) Bool)

(assert (=> start!73114 (and (inv!12 thiss!877) e!234411)))

(declare-fun b!325175 () Bool)

(declare-fun res!266866 () Bool)

(assert (=> b!325175 (=> (not res!266866) (not e!234410))))

(assert (=> b!325175 (= res!266866 (bvslt (currentBit!15288 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!325176 () Bool)

(assert (=> b!325176 (= e!234410 (not (inv!12 (BitStream!14383 (buf!8252 thiss!877) (currentByte!15293 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15288 thiss!877))))))))

(declare-fun b!325177 () Bool)

(declare-fun array_inv!8662 (array!20974) Bool)

(assert (=> b!325177 (= e!234411 (array_inv!8662 (buf!8252 thiss!877)))))

(assert (= (and start!73114 res!266865) b!325175))

(assert (= (and b!325175 res!266866) b!325176))

(assert (= start!73114 b!325177))

(declare-fun m!463167 () Bool)

(assert (=> start!73114 m!463167))

(declare-fun m!463169 () Bool)

(assert (=> start!73114 m!463169))

(declare-fun m!463171 () Bool)

(assert (=> b!325176 m!463171))

(declare-fun m!463173 () Bool)

(assert (=> b!325177 m!463173))

(check-sat (not start!73114) (not b!325176) (not b!325177))
(check-sat)
(get-model)

(declare-fun d!107034 () Bool)

(assert (=> d!107034 (= (remainingBits!0 ((_ sign_extend 32) (size!9110 (buf!8252 thiss!877))) ((_ sign_extend 32) (currentByte!15293 thiss!877)) ((_ sign_extend 32) (currentBit!15288 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9110 (buf!8252 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15293 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15288 thiss!877)))))))

(assert (=> start!73114 d!107034))

(declare-fun d!107038 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!107038 (= (inv!12 thiss!877) (invariant!0 (currentBit!15288 thiss!877) (currentByte!15293 thiss!877) (size!9110 (buf!8252 thiss!877))))))

(declare-fun bs!28175 () Bool)

(assert (= bs!28175 d!107038))

(declare-fun m!463183 () Bool)

(assert (=> bs!28175 m!463183))

(assert (=> start!73114 d!107038))

(declare-fun d!107042 () Bool)

(assert (=> d!107042 (= (inv!12 (BitStream!14383 (buf!8252 thiss!877) (currentByte!15293 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15288 thiss!877)))) (invariant!0 (currentBit!15288 (BitStream!14383 (buf!8252 thiss!877) (currentByte!15293 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15288 thiss!877)))) (currentByte!15293 (BitStream!14383 (buf!8252 thiss!877) (currentByte!15293 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15288 thiss!877)))) (size!9110 (buf!8252 (BitStream!14383 (buf!8252 thiss!877) (currentByte!15293 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15288 thiss!877)))))))))

(declare-fun bs!28176 () Bool)

(assert (= bs!28176 d!107042))

(declare-fun m!463185 () Bool)

(assert (=> bs!28176 m!463185))

(assert (=> b!325176 d!107042))

(declare-fun d!107044 () Bool)

(assert (=> d!107044 (= (array_inv!8662 (buf!8252 thiss!877)) (bvsge (size!9110 (buf!8252 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325177 d!107044))

(check-sat (not d!107038) (not d!107042))
(check-sat)
(get-model)

(declare-fun d!107066 () Bool)

(assert (=> d!107066 (= (invariant!0 (currentBit!15288 thiss!877) (currentByte!15293 thiss!877) (size!9110 (buf!8252 thiss!877))) (and (bvsge (currentBit!15288 thiss!877) #b00000000000000000000000000000000) (bvslt (currentBit!15288 thiss!877) #b00000000000000000000000000001000) (bvsge (currentByte!15293 thiss!877) #b00000000000000000000000000000000) (or (bvslt (currentByte!15293 thiss!877) (size!9110 (buf!8252 thiss!877))) (and (= (currentBit!15288 thiss!877) #b00000000000000000000000000000000) (= (currentByte!15293 thiss!877) (size!9110 (buf!8252 thiss!877)))))))))

(assert (=> d!107038 d!107066))

(declare-fun d!107068 () Bool)

(assert (=> d!107068 (= (invariant!0 (currentBit!15288 (BitStream!14383 (buf!8252 thiss!877) (currentByte!15293 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15288 thiss!877)))) (currentByte!15293 (BitStream!14383 (buf!8252 thiss!877) (currentByte!15293 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15288 thiss!877)))) (size!9110 (buf!8252 (BitStream!14383 (buf!8252 thiss!877) (currentByte!15293 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15288 thiss!877)))))) (and (bvsge (currentBit!15288 (BitStream!14383 (buf!8252 thiss!877) (currentByte!15293 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15288 thiss!877)))) #b00000000000000000000000000000000) (bvslt (currentBit!15288 (BitStream!14383 (buf!8252 thiss!877) (currentByte!15293 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15288 thiss!877)))) #b00000000000000000000000000001000) (bvsge (currentByte!15293 (BitStream!14383 (buf!8252 thiss!877) (currentByte!15293 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15288 thiss!877)))) #b00000000000000000000000000000000) (or (bvslt (currentByte!15293 (BitStream!14383 (buf!8252 thiss!877) (currentByte!15293 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15288 thiss!877)))) (size!9110 (buf!8252 (BitStream!14383 (buf!8252 thiss!877) (currentByte!15293 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15288 thiss!877)))))) (and (= (currentBit!15288 (BitStream!14383 (buf!8252 thiss!877) (currentByte!15293 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15288 thiss!877)))) #b00000000000000000000000000000000) (= (currentByte!15293 (BitStream!14383 (buf!8252 thiss!877) (currentByte!15293 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15288 thiss!877)))) (size!9110 (buf!8252 (BitStream!14383 (buf!8252 thiss!877) (currentByte!15293 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15288 thiss!877))))))))))))

(assert (=> d!107042 d!107068))

(check-sat)
