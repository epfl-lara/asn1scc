; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73384 () Bool)

(assert start!73384)

(declare-fun res!267135 () Bool)

(declare-fun e!234747 () Bool)

(assert (=> start!73384 (=> (not res!267135) (not e!234747))))

(declare-fun lt!448007 () (_ BitVec 64))

(declare-datatypes ((array!21061 0))(
  ( (array!21062 (arr!10232 (Array (_ BitVec 32) (_ BitVec 8))) (size!9140 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14442 0))(
  ( (BitStream!14443 (buf!8282 array!21061) (currentByte!15374 (_ BitVec 32)) (currentBit!15369 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14442)

(assert (=> start!73384 (= res!267135 (and (bvsgt lt!448007 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (currentBit!15369 thiss!877) #b00000000000000000000000000000111)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73384 (= lt!448007 (remainingBits!0 ((_ sign_extend 32) (size!9140 (buf!8282 thiss!877))) ((_ sign_extend 32) (currentByte!15374 thiss!877)) ((_ sign_extend 32) (currentBit!15369 thiss!877))))))

(assert (=> start!73384 e!234747))

(declare-fun e!234749 () Bool)

(declare-fun inv!12 (BitStream!14442) Bool)

(assert (=> start!73384 (and (inv!12 thiss!877) e!234749)))

(declare-fun b!325535 () Bool)

(declare-fun e!234750 () Bool)

(assert (=> b!325535 (= e!234747 e!234750)))

(declare-fun res!267136 () Bool)

(assert (=> b!325535 (=> res!267136 e!234750)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!325535 (= res!267136 (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9140 (buf!8282 thiss!877)) (currentByte!15374 thiss!877) (currentBit!15369 thiss!877))) (bitIndex!0 (size!9140 (buf!8282 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15374 thiss!877)) #b00000000000000000000000000000000))))))

(declare-fun b!325536 () Bool)

(assert (=> b!325536 (= e!234750 (not (= (bvsub lt!448007 (remainingBits!0 ((_ sign_extend 32) (size!9140 (buf!8282 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15374 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!325537 () Bool)

(declare-fun array_inv!8692 (array!21061) Bool)

(assert (=> b!325537 (= e!234749 (array_inv!8692 (buf!8282 thiss!877)))))

(assert (= (and start!73384 res!267135) b!325535))

(assert (= (and b!325535 (not res!267136)) b!325536))

(assert (= start!73384 b!325537))

(declare-fun m!463531 () Bool)

(assert (=> start!73384 m!463531))

(declare-fun m!463533 () Bool)

(assert (=> start!73384 m!463533))

(declare-fun m!463535 () Bool)

(assert (=> b!325535 m!463535))

(declare-fun m!463537 () Bool)

(assert (=> b!325535 m!463537))

(declare-fun m!463539 () Bool)

(assert (=> b!325536 m!463539))

(declare-fun m!463541 () Bool)

(assert (=> b!325537 m!463541))

(check-sat (not b!325537) (not b!325536) (not b!325535) (not start!73384))
(check-sat)
(get-model)

(declare-fun d!107334 () Bool)

(assert (=> d!107334 (= (array_inv!8692 (buf!8282 thiss!877)) (bvsge (size!9140 (buf!8282 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325537 d!107334))

(declare-fun d!107336 () Bool)

(assert (=> d!107336 (= (remainingBits!0 ((_ sign_extend 32) (size!9140 (buf!8282 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15374 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsub (bvmul ((_ sign_extend 32) (size!9140 (buf!8282 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15374 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!325536 d!107336))

(declare-fun d!107344 () Bool)

(declare-fun e!234767 () Bool)

(assert (=> d!107344 e!234767))

(declare-fun res!267152 () Bool)

(assert (=> d!107344 (=> (not res!267152) (not e!234767))))

(declare-fun lt!448036 () (_ BitVec 64))

(declare-fun lt!448037 () (_ BitVec 64))

(declare-fun lt!448040 () (_ BitVec 64))

(assert (=> d!107344 (= res!267152 (= lt!448036 (bvsub lt!448040 lt!448037)))))

(assert (=> d!107344 (or (= (bvand lt!448040 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!448037 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!448040 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!448040 lt!448037) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107344 (= lt!448037 (remainingBits!0 ((_ sign_extend 32) (size!9140 (buf!8282 thiss!877))) ((_ sign_extend 32) (currentByte!15374 thiss!877)) ((_ sign_extend 32) (currentBit!15369 thiss!877))))))

(declare-fun lt!448035 () (_ BitVec 64))

(declare-fun lt!448039 () (_ BitVec 64))

(assert (=> d!107344 (= lt!448040 (bvmul lt!448035 lt!448039))))

(assert (=> d!107344 (or (= lt!448035 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!448039 (bvsdiv (bvmul lt!448035 lt!448039) lt!448035)))))

(assert (=> d!107344 (= lt!448039 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107344 (= lt!448035 ((_ sign_extend 32) (size!9140 (buf!8282 thiss!877))))))

(assert (=> d!107344 (= lt!448036 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15374 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15369 thiss!877))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!107344 (invariant!0 (currentBit!15369 thiss!877) (currentByte!15374 thiss!877) (size!9140 (buf!8282 thiss!877)))))

(assert (=> d!107344 (= (bitIndex!0 (size!9140 (buf!8282 thiss!877)) (currentByte!15374 thiss!877) (currentBit!15369 thiss!877)) lt!448036)))

(declare-fun b!325555 () Bool)

(declare-fun res!267151 () Bool)

(assert (=> b!325555 (=> (not res!267151) (not e!234767))))

(assert (=> b!325555 (= res!267151 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!448036))))

(declare-fun b!325556 () Bool)

(declare-fun lt!448038 () (_ BitVec 64))

(assert (=> b!325556 (= e!234767 (bvsle lt!448036 (bvmul lt!448038 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325556 (or (= lt!448038 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!448038 #b0000000000000000000000000000000000000000000000000000000000001000) lt!448038)))))

(assert (=> b!325556 (= lt!448038 ((_ sign_extend 32) (size!9140 (buf!8282 thiss!877))))))

(assert (= (and d!107344 res!267152) b!325555))

(assert (= (and b!325555 res!267151) b!325556))

(assert (=> d!107344 m!463531))

(declare-fun m!463555 () Bool)

(assert (=> d!107344 m!463555))

(assert (=> b!325535 d!107344))

(declare-fun d!107346 () Bool)

(declare-fun e!234768 () Bool)

(assert (=> d!107346 e!234768))

(declare-fun res!267154 () Bool)

(assert (=> d!107346 (=> (not res!267154) (not e!234768))))

(declare-fun lt!448043 () (_ BitVec 64))

(declare-fun lt!448042 () (_ BitVec 64))

(declare-fun lt!448046 () (_ BitVec 64))

(assert (=> d!107346 (= res!267154 (= lt!448042 (bvsub lt!448046 lt!448043)))))

(assert (=> d!107346 (or (= (bvand lt!448046 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!448043 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!448046 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!448046 lt!448043) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107346 (= lt!448043 (remainingBits!0 ((_ sign_extend 32) (size!9140 (buf!8282 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15374 thiss!877))) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!448041 () (_ BitVec 64))

(declare-fun lt!448045 () (_ BitVec 64))

(assert (=> d!107346 (= lt!448046 (bvmul lt!448041 lt!448045))))

(assert (=> d!107346 (or (= lt!448041 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!448045 (bvsdiv (bvmul lt!448041 lt!448045) lt!448041)))))

(assert (=> d!107346 (= lt!448045 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107346 (= lt!448041 ((_ sign_extend 32) (size!9140 (buf!8282 thiss!877))))))

(assert (=> d!107346 (= lt!448042 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15374 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(assert (=> d!107346 (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!15374 thiss!877)) (size!9140 (buf!8282 thiss!877)))))

(assert (=> d!107346 (= (bitIndex!0 (size!9140 (buf!8282 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15374 thiss!877)) #b00000000000000000000000000000000) lt!448042)))

(declare-fun b!325557 () Bool)

(declare-fun res!267153 () Bool)

(assert (=> b!325557 (=> (not res!267153) (not e!234768))))

(assert (=> b!325557 (= res!267153 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!448042))))

(declare-fun b!325558 () Bool)

(declare-fun lt!448044 () (_ BitVec 64))

(assert (=> b!325558 (= e!234768 (bvsle lt!448042 (bvmul lt!448044 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325558 (or (= lt!448044 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!448044 #b0000000000000000000000000000000000000000000000000000000000001000) lt!448044)))))

(assert (=> b!325558 (= lt!448044 ((_ sign_extend 32) (size!9140 (buf!8282 thiss!877))))))

(assert (= (and d!107346 res!267154) b!325557))

(assert (= (and b!325557 res!267153) b!325558))

(declare-fun m!463557 () Bool)

(assert (=> d!107346 m!463557))

(declare-fun m!463559 () Bool)

(assert (=> d!107346 m!463559))

(assert (=> b!325535 d!107346))

(declare-fun d!107348 () Bool)

(assert (=> d!107348 (= (remainingBits!0 ((_ sign_extend 32) (size!9140 (buf!8282 thiss!877))) ((_ sign_extend 32) (currentByte!15374 thiss!877)) ((_ sign_extend 32) (currentBit!15369 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9140 (buf!8282 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15374 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15369 thiss!877)))))))

(assert (=> start!73384 d!107348))

(declare-fun d!107350 () Bool)

(assert (=> d!107350 (= (inv!12 thiss!877) (invariant!0 (currentBit!15369 thiss!877) (currentByte!15374 thiss!877) (size!9140 (buf!8282 thiss!877))))))

(declare-fun bs!28241 () Bool)

(assert (= bs!28241 d!107350))

(assert (=> bs!28241 m!463555))

(assert (=> start!73384 d!107350))

(check-sat (not d!107350) (not d!107346) (not d!107344))
(check-sat)
(get-model)

(declare-fun d!107370 () Bool)

(assert (=> d!107370 (= (invariant!0 (currentBit!15369 thiss!877) (currentByte!15374 thiss!877) (size!9140 (buf!8282 thiss!877))) (and (bvsge (currentBit!15369 thiss!877) #b00000000000000000000000000000000) (bvslt (currentBit!15369 thiss!877) #b00000000000000000000000000001000) (bvsge (currentByte!15374 thiss!877) #b00000000000000000000000000000000) (or (bvslt (currentByte!15374 thiss!877) (size!9140 (buf!8282 thiss!877))) (and (= (currentBit!15369 thiss!877) #b00000000000000000000000000000000) (= (currentByte!15374 thiss!877) (size!9140 (buf!8282 thiss!877)))))))))

(assert (=> d!107350 d!107370))

(declare-fun d!107372 () Bool)

(assert (=> d!107372 (= (remainingBits!0 ((_ sign_extend 32) (size!9140 (buf!8282 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15374 thiss!877))) ((_ sign_extend 32) #b00000000000000000000000000000000)) (bvsub (bvmul ((_ sign_extend 32) (size!9140 (buf!8282 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15374 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) #b00000000000000000000000000000000))))))

(assert (=> d!107346 d!107372))

(declare-fun d!107374 () Bool)

(assert (=> d!107374 (= (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!15374 thiss!877)) (size!9140 (buf!8282 thiss!877))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 #b00000000000000000000000000001000) (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!15374 thiss!877)) #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!15374 thiss!877)) (size!9140 (buf!8282 thiss!877))) (and (= #b00000000000000000000000000000000 #b00000000000000000000000000000000) (= (bvadd #b00000000000000000000000000000001 (currentByte!15374 thiss!877)) (size!9140 (buf!8282 thiss!877)))))))))

(assert (=> d!107346 d!107374))

(assert (=> d!107344 d!107348))

(assert (=> d!107344 d!107370))

(check-sat)
