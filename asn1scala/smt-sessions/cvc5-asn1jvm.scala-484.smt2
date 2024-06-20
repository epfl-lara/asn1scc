; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14292 () Bool)

(assert start!14292)

(declare-fun res!61376 () Bool)

(declare-fun e!48503 () Bool)

(assert (=> start!14292 (=> (not res!61376) (not e!48503))))

(declare-datatypes ((array!3013 0))(
  ( (array!3014 (arr!2003 (Array (_ BitVec 32) (_ BitVec 8))) (size!1409 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!3013)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!14292 (= res!61376 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1409 srcBuffer!2))))))))

(assert (=> start!14292 e!48503))

(assert (=> start!14292 true))

(declare-fun array_inv!1255 (array!3013) Bool)

(assert (=> start!14292 (array_inv!1255 srcBuffer!2)))

(declare-datatypes ((BitStream!2392 0))(
  ( (BitStream!2393 (buf!1790 array!3013) (currentByte!3528 (_ BitVec 32)) (currentBit!3523 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2392)

(declare-fun e!48506 () Bool)

(declare-fun inv!12 (BitStream!2392) Bool)

(assert (=> start!14292 (and (inv!12 thiss!1379) e!48506)))

(declare-fun b!74249 () Bool)

(declare-fun res!61377 () Bool)

(assert (=> b!74249 (=> (not res!61377) (not e!48503))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74249 (= res!61377 (validate_offset_bits!1 ((_ sign_extend 32) (size!1409 (buf!1790 thiss!1379))) ((_ sign_extend 32) (currentByte!3528 thiss!1379)) ((_ sign_extend 32) (currentBit!3523 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun lt!119577 () (_ BitVec 64))

(declare-fun b!74250 () Bool)

(assert (=> b!74250 (= e!48503 (not (or (bvslt i!635 to!314) (let ((bdg!3624 (bvadd lt!119577 to!314))) (let ((bdg!3625 (bvand bdg!3624 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (= bdg!3625 (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= bdg!3625 (bvand (bvsub bdg!3624 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun isPrefixOf!0 (BitStream!2392 BitStream!2392) Bool)

(assert (=> b!74250 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4895 0))(
  ( (Unit!4896) )
))
(declare-fun lt!119578 () Unit!4895)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2392) Unit!4895)

(assert (=> b!74250 (= lt!119578 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!74250 (= lt!119577 (bitIndex!0 (size!1409 (buf!1790 thiss!1379)) (currentByte!3528 thiss!1379) (currentBit!3523 thiss!1379)))))

(declare-fun b!74251 () Bool)

(assert (=> b!74251 (= e!48506 (array_inv!1255 (buf!1790 thiss!1379)))))

(assert (= (and start!14292 res!61376) b!74249))

(assert (= (and b!74249 res!61377) b!74250))

(assert (= start!14292 b!74251))

(declare-fun m!119197 () Bool)

(assert (=> start!14292 m!119197))

(declare-fun m!119199 () Bool)

(assert (=> start!14292 m!119199))

(declare-fun m!119201 () Bool)

(assert (=> b!74249 m!119201))

(declare-fun m!119203 () Bool)

(assert (=> b!74250 m!119203))

(declare-fun m!119205 () Bool)

(assert (=> b!74250 m!119205))

(declare-fun m!119207 () Bool)

(assert (=> b!74250 m!119207))

(declare-fun m!119209 () Bool)

(assert (=> b!74251 m!119209))

(push 1)

(assert (not b!74251))

(assert (not start!14292))

(assert (not b!74250))

(assert (not b!74249))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!23610 () Bool)

(assert (=> d!23610 (= (array_inv!1255 (buf!1790 thiss!1379)) (bvsge (size!1409 (buf!1790 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!74251 d!23610))

(declare-fun d!23612 () Bool)

(assert (=> d!23612 (= (array_inv!1255 srcBuffer!2) (bvsge (size!1409 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!14292 d!23612))

(declare-fun d!23614 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!23614 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3523 thiss!1379) (currentByte!3528 thiss!1379) (size!1409 (buf!1790 thiss!1379))))))

(declare-fun bs!5673 () Bool)

(assert (= bs!5673 d!23614))

(declare-fun m!119245 () Bool)

(assert (=> bs!5673 m!119245))

(assert (=> start!14292 d!23614))

(declare-fun d!23616 () Bool)

(declare-fun res!61405 () Bool)

(declare-fun e!48541 () Bool)

(assert (=> d!23616 (=> (not res!61405) (not e!48541))))

(assert (=> d!23616 (= res!61405 (= (size!1409 (buf!1790 thiss!1379)) (size!1409 (buf!1790 thiss!1379))))))

(assert (=> d!23616 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!48541)))

(declare-fun b!74285 () Bool)

(declare-fun res!61406 () Bool)

(assert (=> b!74285 (=> (not res!61406) (not e!48541))))

(assert (=> b!74285 (= res!61406 (bvsle (bitIndex!0 (size!1409 (buf!1790 thiss!1379)) (currentByte!3528 thiss!1379) (currentBit!3523 thiss!1379)) (bitIndex!0 (size!1409 (buf!1790 thiss!1379)) (currentByte!3528 thiss!1379) (currentBit!3523 thiss!1379))))))

(declare-fun b!74286 () Bool)

(declare-fun e!48542 () Bool)

(assert (=> b!74286 (= e!48541 e!48542)))

(declare-fun res!61407 () Bool)

(assert (=> b!74286 (=> res!61407 e!48542)))

(assert (=> b!74286 (= res!61407 (= (size!1409 (buf!1790 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!74287 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3013 array!3013 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74287 (= e!48542 (arrayBitRangesEq!0 (buf!1790 thiss!1379) (buf!1790 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1409 (buf!1790 thiss!1379)) (currentByte!3528 thiss!1379) (currentBit!3523 thiss!1379))))))

(assert (= (and d!23616 res!61405) b!74285))

(assert (= (and b!74285 res!61406) b!74286))

(assert (= (and b!74286 (not res!61407)) b!74287))

(assert (=> b!74285 m!119207))

(assert (=> b!74285 m!119207))

(assert (=> b!74287 m!119207))

(assert (=> b!74287 m!119207))

(declare-fun m!119247 () Bool)

(assert (=> b!74287 m!119247))

(assert (=> b!74250 d!23616))

(declare-fun d!23618 () Bool)

(assert (=> d!23618 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!119596 () Unit!4895)

(declare-fun choose!11 (BitStream!2392) Unit!4895)

(assert (=> d!23618 (= lt!119596 (choose!11 thiss!1379))))

(assert (=> d!23618 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!119596)))

(declare-fun bs!5675 () Bool)

(assert (= bs!5675 d!23618))

(assert (=> bs!5675 m!119203))

(declare-fun m!119249 () Bool)

(assert (=> bs!5675 m!119249))

(assert (=> b!74250 d!23618))

(declare-fun d!23620 () Bool)

(declare-fun e!48548 () Bool)

(assert (=> d!23620 e!48548))

(declare-fun res!61418 () Bool)

(assert (=> d!23620 (=> (not res!61418) (not e!48548))))

(declare-fun lt!119627 () (_ BitVec 64))

(declare-fun lt!119629 () (_ BitVec 64))

(declare-fun lt!119632 () (_ BitVec 64))

(assert (=> d!23620 (= res!61418 (= lt!119632 (bvsub lt!119629 lt!119627)))))

(assert (=> d!23620 (or (= (bvand lt!119629 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!119627 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!119629 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!119629 lt!119627) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!23620 (= lt!119627 (remainingBits!0 ((_ sign_extend 32) (size!1409 (buf!1790 thiss!1379))) ((_ sign_extend 32) (currentByte!3528 thiss!1379)) ((_ sign_extend 32) (currentBit!3523 thiss!1379))))))

(declare-fun lt!119628 () (_ BitVec 64))

(declare-fun lt!119631 () (_ BitVec 64))

(assert (=> d!23620 (= lt!119629 (bvmul lt!119628 lt!119631))))

(assert (=> d!23620 (or (= lt!119628 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!119631 (bvsdiv (bvmul lt!119628 lt!119631) lt!119628)))))

(assert (=> d!23620 (= lt!119631 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23620 (= lt!119628 ((_ sign_extend 32) (size!1409 (buf!1790 thiss!1379))))))

(assert (=> d!23620 (= lt!119632 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3528 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3523 thiss!1379))))))

(assert (=> d!23620 (invariant!0 (currentBit!3523 thiss!1379) (currentByte!3528 thiss!1379) (size!1409 (buf!1790 thiss!1379)))))

(assert (=> d!23620 (= (bitIndex!0 (size!1409 (buf!1790 thiss!1379)) (currentByte!3528 thiss!1379) (currentBit!3523 thiss!1379)) lt!119632)))

(declare-fun b!74298 () Bool)

(declare-fun res!61419 () Bool)

(assert (=> b!74298 (=> (not res!61419) (not e!48548))))

(assert (=> b!74298 (= res!61419 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!119632))))

(declare-fun b!74299 () Bool)

(declare-fun lt!119630 () (_ BitVec 64))

(assert (=> b!74299 (= e!48548 (bvsle lt!119632 (bvmul lt!119630 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!74299 (or (= lt!119630 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!119630 #b0000000000000000000000000000000000000000000000000000000000001000) lt!119630)))))

(assert (=> b!74299 (= lt!119630 ((_ sign_extend 32) (size!1409 (buf!1790 thiss!1379))))))

(assert (= (and d!23620 res!61418) b!74298))

(assert (= (and b!74298 res!61419) b!74299))

(declare-fun m!119253 () Bool)

(assert (=> d!23620 m!119253))

(assert (=> d!23620 m!119245))

(assert (=> b!74250 d!23620))

(declare-fun d!23626 () Bool)

(assert (=> d!23626 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1409 (buf!1790 thiss!1379))) ((_ sign_extend 32) (currentByte!3528 thiss!1379)) ((_ sign_extend 32) (currentBit!3523 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1409 (buf!1790 thiss!1379))) ((_ sign_extend 32) (currentByte!3528 thiss!1379)) ((_ sign_extend 32) (currentBit!3523 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5677 () Bool)

(assert (= bs!5677 d!23626))

(assert (=> bs!5677 m!119253))

(assert (=> b!74249 d!23626))

(push 1)

(assert (not d!23626))

(assert (not b!74287))

(assert (not b!74285))

(assert (not d!23614))

(assert (not d!23620))

(assert (not d!23618))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

