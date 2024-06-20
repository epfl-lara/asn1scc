; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11168 () Bool)

(assert start!11168)

(declare-fun b!55438 () Bool)

(declare-fun e!36958 () Bool)

(declare-fun e!36964 () Bool)

(assert (=> b!55438 (= e!36958 e!36964)))

(declare-fun res!46186 () Bool)

(assert (=> b!55438 (=> res!46186 e!36964)))

(declare-datatypes ((array!2583 0))(
  ( (array!2584 (arr!1722 (Array (_ BitVec 32) (_ BitVec 8))) (size!1176 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2040 0))(
  ( (BitStream!2041 (buf!1539 array!2583) (currentByte!3121 (_ BitVec 32)) (currentBit!3116 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3831 0))(
  ( (Unit!3832) )
))
(declare-datatypes ((tuple2!5058 0))(
  ( (tuple2!5059 (_1!2640 Unit!3831) (_2!2640 BitStream!2040)) )
))
(declare-fun lt!86511 () tuple2!5058)

(declare-fun lt!86506 () tuple2!5058)

(declare-fun isPrefixOf!0 (BitStream!2040 BitStream!2040) Bool)

(assert (=> b!55438 (= res!46186 (not (isPrefixOf!0 (_2!2640 lt!86511) (_2!2640 lt!86506))))))

(declare-fun thiss!1379 () BitStream!2040)

(assert (=> b!55438 (isPrefixOf!0 thiss!1379 (_2!2640 lt!86506))))

(declare-fun lt!86503 () Unit!3831)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2040 BitStream!2040 BitStream!2040) Unit!3831)

(assert (=> b!55438 (= lt!86503 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2640 lt!86511) (_2!2640 lt!86506)))))

(declare-fun srcBuffer!2 () array!2583)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2040 array!2583 (_ BitVec 64) (_ BitVec 64)) tuple2!5058)

(assert (=> b!55438 (= lt!86506 (appendBitsMSBFirstLoop!0 (_2!2640 lt!86511) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!36965 () Bool)

(assert (=> b!55438 e!36965))

(declare-fun res!46180 () Bool)

(assert (=> b!55438 (=> (not res!46180) (not e!36965))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!55438 (= res!46180 (validate_offset_bits!1 ((_ sign_extend 32) (size!1176 (buf!1539 (_2!2640 lt!86511)))) ((_ sign_extend 32) (currentByte!3121 thiss!1379)) ((_ sign_extend 32) (currentBit!3116 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!86507 () Unit!3831)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2040 array!2583 (_ BitVec 64)) Unit!3831)

(assert (=> b!55438 (= lt!86507 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1539 (_2!2640 lt!86511)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5060 0))(
  ( (tuple2!5061 (_1!2641 BitStream!2040) (_2!2641 BitStream!2040)) )
))
(declare-fun lt!86510 () tuple2!5060)

(declare-fun reader!0 (BitStream!2040 BitStream!2040) tuple2!5060)

(assert (=> b!55438 (= lt!86510 (reader!0 thiss!1379 (_2!2640 lt!86511)))))

(declare-fun e!36963 () Bool)

(declare-fun lt!86512 () (_ BitVec 64))

(declare-fun b!55439 () Bool)

(declare-fun lt!86508 () (_ BitVec 64))

(assert (=> b!55439 (= e!36963 (or (not (= lt!86508 (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!86508 (bvand lt!86512 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!86509 () (_ BitVec 64))

(assert (=> b!55439 (= lt!86508 (bvand lt!86509 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!55439 (= (size!1176 (buf!1539 (_2!2640 lt!86506))) (size!1176 (buf!1539 thiss!1379)))))

(declare-fun b!55440 () Bool)

(declare-fun res!46187 () Bool)

(declare-fun e!36962 () Bool)

(assert (=> b!55440 (=> (not res!46187) (not e!36962))))

(assert (=> b!55440 (= res!46187 (validate_offset_bits!1 ((_ sign_extend 32) (size!1176 (buf!1539 thiss!1379))) ((_ sign_extend 32) (currentByte!3121 thiss!1379)) ((_ sign_extend 32) (currentBit!3116 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!55441 () Bool)

(declare-fun e!36961 () Bool)

(assert (=> b!55441 (= e!36961 e!36958)))

(declare-fun res!46183 () Bool)

(assert (=> b!55441 (=> res!46183 e!36958)))

(assert (=> b!55441 (= res!46183 (not (isPrefixOf!0 thiss!1379 (_2!2640 lt!86511))))))

(assert (=> b!55441 (validate_offset_bits!1 ((_ sign_extend 32) (size!1176 (buf!1539 (_2!2640 lt!86511)))) ((_ sign_extend 32) (currentByte!3121 (_2!2640 lt!86511))) ((_ sign_extend 32) (currentBit!3116 (_2!2640 lt!86511))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!86505 () Unit!3831)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2040 BitStream!2040 (_ BitVec 64) (_ BitVec 64)) Unit!3831)

(assert (=> b!55441 (= lt!86505 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2640 lt!86511) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2040 (_ BitVec 8) (_ BitVec 32)) tuple2!5058)

(assert (=> b!55441 (= lt!86511 (appendBitFromByte!0 thiss!1379 (select (arr!1722 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!55442 () Bool)

(assert (=> b!55442 (= e!36964 e!36963)))

(declare-fun res!46182 () Bool)

(assert (=> b!55442 (=> res!46182 e!36963)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!55442 (= res!46182 (not (= (bitIndex!0 (size!1176 (buf!1539 (_2!2640 lt!86506))) (currentByte!3121 (_2!2640 lt!86506)) (currentBit!3116 (_2!2640 lt!86506))) (bvsub lt!86512 i!635))))))

(assert (=> b!55442 (= lt!86512 (bvadd lt!86509 to!314))))

(declare-fun b!55443 () Bool)

(assert (=> b!55443 (= e!36962 (not e!36961))))

(declare-fun res!46188 () Bool)

(assert (=> b!55443 (=> res!46188 e!36961)))

(assert (=> b!55443 (= res!46188 (bvsge i!635 to!314))))

(assert (=> b!55443 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!86504 () Unit!3831)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2040) Unit!3831)

(assert (=> b!55443 (= lt!86504 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!55443 (= lt!86509 (bitIndex!0 (size!1176 (buf!1539 thiss!1379)) (currentByte!3121 thiss!1379) (currentBit!3116 thiss!1379)))))

(declare-fun b!55444 () Bool)

(declare-fun res!46184 () Bool)

(assert (=> b!55444 (=> res!46184 e!36963)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!55444 (= res!46184 (not (invariant!0 (currentBit!3116 (_2!2640 lt!86506)) (currentByte!3121 (_2!2640 lt!86506)) (size!1176 (buf!1539 (_2!2640 lt!86506))))))))

(declare-fun b!55445 () Bool)

(declare-fun e!36960 () Bool)

(declare-fun array_inv!1079 (array!2583) Bool)

(assert (=> b!55445 (= e!36960 (array_inv!1079 (buf!1539 thiss!1379)))))

(declare-fun res!46185 () Bool)

(assert (=> start!11168 (=> (not res!46185) (not e!36962))))

(assert (=> start!11168 (= res!46185 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1176 srcBuffer!2))))))))

(assert (=> start!11168 e!36962))

(assert (=> start!11168 true))

(assert (=> start!11168 (array_inv!1079 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2040) Bool)

(assert (=> start!11168 (and (inv!12 thiss!1379) e!36960)))

(declare-fun b!55446 () Bool)

(declare-datatypes ((List!595 0))(
  ( (Nil!592) (Cons!591 (h!710 Bool) (t!1345 List!595)) )
))
(declare-fun head!414 (List!595) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2040 array!2583 (_ BitVec 64) (_ BitVec 64)) List!595)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2040 BitStream!2040 (_ BitVec 64)) List!595)

(assert (=> b!55446 (= e!36965 (= (head!414 (byteArrayBitContentToList!0 (_2!2640 lt!86511) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!414 (bitStreamReadBitsIntoList!0 (_2!2640 lt!86511) (_1!2641 lt!86510) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!55447 () Bool)

(declare-fun res!46181 () Bool)

(assert (=> b!55447 (=> res!46181 e!36963)))

(assert (=> b!55447 (= res!46181 (not (= (size!1176 (buf!1539 thiss!1379)) (size!1176 (buf!1539 (_2!2640 lt!86506))))))))

(assert (= (and start!11168 res!46185) b!55440))

(assert (= (and b!55440 res!46187) b!55443))

(assert (= (and b!55443 (not res!46188)) b!55441))

(assert (= (and b!55441 (not res!46183)) b!55438))

(assert (= (and b!55438 res!46180) b!55446))

(assert (= (and b!55438 (not res!46186)) b!55442))

(assert (= (and b!55442 (not res!46182)) b!55444))

(assert (= (and b!55444 (not res!46184)) b!55447))

(assert (= (and b!55447 (not res!46181)) b!55439))

(assert (= start!11168 b!55445))

(declare-fun m!87333 () Bool)

(assert (=> start!11168 m!87333))

(declare-fun m!87335 () Bool)

(assert (=> start!11168 m!87335))

(declare-fun m!87337 () Bool)

(assert (=> b!55441 m!87337))

(declare-fun m!87339 () Bool)

(assert (=> b!55441 m!87339))

(declare-fun m!87341 () Bool)

(assert (=> b!55441 m!87341))

(declare-fun m!87343 () Bool)

(assert (=> b!55441 m!87343))

(assert (=> b!55441 m!87339))

(declare-fun m!87345 () Bool)

(assert (=> b!55441 m!87345))

(declare-fun m!87347 () Bool)

(assert (=> b!55446 m!87347))

(assert (=> b!55446 m!87347))

(declare-fun m!87349 () Bool)

(assert (=> b!55446 m!87349))

(declare-fun m!87351 () Bool)

(assert (=> b!55446 m!87351))

(assert (=> b!55446 m!87351))

(declare-fun m!87353 () Bool)

(assert (=> b!55446 m!87353))

(declare-fun m!87355 () Bool)

(assert (=> b!55445 m!87355))

(declare-fun m!87357 () Bool)

(assert (=> b!55438 m!87357))

(declare-fun m!87359 () Bool)

(assert (=> b!55438 m!87359))

(declare-fun m!87361 () Bool)

(assert (=> b!55438 m!87361))

(declare-fun m!87363 () Bool)

(assert (=> b!55438 m!87363))

(declare-fun m!87365 () Bool)

(assert (=> b!55438 m!87365))

(declare-fun m!87367 () Bool)

(assert (=> b!55438 m!87367))

(declare-fun m!87369 () Bool)

(assert (=> b!55438 m!87369))

(declare-fun m!87371 () Bool)

(assert (=> b!55440 m!87371))

(declare-fun m!87373 () Bool)

(assert (=> b!55443 m!87373))

(declare-fun m!87375 () Bool)

(assert (=> b!55443 m!87375))

(declare-fun m!87377 () Bool)

(assert (=> b!55443 m!87377))

(declare-fun m!87379 () Bool)

(assert (=> b!55442 m!87379))

(declare-fun m!87381 () Bool)

(assert (=> b!55444 m!87381))

(check-sat (not b!55445) (not b!55444) (not b!55442) (not start!11168) (not b!55440) (not b!55438) (not b!55443) (not b!55441) (not b!55446))
(check-sat)
(get-model)

(declare-fun d!17650 () Bool)

(declare-fun res!46222 () Bool)

(declare-fun e!36997 () Bool)

(assert (=> d!17650 (=> (not res!46222) (not e!36997))))

(assert (=> d!17650 (= res!46222 (= (size!1176 (buf!1539 thiss!1379)) (size!1176 (buf!1539 thiss!1379))))))

(assert (=> d!17650 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!36997)))

(declare-fun b!55484 () Bool)

(declare-fun res!46224 () Bool)

(assert (=> b!55484 (=> (not res!46224) (not e!36997))))

(assert (=> b!55484 (= res!46224 (bvsle (bitIndex!0 (size!1176 (buf!1539 thiss!1379)) (currentByte!3121 thiss!1379) (currentBit!3116 thiss!1379)) (bitIndex!0 (size!1176 (buf!1539 thiss!1379)) (currentByte!3121 thiss!1379) (currentBit!3116 thiss!1379))))))

(declare-fun b!55485 () Bool)

(declare-fun e!36998 () Bool)

(assert (=> b!55485 (= e!36997 e!36998)))

(declare-fun res!46223 () Bool)

(assert (=> b!55485 (=> res!46223 e!36998)))

(assert (=> b!55485 (= res!46223 (= (size!1176 (buf!1539 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!55486 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2583 array!2583 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!55486 (= e!36998 (arrayBitRangesEq!0 (buf!1539 thiss!1379) (buf!1539 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1176 (buf!1539 thiss!1379)) (currentByte!3121 thiss!1379) (currentBit!3116 thiss!1379))))))

(assert (= (and d!17650 res!46222) b!55484))

(assert (= (and b!55484 res!46224) b!55485))

(assert (= (and b!55485 (not res!46223)) b!55486))

(assert (=> b!55484 m!87377))

(assert (=> b!55484 m!87377))

(assert (=> b!55486 m!87377))

(assert (=> b!55486 m!87377))

(declare-fun m!87433 () Bool)

(assert (=> b!55486 m!87433))

(assert (=> b!55443 d!17650))

(declare-fun d!17652 () Bool)

(assert (=> d!17652 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!86545 () Unit!3831)

(declare-fun choose!11 (BitStream!2040) Unit!3831)

(assert (=> d!17652 (= lt!86545 (choose!11 thiss!1379))))

(assert (=> d!17652 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!86545)))

(declare-fun bs!4441 () Bool)

(assert (= bs!4441 d!17652))

(assert (=> bs!4441 m!87373))

(declare-fun m!87435 () Bool)

(assert (=> bs!4441 m!87435))

(assert (=> b!55443 d!17652))

(declare-fun d!17654 () Bool)

(declare-fun e!37001 () Bool)

(assert (=> d!17654 e!37001))

(declare-fun res!46230 () Bool)

(assert (=> d!17654 (=> (not res!46230) (not e!37001))))

(declare-fun lt!86563 () (_ BitVec 64))

(declare-fun lt!86560 () (_ BitVec 64))

(declare-fun lt!86561 () (_ BitVec 64))

(assert (=> d!17654 (= res!46230 (= lt!86563 (bvsub lt!86560 lt!86561)))))

(assert (=> d!17654 (or (= (bvand lt!86560 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!86561 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!86560 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!86560 lt!86561) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!17654 (= lt!86561 (remainingBits!0 ((_ sign_extend 32) (size!1176 (buf!1539 thiss!1379))) ((_ sign_extend 32) (currentByte!3121 thiss!1379)) ((_ sign_extend 32) (currentBit!3116 thiss!1379))))))

(declare-fun lt!86558 () (_ BitVec 64))

(declare-fun lt!86559 () (_ BitVec 64))

(assert (=> d!17654 (= lt!86560 (bvmul lt!86558 lt!86559))))

(assert (=> d!17654 (or (= lt!86558 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!86559 (bvsdiv (bvmul lt!86558 lt!86559) lt!86558)))))

(assert (=> d!17654 (= lt!86559 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17654 (= lt!86558 ((_ sign_extend 32) (size!1176 (buf!1539 thiss!1379))))))

(assert (=> d!17654 (= lt!86563 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3121 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3116 thiss!1379))))))

(assert (=> d!17654 (invariant!0 (currentBit!3116 thiss!1379) (currentByte!3121 thiss!1379) (size!1176 (buf!1539 thiss!1379)))))

(assert (=> d!17654 (= (bitIndex!0 (size!1176 (buf!1539 thiss!1379)) (currentByte!3121 thiss!1379) (currentBit!3116 thiss!1379)) lt!86563)))

(declare-fun b!55491 () Bool)

(declare-fun res!46229 () Bool)

(assert (=> b!55491 (=> (not res!46229) (not e!37001))))

(assert (=> b!55491 (= res!46229 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!86563))))

(declare-fun b!55492 () Bool)

(declare-fun lt!86562 () (_ BitVec 64))

(assert (=> b!55492 (= e!37001 (bvsle lt!86563 (bvmul lt!86562 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!55492 (or (= lt!86562 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!86562 #b0000000000000000000000000000000000000000000000000000000000001000) lt!86562)))))

(assert (=> b!55492 (= lt!86562 ((_ sign_extend 32) (size!1176 (buf!1539 thiss!1379))))))

(assert (= (and d!17654 res!46230) b!55491))

(assert (= (and b!55491 res!46229) b!55492))

(declare-fun m!87437 () Bool)

(assert (=> d!17654 m!87437))

(declare-fun m!87439 () Bool)

(assert (=> d!17654 m!87439))

(assert (=> b!55443 d!17654))

(declare-fun d!17656 () Bool)

(declare-fun res!46231 () Bool)

(declare-fun e!37002 () Bool)

(assert (=> d!17656 (=> (not res!46231) (not e!37002))))

(assert (=> d!17656 (= res!46231 (= (size!1176 (buf!1539 thiss!1379)) (size!1176 (buf!1539 (_2!2640 lt!86506)))))))

(assert (=> d!17656 (= (isPrefixOf!0 thiss!1379 (_2!2640 lt!86506)) e!37002)))

(declare-fun b!55493 () Bool)

(declare-fun res!46233 () Bool)

(assert (=> b!55493 (=> (not res!46233) (not e!37002))))

(assert (=> b!55493 (= res!46233 (bvsle (bitIndex!0 (size!1176 (buf!1539 thiss!1379)) (currentByte!3121 thiss!1379) (currentBit!3116 thiss!1379)) (bitIndex!0 (size!1176 (buf!1539 (_2!2640 lt!86506))) (currentByte!3121 (_2!2640 lt!86506)) (currentBit!3116 (_2!2640 lt!86506)))))))

(declare-fun b!55494 () Bool)

(declare-fun e!37003 () Bool)

(assert (=> b!55494 (= e!37002 e!37003)))

(declare-fun res!46232 () Bool)

(assert (=> b!55494 (=> res!46232 e!37003)))

(assert (=> b!55494 (= res!46232 (= (size!1176 (buf!1539 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!55495 () Bool)

(assert (=> b!55495 (= e!37003 (arrayBitRangesEq!0 (buf!1539 thiss!1379) (buf!1539 (_2!2640 lt!86506)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1176 (buf!1539 thiss!1379)) (currentByte!3121 thiss!1379) (currentBit!3116 thiss!1379))))))

(assert (= (and d!17656 res!46231) b!55493))

(assert (= (and b!55493 res!46233) b!55494))

(assert (= (and b!55494 (not res!46232)) b!55495))

(assert (=> b!55493 m!87377))

(assert (=> b!55493 m!87379))

(assert (=> b!55495 m!87377))

(assert (=> b!55495 m!87377))

(declare-fun m!87441 () Bool)

(assert (=> b!55495 m!87441))

(assert (=> b!55438 d!17656))

(declare-fun d!17658 () Bool)

(declare-fun res!46234 () Bool)

(declare-fun e!37004 () Bool)

(assert (=> d!17658 (=> (not res!46234) (not e!37004))))

(assert (=> d!17658 (= res!46234 (= (size!1176 (buf!1539 (_2!2640 lt!86511))) (size!1176 (buf!1539 (_2!2640 lt!86506)))))))

(assert (=> d!17658 (= (isPrefixOf!0 (_2!2640 lt!86511) (_2!2640 lt!86506)) e!37004)))

(declare-fun b!55496 () Bool)

(declare-fun res!46236 () Bool)

(assert (=> b!55496 (=> (not res!46236) (not e!37004))))

(assert (=> b!55496 (= res!46236 (bvsle (bitIndex!0 (size!1176 (buf!1539 (_2!2640 lt!86511))) (currentByte!3121 (_2!2640 lt!86511)) (currentBit!3116 (_2!2640 lt!86511))) (bitIndex!0 (size!1176 (buf!1539 (_2!2640 lt!86506))) (currentByte!3121 (_2!2640 lt!86506)) (currentBit!3116 (_2!2640 lt!86506)))))))

(declare-fun b!55497 () Bool)

(declare-fun e!37005 () Bool)

(assert (=> b!55497 (= e!37004 e!37005)))

(declare-fun res!46235 () Bool)

(assert (=> b!55497 (=> res!46235 e!37005)))

(assert (=> b!55497 (= res!46235 (= (size!1176 (buf!1539 (_2!2640 lt!86511))) #b00000000000000000000000000000000))))

(declare-fun b!55498 () Bool)

(assert (=> b!55498 (= e!37005 (arrayBitRangesEq!0 (buf!1539 (_2!2640 lt!86511)) (buf!1539 (_2!2640 lt!86506)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1176 (buf!1539 (_2!2640 lt!86511))) (currentByte!3121 (_2!2640 lt!86511)) (currentBit!3116 (_2!2640 lt!86511)))))))

(assert (= (and d!17658 res!46234) b!55496))

(assert (= (and b!55496 res!46236) b!55497))

(assert (= (and b!55497 (not res!46235)) b!55498))

(declare-fun m!87443 () Bool)

(assert (=> b!55496 m!87443))

(assert (=> b!55496 m!87379))

(assert (=> b!55498 m!87443))

(assert (=> b!55498 m!87443))

(declare-fun m!87445 () Bool)

(assert (=> b!55498 m!87445))

(assert (=> b!55438 d!17658))

(declare-fun d!17660 () Bool)

(assert (=> d!17660 (validate_offset_bits!1 ((_ sign_extend 32) (size!1176 (buf!1539 (_2!2640 lt!86511)))) ((_ sign_extend 32) (currentByte!3121 thiss!1379)) ((_ sign_extend 32) (currentBit!3116 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!86566 () Unit!3831)

(declare-fun choose!9 (BitStream!2040 array!2583 (_ BitVec 64) BitStream!2040) Unit!3831)

(assert (=> d!17660 (= lt!86566 (choose!9 thiss!1379 (buf!1539 (_2!2640 lt!86511)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2041 (buf!1539 (_2!2640 lt!86511)) (currentByte!3121 thiss!1379) (currentBit!3116 thiss!1379))))))

(assert (=> d!17660 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1539 (_2!2640 lt!86511)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!86566)))

(declare-fun bs!4442 () Bool)

(assert (= bs!4442 d!17660))

(assert (=> bs!4442 m!87359))

(declare-fun m!87447 () Bool)

(assert (=> bs!4442 m!87447))

(assert (=> b!55438 d!17660))

(declare-fun b!55584 () Bool)

(declare-fun res!46311 () Bool)

(declare-fun e!37048 () Bool)

(assert (=> b!55584 (=> (not res!46311) (not e!37048))))

(declare-fun lt!86832 () tuple2!5058)

(assert (=> b!55584 (= res!46311 (invariant!0 (currentBit!3116 (_2!2640 lt!86832)) (currentByte!3121 (_2!2640 lt!86832)) (size!1176 (buf!1539 (_2!2640 lt!86832)))))))

(declare-fun lt!86835 () tuple2!5058)

(declare-fun bm!709 () Bool)

(declare-fun c!3963 () Bool)

(declare-fun call!712 () tuple2!5060)

(assert (=> bm!709 (= call!712 (reader!0 (_2!2640 lt!86511) (ite c!3963 (_2!2640 lt!86835) (_2!2640 lt!86511))))))

(declare-fun b!55586 () Bool)

(declare-fun e!37049 () tuple2!5058)

(declare-fun Unit!3835 () Unit!3831)

(assert (=> b!55586 (= e!37049 (tuple2!5059 Unit!3835 (_2!2640 lt!86511)))))

(assert (=> b!55586 (= (size!1176 (buf!1539 (_2!2640 lt!86511))) (size!1176 (buf!1539 (_2!2640 lt!86511))))))

(declare-fun lt!86837 () Unit!3831)

(declare-fun Unit!3836 () Unit!3831)

(assert (=> b!55586 (= lt!86837 Unit!3836)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2040 array!2583 array!2583 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5066 0))(
  ( (tuple2!5067 (_1!2644 array!2583) (_2!2644 BitStream!2040)) )
))
(declare-fun readBits!0 (BitStream!2040 (_ BitVec 64)) tuple2!5066)

(assert (=> b!55586 (checkByteArrayBitContent!0 (_2!2640 lt!86511) srcBuffer!2 (_1!2644 (readBits!0 (_1!2641 call!712) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!55587 () Bool)

(declare-fun res!46315 () Bool)

(assert (=> b!55587 (=> (not res!46315) (not e!37048))))

(assert (=> b!55587 (= res!46315 (= (size!1176 (buf!1539 (_2!2640 lt!86511))) (size!1176 (buf!1539 (_2!2640 lt!86832)))))))

(declare-fun lt!86806 () tuple2!5060)

(declare-fun b!55588 () Bool)

(assert (=> b!55588 (= e!37048 (= (bitStreamReadBitsIntoList!0 (_2!2640 lt!86832) (_1!2641 lt!86806) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2640 lt!86832) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!55588 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!55588 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!86807 () Unit!3831)

(declare-fun lt!86812 () Unit!3831)

(assert (=> b!55588 (= lt!86807 lt!86812)))

(declare-fun lt!86822 () (_ BitVec 64))

(assert (=> b!55588 (validate_offset_bits!1 ((_ sign_extend 32) (size!1176 (buf!1539 (_2!2640 lt!86832)))) ((_ sign_extend 32) (currentByte!3121 (_2!2640 lt!86511))) ((_ sign_extend 32) (currentBit!3116 (_2!2640 lt!86511))) lt!86822)))

(assert (=> b!55588 (= lt!86812 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2640 lt!86511) (buf!1539 (_2!2640 lt!86832)) lt!86822))))

(declare-fun e!37050 () Bool)

(assert (=> b!55588 e!37050))

(declare-fun res!46314 () Bool)

(assert (=> b!55588 (=> (not res!46314) (not e!37050))))

(assert (=> b!55588 (= res!46314 (and (= (size!1176 (buf!1539 (_2!2640 lt!86511))) (size!1176 (buf!1539 (_2!2640 lt!86832)))) (bvsge lt!86822 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!55588 (= lt!86822 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!55588 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!55588 (= lt!86806 (reader!0 (_2!2640 lt!86511) (_2!2640 lt!86832)))))

(declare-fun b!55589 () Bool)

(declare-fun Unit!3837 () Unit!3831)

(assert (=> b!55589 (= e!37049 (tuple2!5059 Unit!3837 (_2!2640 lt!86835)))))

(declare-fun lt!86809 () tuple2!5058)

(assert (=> b!55589 (= lt!86809 (appendBitFromByte!0 (_2!2640 lt!86511) (select (arr!1722 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!86820 () (_ BitVec 64))

(assert (=> b!55589 (= lt!86820 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!86802 () (_ BitVec 64))

(assert (=> b!55589 (= lt!86802 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!86838 () Unit!3831)

(assert (=> b!55589 (= lt!86838 (validateOffsetBitsIneqLemma!0 (_2!2640 lt!86511) (_2!2640 lt!86809) lt!86820 lt!86802))))

(assert (=> b!55589 (validate_offset_bits!1 ((_ sign_extend 32) (size!1176 (buf!1539 (_2!2640 lt!86809)))) ((_ sign_extend 32) (currentByte!3121 (_2!2640 lt!86809))) ((_ sign_extend 32) (currentBit!3116 (_2!2640 lt!86809))) (bvsub lt!86820 lt!86802))))

(declare-fun lt!86800 () Unit!3831)

(assert (=> b!55589 (= lt!86800 lt!86838)))

(declare-fun lt!86805 () tuple2!5060)

(assert (=> b!55589 (= lt!86805 (reader!0 (_2!2640 lt!86511) (_2!2640 lt!86809)))))

(declare-fun lt!86827 () (_ BitVec 64))

(assert (=> b!55589 (= lt!86827 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!86813 () Unit!3831)

(assert (=> b!55589 (= lt!86813 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2640 lt!86511) (buf!1539 (_2!2640 lt!86809)) lt!86827))))

(assert (=> b!55589 (validate_offset_bits!1 ((_ sign_extend 32) (size!1176 (buf!1539 (_2!2640 lt!86809)))) ((_ sign_extend 32) (currentByte!3121 (_2!2640 lt!86511))) ((_ sign_extend 32) (currentBit!3116 (_2!2640 lt!86511))) lt!86827)))

(declare-fun lt!86817 () Unit!3831)

(assert (=> b!55589 (= lt!86817 lt!86813)))

(assert (=> b!55589 (= (head!414 (byteArrayBitContentToList!0 (_2!2640 lt!86809) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!414 (bitStreamReadBitsIntoList!0 (_2!2640 lt!86809) (_1!2641 lt!86805) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!86811 () Unit!3831)

(declare-fun Unit!3838 () Unit!3831)

(assert (=> b!55589 (= lt!86811 Unit!3838)))

(assert (=> b!55589 (= lt!86835 (appendBitsMSBFirstLoop!0 (_2!2640 lt!86809) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!86833 () Unit!3831)

(assert (=> b!55589 (= lt!86833 (lemmaIsPrefixTransitive!0 (_2!2640 lt!86511) (_2!2640 lt!86809) (_2!2640 lt!86835)))))

(assert (=> b!55589 (isPrefixOf!0 (_2!2640 lt!86511) (_2!2640 lt!86835))))

(declare-fun lt!86819 () Unit!3831)

(assert (=> b!55589 (= lt!86819 lt!86833)))

(assert (=> b!55589 (= (size!1176 (buf!1539 (_2!2640 lt!86835))) (size!1176 (buf!1539 (_2!2640 lt!86511))))))

(declare-fun lt!86815 () Unit!3831)

(declare-fun Unit!3839 () Unit!3831)

(assert (=> b!55589 (= lt!86815 Unit!3839)))

(assert (=> b!55589 (= (bitIndex!0 (size!1176 (buf!1539 (_2!2640 lt!86835))) (currentByte!3121 (_2!2640 lt!86835)) (currentBit!3116 (_2!2640 lt!86835))) (bvsub (bvadd (bitIndex!0 (size!1176 (buf!1539 (_2!2640 lt!86511))) (currentByte!3121 (_2!2640 lt!86511)) (currentBit!3116 (_2!2640 lt!86511))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!86801 () Unit!3831)

(declare-fun Unit!3840 () Unit!3831)

(assert (=> b!55589 (= lt!86801 Unit!3840)))

(assert (=> b!55589 (= (bitIndex!0 (size!1176 (buf!1539 (_2!2640 lt!86835))) (currentByte!3121 (_2!2640 lt!86835)) (currentBit!3116 (_2!2640 lt!86835))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1176 (buf!1539 (_2!2640 lt!86809))) (currentByte!3121 (_2!2640 lt!86809)) (currentBit!3116 (_2!2640 lt!86809))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!86834 () Unit!3831)

(declare-fun Unit!3841 () Unit!3831)

(assert (=> b!55589 (= lt!86834 Unit!3841)))

(declare-fun lt!86831 () tuple2!5060)

(assert (=> b!55589 (= lt!86831 call!712)))

(declare-fun lt!86818 () (_ BitVec 64))

(assert (=> b!55589 (= lt!86818 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!86842 () Unit!3831)

(assert (=> b!55589 (= lt!86842 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2640 lt!86511) (buf!1539 (_2!2640 lt!86835)) lt!86818))))

(assert (=> b!55589 (validate_offset_bits!1 ((_ sign_extend 32) (size!1176 (buf!1539 (_2!2640 lt!86835)))) ((_ sign_extend 32) (currentByte!3121 (_2!2640 lt!86511))) ((_ sign_extend 32) (currentBit!3116 (_2!2640 lt!86511))) lt!86818)))

(declare-fun lt!86814 () Unit!3831)

(assert (=> b!55589 (= lt!86814 lt!86842)))

(declare-fun lt!86825 () tuple2!5060)

(assert (=> b!55589 (= lt!86825 (reader!0 (_2!2640 lt!86809) (_2!2640 lt!86835)))))

(declare-fun lt!86830 () (_ BitVec 64))

(assert (=> b!55589 (= lt!86830 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!86808 () Unit!3831)

(assert (=> b!55589 (= lt!86808 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2640 lt!86809) (buf!1539 (_2!2640 lt!86835)) lt!86830))))

(assert (=> b!55589 (validate_offset_bits!1 ((_ sign_extend 32) (size!1176 (buf!1539 (_2!2640 lt!86835)))) ((_ sign_extend 32) (currentByte!3121 (_2!2640 lt!86809))) ((_ sign_extend 32) (currentBit!3116 (_2!2640 lt!86809))) lt!86830)))

(declare-fun lt!86836 () Unit!3831)

(assert (=> b!55589 (= lt!86836 lt!86808)))

(declare-fun lt!86816 () List!595)

(assert (=> b!55589 (= lt!86816 (byteArrayBitContentToList!0 (_2!2640 lt!86835) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!86803 () List!595)

(assert (=> b!55589 (= lt!86803 (byteArrayBitContentToList!0 (_2!2640 lt!86835) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!86826 () List!595)

(assert (=> b!55589 (= lt!86826 (bitStreamReadBitsIntoList!0 (_2!2640 lt!86835) (_1!2641 lt!86831) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!86828 () List!595)

(assert (=> b!55589 (= lt!86828 (bitStreamReadBitsIntoList!0 (_2!2640 lt!86835) (_1!2641 lt!86825) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!86839 () (_ BitVec 64))

(assert (=> b!55589 (= lt!86839 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!86829 () Unit!3831)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2040 BitStream!2040 BitStream!2040 BitStream!2040 (_ BitVec 64) List!595) Unit!3831)

(assert (=> b!55589 (= lt!86829 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2640 lt!86835) (_2!2640 lt!86835) (_1!2641 lt!86831) (_1!2641 lt!86825) lt!86839 lt!86826))))

(declare-fun tail!264 (List!595) List!595)

(assert (=> b!55589 (= (bitStreamReadBitsIntoList!0 (_2!2640 lt!86835) (_1!2641 lt!86825) (bvsub lt!86839 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!264 lt!86826))))

(declare-fun lt!86804 () Unit!3831)

(assert (=> b!55589 (= lt!86804 lt!86829)))

(declare-fun lt!86799 () Unit!3831)

(declare-fun lt!86810 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2583 array!2583 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3831)

(assert (=> b!55589 (= lt!86799 (arrayBitRangesEqImpliesEq!0 (buf!1539 (_2!2640 lt!86809)) (buf!1539 (_2!2640 lt!86835)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!86810 (bitIndex!0 (size!1176 (buf!1539 (_2!2640 lt!86809))) (currentByte!3121 (_2!2640 lt!86809)) (currentBit!3116 (_2!2640 lt!86809)))))))

(declare-fun bitAt!0 (array!2583 (_ BitVec 64)) Bool)

(assert (=> b!55589 (= (bitAt!0 (buf!1539 (_2!2640 lt!86809)) lt!86810) (bitAt!0 (buf!1539 (_2!2640 lt!86835)) lt!86810))))

(declare-fun lt!86823 () Unit!3831)

(assert (=> b!55589 (= lt!86823 lt!86799)))

(declare-fun b!55590 () Bool)

(declare-fun res!46313 () Bool)

(assert (=> b!55590 (=> (not res!46313) (not e!37048))))

(assert (=> b!55590 (= res!46313 (= (size!1176 (buf!1539 (_2!2640 lt!86832))) (size!1176 (buf!1539 (_2!2640 lt!86511)))))))

(declare-fun b!55591 () Bool)

(declare-fun res!46316 () Bool)

(assert (=> b!55591 (=> (not res!46316) (not e!37048))))

(assert (=> b!55591 (= res!46316 (isPrefixOf!0 (_2!2640 lt!86511) (_2!2640 lt!86832)))))

(declare-fun b!55585 () Bool)

(assert (=> b!55585 (= e!37050 (validate_offset_bits!1 ((_ sign_extend 32) (size!1176 (buf!1539 (_2!2640 lt!86511)))) ((_ sign_extend 32) (currentByte!3121 (_2!2640 lt!86511))) ((_ sign_extend 32) (currentBit!3116 (_2!2640 lt!86511))) lt!86822))))

(declare-fun d!17662 () Bool)

(assert (=> d!17662 e!37048))

(declare-fun res!46312 () Bool)

(assert (=> d!17662 (=> (not res!46312) (not e!37048))))

(declare-fun lt!86824 () (_ BitVec 64))

(assert (=> d!17662 (= res!46312 (= (bitIndex!0 (size!1176 (buf!1539 (_2!2640 lt!86832))) (currentByte!3121 (_2!2640 lt!86832)) (currentBit!3116 (_2!2640 lt!86832))) (bvsub lt!86824 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!17662 (or (= (bvand lt!86824 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!86824 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!86824 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!86841 () (_ BitVec 64))

(assert (=> d!17662 (= lt!86824 (bvadd lt!86841 to!314))))

(assert (=> d!17662 (or (not (= (bvand lt!86841 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!86841 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!86841 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17662 (= lt!86841 (bitIndex!0 (size!1176 (buf!1539 (_2!2640 lt!86511))) (currentByte!3121 (_2!2640 lt!86511)) (currentBit!3116 (_2!2640 lt!86511))))))

(assert (=> d!17662 (= lt!86832 e!37049)))

(assert (=> d!17662 (= c!3963 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!86821 () Unit!3831)

(declare-fun lt!86840 () Unit!3831)

(assert (=> d!17662 (= lt!86821 lt!86840)))

(assert (=> d!17662 (isPrefixOf!0 (_2!2640 lt!86511) (_2!2640 lt!86511))))

(assert (=> d!17662 (= lt!86840 (lemmaIsPrefixRefl!0 (_2!2640 lt!86511)))))

(assert (=> d!17662 (= lt!86810 (bitIndex!0 (size!1176 (buf!1539 (_2!2640 lt!86511))) (currentByte!3121 (_2!2640 lt!86511)) (currentBit!3116 (_2!2640 lt!86511))))))

(assert (=> d!17662 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17662 (= (appendBitsMSBFirstLoop!0 (_2!2640 lt!86511) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!86832)))

(assert (= (and d!17662 c!3963) b!55589))

(assert (= (and d!17662 (not c!3963)) b!55586))

(assert (= (or b!55589 b!55586) bm!709))

(assert (= (and d!17662 res!46312) b!55584))

(assert (= (and b!55584 res!46311) b!55587))

(assert (= (and b!55587 res!46315) b!55591))

(assert (= (and b!55591 res!46316) b!55590))

(assert (= (and b!55590 res!46313) b!55588))

(assert (= (and b!55588 res!46314) b!55585))

(declare-fun m!87525 () Bool)

(assert (=> b!55591 m!87525))

(declare-fun m!87527 () Bool)

(assert (=> b!55586 m!87527))

(declare-fun m!87529 () Bool)

(assert (=> b!55586 m!87529))

(declare-fun m!87531 () Bool)

(assert (=> b!55585 m!87531))

(declare-fun m!87533 () Bool)

(assert (=> bm!709 m!87533))

(declare-fun m!87535 () Bool)

(assert (=> d!17662 m!87535))

(assert (=> d!17662 m!87443))

(declare-fun m!87537 () Bool)

(assert (=> d!17662 m!87537))

(declare-fun m!87539 () Bool)

(assert (=> d!17662 m!87539))

(declare-fun m!87541 () Bool)

(assert (=> b!55584 m!87541))

(declare-fun m!87543 () Bool)

(assert (=> b!55588 m!87543))

(declare-fun m!87545 () Bool)

(assert (=> b!55588 m!87545))

(declare-fun m!87547 () Bool)

(assert (=> b!55588 m!87547))

(declare-fun m!87549 () Bool)

(assert (=> b!55588 m!87549))

(declare-fun m!87551 () Bool)

(assert (=> b!55588 m!87551))

(declare-fun m!87553 () Bool)

(assert (=> b!55589 m!87553))

(declare-fun m!87555 () Bool)

(assert (=> b!55589 m!87555))

(declare-fun m!87557 () Bool)

(assert (=> b!55589 m!87557))

(declare-fun m!87559 () Bool)

(assert (=> b!55589 m!87559))

(declare-fun m!87561 () Bool)

(assert (=> b!55589 m!87561))

(declare-fun m!87563 () Bool)

(assert (=> b!55589 m!87563))

(assert (=> b!55589 m!87553))

(declare-fun m!87565 () Bool)

(assert (=> b!55589 m!87565))

(declare-fun m!87567 () Bool)

(assert (=> b!55589 m!87567))

(declare-fun m!87569 () Bool)

(assert (=> b!55589 m!87569))

(assert (=> b!55589 m!87443))

(declare-fun m!87571 () Bool)

(assert (=> b!55589 m!87571))

(declare-fun m!87573 () Bool)

(assert (=> b!55589 m!87573))

(declare-fun m!87575 () Bool)

(assert (=> b!55589 m!87575))

(declare-fun m!87577 () Bool)

(assert (=> b!55589 m!87577))

(declare-fun m!87579 () Bool)

(assert (=> b!55589 m!87579))

(declare-fun m!87581 () Bool)

(assert (=> b!55589 m!87581))

(declare-fun m!87583 () Bool)

(assert (=> b!55589 m!87583))

(assert (=> b!55589 m!87581))

(declare-fun m!87585 () Bool)

(assert (=> b!55589 m!87585))

(assert (=> b!55589 m!87557))

(declare-fun m!87587 () Bool)

(assert (=> b!55589 m!87587))

(declare-fun m!87589 () Bool)

(assert (=> b!55589 m!87589))

(declare-fun m!87591 () Bool)

(assert (=> b!55589 m!87591))

(declare-fun m!87593 () Bool)

(assert (=> b!55589 m!87593))

(assert (=> b!55589 m!87561))

(declare-fun m!87595 () Bool)

(assert (=> b!55589 m!87595))

(declare-fun m!87597 () Bool)

(assert (=> b!55589 m!87597))

(declare-fun m!87599 () Bool)

(assert (=> b!55589 m!87599))

(declare-fun m!87601 () Bool)

(assert (=> b!55589 m!87601))

(declare-fun m!87603 () Bool)

(assert (=> b!55589 m!87603))

(declare-fun m!87605 () Bool)

(assert (=> b!55589 m!87605))

(declare-fun m!87607 () Bool)

(assert (=> b!55589 m!87607))

(declare-fun m!87609 () Bool)

(assert (=> b!55589 m!87609))

(declare-fun m!87611 () Bool)

(assert (=> b!55589 m!87611))

(declare-fun m!87613 () Bool)

(assert (=> b!55589 m!87613))

(assert (=> b!55438 d!17662))

(declare-fun d!17698 () Bool)

(assert (=> d!17698 (isPrefixOf!0 thiss!1379 (_2!2640 lt!86506))))

(declare-fun lt!86845 () Unit!3831)

(declare-fun choose!30 (BitStream!2040 BitStream!2040 BitStream!2040) Unit!3831)

(assert (=> d!17698 (= lt!86845 (choose!30 thiss!1379 (_2!2640 lt!86511) (_2!2640 lt!86506)))))

(assert (=> d!17698 (isPrefixOf!0 thiss!1379 (_2!2640 lt!86511))))

(assert (=> d!17698 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2640 lt!86511) (_2!2640 lt!86506)) lt!86845)))

(declare-fun bs!4448 () Bool)

(assert (= bs!4448 d!17698))

(assert (=> bs!4448 m!87357))

(declare-fun m!87615 () Bool)

(assert (=> bs!4448 m!87615))

(assert (=> bs!4448 m!87343))

(assert (=> b!55438 d!17698))

(declare-fun b!55602 () Bool)

(declare-fun res!46323 () Bool)

(declare-fun e!37056 () Bool)

(assert (=> b!55602 (=> (not res!46323) (not e!37056))))

(declare-fun lt!86893 () tuple2!5060)

(assert (=> b!55602 (= res!46323 (isPrefixOf!0 (_2!2641 lt!86893) (_2!2640 lt!86511)))))

(declare-fun b!55603 () Bool)

(declare-fun lt!86904 () (_ BitVec 64))

(declare-fun lt!86898 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2040 (_ BitVec 64)) BitStream!2040)

(assert (=> b!55603 (= e!37056 (= (_1!2641 lt!86893) (withMovedBitIndex!0 (_2!2641 lt!86893) (bvsub lt!86904 lt!86898))))))

(assert (=> b!55603 (or (= (bvand lt!86904 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!86898 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!86904 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!86904 lt!86898) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!55603 (= lt!86898 (bitIndex!0 (size!1176 (buf!1539 (_2!2640 lt!86511))) (currentByte!3121 (_2!2640 lt!86511)) (currentBit!3116 (_2!2640 lt!86511))))))

(assert (=> b!55603 (= lt!86904 (bitIndex!0 (size!1176 (buf!1539 thiss!1379)) (currentByte!3121 thiss!1379) (currentBit!3116 thiss!1379)))))

(declare-fun d!17700 () Bool)

(assert (=> d!17700 e!37056))

(declare-fun res!46324 () Bool)

(assert (=> d!17700 (=> (not res!46324) (not e!37056))))

(assert (=> d!17700 (= res!46324 (isPrefixOf!0 (_1!2641 lt!86893) (_2!2641 lt!86893)))))

(declare-fun lt!86886 () BitStream!2040)

(assert (=> d!17700 (= lt!86893 (tuple2!5061 lt!86886 (_2!2640 lt!86511)))))

(declare-fun lt!86894 () Unit!3831)

(declare-fun lt!86903 () Unit!3831)

(assert (=> d!17700 (= lt!86894 lt!86903)))

(assert (=> d!17700 (isPrefixOf!0 lt!86886 (_2!2640 lt!86511))))

(assert (=> d!17700 (= lt!86903 (lemmaIsPrefixTransitive!0 lt!86886 (_2!2640 lt!86511) (_2!2640 lt!86511)))))

(declare-fun lt!86900 () Unit!3831)

(declare-fun lt!86892 () Unit!3831)

(assert (=> d!17700 (= lt!86900 lt!86892)))

(assert (=> d!17700 (isPrefixOf!0 lt!86886 (_2!2640 lt!86511))))

(assert (=> d!17700 (= lt!86892 (lemmaIsPrefixTransitive!0 lt!86886 thiss!1379 (_2!2640 lt!86511)))))

(declare-fun lt!86905 () Unit!3831)

(declare-fun e!37055 () Unit!3831)

(assert (=> d!17700 (= lt!86905 e!37055)))

(declare-fun c!3966 () Bool)

(assert (=> d!17700 (= c!3966 (not (= (size!1176 (buf!1539 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!86888 () Unit!3831)

(declare-fun lt!86895 () Unit!3831)

(assert (=> d!17700 (= lt!86888 lt!86895)))

(assert (=> d!17700 (isPrefixOf!0 (_2!2640 lt!86511) (_2!2640 lt!86511))))

(assert (=> d!17700 (= lt!86895 (lemmaIsPrefixRefl!0 (_2!2640 lt!86511)))))

(declare-fun lt!86897 () Unit!3831)

(declare-fun lt!86887 () Unit!3831)

(assert (=> d!17700 (= lt!86897 lt!86887)))

(assert (=> d!17700 (= lt!86887 (lemmaIsPrefixRefl!0 (_2!2640 lt!86511)))))

(declare-fun lt!86902 () Unit!3831)

(declare-fun lt!86901 () Unit!3831)

(assert (=> d!17700 (= lt!86902 lt!86901)))

(assert (=> d!17700 (isPrefixOf!0 lt!86886 lt!86886)))

(assert (=> d!17700 (= lt!86901 (lemmaIsPrefixRefl!0 lt!86886))))

(declare-fun lt!86890 () Unit!3831)

(declare-fun lt!86899 () Unit!3831)

(assert (=> d!17700 (= lt!86890 lt!86899)))

(assert (=> d!17700 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!17700 (= lt!86899 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!17700 (= lt!86886 (BitStream!2041 (buf!1539 (_2!2640 lt!86511)) (currentByte!3121 thiss!1379) (currentBit!3116 thiss!1379)))))

(assert (=> d!17700 (isPrefixOf!0 thiss!1379 (_2!2640 lt!86511))))

(assert (=> d!17700 (= (reader!0 thiss!1379 (_2!2640 lt!86511)) lt!86893)))

(declare-fun b!55604 () Bool)

(declare-fun Unit!3842 () Unit!3831)

(assert (=> b!55604 (= e!37055 Unit!3842)))

(declare-fun b!55605 () Bool)

(declare-fun lt!86891 () Unit!3831)

(assert (=> b!55605 (= e!37055 lt!86891)))

(declare-fun lt!86896 () (_ BitVec 64))

(assert (=> b!55605 (= lt!86896 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86889 () (_ BitVec 64))

(assert (=> b!55605 (= lt!86889 (bitIndex!0 (size!1176 (buf!1539 thiss!1379)) (currentByte!3121 thiss!1379) (currentBit!3116 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2583 array!2583 (_ BitVec 64) (_ BitVec 64)) Unit!3831)

(assert (=> b!55605 (= lt!86891 (arrayBitRangesEqSymmetric!0 (buf!1539 thiss!1379) (buf!1539 (_2!2640 lt!86511)) lt!86896 lt!86889))))

(assert (=> b!55605 (arrayBitRangesEq!0 (buf!1539 (_2!2640 lt!86511)) (buf!1539 thiss!1379) lt!86896 lt!86889)))

(declare-fun b!55606 () Bool)

(declare-fun res!46325 () Bool)

(assert (=> b!55606 (=> (not res!46325) (not e!37056))))

(assert (=> b!55606 (= res!46325 (isPrefixOf!0 (_1!2641 lt!86893) thiss!1379))))

(assert (= (and d!17700 c!3966) b!55605))

(assert (= (and d!17700 (not c!3966)) b!55604))

(assert (= (and d!17700 res!46324) b!55606))

(assert (= (and b!55606 res!46325) b!55602))

(assert (= (and b!55602 res!46323) b!55603))

(declare-fun m!87617 () Bool)

(assert (=> d!17700 m!87617))

(declare-fun m!87619 () Bool)

(assert (=> d!17700 m!87619))

(declare-fun m!87621 () Bool)

(assert (=> d!17700 m!87621))

(declare-fun m!87623 () Bool)

(assert (=> d!17700 m!87623))

(assert (=> d!17700 m!87373))

(declare-fun m!87625 () Bool)

(assert (=> d!17700 m!87625))

(declare-fun m!87627 () Bool)

(assert (=> d!17700 m!87627))

(assert (=> d!17700 m!87537))

(assert (=> d!17700 m!87343))

(assert (=> d!17700 m!87375))

(assert (=> d!17700 m!87539))

(declare-fun m!87629 () Bool)

(assert (=> b!55602 m!87629))

(assert (=> b!55605 m!87377))

(declare-fun m!87631 () Bool)

(assert (=> b!55605 m!87631))

(declare-fun m!87633 () Bool)

(assert (=> b!55605 m!87633))

(declare-fun m!87635 () Bool)

(assert (=> b!55606 m!87635))

(declare-fun m!87637 () Bool)

(assert (=> b!55603 m!87637))

(assert (=> b!55603 m!87443))

(assert (=> b!55603 m!87377))

(assert (=> b!55438 d!17700))

(declare-fun d!17702 () Bool)

(assert (=> d!17702 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1176 (buf!1539 (_2!2640 lt!86511)))) ((_ sign_extend 32) (currentByte!3121 thiss!1379)) ((_ sign_extend 32) (currentBit!3116 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1176 (buf!1539 (_2!2640 lt!86511)))) ((_ sign_extend 32) (currentByte!3121 thiss!1379)) ((_ sign_extend 32) (currentBit!3116 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4449 () Bool)

(assert (= bs!4449 d!17702))

(declare-fun m!87639 () Bool)

(assert (=> bs!4449 m!87639))

(assert (=> b!55438 d!17702))

(declare-fun d!17704 () Bool)

(declare-fun res!46326 () Bool)

(declare-fun e!37057 () Bool)

(assert (=> d!17704 (=> (not res!46326) (not e!37057))))

(assert (=> d!17704 (= res!46326 (= (size!1176 (buf!1539 thiss!1379)) (size!1176 (buf!1539 (_2!2640 lt!86511)))))))

(assert (=> d!17704 (= (isPrefixOf!0 thiss!1379 (_2!2640 lt!86511)) e!37057)))

(declare-fun b!55607 () Bool)

(declare-fun res!46328 () Bool)

(assert (=> b!55607 (=> (not res!46328) (not e!37057))))

(assert (=> b!55607 (= res!46328 (bvsle (bitIndex!0 (size!1176 (buf!1539 thiss!1379)) (currentByte!3121 thiss!1379) (currentBit!3116 thiss!1379)) (bitIndex!0 (size!1176 (buf!1539 (_2!2640 lt!86511))) (currentByte!3121 (_2!2640 lt!86511)) (currentBit!3116 (_2!2640 lt!86511)))))))

(declare-fun b!55608 () Bool)

(declare-fun e!37058 () Bool)

(assert (=> b!55608 (= e!37057 e!37058)))

(declare-fun res!46327 () Bool)

(assert (=> b!55608 (=> res!46327 e!37058)))

(assert (=> b!55608 (= res!46327 (= (size!1176 (buf!1539 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!55609 () Bool)

(assert (=> b!55609 (= e!37058 (arrayBitRangesEq!0 (buf!1539 thiss!1379) (buf!1539 (_2!2640 lt!86511)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1176 (buf!1539 thiss!1379)) (currentByte!3121 thiss!1379) (currentBit!3116 thiss!1379))))))

(assert (= (and d!17704 res!46326) b!55607))

(assert (= (and b!55607 res!46328) b!55608))

(assert (= (and b!55608 (not res!46327)) b!55609))

(assert (=> b!55607 m!87377))

(assert (=> b!55607 m!87443))

(assert (=> b!55609 m!87377))

(assert (=> b!55609 m!87377))

(declare-fun m!87641 () Bool)

(assert (=> b!55609 m!87641))

(assert (=> b!55441 d!17704))

(declare-fun d!17706 () Bool)

(assert (=> d!17706 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1176 (buf!1539 (_2!2640 lt!86511)))) ((_ sign_extend 32) (currentByte!3121 (_2!2640 lt!86511))) ((_ sign_extend 32) (currentBit!3116 (_2!2640 lt!86511))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1176 (buf!1539 (_2!2640 lt!86511)))) ((_ sign_extend 32) (currentByte!3121 (_2!2640 lt!86511))) ((_ sign_extend 32) (currentBit!3116 (_2!2640 lt!86511)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4450 () Bool)

(assert (= bs!4450 d!17706))

(declare-fun m!87643 () Bool)

(assert (=> bs!4450 m!87643))

(assert (=> b!55441 d!17706))

(declare-fun d!17708 () Bool)

(declare-fun e!37061 () Bool)

(assert (=> d!17708 e!37061))

(declare-fun res!46331 () Bool)

(assert (=> d!17708 (=> (not res!46331) (not e!37061))))

(assert (=> d!17708 (= res!46331 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!86908 () Unit!3831)

(declare-fun choose!27 (BitStream!2040 BitStream!2040 (_ BitVec 64) (_ BitVec 64)) Unit!3831)

(assert (=> d!17708 (= lt!86908 (choose!27 thiss!1379 (_2!2640 lt!86511) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!17708 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!17708 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2640 lt!86511) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!86908)))

(declare-fun b!55612 () Bool)

(assert (=> b!55612 (= e!37061 (validate_offset_bits!1 ((_ sign_extend 32) (size!1176 (buf!1539 (_2!2640 lt!86511)))) ((_ sign_extend 32) (currentByte!3121 (_2!2640 lt!86511))) ((_ sign_extend 32) (currentBit!3116 (_2!2640 lt!86511))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!17708 res!46331) b!55612))

(declare-fun m!87645 () Bool)

(assert (=> d!17708 m!87645))

(assert (=> b!55612 m!87341))

(assert (=> b!55441 d!17708))

(declare-fun b!55630 () Bool)

(declare-fun e!37071 () Bool)

(declare-datatypes ((tuple2!5068 0))(
  ( (tuple2!5069 (_1!2645 BitStream!2040) (_2!2645 Bool)) )
))
(declare-fun lt!86936 () tuple2!5068)

(declare-fun lt!86943 () tuple2!5058)

(assert (=> b!55630 (= e!37071 (= (bitIndex!0 (size!1176 (buf!1539 (_1!2645 lt!86936))) (currentByte!3121 (_1!2645 lt!86936)) (currentBit!3116 (_1!2645 lt!86936))) (bitIndex!0 (size!1176 (buf!1539 (_2!2640 lt!86943))) (currentByte!3121 (_2!2640 lt!86943)) (currentBit!3116 (_2!2640 lt!86943)))))))

(declare-fun b!55631 () Bool)

(declare-fun res!46351 () Bool)

(declare-fun e!37070 () Bool)

(assert (=> b!55631 (=> (not res!46351) (not e!37070))))

(declare-fun lt!86944 () (_ BitVec 64))

(declare-fun lt!86941 () (_ BitVec 64))

(assert (=> b!55631 (= res!46351 (= (bitIndex!0 (size!1176 (buf!1539 (_2!2640 lt!86943))) (currentByte!3121 (_2!2640 lt!86943)) (currentBit!3116 (_2!2640 lt!86943))) (bvadd lt!86944 lt!86941)))))

(assert (=> b!55631 (or (not (= (bvand lt!86944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!86941 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!86944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!86944 lt!86941) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!55631 (= lt!86941 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!55631 (= lt!86944 (bitIndex!0 (size!1176 (buf!1539 thiss!1379)) (currentByte!3121 thiss!1379) (currentBit!3116 thiss!1379)))))

(declare-fun b!55632 () Bool)

(declare-fun e!37072 () Bool)

(declare-fun lt!86938 () tuple2!5068)

(declare-fun lt!86937 () tuple2!5058)

(assert (=> b!55632 (= e!37072 (= (bitIndex!0 (size!1176 (buf!1539 (_1!2645 lt!86938))) (currentByte!3121 (_1!2645 lt!86938)) (currentBit!3116 (_1!2645 lt!86938))) (bitIndex!0 (size!1176 (buf!1539 (_2!2640 lt!86937))) (currentByte!3121 (_2!2640 lt!86937)) (currentBit!3116 (_2!2640 lt!86937)))))))

(declare-fun b!55633 () Bool)

(declare-fun e!37073 () Bool)

(assert (=> b!55633 (= e!37073 e!37072)))

(declare-fun res!46355 () Bool)

(assert (=> b!55633 (=> (not res!46355) (not e!37072))))

(declare-fun lt!86940 () Bool)

(assert (=> b!55633 (= res!46355 (and (= (_2!2645 lt!86938) lt!86940) (= (_1!2645 lt!86938) (_2!2640 lt!86937))))))

(declare-fun readBitPure!0 (BitStream!2040) tuple2!5068)

(declare-fun readerFrom!0 (BitStream!2040 (_ BitVec 32) (_ BitVec 32)) BitStream!2040)

(assert (=> b!55633 (= lt!86938 (readBitPure!0 (readerFrom!0 (_2!2640 lt!86937) (currentBit!3116 thiss!1379) (currentByte!3121 thiss!1379))))))

(declare-fun b!55634 () Bool)

(assert (=> b!55634 (= e!37070 e!37071)))

(declare-fun res!46354 () Bool)

(assert (=> b!55634 (=> (not res!46354) (not e!37071))))

(declare-fun lt!86934 () (_ BitVec 8))

(assert (=> b!55634 (= res!46354 (and (= (_2!2645 lt!86936) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1722 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!86934)) #b00000000000000000000000000000000))) (= (_1!2645 lt!86936) (_2!2640 lt!86943))))))

(declare-fun lt!86942 () tuple2!5066)

(declare-fun lt!86939 () BitStream!2040)

(assert (=> b!55634 (= lt!86942 (readBits!0 lt!86939 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!55634 (= lt!86936 (readBitPure!0 lt!86939))))

(assert (=> b!55634 (= lt!86939 (readerFrom!0 (_2!2640 lt!86943) (currentBit!3116 thiss!1379) (currentByte!3121 thiss!1379)))))

(declare-fun b!55636 () Bool)

(declare-fun res!46348 () Bool)

(assert (=> b!55636 (=> (not res!46348) (not e!37070))))

(assert (=> b!55636 (= res!46348 (isPrefixOf!0 thiss!1379 (_2!2640 lt!86943)))))

(declare-fun b!55637 () Bool)

(declare-fun res!46349 () Bool)

(assert (=> b!55637 (=> (not res!46349) (not e!37073))))

(assert (=> b!55637 (= res!46349 (isPrefixOf!0 thiss!1379 (_2!2640 lt!86937)))))

(declare-fun b!55635 () Bool)

(declare-fun res!46350 () Bool)

(assert (=> b!55635 (=> (not res!46350) (not e!37073))))

(assert (=> b!55635 (= res!46350 (= (bitIndex!0 (size!1176 (buf!1539 (_2!2640 lt!86937))) (currentByte!3121 (_2!2640 lt!86937)) (currentBit!3116 (_2!2640 lt!86937))) (bvadd (bitIndex!0 (size!1176 (buf!1539 thiss!1379)) (currentByte!3121 thiss!1379) (currentBit!3116 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!17710 () Bool)

(assert (=> d!17710 e!37070))

(declare-fun res!46353 () Bool)

(assert (=> d!17710 (=> (not res!46353) (not e!37070))))

(assert (=> d!17710 (= res!46353 (= (size!1176 (buf!1539 (_2!2640 lt!86943))) (size!1176 (buf!1539 thiss!1379))))))

(declare-fun lt!86933 () array!2583)

(assert (=> d!17710 (= lt!86934 (select (arr!1722 lt!86933) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!17710 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1176 lt!86933)))))

(assert (=> d!17710 (= lt!86933 (array!2584 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!86935 () tuple2!5058)

(assert (=> d!17710 (= lt!86943 (tuple2!5059 (_1!2640 lt!86935) (_2!2640 lt!86935)))))

(assert (=> d!17710 (= lt!86935 lt!86937)))

(assert (=> d!17710 e!37073))

(declare-fun res!46352 () Bool)

(assert (=> d!17710 (=> (not res!46352) (not e!37073))))

(assert (=> d!17710 (= res!46352 (= (size!1176 (buf!1539 thiss!1379)) (size!1176 (buf!1539 (_2!2640 lt!86937)))))))

(declare-fun appendBit!0 (BitStream!2040 Bool) tuple2!5058)

(assert (=> d!17710 (= lt!86937 (appendBit!0 thiss!1379 lt!86940))))

(assert (=> d!17710 (= lt!86940 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1722 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!17710 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!17710 (= (appendBitFromByte!0 thiss!1379 (select (arr!1722 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!86943)))

(assert (= (and d!17710 res!46352) b!55635))

(assert (= (and b!55635 res!46350) b!55637))

(assert (= (and b!55637 res!46349) b!55633))

(assert (= (and b!55633 res!46355) b!55632))

(assert (= (and d!17710 res!46353) b!55631))

(assert (= (and b!55631 res!46351) b!55636))

(assert (= (and b!55636 res!46348) b!55634))

(assert (= (and b!55634 res!46354) b!55630))

(declare-fun m!87647 () Bool)

(assert (=> b!55632 m!87647))

(declare-fun m!87649 () Bool)

(assert (=> b!55632 m!87649))

(declare-fun m!87651 () Bool)

(assert (=> b!55634 m!87651))

(declare-fun m!87653 () Bool)

(assert (=> b!55634 m!87653))

(declare-fun m!87655 () Bool)

(assert (=> b!55634 m!87655))

(declare-fun m!87657 () Bool)

(assert (=> b!55636 m!87657))

(declare-fun m!87659 () Bool)

(assert (=> d!17710 m!87659))

(declare-fun m!87661 () Bool)

(assert (=> d!17710 m!87661))

(declare-fun m!87663 () Bool)

(assert (=> d!17710 m!87663))

(assert (=> b!55635 m!87649))

(assert (=> b!55635 m!87377))

(declare-fun m!87665 () Bool)

(assert (=> b!55637 m!87665))

(declare-fun m!87667 () Bool)

(assert (=> b!55630 m!87667))

(declare-fun m!87669 () Bool)

(assert (=> b!55630 m!87669))

(assert (=> b!55631 m!87669))

(assert (=> b!55631 m!87377))

(declare-fun m!87671 () Bool)

(assert (=> b!55633 m!87671))

(assert (=> b!55633 m!87671))

(declare-fun m!87673 () Bool)

(assert (=> b!55633 m!87673))

(assert (=> b!55441 d!17710))

(declare-fun d!17712 () Bool)

(declare-fun e!37074 () Bool)

(assert (=> d!17712 e!37074))

(declare-fun res!46357 () Bool)

(assert (=> d!17712 (=> (not res!46357) (not e!37074))))

(declare-fun lt!86947 () (_ BitVec 64))

(declare-fun lt!86948 () (_ BitVec 64))

(declare-fun lt!86950 () (_ BitVec 64))

(assert (=> d!17712 (= res!46357 (= lt!86950 (bvsub lt!86947 lt!86948)))))

(assert (=> d!17712 (or (= (bvand lt!86947 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!86948 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!86947 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!86947 lt!86948) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17712 (= lt!86948 (remainingBits!0 ((_ sign_extend 32) (size!1176 (buf!1539 (_2!2640 lt!86506)))) ((_ sign_extend 32) (currentByte!3121 (_2!2640 lt!86506))) ((_ sign_extend 32) (currentBit!3116 (_2!2640 lt!86506)))))))

(declare-fun lt!86945 () (_ BitVec 64))

(declare-fun lt!86946 () (_ BitVec 64))

(assert (=> d!17712 (= lt!86947 (bvmul lt!86945 lt!86946))))

(assert (=> d!17712 (or (= lt!86945 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!86946 (bvsdiv (bvmul lt!86945 lt!86946) lt!86945)))))

(assert (=> d!17712 (= lt!86946 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17712 (= lt!86945 ((_ sign_extend 32) (size!1176 (buf!1539 (_2!2640 lt!86506)))))))

(assert (=> d!17712 (= lt!86950 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3121 (_2!2640 lt!86506))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3116 (_2!2640 lt!86506)))))))

(assert (=> d!17712 (invariant!0 (currentBit!3116 (_2!2640 lt!86506)) (currentByte!3121 (_2!2640 lt!86506)) (size!1176 (buf!1539 (_2!2640 lt!86506))))))

(assert (=> d!17712 (= (bitIndex!0 (size!1176 (buf!1539 (_2!2640 lt!86506))) (currentByte!3121 (_2!2640 lt!86506)) (currentBit!3116 (_2!2640 lt!86506))) lt!86950)))

(declare-fun b!55638 () Bool)

(declare-fun res!46356 () Bool)

(assert (=> b!55638 (=> (not res!46356) (not e!37074))))

(assert (=> b!55638 (= res!46356 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!86950))))

(declare-fun b!55639 () Bool)

(declare-fun lt!86949 () (_ BitVec 64))

(assert (=> b!55639 (= e!37074 (bvsle lt!86950 (bvmul lt!86949 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!55639 (or (= lt!86949 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!86949 #b0000000000000000000000000000000000000000000000000000000000001000) lt!86949)))))

(assert (=> b!55639 (= lt!86949 ((_ sign_extend 32) (size!1176 (buf!1539 (_2!2640 lt!86506)))))))

(assert (= (and d!17712 res!46357) b!55638))

(assert (= (and b!55638 res!46356) b!55639))

(declare-fun m!87675 () Bool)

(assert (=> d!17712 m!87675))

(assert (=> d!17712 m!87381))

(assert (=> b!55442 d!17712))

(declare-fun d!17714 () Bool)

(assert (=> d!17714 (= (array_inv!1079 (buf!1539 thiss!1379)) (bvsge (size!1176 (buf!1539 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!55445 d!17714))

(declare-fun d!17716 () Bool)

(assert (=> d!17716 (= (array_inv!1079 srcBuffer!2) (bvsge (size!1176 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!11168 d!17716))

(declare-fun d!17718 () Bool)

(assert (=> d!17718 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3116 thiss!1379) (currentByte!3121 thiss!1379) (size!1176 (buf!1539 thiss!1379))))))

(declare-fun bs!4451 () Bool)

(assert (= bs!4451 d!17718))

(assert (=> bs!4451 m!87439))

(assert (=> start!11168 d!17718))

(declare-fun d!17720 () Bool)

(assert (=> d!17720 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1176 (buf!1539 thiss!1379))) ((_ sign_extend 32) (currentByte!3121 thiss!1379)) ((_ sign_extend 32) (currentBit!3116 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1176 (buf!1539 thiss!1379))) ((_ sign_extend 32) (currentByte!3121 thiss!1379)) ((_ sign_extend 32) (currentBit!3116 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4452 () Bool)

(assert (= bs!4452 d!17720))

(assert (=> bs!4452 m!87437))

(assert (=> b!55440 d!17720))

(declare-fun d!17722 () Bool)

(assert (=> d!17722 (= (head!414 (byteArrayBitContentToList!0 (_2!2640 lt!86511) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!710 (byteArrayBitContentToList!0 (_2!2640 lt!86511) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!55446 d!17722))

(declare-fun d!17724 () Bool)

(declare-fun c!3969 () Bool)

(assert (=> d!17724 (= c!3969 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!37077 () List!595)

(assert (=> d!17724 (= (byteArrayBitContentToList!0 (_2!2640 lt!86511) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!37077)))

(declare-fun b!55644 () Bool)

(assert (=> b!55644 (= e!37077 Nil!592)))

(declare-fun b!55645 () Bool)

(assert (=> b!55645 (= e!37077 (Cons!591 (not (= (bvand ((_ sign_extend 24) (select (arr!1722 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2640 lt!86511) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!17724 c!3969) b!55644))

(assert (= (and d!17724 (not c!3969)) b!55645))

(assert (=> b!55645 m!87339))

(assert (=> b!55645 m!87663))

(declare-fun m!87677 () Bool)

(assert (=> b!55645 m!87677))

(assert (=> b!55446 d!17724))

(declare-fun d!17726 () Bool)

(assert (=> d!17726 (= (head!414 (bitStreamReadBitsIntoList!0 (_2!2640 lt!86511) (_1!2641 lt!86510) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!710 (bitStreamReadBitsIntoList!0 (_2!2640 lt!86511) (_1!2641 lt!86510) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!55446 d!17726))

(declare-fun b!55654 () Bool)

(declare-datatypes ((tuple2!5070 0))(
  ( (tuple2!5071 (_1!2646 List!595) (_2!2646 BitStream!2040)) )
))
(declare-fun e!37083 () tuple2!5070)

(assert (=> b!55654 (= e!37083 (tuple2!5071 Nil!592 (_1!2641 lt!86510)))))

(declare-fun b!55657 () Bool)

(declare-fun e!37082 () Bool)

(declare-fun lt!86957 () List!595)

(declare-fun length!276 (List!595) Int)

(assert (=> b!55657 (= e!37082 (> (length!276 lt!86957) 0))))

(declare-fun lt!86959 () (_ BitVec 64))

(declare-fun b!55655 () Bool)

(declare-datatypes ((tuple2!5072 0))(
  ( (tuple2!5073 (_1!2647 Bool) (_2!2647 BitStream!2040)) )
))
(declare-fun lt!86958 () tuple2!5072)

(assert (=> b!55655 (= e!37083 (tuple2!5071 (Cons!591 (_1!2647 lt!86958) (bitStreamReadBitsIntoList!0 (_2!2640 lt!86511) (_2!2647 lt!86958) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!86959))) (_2!2647 lt!86958)))))

(declare-fun readBit!0 (BitStream!2040) tuple2!5072)

(assert (=> b!55655 (= lt!86958 (readBit!0 (_1!2641 lt!86510)))))

(assert (=> b!55655 (= lt!86959 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!17728 () Bool)

(assert (=> d!17728 e!37082))

(declare-fun c!3975 () Bool)

(assert (=> d!17728 (= c!3975 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17728 (= lt!86957 (_1!2646 e!37083))))

(declare-fun c!3974 () Bool)

(assert (=> d!17728 (= c!3974 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17728 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17728 (= (bitStreamReadBitsIntoList!0 (_2!2640 lt!86511) (_1!2641 lt!86510) #b0000000000000000000000000000000000000000000000000000000000000001) lt!86957)))

(declare-fun b!55656 () Bool)

(declare-fun isEmpty!162 (List!595) Bool)

(assert (=> b!55656 (= e!37082 (isEmpty!162 lt!86957))))

(assert (= (and d!17728 c!3974) b!55654))

(assert (= (and d!17728 (not c!3974)) b!55655))

(assert (= (and d!17728 c!3975) b!55656))

(assert (= (and d!17728 (not c!3975)) b!55657))

(declare-fun m!87679 () Bool)

(assert (=> b!55657 m!87679))

(declare-fun m!87681 () Bool)

(assert (=> b!55655 m!87681))

(declare-fun m!87683 () Bool)

(assert (=> b!55655 m!87683))

(declare-fun m!87685 () Bool)

(assert (=> b!55656 m!87685))

(assert (=> b!55446 d!17728))

(declare-fun d!17730 () Bool)

(assert (=> d!17730 (= (invariant!0 (currentBit!3116 (_2!2640 lt!86506)) (currentByte!3121 (_2!2640 lt!86506)) (size!1176 (buf!1539 (_2!2640 lt!86506)))) (and (bvsge (currentBit!3116 (_2!2640 lt!86506)) #b00000000000000000000000000000000) (bvslt (currentBit!3116 (_2!2640 lt!86506)) #b00000000000000000000000000001000) (bvsge (currentByte!3121 (_2!2640 lt!86506)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3121 (_2!2640 lt!86506)) (size!1176 (buf!1539 (_2!2640 lt!86506)))) (and (= (currentBit!3116 (_2!2640 lt!86506)) #b00000000000000000000000000000000) (= (currentByte!3121 (_2!2640 lt!86506)) (size!1176 (buf!1539 (_2!2640 lt!86506))))))))))

(assert (=> b!55444 d!17730))

(check-sat (not b!55591) (not b!55585) (not b!55605) (not b!55603) (not b!55484) (not d!17652) (not b!55493) (not d!17702) (not b!55637) (not b!55634) (not d!17660) (not b!55607) (not d!17698) (not b!55584) (not b!55498) (not d!17662) (not d!17718) (not b!55655) (not b!55645) (not b!55609) (not b!55636) (not b!55495) (not d!17700) (not b!55612) (not b!55606) (not d!17712) (not b!55586) (not b!55632) (not b!55656) (not b!55602) (not b!55635) (not d!17710) (not d!17720) (not b!55633) (not d!17706) (not b!55496) (not bm!709) (not b!55657) (not b!55486) (not b!55589) (not b!55631) (not b!55630) (not b!55588) (not d!17708) (not d!17654))
