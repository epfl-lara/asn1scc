; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42426 () Bool)

(assert start!42426)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!313471 () (_ BitVec 64))

(declare-fun lt!313470 () (_ BitVec 64))

(declare-fun e!137538 () Bool)

(declare-fun b!200506 () Bool)

(assert (=> b!200506 (= e!137538 (and (= lt!313470 (bvand ((_ sign_extend 32) nBits!348) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!313470 (bvand (bvadd lt!313471 ((_ sign_extend 32) nBits!348)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!200506 (= lt!313470 (bvand lt!313471 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!10140 0))(
  ( (array!10141 (arr!5397 (Array (_ BitVec 32) (_ BitVec 8))) (size!4467 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8042 0))(
  ( (BitStream!8043 (buf!4968 array!10140) (currentByte!9330 (_ BitVec 32)) (currentBit!9325 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8042)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!200506 (= lt!313471 (bitIndex!0 (size!4467 (buf!4968 thiss!1204)) (currentByte!9330 thiss!1204) (currentBit!9325 thiss!1204)))))

(declare-fun b!200507 () Bool)

(declare-fun res!167861 () Bool)

(assert (=> b!200507 (=> (not res!167861) (not e!137538))))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!200507 (= res!167861 (= i!590 nBits!348))))

(declare-fun res!167862 () Bool)

(assert (=> start!42426 (=> (not res!167862) (not e!137538))))

(assert (=> start!42426 (= res!167862 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42426 e!137538))

(assert (=> start!42426 true))

(declare-fun e!137540 () Bool)

(declare-fun inv!12 (BitStream!8042) Bool)

(assert (=> start!42426 (and (inv!12 thiss!1204) e!137540)))

(declare-fun b!200508 () Bool)

(declare-fun res!167859 () Bool)

(assert (=> b!200508 (=> (not res!167859) (not e!137538))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!200508 (= res!167859 (invariant!0 (currentBit!9325 thiss!1204) (currentByte!9330 thiss!1204) (size!4467 (buf!4968 thiss!1204))))))

(declare-fun b!200509 () Bool)

(declare-fun array_inv!4208 (array!10140) Bool)

(assert (=> b!200509 (= e!137540 (array_inv!4208 (buf!4968 thiss!1204)))))

(declare-fun b!200510 () Bool)

(declare-fun res!167860 () Bool)

(assert (=> b!200510 (=> (not res!167860) (not e!137538))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200510 (= res!167860 (validate_offset_bits!1 ((_ sign_extend 32) (size!4467 (buf!4968 thiss!1204))) ((_ sign_extend 32) (currentByte!9330 thiss!1204)) ((_ sign_extend 32) (currentBit!9325 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(assert (= (and start!42426 res!167862) b!200510))

(assert (= (and b!200510 res!167860) b!200508))

(assert (= (and b!200508 res!167859) b!200507))

(assert (= (and b!200507 res!167861) b!200506))

(assert (= start!42426 b!200509))

(declare-fun m!311307 () Bool)

(assert (=> b!200510 m!311307))

(declare-fun m!311309 () Bool)

(assert (=> b!200509 m!311309))

(declare-fun m!311311 () Bool)

(assert (=> b!200508 m!311311))

(declare-fun m!311313 () Bool)

(assert (=> b!200506 m!311313))

(declare-fun m!311315 () Bool)

(assert (=> start!42426 m!311315))

(push 1)

(assert (not b!200509))

(assert (not b!200508))

(assert (not b!200506))

(assert (not b!200510))

(assert (not start!42426))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!68775 () Bool)

(declare-fun e!137549 () Bool)

(assert (=> d!68775 e!137549))

(declare-fun res!167879 () Bool)

(assert (=> d!68775 (=> (not res!167879) (not e!137549))))

(declare-fun lt!313520 () (_ BitVec 64))

(declare-fun lt!313522 () (_ BitVec 64))

(declare-fun lt!313525 () (_ BitVec 64))

(assert (=> d!68775 (= res!167879 (= lt!313522 (bvsub lt!313525 lt!313520)))))

(assert (=> d!68775 (or (= (bvand lt!313525 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!313520 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!313525 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!313525 lt!313520) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!68775 (= lt!313520 (remainingBits!0 ((_ sign_extend 32) (size!4467 (buf!4968 thiss!1204))) ((_ sign_extend 32) (currentByte!9330 thiss!1204)) ((_ sign_extend 32) (currentBit!9325 thiss!1204))))))

(declare-fun lt!313524 () (_ BitVec 64))

(declare-fun lt!313521 () (_ BitVec 64))

(assert (=> d!68775 (= lt!313525 (bvmul lt!313524 lt!313521))))

(assert (=> d!68775 (or (= lt!313524 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!313521 (bvsdiv (bvmul lt!313524 lt!313521) lt!313524)))))

(assert (=> d!68775 (= lt!313521 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68775 (= lt!313524 ((_ sign_extend 32) (size!4467 (buf!4968 thiss!1204))))))

(assert (=> d!68775 (= lt!313522 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9330 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9325 thiss!1204))))))

(assert (=> d!68775 (invariant!0 (currentBit!9325 thiss!1204) (currentByte!9330 thiss!1204) (size!4467 (buf!4968 thiss!1204)))))

(assert (=> d!68775 (= (bitIndex!0 (size!4467 (buf!4968 thiss!1204)) (currentByte!9330 thiss!1204) (currentBit!9325 thiss!1204)) lt!313522)))

(declare-fun b!200527 () Bool)

(declare-fun res!167880 () Bool)

(assert (=> b!200527 (=> (not res!167880) (not e!137549))))

(assert (=> b!200527 (= res!167880 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!313522))))

(declare-fun b!200528 () Bool)

(declare-fun lt!313523 () (_ BitVec 64))

(assert (=> b!200528 (= e!137549 (bvsle lt!313522 (bvmul lt!313523 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200528 (or (= lt!313523 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!313523 #b0000000000000000000000000000000000000000000000000000000000001000) lt!313523)))))

(assert (=> b!200528 (= lt!313523 ((_ sign_extend 32) (size!4467 (buf!4968 thiss!1204))))))

(assert (= (and d!68775 res!167879) b!200527))

(assert (= (and b!200527 res!167880) b!200528))

(declare-fun m!311321 () Bool)

(assert (=> d!68775 m!311321))

(assert (=> d!68775 m!311311))

(assert (=> b!200506 d!68775))

(declare-fun d!68783 () Bool)

(assert (=> d!68783 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9325 thiss!1204) (currentByte!9330 thiss!1204) (size!4467 (buf!4968 thiss!1204))))))

(declare-fun bs!16939 () Bool)

(assert (= bs!16939 d!68783))

(assert (=> bs!16939 m!311311))

(assert (=> start!42426 d!68783))

(declare-fun d!68785 () Bool)

(assert (=> d!68785 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4467 (buf!4968 thiss!1204))) ((_ sign_extend 32) (currentByte!9330 thiss!1204)) ((_ sign_extend 32) (currentBit!9325 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4467 (buf!4968 thiss!1204))) ((_ sign_extend 32) (currentByte!9330 thiss!1204)) ((_ sign_extend 32) (currentBit!9325 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!16940 () Bool)

(assert (= bs!16940 d!68785))

(assert (=> bs!16940 m!311321))

(assert (=> b!200510 d!68785))

(declare-fun d!68787 () Bool)

(assert (=> d!68787 (= (array_inv!4208 (buf!4968 thiss!1204)) (bvsge (size!4467 (buf!4968 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!200509 d!68787))

(declare-fun d!68789 () Bool)

(assert (=> d!68789 (= (invariant!0 (currentBit!9325 thiss!1204) (currentByte!9330 thiss!1204) (size!4467 (buf!4968 thiss!1204))) (and (bvsge (currentBit!9325 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9325 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9330 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9330 thiss!1204) (size!4467 (buf!4968 thiss!1204))) (and (= (currentBit!9325 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9330 thiss!1204) (size!4467 (buf!4968 thiss!1204)))))))))

(assert (=> b!200508 d!68789))

(push 1)

(assert (not d!68775))

(assert (not d!68785))

(assert (not d!68783))

(check-sat)

(pop 1)

(push 1)

(check-sat)

