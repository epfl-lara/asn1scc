; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14250 () Bool)

(assert start!14250)

(declare-fun res!61314 () Bool)

(declare-fun e!48441 () Bool)

(assert (=> start!14250 (=> (not res!61314) (not e!48441))))

(declare-datatypes ((array!3004 0))(
  ( (array!3005 (arr!2000 (Array (_ BitVec 32) (_ BitVec 8))) (size!1406 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!3004)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!14250 (= res!61314 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1406 srcBuffer!2))))))))

(assert (=> start!14250 e!48441))

(assert (=> start!14250 true))

(declare-fun array_inv!1252 (array!3004) Bool)

(assert (=> start!14250 (array_inv!1252 srcBuffer!2)))

(declare-datatypes ((BitStream!2386 0))(
  ( (BitStream!2387 (buf!1787 array!3004) (currentByte!3519 (_ BitVec 32)) (currentBit!3514 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2386)

(declare-fun e!48442 () Bool)

(declare-fun inv!12 (BitStream!2386) Bool)

(assert (=> start!14250 (and (inv!12 thiss!1379) e!48442)))

(declare-fun b!74177 () Bool)

(declare-fun res!61313 () Bool)

(assert (=> b!74177 (=> (not res!61313) (not e!48441))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74177 (= res!61313 (validate_offset_bits!1 ((_ sign_extend 32) (size!1406 (buf!1787 thiss!1379))) ((_ sign_extend 32) (currentByte!3519 thiss!1379)) ((_ sign_extend 32) (currentBit!3514 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!74178 () Bool)

(declare-fun lt!119497 () (_ BitVec 64))

(assert (=> b!74178 (= e!48441 (not (or (bvslt i!635 to!314) (let ((bdg!3621 (bvand lt!119497 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (not (= bdg!3621 (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= bdg!3621 (bvand (bvadd lt!119497 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun isPrefixOf!0 (BitStream!2386 BitStream!2386) Bool)

(assert (=> b!74178 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4889 0))(
  ( (Unit!4890) )
))
(declare-fun lt!119496 () Unit!4889)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2386) Unit!4889)

(assert (=> b!74178 (= lt!119496 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!74178 (= lt!119497 (bitIndex!0 (size!1406 (buf!1787 thiss!1379)) (currentByte!3519 thiss!1379) (currentBit!3514 thiss!1379)))))

(declare-fun b!74179 () Bool)

(assert (=> b!74179 (= e!48442 (array_inv!1252 (buf!1787 thiss!1379)))))

(assert (= (and start!14250 res!61314) b!74177))

(assert (= (and b!74177 res!61313) b!74178))

(assert (= start!14250 b!74179))

(declare-fun m!119131 () Bool)

(assert (=> start!14250 m!119131))

(declare-fun m!119133 () Bool)

(assert (=> start!14250 m!119133))

(declare-fun m!119135 () Bool)

(assert (=> b!74177 m!119135))

(declare-fun m!119137 () Bool)

(assert (=> b!74178 m!119137))

(declare-fun m!119139 () Bool)

(assert (=> b!74178 m!119139))

(declare-fun m!119141 () Bool)

(assert (=> b!74178 m!119141))

(declare-fun m!119143 () Bool)

(assert (=> b!74179 m!119143))

(push 1)

(assert (not b!74177))

(assert (not b!74178))

(assert (not start!14250))

(assert (not b!74179))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!23564 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!23564 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1406 (buf!1787 thiss!1379))) ((_ sign_extend 32) (currentByte!3519 thiss!1379)) ((_ sign_extend 32) (currentBit!3514 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1406 (buf!1787 thiss!1379))) ((_ sign_extend 32) (currentByte!3519 thiss!1379)) ((_ sign_extend 32) (currentBit!3514 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5658 () Bool)

(assert (= bs!5658 d!23564))

(declare-fun m!119179 () Bool)

(assert (=> bs!5658 m!119179))

(assert (=> b!74177 d!23564))

(declare-fun d!23566 () Bool)

(declare-fun res!61343 () Bool)

(declare-fun e!48478 () Bool)

(assert (=> d!23566 (=> (not res!61343) (not e!48478))))

(assert (=> d!23566 (= res!61343 (= (size!1406 (buf!1787 thiss!1379)) (size!1406 (buf!1787 thiss!1379))))))

(assert (=> d!23566 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!48478)))

(declare-fun b!74213 () Bool)

(declare-fun res!61344 () Bool)

(assert (=> b!74213 (=> (not res!61344) (not e!48478))))

(assert (=> b!74213 (= res!61344 (bvsle (bitIndex!0 (size!1406 (buf!1787 thiss!1379)) (currentByte!3519 thiss!1379) (currentBit!3514 thiss!1379)) (bitIndex!0 (size!1406 (buf!1787 thiss!1379)) (currentByte!3519 thiss!1379) (currentBit!3514 thiss!1379))))))

(declare-fun b!74214 () Bool)

(declare-fun e!48479 () Bool)

(assert (=> b!74214 (= e!48478 e!48479)))

(declare-fun res!61342 () Bool)

(assert (=> b!74214 (=> res!61342 e!48479)))

(assert (=> b!74214 (= res!61342 (= (size!1406 (buf!1787 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!74215 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3004 array!3004 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74215 (= e!48479 (arrayBitRangesEq!0 (buf!1787 thiss!1379) (buf!1787 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1406 (buf!1787 thiss!1379)) (currentByte!3519 thiss!1379) (currentBit!3514 thiss!1379))))))

(assert (= (and d!23566 res!61343) b!74213))

(assert (= (and b!74213 res!61344) b!74214))

(assert (= (and b!74214 (not res!61342)) b!74215))

(assert (=> b!74213 m!119141))

(assert (=> b!74213 m!119141))

(assert (=> b!74215 m!119141))

(assert (=> b!74215 m!119141))

(declare-fun m!119181 () Bool)

(assert (=> b!74215 m!119181))

(assert (=> b!74178 d!23566))

(declare-fun d!23568 () Bool)

(assert (=> d!23568 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!119527 () Unit!4889)

(declare-fun choose!11 (BitStream!2386) Unit!4889)

(assert (=> d!23568 (= lt!119527 (choose!11 thiss!1379))))

(assert (=> d!23568 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!119527)))

(declare-fun bs!5660 () Bool)

(assert (= bs!5660 d!23568))

(assert (=> bs!5660 m!119137))

(declare-fun m!119183 () Bool)

(assert (=> bs!5660 m!119183))

(assert (=> b!74178 d!23568))

(declare-fun d!23570 () Bool)

(declare-fun e!48491 () Bool)

(assert (=> d!23570 e!48491))

(declare-fun res!61364 () Bool)

(assert (=> d!23570 (=> (not res!61364) (not e!48491))))

(declare-fun lt!119548 () (_ BitVec 64))

(declare-fun lt!119546 () (_ BitVec 64))

(declare-fun lt!119550 () (_ BitVec 64))

(assert (=> d!23570 (= res!61364 (= lt!119550 (bvsub lt!119548 lt!119546)))))

(assert (=> d!23570 (or (= (bvand lt!119548 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!119546 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!119548 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!119548 lt!119546) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23570 (= lt!119546 (remainingBits!0 ((_ sign_extend 32) (size!1406 (buf!1787 thiss!1379))) ((_ sign_extend 32) (currentByte!3519 thiss!1379)) ((_ sign_extend 32) (currentBit!3514 thiss!1379))))))

(declare-fun lt!119547 () (_ BitVec 64))

(declare-fun lt!119551 () (_ BitVec 64))

(assert (=> d!23570 (= lt!119548 (bvmul lt!119547 lt!119551))))

(assert (=> d!23570 (or (= lt!119547 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!119551 (bvsdiv (bvmul lt!119547 lt!119551) lt!119547)))))

(assert (=> d!23570 (= lt!119551 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23570 (= lt!119547 ((_ sign_extend 32) (size!1406 (buf!1787 thiss!1379))))))

(assert (=> d!23570 (= lt!119550 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3519 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3514 thiss!1379))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!23570 (invariant!0 (currentBit!3514 thiss!1379) (currentByte!3519 thiss!1379) (size!1406 (buf!1787 thiss!1379)))))

(assert (=> d!23570 (= (bitIndex!0 (size!1406 (buf!1787 thiss!1379)) (currentByte!3519 thiss!1379) (currentBit!3514 thiss!1379)) lt!119550)))

(declare-fun b!74235 () Bool)

(declare-fun res!61365 () Bool)

(assert (=> b!74235 (=> (not res!61365) (not e!48491))))

(assert (=> b!74235 (= res!61365 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!119550))))

(declare-fun b!74236 () Bool)

(declare-fun lt!119549 () (_ BitVec 64))

(assert (=> b!74236 (= e!48491 (bvsle lt!119550 (bvmul lt!119549 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!74236 (or (= lt!119549 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!119549 #b0000000000000000000000000000000000000000000000000000000000001000) lt!119549)))))

(assert (=> b!74236 (= lt!119549 ((_ sign_extend 32) (size!1406 (buf!1787 thiss!1379))))))

(assert (= (and d!23570 res!61364) b!74235))

(assert (= (and b!74235 res!61365) b!74236))

(assert (=> d!23570 m!119179))

(declare-fun m!119191 () Bool)

(assert (=> d!23570 m!119191))

(assert (=> b!74178 d!23570))

(declare-fun d!23584 () Bool)

(assert (=> d!23584 (= (array_inv!1252 srcBuffer!2) (bvsge (size!1406 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!14250 d!23584))

(declare-fun d!23586 () Bool)

(assert (=> d!23586 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3514 thiss!1379) (currentByte!3519 thiss!1379) (size!1406 (buf!1787 thiss!1379))))))

(declare-fun bs!5665 () Bool)

(assert (= bs!5665 d!23586))

(assert (=> bs!5665 m!119191))

(assert (=> start!14250 d!23586))

(declare-fun d!23590 () Bool)

(assert (=> d!23590 (= (array_inv!1252 (buf!1787 thiss!1379)) (bvsge (size!1406 (buf!1787 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!74179 d!23590))

(push 1)

(assert (not d!23564))

(assert (not d!23570))

(assert (not b!74213))

(assert (not d!23568))

(assert (not b!74215))

(assert (not d!23586))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

