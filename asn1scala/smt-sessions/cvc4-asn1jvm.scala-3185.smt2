; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73212 () Bool)

(assert start!73212)

(declare-fun res!266976 () Bool)

(declare-fun e!234557 () Bool)

(assert (=> start!73212 (=> (not res!266976) (not e!234557))))

(declare-fun lt!447758 () (_ BitVec 64))

(declare-datatypes ((array!21009 0))(
  ( (array!21010 (arr!10215 (Array (_ BitVec 32) (_ BitVec 8))) (size!9123 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14408 0))(
  ( (BitStream!14409 (buf!8265 array!21009) (currentByte!15324 (_ BitVec 32)) (currentBit!15319 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14408)

(assert (=> start!73212 (= res!266976 (and (bvsgt lt!447758 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt (currentBit!15319 thiss!877) #b00000000000000000000000000000111)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73212 (= lt!447758 (remainingBits!0 ((_ sign_extend 32) (size!9123 (buf!8265 thiss!877))) ((_ sign_extend 32) (currentByte!15324 thiss!877)) ((_ sign_extend 32) (currentBit!15319 thiss!877))))))

(assert (=> start!73212 e!234557))

(declare-fun e!234556 () Bool)

(declare-fun inv!12 (BitStream!14408) Bool)

(assert (=> start!73212 (and (inv!12 thiss!877) e!234556)))

(declare-fun b!325325 () Bool)

(declare-fun e!234558 () Bool)

(assert (=> b!325325 (= e!234557 e!234558)))

(declare-fun res!266977 () Bool)

(assert (=> b!325325 (=> res!266977 e!234558)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!325325 (= res!266977 (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9123 (buf!8265 thiss!877)) (currentByte!15324 thiss!877) (currentBit!15319 thiss!877))) (bitIndex!0 (size!9123 (buf!8265 thiss!877)) (currentByte!15324 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15319 thiss!877))))))))

(declare-fun b!325326 () Bool)

(assert (=> b!325326 (= e!234558 (not (= (bvsub lt!447758 (remainingBits!0 ((_ sign_extend 32) (size!9123 (buf!8265 thiss!877))) ((_ sign_extend 32) (currentByte!15324 thiss!877)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15319 thiss!877))))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!325327 () Bool)

(declare-fun array_inv!8675 (array!21009) Bool)

(assert (=> b!325327 (= e!234556 (array_inv!8675 (buf!8265 thiss!877)))))

(assert (= (and start!73212 res!266976) b!325325))

(assert (= (and b!325325 (not res!266977)) b!325326))

(assert (= start!73212 b!325327))

(declare-fun m!463315 () Bool)

(assert (=> start!73212 m!463315))

(declare-fun m!463317 () Bool)

(assert (=> start!73212 m!463317))

(declare-fun m!463319 () Bool)

(assert (=> b!325325 m!463319))

(declare-fun m!463321 () Bool)

(assert (=> b!325325 m!463321))

(declare-fun m!463323 () Bool)

(assert (=> b!325326 m!463323))

(declare-fun m!463325 () Bool)

(assert (=> b!325327 m!463325))

(push 1)

(assert (not b!325327))

(assert (not b!325326))

(assert (not b!325325))

(assert (not start!73212))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107160 () Bool)

(assert (=> d!107160 (= (array_inv!8675 (buf!8265 thiss!877)) (bvsge (size!9123 (buf!8265 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325327 d!107160))

(declare-fun d!107162 () Bool)

(assert (=> d!107162 (= (remainingBits!0 ((_ sign_extend 32) (size!9123 (buf!8265 thiss!877))) ((_ sign_extend 32) (currentByte!15324 thiss!877)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15319 thiss!877)))) (bvsub (bvmul ((_ sign_extend 32) (size!9123 (buf!8265 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15324 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15319 thiss!877))))))))

(assert (=> b!325326 d!107162))

(declare-fun d!107164 () Bool)

(declare-fun e!234569 () Bool)

(assert (=> d!107164 e!234569))

(declare-fun res!266998 () Bool)

(assert (=> d!107164 (=> (not res!266998) (not e!234569))))

(declare-fun lt!447822 () (_ BitVec 64))

(declare-fun lt!447821 () (_ BitVec 64))

(declare-fun lt!447824 () (_ BitVec 64))

(assert (=> d!107164 (= res!266998 (= lt!447821 (bvsub lt!447824 lt!447822)))))

(assert (=> d!107164 (or (= (bvand lt!447824 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447822 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447824 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447824 lt!447822) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107164 (= lt!447822 (remainingBits!0 ((_ sign_extend 32) (size!9123 (buf!8265 thiss!877))) ((_ sign_extend 32) (currentByte!15324 thiss!877)) ((_ sign_extend 32) (currentBit!15319 thiss!877))))))

(declare-fun lt!447820 () (_ BitVec 64))

(declare-fun lt!447819 () (_ BitVec 64))

(assert (=> d!107164 (= lt!447824 (bvmul lt!447820 lt!447819))))

(assert (=> d!107164 (or (= lt!447820 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447819 (bvsdiv (bvmul lt!447820 lt!447819) lt!447820)))))

(assert (=> d!107164 (= lt!447819 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107164 (= lt!447820 ((_ sign_extend 32) (size!9123 (buf!8265 thiss!877))))))

(assert (=> d!107164 (= lt!447821 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15324 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15319 thiss!877))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!107164 (invariant!0 (currentBit!15319 thiss!877) (currentByte!15324 thiss!877) (size!9123 (buf!8265 thiss!877)))))

(assert (=> d!107164 (= (bitIndex!0 (size!9123 (buf!8265 thiss!877)) (currentByte!15324 thiss!877) (currentBit!15319 thiss!877)) lt!447821)))

(declare-fun b!325348 () Bool)

(declare-fun res!266999 () Bool)

(assert (=> b!325348 (=> (not res!266999) (not e!234569))))

(assert (=> b!325348 (= res!266999 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447821))))

(declare-fun b!325349 () Bool)

(declare-fun lt!447823 () (_ BitVec 64))

(assert (=> b!325349 (= e!234569 (bvsle lt!447821 (bvmul lt!447823 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325349 (or (= lt!447823 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447823 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447823)))))

(assert (=> b!325349 (= lt!447823 ((_ sign_extend 32) (size!9123 (buf!8265 thiss!877))))))

(assert (= (and d!107164 res!266998) b!325348))

(assert (= (and b!325348 res!266999) b!325349))

(assert (=> d!107164 m!463315))

(declare-fun m!463335 () Bool)

(assert (=> d!107164 m!463335))

(assert (=> b!325325 d!107164))

(declare-fun d!107168 () Bool)

(declare-fun e!234570 () Bool)

(assert (=> d!107168 e!234570))

(declare-fun res!267000 () Bool)

(assert (=> d!107168 (=> (not res!267000) (not e!234570))))

(declare-fun lt!447827 () (_ BitVec 64))

(declare-fun lt!447828 () (_ BitVec 64))

(declare-fun lt!447830 () (_ BitVec 64))

(assert (=> d!107168 (= res!267000 (= lt!447827 (bvsub lt!447830 lt!447828)))))

(assert (=> d!107168 (or (= (bvand lt!447830 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447828 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447830 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447830 lt!447828) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107168 (= lt!447828 (remainingBits!0 ((_ sign_extend 32) (size!9123 (buf!8265 thiss!877))) ((_ sign_extend 32) (currentByte!15324 thiss!877)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15319 thiss!877)))))))

(declare-fun lt!447826 () (_ BitVec 64))

(declare-fun lt!447825 () (_ BitVec 64))

(assert (=> d!107168 (= lt!447830 (bvmul lt!447826 lt!447825))))

(assert (=> d!107168 (or (= lt!447826 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447825 (bvsdiv (bvmul lt!447826 lt!447825) lt!447826)))))

(assert (=> d!107168 (= lt!447825 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107168 (= lt!447826 ((_ sign_extend 32) (size!9123 (buf!8265 thiss!877))))))

(assert (=> d!107168 (= lt!447827 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15324 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15319 thiss!877)))))))

(assert (=> d!107168 (invariant!0 (bvadd #b00000000000000000000000000000001 (currentBit!15319 thiss!877)) (currentByte!15324 thiss!877) (size!9123 (buf!8265 thiss!877)))))

(assert (=> d!107168 (= (bitIndex!0 (size!9123 (buf!8265 thiss!877)) (currentByte!15324 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15319 thiss!877))) lt!447827)))

(declare-fun b!325350 () Bool)

(declare-fun res!267001 () Bool)

(assert (=> b!325350 (=> (not res!267001) (not e!234570))))

(assert (=> b!325350 (= res!267001 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447827))))

(declare-fun b!325351 () Bool)

(declare-fun lt!447829 () (_ BitVec 64))

(assert (=> b!325351 (= e!234570 (bvsle lt!447827 (bvmul lt!447829 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325351 (or (= lt!447829 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447829 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447829)))))

(assert (=> b!325351 (= lt!447829 ((_ sign_extend 32) (size!9123 (buf!8265 thiss!877))))))

(assert (= (and d!107168 res!267000) b!325350))

(assert (= (and b!325350 res!267001) b!325351))

(assert (=> d!107168 m!463323))

(declare-fun m!463337 () Bool)

(assert (=> d!107168 m!463337))

(assert (=> b!325325 d!107168))

(declare-fun d!107170 () Bool)

(assert (=> d!107170 (= (remainingBits!0 ((_ sign_extend 32) (size!9123 (buf!8265 thiss!877))) ((_ sign_extend 32) (currentByte!15324 thiss!877)) ((_ sign_extend 32) (currentBit!15319 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9123 (buf!8265 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15324 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15319 thiss!877)))))))

(assert (=> start!73212 d!107170))

(declare-fun d!107172 () Bool)

(assert (=> d!107172 (= (inv!12 thiss!877) (invariant!0 (currentBit!15319 thiss!877) (currentByte!15324 thiss!877) (size!9123 (buf!8265 thiss!877))))))

(declare-fun bs!28201 () Bool)

(assert (= bs!28201 d!107172))

(assert (=> bs!28201 m!463335))

(assert (=> start!73212 d!107172))

(push 1)

(assert (not d!107164))

(assert (not d!107172))

(assert (not d!107168))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

