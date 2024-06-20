; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42458 () Bool)

(assert start!42458)

(declare-fun b!200539 () Bool)

(declare-fun res!167891 () Bool)

(declare-fun e!137558 () Bool)

(assert (=> b!200539 (=> (not res!167891) (not e!137558))))

(declare-datatypes ((array!10145 0))(
  ( (array!10146 (arr!5398 (Array (_ BitVec 32) (_ BitVec 8))) (size!4468 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8044 0))(
  ( (BitStream!8045 (buf!4969 array!10145) (currentByte!9340 (_ BitVec 32)) (currentBit!9335 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8044)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!200539 (= res!167891 (invariant!0 (currentBit!9335 thiss!1204) (currentByte!9340 thiss!1204) (size!4468 (buf!4969 thiss!1204))))))

(declare-fun b!200540 () Bool)

(declare-fun e!137557 () Bool)

(declare-fun array_inv!4209 (array!10145) Bool)

(assert (=> b!200540 (= e!137557 (array_inv!4209 (buf!4969 thiss!1204)))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!313531 () (_ BitVec 64))

(declare-fun b!200541 () Bool)

(declare-fun lt!313530 () (_ BitVec 64))

(assert (=> b!200541 (= e!137558 (and (not (= lt!313531 (bvand ((_ sign_extend 32) i!590) #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!313531 (bvand (bvsub lt!313530 ((_ sign_extend 32) i!590)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!200541 (= lt!313531 (bvand lt!313530 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!200541 (= lt!313530 (bvadd (bitIndex!0 (size!4468 (buf!4969 thiss!1204)) (currentByte!9340 thiss!1204) (currentBit!9335 thiss!1204)) ((_ sign_extend 32) nBits!348)))))

(declare-fun b!200543 () Bool)

(declare-fun res!167890 () Bool)

(assert (=> b!200543 (=> (not res!167890) (not e!137558))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200543 (= res!167890 (validate_offset_bits!1 ((_ sign_extend 32) (size!4468 (buf!4969 thiss!1204))) ((_ sign_extend 32) (currentByte!9340 thiss!1204)) ((_ sign_extend 32) (currentBit!9335 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!200542 () Bool)

(declare-fun res!167892 () Bool)

(assert (=> b!200542 (=> (not res!167892) (not e!137558))))

(assert (=> b!200542 (= res!167892 (= i!590 nBits!348))))

(declare-fun res!167889 () Bool)

(assert (=> start!42458 (=> (not res!167889) (not e!137558))))

(assert (=> start!42458 (= res!167889 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42458 e!137558))

(assert (=> start!42458 true))

(declare-fun inv!12 (BitStream!8044) Bool)

(assert (=> start!42458 (and (inv!12 thiss!1204) e!137557)))

(assert (= (and start!42458 res!167889) b!200543))

(assert (= (and b!200543 res!167890) b!200539))

(assert (= (and b!200539 res!167891) b!200542))

(assert (= (and b!200542 res!167892) b!200541))

(assert (= start!42458 b!200540))

(declare-fun m!311323 () Bool)

(assert (=> b!200540 m!311323))

(declare-fun m!311325 () Bool)

(assert (=> b!200543 m!311325))

(declare-fun m!311327 () Bool)

(assert (=> start!42458 m!311327))

(declare-fun m!311329 () Bool)

(assert (=> b!200539 m!311329))

(declare-fun m!311331 () Bool)

(assert (=> b!200541 m!311331))

(push 1)

(assert (not b!200539))

(assert (not b!200540))

(assert (not b!200543))

(assert (not start!42458))

(assert (not b!200541))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!68793 () Bool)

(assert (=> d!68793 (= (invariant!0 (currentBit!9335 thiss!1204) (currentByte!9340 thiss!1204) (size!4468 (buf!4969 thiss!1204))) (and (bvsge (currentBit!9335 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9335 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9340 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9340 thiss!1204) (size!4468 (buf!4969 thiss!1204))) (and (= (currentBit!9335 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9340 thiss!1204) (size!4468 (buf!4969 thiss!1204)))))))))

(assert (=> b!200539 d!68793))

(declare-fun d!68795 () Bool)

(assert (=> d!68795 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9335 thiss!1204) (currentByte!9340 thiss!1204) (size!4468 (buf!4969 thiss!1204))))))

(declare-fun bs!16944 () Bool)

(assert (= bs!16944 d!68795))

(assert (=> bs!16944 m!311329))

(assert (=> start!42458 d!68795))

(declare-fun d!68797 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!68797 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4468 (buf!4969 thiss!1204))) ((_ sign_extend 32) (currentByte!9340 thiss!1204)) ((_ sign_extend 32) (currentBit!9335 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4468 (buf!4969 thiss!1204))) ((_ sign_extend 32) (currentByte!9340 thiss!1204)) ((_ sign_extend 32) (currentBit!9335 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!16945 () Bool)

(assert (= bs!16945 d!68797))

(declare-fun m!311353 () Bool)

(assert (=> bs!16945 m!311353))

(assert (=> b!200543 d!68797))

(declare-fun d!68799 () Bool)

(declare-fun e!137579 () Bool)

(assert (=> d!68799 e!137579))

(declare-fun res!167922 () Bool)

(assert (=> d!68799 (=> (not res!167922) (not e!137579))))

(declare-fun lt!313559 () (_ BitVec 64))

(declare-fun lt!313558 () (_ BitVec 64))

(declare-fun lt!313557 () (_ BitVec 64))

(assert (=> d!68799 (= res!167922 (= lt!313557 (bvsub lt!313558 lt!313559)))))

(assert (=> d!68799 (or (= (bvand lt!313558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!313559 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!313558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!313558 lt!313559) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68799 (= lt!313559 (remainingBits!0 ((_ sign_extend 32) (size!4468 (buf!4969 thiss!1204))) ((_ sign_extend 32) (currentByte!9340 thiss!1204)) ((_ sign_extend 32) (currentBit!9335 thiss!1204))))))

(declare-fun lt!313561 () (_ BitVec 64))

(declare-fun lt!313560 () (_ BitVec 64))

(assert (=> d!68799 (= lt!313558 (bvmul lt!313561 lt!313560))))

(assert (=> d!68799 (or (= lt!313561 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!313560 (bvsdiv (bvmul lt!313561 lt!313560) lt!313561)))))

(assert (=> d!68799 (= lt!313560 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68799 (= lt!313561 ((_ sign_extend 32) (size!4468 (buf!4969 thiss!1204))))))

(assert (=> d!68799 (= lt!313557 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9340 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9335 thiss!1204))))))

(assert (=> d!68799 (invariant!0 (currentBit!9335 thiss!1204) (currentByte!9340 thiss!1204) (size!4468 (buf!4969 thiss!1204)))))

(assert (=> d!68799 (= (bitIndex!0 (size!4468 (buf!4969 thiss!1204)) (currentByte!9340 thiss!1204) (currentBit!9335 thiss!1204)) lt!313557)))

(declare-fun b!200578 () Bool)

(declare-fun res!167921 () Bool)

(assert (=> b!200578 (=> (not res!167921) (not e!137579))))

(assert (=> b!200578 (= res!167921 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!313557))))

(declare-fun b!200579 () Bool)

(declare-fun lt!313556 () (_ BitVec 64))

(assert (=> b!200579 (= e!137579 (bvsle lt!313557 (bvmul lt!313556 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200579 (or (= lt!313556 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!313556 #b0000000000000000000000000000000000000000000000000000000000001000) lt!313556)))))

(assert (=> b!200579 (= lt!313556 ((_ sign_extend 32) (size!4468 (buf!4969 thiss!1204))))))

(assert (= (and d!68799 res!167922) b!200578))

(assert (= (and b!200578 res!167921) b!200579))

(assert (=> d!68799 m!311353))

(assert (=> d!68799 m!311329))

(assert (=> b!200541 d!68799))

(declare-fun d!68811 () Bool)

(assert (=> d!68811 (= (array_inv!4209 (buf!4969 thiss!1204)) (bvsge (size!4468 (buf!4969 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!200540 d!68811))

(push 1)

(assert (not d!68797))

(assert (not d!68799))

(assert (not d!68795))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

