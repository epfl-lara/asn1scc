; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73238 () Bool)

(assert start!73238)

(declare-fun res!267007 () Bool)

(declare-fun e!234577 () Bool)

(assert (=> start!73238 (=> (not res!267007) (not e!234577))))

(declare-datatypes ((array!21014 0))(
  ( (array!21015 (arr!10216 (Array (_ BitVec 32) (_ BitVec 8))) (size!9124 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14410 0))(
  ( (BitStream!14411 (buf!8266 array!21014) (currentByte!15331 (_ BitVec 32)) (currentBit!15326 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14410)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73238 (= res!267007 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9124 (buf!8266 thiss!877))) ((_ sign_extend 32) (currentByte!15331 thiss!877)) ((_ sign_extend 32) (currentBit!15326 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73238 e!234577))

(declare-fun e!234578 () Bool)

(declare-fun inv!12 (BitStream!14410) Bool)

(assert (=> start!73238 (and (inv!12 thiss!877) e!234578)))

(declare-fun b!325358 () Bool)

(declare-fun res!267006 () Bool)

(assert (=> b!325358 (=> (not res!267006) (not e!234577))))

(assert (=> b!325358 (= res!267006 (bvsge (currentBit!15326 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!325359 () Bool)

(assert (=> b!325359 (= e!234577 (not (inv!12 (BitStream!14411 (buf!8266 thiss!877) (currentByte!15331 thiss!877) #b00000000000000000000000000000000))))))

(declare-fun b!325360 () Bool)

(declare-fun array_inv!8676 (array!21014) Bool)

(assert (=> b!325360 (= e!234578 (array_inv!8676 (buf!8266 thiss!877)))))

(assert (= (and start!73238 res!267007) b!325358))

(assert (= (and b!325358 res!267006) b!325359))

(assert (= start!73238 b!325360))

(declare-fun m!463339 () Bool)

(assert (=> start!73238 m!463339))

(declare-fun m!463341 () Bool)

(assert (=> start!73238 m!463341))

(declare-fun m!463343 () Bool)

(assert (=> b!325359 m!463343))

(declare-fun m!463345 () Bool)

(assert (=> b!325360 m!463345))

(push 1)

(assert (not b!325360))

(assert (not b!325359))

(assert (not start!73238))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107178 () Bool)

(assert (=> d!107178 (= (array_inv!8676 (buf!8266 thiss!877)) (bvsge (size!9124 (buf!8266 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325360 d!107178))

(declare-fun d!107182 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!107182 (= (inv!12 (BitStream!14411 (buf!8266 thiss!877) (currentByte!15331 thiss!877) #b00000000000000000000000000000000)) (invariant!0 (currentBit!15326 (BitStream!14411 (buf!8266 thiss!877) (currentByte!15331 thiss!877) #b00000000000000000000000000000000)) (currentByte!15331 (BitStream!14411 (buf!8266 thiss!877) (currentByte!15331 thiss!877) #b00000000000000000000000000000000)) (size!9124 (buf!8266 (BitStream!14411 (buf!8266 thiss!877) (currentByte!15331 thiss!877) #b00000000000000000000000000000000)))))))

(declare-fun bs!28207 () Bool)

(assert (= bs!28207 d!107182))

(declare-fun m!463367 () Bool)

(assert (=> bs!28207 m!463367))

(assert (=> b!325359 d!107182))

(declare-fun d!107188 () Bool)

(assert (=> d!107188 (= (remainingBits!0 ((_ sign_extend 32) (size!9124 (buf!8266 thiss!877))) ((_ sign_extend 32) (currentByte!15331 thiss!877)) ((_ sign_extend 32) (currentBit!15326 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9124 (buf!8266 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15331 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15326 thiss!877)))))))

(assert (=> start!73238 d!107188))

(declare-fun d!107190 () Bool)

(assert (=> d!107190 (= (inv!12 thiss!877) (invariant!0 (currentBit!15326 thiss!877) (currentByte!15331 thiss!877) (size!9124 (buf!8266 thiss!877))))))

(declare-fun bs!28208 () Bool)

(assert (= bs!28208 d!107190))

(declare-fun m!463369 () Bool)

(assert (=> bs!28208 m!463369))

(assert (=> start!73238 d!107190))

(push 1)

(assert (not d!107182))

(assert (not d!107190))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107200 () Bool)

(assert (=> d!107200 (= (invariant!0 (currentBit!15326 (BitStream!14411 (buf!8266 thiss!877) (currentByte!15331 thiss!877) #b00000000000000000000000000000000)) (currentByte!15331 (BitStream!14411 (buf!8266 thiss!877) (currentByte!15331 thiss!877) #b00000000000000000000000000000000)) (size!9124 (buf!8266 (BitStream!14411 (buf!8266 thiss!877) (currentByte!15331 thiss!877) #b00000000000000000000000000000000)))) (and (bvsge (currentBit!15326 (BitStream!14411 (buf!8266 thiss!877) (currentByte!15331 thiss!877) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (bvslt (currentBit!15326 (BitStream!14411 (buf!8266 thiss!877) (currentByte!15331 thiss!877) #b00000000000000000000000000000000)) #b00000000000000000000000000001000) (bvsge (currentByte!15331 (BitStream!14411 (buf!8266 thiss!877) (currentByte!15331 thiss!877) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (or (bvslt (currentByte!15331 (BitStream!14411 (buf!8266 thiss!877) (currentByte!15331 thiss!877) #b00000000000000000000000000000000)) (size!9124 (buf!8266 (BitStream!14411 (buf!8266 thiss!877) (currentByte!15331 thiss!877) #b00000000000000000000000000000000)))) (and (= (currentBit!15326 (BitStream!14411 (buf!8266 thiss!877) (currentByte!15331 thiss!877) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (= (currentByte!15331 (BitStream!14411 (buf!8266 thiss!877) (currentByte!15331 thiss!877) #b00000000000000000000000000000000)) (size!9124 (buf!8266 (BitStream!14411 (buf!8266 thiss!877) (currentByte!15331 thiss!877) #b00000000000000000000000000000000))))))))))

(assert (=> d!107182 d!107200))

(declare-fun d!107204 () Bool)

(assert (=> d!107204 (= (invariant!0 (currentBit!15326 thiss!877) (currentByte!15331 thiss!877) (size!9124 (buf!8266 thiss!877))) (and (bvsge (currentBit!15326 thiss!877) #b00000000000000000000000000000000) (bvslt (currentBit!15326 thiss!877) #b00000000000000000000000000001000) (bvsge (currentByte!15331 thiss!877) #b00000000000000000000000000000000) (or (bvslt (currentByte!15331 thiss!877) (size!9124 (buf!8266 thiss!877))) (and (= (currentBit!15326 thiss!877) #b00000000000000000000000000000000) (= (currentByte!15331 thiss!877) (size!9124 (buf!8266 thiss!877)))))))))

(assert (=> d!107190 d!107204))

(push 1)

(check-sat)

(pop 1)

