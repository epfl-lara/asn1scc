; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42460 () Bool)

(assert start!42460)

(declare-fun res!167903 () Bool)

(declare-fun e!137567 () Bool)

(assert (=> start!42460 (=> (not res!167903) (not e!137567))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!42460 (= res!167903 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42460 e!137567))

(assert (=> start!42460 true))

(declare-datatypes ((array!10147 0))(
  ( (array!10148 (arr!5399 (Array (_ BitVec 32) (_ BitVec 8))) (size!4469 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8046 0))(
  ( (BitStream!8047 (buf!4970 array!10147) (currentByte!9341 (_ BitVec 32)) (currentBit!9336 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8046)

(declare-fun e!137566 () Bool)

(declare-fun inv!12 (BitStream!8046) Bool)

(assert (=> start!42460 (and (inv!12 thiss!1204) e!137566)))

(declare-fun b!200554 () Bool)

(declare-fun res!167901 () Bool)

(assert (=> b!200554 (=> (not res!167901) (not e!137567))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!200554 (= res!167901 (invariant!0 (currentBit!9336 thiss!1204) (currentByte!9341 thiss!1204) (size!4469 (buf!4970 thiss!1204))))))

(declare-fun b!200555 () Bool)

(declare-fun res!167904 () Bool)

(assert (=> b!200555 (=> (not res!167904) (not e!137567))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200555 (= res!167904 (validate_offset_bits!1 ((_ sign_extend 32) (size!4469 (buf!4970 thiss!1204))) ((_ sign_extend 32) (currentByte!9341 thiss!1204)) ((_ sign_extend 32) (currentBit!9336 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!200556 () Bool)

(declare-fun array_inv!4210 (array!10147) Bool)

(assert (=> b!200556 (= e!137566 (array_inv!4210 (buf!4970 thiss!1204)))))

(declare-fun lt!313537 () (_ BitVec 64))

(declare-fun lt!313536 () (_ BitVec 64))

(declare-fun b!200557 () Bool)

(assert (=> b!200557 (= e!137567 (and (not (= lt!313536 (bvand ((_ sign_extend 32) i!590) #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!313536 (bvand (bvsub lt!313537 ((_ sign_extend 32) i!590)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!200557 (= lt!313536 (bvand lt!313537 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!200557 (= lt!313537 (bvadd (bitIndex!0 (size!4469 (buf!4970 thiss!1204)) (currentByte!9341 thiss!1204) (currentBit!9336 thiss!1204)) ((_ sign_extend 32) nBits!348)))))

(declare-fun b!200558 () Bool)

(declare-fun res!167902 () Bool)

(assert (=> b!200558 (=> (not res!167902) (not e!137567))))

(assert (=> b!200558 (= res!167902 (= i!590 nBits!348))))

(assert (= (and start!42460 res!167903) b!200555))

(assert (= (and b!200555 res!167904) b!200554))

(assert (= (and b!200554 res!167901) b!200558))

(assert (= (and b!200558 res!167902) b!200557))

(assert (= start!42460 b!200556))

(declare-fun m!311333 () Bool)

(assert (=> start!42460 m!311333))

(declare-fun m!311335 () Bool)

(assert (=> b!200557 m!311335))

(declare-fun m!311337 () Bool)

(assert (=> b!200556 m!311337))

(declare-fun m!311339 () Bool)

(assert (=> b!200555 m!311339))

(declare-fun m!311341 () Bool)

(assert (=> b!200554 m!311341))

(check-sat (not b!200557) (not b!200555) (not b!200554) (not b!200556) (not start!42460))
(check-sat)
(get-model)

(declare-fun d!68801 () Bool)

(assert (=> d!68801 (= (invariant!0 (currentBit!9336 thiss!1204) (currentByte!9341 thiss!1204) (size!4469 (buf!4970 thiss!1204))) (and (bvsge (currentBit!9336 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9336 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9341 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9341 thiss!1204) (size!4469 (buf!4970 thiss!1204))) (and (= (currentBit!9336 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9341 thiss!1204) (size!4469 (buf!4970 thiss!1204)))))))))

(assert (=> b!200554 d!68801))

(declare-fun d!68803 () Bool)

(assert (=> d!68803 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9336 thiss!1204) (currentByte!9341 thiss!1204) (size!4469 (buf!4970 thiss!1204))))))

(declare-fun bs!16946 () Bool)

(assert (= bs!16946 d!68803))

(assert (=> bs!16946 m!311341))

(assert (=> start!42460 d!68803))

(declare-fun d!68807 () Bool)

(declare-fun e!137584 () Bool)

(assert (=> d!68807 e!137584))

(declare-fun res!167931 () Bool)

(assert (=> d!68807 (=> (not res!167931) (not e!137584))))

(declare-fun lt!313586 () (_ BitVec 64))

(declare-fun lt!313591 () (_ BitVec 64))

(declare-fun lt!313589 () (_ BitVec 64))

(assert (=> d!68807 (= res!167931 (= lt!313586 (bvsub lt!313591 lt!313589)))))

(assert (=> d!68807 (or (= (bvand lt!313591 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!313589 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!313591 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!313591 lt!313589) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!68807 (= lt!313589 (remainingBits!0 ((_ sign_extend 32) (size!4469 (buf!4970 thiss!1204))) ((_ sign_extend 32) (currentByte!9341 thiss!1204)) ((_ sign_extend 32) (currentBit!9336 thiss!1204))))))

(declare-fun lt!313588 () (_ BitVec 64))

(declare-fun lt!313587 () (_ BitVec 64))

(assert (=> d!68807 (= lt!313591 (bvmul lt!313588 lt!313587))))

(assert (=> d!68807 (or (= lt!313588 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!313587 (bvsdiv (bvmul lt!313588 lt!313587) lt!313588)))))

(assert (=> d!68807 (= lt!313587 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68807 (= lt!313588 ((_ sign_extend 32) (size!4469 (buf!4970 thiss!1204))))))

(assert (=> d!68807 (= lt!313586 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9341 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9336 thiss!1204))))))

(assert (=> d!68807 (invariant!0 (currentBit!9336 thiss!1204) (currentByte!9341 thiss!1204) (size!4469 (buf!4970 thiss!1204)))))

(assert (=> d!68807 (= (bitIndex!0 (size!4469 (buf!4970 thiss!1204)) (currentByte!9341 thiss!1204) (currentBit!9336 thiss!1204)) lt!313586)))

(declare-fun b!200588 () Bool)

(declare-fun res!167932 () Bool)

(assert (=> b!200588 (=> (not res!167932) (not e!137584))))

(assert (=> b!200588 (= res!167932 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!313586))))

(declare-fun b!200589 () Bool)

(declare-fun lt!313590 () (_ BitVec 64))

(assert (=> b!200589 (= e!137584 (bvsle lt!313586 (bvmul lt!313590 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200589 (or (= lt!313590 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!313590 #b0000000000000000000000000000000000000000000000000000000000001000) lt!313590)))))

(assert (=> b!200589 (= lt!313590 ((_ sign_extend 32) (size!4469 (buf!4970 thiss!1204))))))

(assert (= (and d!68807 res!167931) b!200588))

(assert (= (and b!200588 res!167932) b!200589))

(declare-fun m!311357 () Bool)

(assert (=> d!68807 m!311357))

(assert (=> d!68807 m!311341))

(assert (=> b!200557 d!68807))

(declare-fun d!68815 () Bool)

(assert (=> d!68815 (= (array_inv!4210 (buf!4970 thiss!1204)) (bvsge (size!4469 (buf!4970 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!200556 d!68815))

(declare-fun d!68817 () Bool)

(assert (=> d!68817 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4469 (buf!4970 thiss!1204))) ((_ sign_extend 32) (currentByte!9341 thiss!1204)) ((_ sign_extend 32) (currentBit!9336 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4469 (buf!4970 thiss!1204))) ((_ sign_extend 32) (currentByte!9341 thiss!1204)) ((_ sign_extend 32) (currentBit!9336 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!16949 () Bool)

(assert (= bs!16949 d!68817))

(assert (=> bs!16949 m!311357))

(assert (=> b!200555 d!68817))

(check-sat (not d!68807) (not d!68817) (not d!68803))
