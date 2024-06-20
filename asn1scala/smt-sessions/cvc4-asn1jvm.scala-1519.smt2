; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42462 () Bool)

(assert start!42462)

(declare-fun b!200569 () Bool)

(declare-fun res!167916 () Bool)

(declare-fun e!137575 () Bool)

(assert (=> b!200569 (=> (not res!167916) (not e!137575))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!10149 0))(
  ( (array!10150 (arr!5400 (Array (_ BitVec 32) (_ BitVec 8))) (size!4470 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8048 0))(
  ( (BitStream!8049 (buf!4971 array!10149) (currentByte!9342 (_ BitVec 32)) (currentBit!9337 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8048)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200569 (= res!167916 (validate_offset_bits!1 ((_ sign_extend 32) (size!4470 (buf!4971 thiss!1204))) ((_ sign_extend 32) (currentByte!9342 thiss!1204)) ((_ sign_extend 32) (currentBit!9337 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!200570 () Bool)

(declare-fun res!167913 () Bool)

(assert (=> b!200570 (=> (not res!167913) (not e!137575))))

(assert (=> b!200570 (= res!167913 (= i!590 nBits!348))))

(declare-fun b!200571 () Bool)

(declare-fun res!167914 () Bool)

(assert (=> b!200571 (=> (not res!167914) (not e!137575))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!200571 (= res!167914 (invariant!0 (currentBit!9337 thiss!1204) (currentByte!9342 thiss!1204) (size!4470 (buf!4971 thiss!1204))))))

(declare-fun res!167915 () Bool)

(assert (=> start!42462 (=> (not res!167915) (not e!137575))))

(assert (=> start!42462 (= res!167915 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42462 e!137575))

(assert (=> start!42462 true))

(declare-fun e!137574 () Bool)

(declare-fun inv!12 (BitStream!8048) Bool)

(assert (=> start!42462 (and (inv!12 thiss!1204) e!137574)))

(declare-fun b!200572 () Bool)

(declare-fun array_inv!4211 (array!10149) Bool)

(assert (=> b!200572 (= e!137574 (array_inv!4211 (buf!4971 thiss!1204)))))

(declare-fun lt!313542 () (_ BitVec 64))

(declare-fun lt!313543 () (_ BitVec 64))

(declare-fun b!200573 () Bool)

(assert (=> b!200573 (= e!137575 (and (not (= lt!313543 (bvand ((_ sign_extend 32) i!590) #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!313543 (bvand (bvsub lt!313542 ((_ sign_extend 32) i!590)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!200573 (= lt!313543 (bvand lt!313542 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!200573 (= lt!313542 (bvadd (bitIndex!0 (size!4470 (buf!4971 thiss!1204)) (currentByte!9342 thiss!1204) (currentBit!9337 thiss!1204)) ((_ sign_extend 32) nBits!348)))))

(assert (= (and start!42462 res!167915) b!200569))

(assert (= (and b!200569 res!167916) b!200571))

(assert (= (and b!200571 res!167914) b!200570))

(assert (= (and b!200570 res!167913) b!200573))

(assert (= start!42462 b!200572))

(declare-fun m!311343 () Bool)

(assert (=> b!200572 m!311343))

(declare-fun m!311345 () Bool)

(assert (=> start!42462 m!311345))

(declare-fun m!311347 () Bool)

(assert (=> b!200571 m!311347))

(declare-fun m!311349 () Bool)

(assert (=> b!200569 m!311349))

(declare-fun m!311351 () Bool)

(assert (=> b!200573 m!311351))

(push 1)

(assert (not b!200573))

(assert (not b!200569))

(assert (not b!200571))

(assert (not start!42462))

(assert (not b!200572))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!68805 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!68805 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4470 (buf!4971 thiss!1204))) ((_ sign_extend 32) (currentByte!9342 thiss!1204)) ((_ sign_extend 32) (currentBit!9337 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4470 (buf!4971 thiss!1204))) ((_ sign_extend 32) (currentByte!9342 thiss!1204)) ((_ sign_extend 32) (currentBit!9337 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!16947 () Bool)

(assert (= bs!16947 d!68805))

(declare-fun m!311355 () Bool)

(assert (=> bs!16947 m!311355))

(assert (=> b!200569 d!68805))

(declare-fun d!68809 () Bool)

(assert (=> d!68809 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9337 thiss!1204) (currentByte!9342 thiss!1204) (size!4470 (buf!4971 thiss!1204))))))

(declare-fun bs!16948 () Bool)

(assert (= bs!16948 d!68809))

(assert (=> bs!16948 m!311347))

(assert (=> start!42462 d!68809))

(declare-fun d!68813 () Bool)

(declare-fun e!137585 () Bool)

(assert (=> d!68813 e!137585))

(declare-fun res!167934 () Bool)

(assert (=> d!68813 (=> (not res!167934) (not e!137585))))

(declare-fun lt!313597 () (_ BitVec 64))

(declare-fun lt!313592 () (_ BitVec 64))

(declare-fun lt!313595 () (_ BitVec 64))

(assert (=> d!68813 (= res!167934 (= lt!313592 (bvsub lt!313595 lt!313597)))))

(assert (=> d!68813 (or (= (bvand lt!313595 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!313597 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!313595 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!313595 lt!313597) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68813 (= lt!313597 (remainingBits!0 ((_ sign_extend 32) (size!4470 (buf!4971 thiss!1204))) ((_ sign_extend 32) (currentByte!9342 thiss!1204)) ((_ sign_extend 32) (currentBit!9337 thiss!1204))))))

(declare-fun lt!313596 () (_ BitVec 64))

(declare-fun lt!313594 () (_ BitVec 64))

(assert (=> d!68813 (= lt!313595 (bvmul lt!313596 lt!313594))))

(assert (=> d!68813 (or (= lt!313596 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!313594 (bvsdiv (bvmul lt!313596 lt!313594) lt!313596)))))

(assert (=> d!68813 (= lt!313594 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68813 (= lt!313596 ((_ sign_extend 32) (size!4470 (buf!4971 thiss!1204))))))

(assert (=> d!68813 (= lt!313592 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9342 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9337 thiss!1204))))))

(assert (=> d!68813 (invariant!0 (currentBit!9337 thiss!1204) (currentByte!9342 thiss!1204) (size!4470 (buf!4971 thiss!1204)))))

(assert (=> d!68813 (= (bitIndex!0 (size!4470 (buf!4971 thiss!1204)) (currentByte!9342 thiss!1204) (currentBit!9337 thiss!1204)) lt!313592)))

(declare-fun b!200590 () Bool)

(declare-fun res!167933 () Bool)

(assert (=> b!200590 (=> (not res!167933) (not e!137585))))

(assert (=> b!200590 (= res!167933 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!313592))))

(declare-fun b!200591 () Bool)

(declare-fun lt!313593 () (_ BitVec 64))

(assert (=> b!200591 (= e!137585 (bvsle lt!313592 (bvmul lt!313593 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200591 (or (= lt!313593 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!313593 #b0000000000000000000000000000000000000000000000000000000000001000) lt!313593)))))

(assert (=> b!200591 (= lt!313593 ((_ sign_extend 32) (size!4470 (buf!4971 thiss!1204))))))

(assert (= (and d!68813 res!167934) b!200590))

(assert (= (and b!200590 res!167933) b!200591))

(assert (=> d!68813 m!311355))

(assert (=> d!68813 m!311347))

(assert (=> b!200573 d!68813))

(declare-fun d!68819 () Bool)

(assert (=> d!68819 (= (array_inv!4211 (buf!4971 thiss!1204)) (bvsge (size!4470 (buf!4971 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!200572 d!68819))

(declare-fun d!68821 () Bool)

(assert (=> d!68821 (= (invariant!0 (currentBit!9337 thiss!1204) (currentByte!9342 thiss!1204) (size!4470 (buf!4971 thiss!1204))) (and (bvsge (currentBit!9337 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9337 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9342 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9342 thiss!1204) (size!4470 (buf!4971 thiss!1204))) (and (= (currentBit!9337 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9342 thiss!1204) (size!4470 (buf!4971 thiss!1204)))))))))

(assert (=> b!200571 d!68821))

(push 1)

(assert (not d!68813))

(assert (not d!68805))

(assert (not d!68809))

(check-sat)

(pop 1)

(push 1)

(check-sat)

