; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73240 () Bool)

(assert start!73240)

(declare-fun res!267013 () Bool)

(declare-fun e!234586 () Bool)

(assert (=> start!73240 (=> (not res!267013) (not e!234586))))

(declare-datatypes ((array!21016 0))(
  ( (array!21017 (arr!10217 (Array (_ BitVec 32) (_ BitVec 8))) (size!9125 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14412 0))(
  ( (BitStream!14413 (buf!8267 array!21016) (currentByte!15332 (_ BitVec 32)) (currentBit!15327 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14412)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73240 (= res!267013 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9125 (buf!8267 thiss!877))) ((_ sign_extend 32) (currentByte!15332 thiss!877)) ((_ sign_extend 32) (currentBit!15327 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73240 e!234586))

(declare-fun e!234587 () Bool)

(declare-fun inv!12 (BitStream!14412) Bool)

(assert (=> start!73240 (and (inv!12 thiss!877) e!234587)))

(declare-fun b!325367 () Bool)

(declare-fun res!267012 () Bool)

(assert (=> b!325367 (=> (not res!267012) (not e!234586))))

(assert (=> b!325367 (= res!267012 (bvsge (currentBit!15327 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!325368 () Bool)

(assert (=> b!325368 (= e!234586 (not (inv!12 (BitStream!14413 (buf!8267 thiss!877) (currentByte!15332 thiss!877) #b00000000000000000000000000000000))))))

(declare-fun b!325369 () Bool)

(declare-fun array_inv!8677 (array!21016) Bool)

(assert (=> b!325369 (= e!234587 (array_inv!8677 (buf!8267 thiss!877)))))

(assert (= (and start!73240 res!267013) b!325367))

(assert (= (and b!325367 res!267012) b!325368))

(assert (= start!73240 b!325369))

(declare-fun m!463347 () Bool)

(assert (=> start!73240 m!463347))

(declare-fun m!463349 () Bool)

(assert (=> start!73240 m!463349))

(declare-fun m!463351 () Bool)

(assert (=> b!325368 m!463351))

(declare-fun m!463353 () Bool)

(assert (=> b!325369 m!463353))

(check-sat (not b!325368) (not start!73240) (not b!325369))
(check-sat)
(get-model)

(declare-fun d!107176 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!107176 (= (inv!12 (BitStream!14413 (buf!8267 thiss!877) (currentByte!15332 thiss!877) #b00000000000000000000000000000000)) (invariant!0 (currentBit!15327 (BitStream!14413 (buf!8267 thiss!877) (currentByte!15332 thiss!877) #b00000000000000000000000000000000)) (currentByte!15332 (BitStream!14413 (buf!8267 thiss!877) (currentByte!15332 thiss!877) #b00000000000000000000000000000000)) (size!9125 (buf!8267 (BitStream!14413 (buf!8267 thiss!877) (currentByte!15332 thiss!877) #b00000000000000000000000000000000)))))))

(declare-fun bs!28205 () Bool)

(assert (= bs!28205 d!107176))

(declare-fun m!463363 () Bool)

(assert (=> bs!28205 m!463363))

(assert (=> b!325368 d!107176))

(declare-fun d!107180 () Bool)

(assert (=> d!107180 (= (remainingBits!0 ((_ sign_extend 32) (size!9125 (buf!8267 thiss!877))) ((_ sign_extend 32) (currentByte!15332 thiss!877)) ((_ sign_extend 32) (currentBit!15327 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9125 (buf!8267 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15332 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15327 thiss!877)))))))

(assert (=> start!73240 d!107180))

(declare-fun d!107184 () Bool)

(assert (=> d!107184 (= (inv!12 thiss!877) (invariant!0 (currentBit!15327 thiss!877) (currentByte!15332 thiss!877) (size!9125 (buf!8267 thiss!877))))))

(declare-fun bs!28206 () Bool)

(assert (= bs!28206 d!107184))

(declare-fun m!463365 () Bool)

(assert (=> bs!28206 m!463365))

(assert (=> start!73240 d!107184))

(declare-fun d!107186 () Bool)

(assert (=> d!107186 (= (array_inv!8677 (buf!8267 thiss!877)) (bvsge (size!9125 (buf!8267 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325369 d!107186))

(check-sat (not d!107184) (not d!107176))
(check-sat)
(get-model)

(declare-fun d!107202 () Bool)

(assert (=> d!107202 (= (invariant!0 (currentBit!15327 thiss!877) (currentByte!15332 thiss!877) (size!9125 (buf!8267 thiss!877))) (and (bvsge (currentBit!15327 thiss!877) #b00000000000000000000000000000000) (bvslt (currentBit!15327 thiss!877) #b00000000000000000000000000001000) (bvsge (currentByte!15332 thiss!877) #b00000000000000000000000000000000) (or (bvslt (currentByte!15332 thiss!877) (size!9125 (buf!8267 thiss!877))) (and (= (currentBit!15327 thiss!877) #b00000000000000000000000000000000) (= (currentByte!15332 thiss!877) (size!9125 (buf!8267 thiss!877)))))))))

(assert (=> d!107184 d!107202))

(declare-fun d!107206 () Bool)

(assert (=> d!107206 (= (invariant!0 (currentBit!15327 (BitStream!14413 (buf!8267 thiss!877) (currentByte!15332 thiss!877) #b00000000000000000000000000000000)) (currentByte!15332 (BitStream!14413 (buf!8267 thiss!877) (currentByte!15332 thiss!877) #b00000000000000000000000000000000)) (size!9125 (buf!8267 (BitStream!14413 (buf!8267 thiss!877) (currentByte!15332 thiss!877) #b00000000000000000000000000000000)))) (and (bvsge (currentBit!15327 (BitStream!14413 (buf!8267 thiss!877) (currentByte!15332 thiss!877) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (bvslt (currentBit!15327 (BitStream!14413 (buf!8267 thiss!877) (currentByte!15332 thiss!877) #b00000000000000000000000000000000)) #b00000000000000000000000000001000) (bvsge (currentByte!15332 (BitStream!14413 (buf!8267 thiss!877) (currentByte!15332 thiss!877) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (or (bvslt (currentByte!15332 (BitStream!14413 (buf!8267 thiss!877) (currentByte!15332 thiss!877) #b00000000000000000000000000000000)) (size!9125 (buf!8267 (BitStream!14413 (buf!8267 thiss!877) (currentByte!15332 thiss!877) #b00000000000000000000000000000000)))) (and (= (currentBit!15327 (BitStream!14413 (buf!8267 thiss!877) (currentByte!15332 thiss!877) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (= (currentByte!15332 (BitStream!14413 (buf!8267 thiss!877) (currentByte!15332 thiss!877) #b00000000000000000000000000000000)) (size!9125 (buf!8267 (BitStream!14413 (buf!8267 thiss!877) (currentByte!15332 thiss!877) #b00000000000000000000000000000000))))))))))

(assert (=> d!107176 d!107206))

(check-sat)
