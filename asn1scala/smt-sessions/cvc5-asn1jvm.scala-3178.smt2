; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73040 () Bool)

(assert start!73040)

(declare-fun b!325023 () Bool)

(declare-fun e!234287 () Bool)

(declare-datatypes ((array!20948 0))(
  ( (array!20949 (arr!10192 (Array (_ BitVec 32) (_ BitVec 8))) (size!9100 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14362 0))(
  ( (BitStream!14363 (buf!8242 array!20948) (currentByte!15268 (_ BitVec 32)) (currentBit!15263 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14362)

(declare-fun lt!447419 () (_ BitVec 64))

(assert (=> b!325023 (= e!234287 (and (bvsle ((_ sign_extend 32) (size!9100 (buf!8242 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle lt!447419 #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!9100 (buf!8242 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt lt!447419 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!325023 (= lt!447419 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15268 thiss!877))))))

(declare-fun b!325022 () Bool)

(declare-fun res!266742 () Bool)

(assert (=> b!325022 (=> (not res!266742) (not e!234287))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!325022 (= res!266742 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9100 (buf!8242 thiss!877)) (currentByte!15268 thiss!877) (currentBit!15263 thiss!877))) (bitIndex!0 (size!9100 (buf!8242 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15268 thiss!877)) #b00000000000000000000000000000000)))))

(declare-fun res!266743 () Bool)

(assert (=> start!73040 (=> (not res!266743) (not e!234287))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73040 (= res!266743 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9100 (buf!8242 thiss!877))) ((_ sign_extend 32) (currentByte!15268 thiss!877)) ((_ sign_extend 32) (currentBit!15263 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73040 e!234287))

(declare-fun e!234286 () Bool)

(declare-fun inv!12 (BitStream!14362) Bool)

(assert (=> start!73040 (and (inv!12 thiss!877) e!234286)))

(declare-fun b!325024 () Bool)

(declare-fun array_inv!8652 (array!20948) Bool)

(assert (=> b!325024 (= e!234286 (array_inv!8652 (buf!8242 thiss!877)))))

(declare-fun b!325021 () Bool)

(declare-fun res!266741 () Bool)

(assert (=> b!325021 (=> (not res!266741) (not e!234287))))

(assert (=> b!325021 (= res!266741 (bvsge (currentBit!15263 thiss!877) #b00000000000000000000000000000111))))

(assert (= (and start!73040 res!266743) b!325021))

(assert (= (and b!325021 res!266741) b!325022))

(assert (= (and b!325022 res!266742) b!325023))

(assert (= start!73040 b!325024))

(declare-fun m!463039 () Bool)

(assert (=> b!325022 m!463039))

(declare-fun m!463041 () Bool)

(assert (=> b!325022 m!463041))

(declare-fun m!463043 () Bool)

(assert (=> start!73040 m!463043))

(declare-fun m!463045 () Bool)

(assert (=> start!73040 m!463045))

(declare-fun m!463047 () Bool)

(assert (=> b!325024 m!463047))

(push 1)

(assert (not start!73040))

(assert (not b!325024))

(assert (not b!325022))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106964 () Bool)

(assert (=> d!106964 (= (remainingBits!0 ((_ sign_extend 32) (size!9100 (buf!8242 thiss!877))) ((_ sign_extend 32) (currentByte!15268 thiss!877)) ((_ sign_extend 32) (currentBit!15263 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9100 (buf!8242 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15268 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15263 thiss!877)))))))

(assert (=> start!73040 d!106964))

(declare-fun d!106968 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106968 (= (inv!12 thiss!877) (invariant!0 (currentBit!15263 thiss!877) (currentByte!15268 thiss!877) (size!9100 (buf!8242 thiss!877))))))

(declare-fun bs!28160 () Bool)

(assert (= bs!28160 d!106968))

(declare-fun m!463075 () Bool)

(assert (=> bs!28160 m!463075))

(assert (=> start!73040 d!106968))

(declare-fun d!106972 () Bool)

(assert (=> d!106972 (= (array_inv!8652 (buf!8242 thiss!877)) (bvsge (size!9100 (buf!8242 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325024 d!106972))

(declare-fun d!106974 () Bool)

(declare-fun e!234313 () Bool)

(assert (=> d!106974 e!234313))

(declare-fun res!266774 () Bool)

(assert (=> d!106974 (=> (not res!266774) (not e!234313))))

(declare-fun lt!447463 () (_ BitVec 64))

(declare-fun lt!447464 () (_ BitVec 64))

(declare-fun lt!447462 () (_ BitVec 64))

(assert (=> d!106974 (= res!266774 (= lt!447464 (bvsub lt!447463 lt!447462)))))

(assert (=> d!106974 (or (= (bvand lt!447463 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447462 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447463 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447463 lt!447462) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106974 (= lt!447462 (remainingBits!0 ((_ sign_extend 32) (size!9100 (buf!8242 thiss!877))) ((_ sign_extend 32) (currentByte!15268 thiss!877)) ((_ sign_extend 32) (currentBit!15263 thiss!877))))))

(declare-fun lt!447466 () (_ BitVec 64))

(declare-fun lt!447467 () (_ BitVec 64))

(assert (=> d!106974 (= lt!447463 (bvmul lt!447466 lt!447467))))

(assert (=> d!106974 (or (= lt!447466 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447467 (bvsdiv (bvmul lt!447466 lt!447467) lt!447466)))))

(assert (=> d!106974 (= lt!447467 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106974 (= lt!447466 ((_ sign_extend 32) (size!9100 (buf!8242 thiss!877))))))

(assert (=> d!106974 (= lt!447464 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15268 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15263 thiss!877))))))

(assert (=> d!106974 (invariant!0 (currentBit!15263 thiss!877) (currentByte!15268 thiss!877) (size!9100 (buf!8242 thiss!877)))))

(assert (=> d!106974 (= (bitIndex!0 (size!9100 (buf!8242 thiss!877)) (currentByte!15268 thiss!877) (currentBit!15263 thiss!877)) lt!447464)))

(declare-fun b!325061 () Bool)

(declare-fun res!266775 () Bool)

(assert (=> b!325061 (=> (not res!266775) (not e!234313))))

(assert (=> b!325061 (= res!266775 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447464))))

(declare-fun b!325062 () Bool)

(declare-fun lt!447465 () (_ BitVec 64))

(assert (=> b!325062 (= e!234313 (bvsle lt!447464 (bvmul lt!447465 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325062 (or (= lt!447465 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447465 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447465)))))

(assert (=> b!325062 (= lt!447465 ((_ sign_extend 32) (size!9100 (buf!8242 thiss!877))))))

(assert (= (and d!106974 res!266774) b!325061))

(assert (= (and b!325061 res!266775) b!325062))

(assert (=> d!106974 m!463043))

(assert (=> d!106974 m!463075))

(assert (=> b!325022 d!106974))

(declare-fun d!106986 () Bool)

(declare-fun e!234314 () Bool)

(assert (=> d!106986 e!234314))

(declare-fun res!266776 () Bool)

(assert (=> d!106986 (=> (not res!266776) (not e!234314))))

(declare-fun lt!447470 () (_ BitVec 64))

(declare-fun lt!447468 () (_ BitVec 64))

(declare-fun lt!447469 () (_ BitVec 64))

(assert (=> d!106986 (= res!266776 (= lt!447470 (bvsub lt!447469 lt!447468)))))

(assert (=> d!106986 (or (= (bvand lt!447469 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447468 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447469 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447469 lt!447468) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106986 (= lt!447468 (remainingBits!0 ((_ sign_extend 32) (size!9100 (buf!8242 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15268 thiss!877))) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!447472 () (_ BitVec 64))

(declare-fun lt!447473 () (_ BitVec 64))

(assert (=> d!106986 (= lt!447469 (bvmul lt!447472 lt!447473))))

(assert (=> d!106986 (or (= lt!447472 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447473 (bvsdiv (bvmul lt!447472 lt!447473) lt!447472)))))

(assert (=> d!106986 (= lt!447473 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106986 (= lt!447472 ((_ sign_extend 32) (size!9100 (buf!8242 thiss!877))))))

(assert (=> d!106986 (= lt!447470 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15268 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(assert (=> d!106986 (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!15268 thiss!877)) (size!9100 (buf!8242 thiss!877)))))

(assert (=> d!106986 (= (bitIndex!0 (size!9100 (buf!8242 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15268 thiss!877)) #b00000000000000000000000000000000) lt!447470)))

(declare-fun b!325063 () Bool)

(declare-fun res!266777 () Bool)

(assert (=> b!325063 (=> (not res!266777) (not e!234314))))

(assert (=> b!325063 (= res!266777 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447470))))

(declare-fun b!325064 () Bool)

(declare-fun lt!447471 () (_ BitVec 64))

(assert (=> b!325064 (= e!234314 (bvsle lt!447470 (bvmul lt!447471 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325064 (or (= lt!447471 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447471 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447471)))))

(assert (=> b!325064 (= lt!447471 ((_ sign_extend 32) (size!9100 (buf!8242 thiss!877))))))

(assert (= (and d!106986 res!266776) b!325063))

(assert (= (and b!325063 res!266777) b!325064))

(declare-fun m!463079 () Bool)

(assert (=> d!106986 m!463079))

(declare-fun m!463081 () Bool)

(assert (=> d!106986 m!463081))

(assert (=> b!325022 d!106986))

(push 1)

(assert (not d!106974))

(assert (not d!106968))

(assert (not d!106986))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

