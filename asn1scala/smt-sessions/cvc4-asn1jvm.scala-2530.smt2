; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63926 () Bool)

(assert start!63926)

(declare-fun res!235469 () Bool)

(declare-fun e!203212 () Bool)

(assert (=> start!63926 (=> (not res!235469) (not e!203212))))

(declare-datatypes ((array!16669 0))(
  ( (array!16670 (arr!8184 (Array (_ BitVec 32) (_ BitVec 8))) (size!7188 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12746 0))(
  ( (BitStream!12747 (buf!7434 array!16669) (currentByte!13815 (_ BitVec 32)) (currentBit!13810 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12746)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63926 (= res!235469 (validate_offset_bits!1 ((_ sign_extend 32) (size!7188 (buf!7434 thiss!1929))) ((_ sign_extend 32) (currentByte!13815 thiss!1929)) ((_ sign_extend 32) (currentBit!13810 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13810 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63926 e!203212))

(declare-fun e!203213 () Bool)

(declare-fun inv!12 (BitStream!12746) Bool)

(assert (=> start!63926 (and (inv!12 thiss!1929) e!203213)))

(declare-fun b!284248 () Bool)

(declare-fun res!235468 () Bool)

(assert (=> b!284248 (=> (not res!235468) (not e!203212))))

(assert (=> b!284248 (= res!235468 (= (currentBit!13810 thiss!1929) #b00000000000000000000000000000000))))

(declare-fun b!284249 () Bool)

(declare-fun lt!418452 () (_ BitVec 64))

(assert (=> b!284249 (= e!203212 (bvsgt lt!418452 (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 lt!418452)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!284249 (= lt!418452 (bitIndex!0 (size!7188 (buf!7434 thiss!1929)) (currentByte!13815 thiss!1929) (currentBit!13810 thiss!1929)))))

(declare-fun b!284250 () Bool)

(declare-fun array_inv!6881 (array!16669) Bool)

(assert (=> b!284250 (= e!203213 (array_inv!6881 (buf!7434 thiss!1929)))))

(assert (= (and start!63926 res!235469) b!284248))

(assert (= (and b!284248 res!235468) b!284249))

(assert (= start!63926 b!284250))

(declare-fun m!417415 () Bool)

(assert (=> start!63926 m!417415))

(declare-fun m!417417 () Bool)

(assert (=> start!63926 m!417417))

(declare-fun m!417419 () Bool)

(assert (=> b!284249 m!417419))

(declare-fun m!417421 () Bool)

(assert (=> b!284250 m!417421))

(push 1)

(assert (not b!284249))

(assert (not start!63926))

(assert (not b!284250))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97900 () Bool)

(declare-fun e!203223 () Bool)

(assert (=> d!97900 e!203223))

(declare-fun res!235486 () Bool)

(assert (=> d!97900 (=> (not res!235486) (not e!203223))))

(declare-fun lt!418504 () (_ BitVec 64))

(declare-fun lt!418505 () (_ BitVec 64))

(declare-fun lt!418503 () (_ BitVec 64))

(assert (=> d!97900 (= res!235486 (= lt!418503 (bvsub lt!418505 lt!418504)))))

(assert (=> d!97900 (or (= (bvand lt!418505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418504 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!418505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!418505 lt!418504) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97900 (= lt!418504 (remainingBits!0 ((_ sign_extend 32) (size!7188 (buf!7434 thiss!1929))) ((_ sign_extend 32) (currentByte!13815 thiss!1929)) ((_ sign_extend 32) (currentBit!13810 thiss!1929))))))

(declare-fun lt!418501 () (_ BitVec 64))

(declare-fun lt!418502 () (_ BitVec 64))

(assert (=> d!97900 (= lt!418505 (bvmul lt!418501 lt!418502))))

(assert (=> d!97900 (or (= lt!418501 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!418502 (bvsdiv (bvmul lt!418501 lt!418502) lt!418501)))))

(assert (=> d!97900 (= lt!418502 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!97900 (= lt!418501 ((_ sign_extend 32) (size!7188 (buf!7434 thiss!1929))))))

(assert (=> d!97900 (= lt!418503 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13815 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13810 thiss!1929))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97900 (invariant!0 (currentBit!13810 thiss!1929) (currentByte!13815 thiss!1929) (size!7188 (buf!7434 thiss!1929)))))

(assert (=> d!97900 (= (bitIndex!0 (size!7188 (buf!7434 thiss!1929)) (currentByte!13815 thiss!1929) (currentBit!13810 thiss!1929)) lt!418503)))

(declare-fun b!284267 () Bool)

(declare-fun res!235487 () Bool)

(assert (=> b!284267 (=> (not res!235487) (not e!203223))))

(assert (=> b!284267 (= res!235487 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!418503))))

(declare-fun b!284268 () Bool)

(declare-fun lt!418506 () (_ BitVec 64))

(assert (=> b!284268 (= e!203223 (bvsle lt!418503 (bvmul lt!418506 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!284268 (or (= lt!418506 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!418506 #b0000000000000000000000000000000000000000000000000000000000001000) lt!418506)))))

(assert (=> b!284268 (= lt!418506 ((_ sign_extend 32) (size!7188 (buf!7434 thiss!1929))))))

(assert (= (and d!97900 res!235486) b!284267))

(assert (= (and b!284267 res!235487) b!284268))

(declare-fun m!417431 () Bool)

(assert (=> d!97900 m!417431))

(declare-fun m!417433 () Bool)

(assert (=> d!97900 m!417433))

(assert (=> b!284249 d!97900))

(declare-fun d!97904 () Bool)

(assert (=> d!97904 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7188 (buf!7434 thiss!1929))) ((_ sign_extend 32) (currentByte!13815 thiss!1929)) ((_ sign_extend 32) (currentBit!13810 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13810 thiss!1929)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7188 (buf!7434 thiss!1929))) ((_ sign_extend 32) (currentByte!13815 thiss!1929)) ((_ sign_extend 32) (currentBit!13810 thiss!1929))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13810 thiss!1929)) #b00000000000000000000000000000111))))))

(declare-fun bs!24748 () Bool)

(assert (= bs!24748 d!97904))

(assert (=> bs!24748 m!417431))

(assert (=> start!63926 d!97904))

(declare-fun d!97906 () Bool)

(assert (=> d!97906 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13810 thiss!1929) (currentByte!13815 thiss!1929) (size!7188 (buf!7434 thiss!1929))))))

(declare-fun bs!24749 () Bool)

(assert (= bs!24749 d!97906))

(assert (=> bs!24749 m!417433))

(assert (=> start!63926 d!97906))

(declare-fun d!97908 () Bool)

(assert (=> d!97908 (= (array_inv!6881 (buf!7434 thiss!1929)) (bvsge (size!7188 (buf!7434 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!284250 d!97908))

(push 1)

(assert (not d!97900))

(assert (not d!97906))

(assert (not d!97904))

(check-sat)

(pop 1)

(push 1)

(check-sat)

