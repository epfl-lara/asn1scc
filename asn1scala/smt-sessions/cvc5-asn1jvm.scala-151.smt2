; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3520 () Bool)

(assert start!3520)

(declare-fun b!15387 () Bool)

(declare-fun e!9629 () Bool)

(declare-datatypes ((array!927 0))(
  ( (array!928 (arr!823 (Array (_ BitVec 32) (_ BitVec 8))) (size!394 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!748 0))(
  ( (BitStream!749 (buf!751 array!927) (currentByte!1914 (_ BitVec 32)) (currentBit!1909 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!1838 0))(
  ( (tuple2!1839 (_1!980 BitStream!748) (_2!980 Bool)) )
))
(declare-fun lt!23316 () tuple2!1838)

(declare-datatypes ((tuple2!1840 0))(
  ( (tuple2!1841 (_1!981 BitStream!748) (_2!981 BitStream!748)) )
))
(declare-fun lt!23313 () tuple2!1840)

(assert (=> b!15387 (= e!9629 (not (or (not (_2!980 lt!23316)) (not (= (_1!980 lt!23316) (_2!981 lt!23313))))))))

(declare-fun nBits!313 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!748 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1838)

(assert (=> b!15387 (= lt!23316 (checkBitsLoopPure!0 (_1!981 lt!23313) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!1276 0))(
  ( (Unit!1277) )
))
(declare-datatypes ((tuple2!1842 0))(
  ( (tuple2!1843 (_1!982 Unit!1276) (_2!982 BitStream!748)) )
))
(declare-fun lt!23317 () tuple2!1842)

(declare-fun thiss!1073 () BitStream!748)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15387 (validate_offset_bits!1 ((_ sign_extend 32) (size!394 (buf!751 (_2!982 lt!23317)))) ((_ sign_extend 32) (currentByte!1914 thiss!1073)) ((_ sign_extend 32) (currentBit!1909 thiss!1073)) nBits!313)))

(declare-fun lt!23315 () Unit!1276)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!748 array!927 (_ BitVec 64)) Unit!1276)

(assert (=> b!15387 (= lt!23315 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!751 (_2!982 lt!23317)) nBits!313))))

(declare-fun reader!0 (BitStream!748 BitStream!748) tuple2!1840)

(assert (=> b!15387 (= lt!23313 (reader!0 thiss!1073 (_2!982 lt!23317)))))

(declare-fun b!15388 () Bool)

(declare-fun res!14323 () Bool)

(declare-fun e!9630 () Bool)

(assert (=> b!15388 (=> (not res!14323) (not e!9630))))

(assert (=> b!15388 (= res!14323 (validate_offset_bits!1 ((_ sign_extend 32) (size!394 (buf!751 thiss!1073))) ((_ sign_extend 32) (currentByte!1914 thiss!1073)) ((_ sign_extend 32) (currentBit!1909 thiss!1073)) nBits!313))))

(declare-fun b!15389 () Bool)

(declare-fun lt!23318 () tuple2!1840)

(assert (=> b!15389 (= e!9630 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!394 (buf!751 (_1!981 lt!23318)))) ((_ sign_extend 32) (currentByte!1914 (_1!981 lt!23318))) ((_ sign_extend 32) (currentBit!1909 (_1!981 lt!23318))) nBits!313)))))

(assert (=> b!15389 (validate_offset_bits!1 ((_ sign_extend 32) (size!394 (buf!751 (_2!982 lt!23317)))) ((_ sign_extend 32) (currentByte!1914 thiss!1073)) ((_ sign_extend 32) (currentBit!1909 thiss!1073)) nBits!313)))

(declare-fun lt!23314 () Unit!1276)

(assert (=> b!15389 (= lt!23314 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!751 (_2!982 lt!23317)) nBits!313))))

(assert (=> b!15389 (= lt!23318 (reader!0 thiss!1073 (_2!982 lt!23317)))))

(declare-fun lt!23320 () Bool)

(declare-fun isPrefixOf!0 (BitStream!748 BitStream!748) Bool)

(assert (=> b!15389 (= lt!23320 (isPrefixOf!0 thiss!1073 (_2!982 lt!23317)))))

(declare-fun lt!23319 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15389 (= lt!23319 (bitIndex!0 (size!394 (buf!751 (_2!982 lt!23317))) (currentByte!1914 (_2!982 lt!23317)) (currentBit!1909 (_2!982 lt!23317))))))

(declare-fun lt!23312 () (_ BitVec 64))

(assert (=> b!15389 (= lt!23312 (bitIndex!0 (size!394 (buf!751 thiss!1073)) (currentByte!1914 thiss!1073) (currentBit!1909 thiss!1073)))))

(assert (=> b!15389 e!9629))

(declare-fun res!14324 () Bool)

(assert (=> b!15389 (=> (not res!14324) (not e!9629))))

(assert (=> b!15389 (= res!14324 (= (size!394 (buf!751 thiss!1073)) (size!394 (buf!751 (_2!982 lt!23317)))))))

(declare-fun appendNBits!0 (BitStream!748 (_ BitVec 64) Bool) tuple2!1842)

(assert (=> b!15389 (= lt!23317 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun res!14326 () Bool)

(assert (=> start!3520 (=> (not res!14326) (not e!9630))))

(assert (=> start!3520 (= res!14326 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3520 e!9630))

(assert (=> start!3520 true))

(declare-fun e!9627 () Bool)

(declare-fun inv!12 (BitStream!748) Bool)

(assert (=> start!3520 (and (inv!12 thiss!1073) e!9627)))

(declare-fun b!15390 () Bool)

(declare-fun res!14327 () Bool)

(assert (=> b!15390 (=> (not res!14327) (not e!9629))))

(assert (=> b!15390 (= res!14327 (= (bitIndex!0 (size!394 (buf!751 (_2!982 lt!23317))) (currentByte!1914 (_2!982 lt!23317)) (currentBit!1909 (_2!982 lt!23317))) (bvadd (bitIndex!0 (size!394 (buf!751 thiss!1073)) (currentByte!1914 thiss!1073) (currentBit!1909 thiss!1073)) nBits!313)))))

(declare-fun b!15391 () Bool)

(declare-fun array_inv!383 (array!927) Bool)

(assert (=> b!15391 (= e!9627 (array_inv!383 (buf!751 thiss!1073)))))

(declare-fun b!15392 () Bool)

(declare-fun res!14325 () Bool)

(assert (=> b!15392 (=> (not res!14325) (not e!9629))))

(assert (=> b!15392 (= res!14325 (isPrefixOf!0 thiss!1073 (_2!982 lt!23317)))))

(assert (= (and start!3520 res!14326) b!15388))

(assert (= (and b!15388 res!14323) b!15389))

(assert (= (and b!15389 res!14324) b!15390))

(assert (= (and b!15390 res!14327) b!15392))

(assert (= (and b!15392 res!14325) b!15387))

(assert (= start!3520 b!15391))

(declare-fun m!22017 () Bool)

(assert (=> b!15390 m!22017))

(declare-fun m!22019 () Bool)

(assert (=> b!15390 m!22019))

(declare-fun m!22021 () Bool)

(assert (=> b!15389 m!22021))

(assert (=> b!15389 m!22019))

(declare-fun m!22023 () Bool)

(assert (=> b!15389 m!22023))

(assert (=> b!15389 m!22017))

(declare-fun m!22025 () Bool)

(assert (=> b!15389 m!22025))

(declare-fun m!22027 () Bool)

(assert (=> b!15389 m!22027))

(declare-fun m!22029 () Bool)

(assert (=> b!15389 m!22029))

(declare-fun m!22031 () Bool)

(assert (=> b!15389 m!22031))

(declare-fun m!22033 () Bool)

(assert (=> b!15388 m!22033))

(declare-fun m!22035 () Bool)

(assert (=> b!15387 m!22035))

(assert (=> b!15387 m!22031))

(assert (=> b!15387 m!22027))

(assert (=> b!15387 m!22023))

(assert (=> b!15392 m!22021))

(declare-fun m!22037 () Bool)

(assert (=> b!15391 m!22037))

(declare-fun m!22039 () Bool)

(assert (=> start!3520 m!22039))

(push 1)

(assert (not start!3520))

(assert (not b!15392))

(assert (not b!15390))

(assert (not b!15387))

(assert (not b!15391))

(assert (not b!15389))

(assert (not b!15388))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5006 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!5006 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!394 (buf!751 thiss!1073))) ((_ sign_extend 32) (currentByte!1914 thiss!1073)) ((_ sign_extend 32) (currentBit!1909 thiss!1073)) nBits!313) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!394 (buf!751 thiss!1073))) ((_ sign_extend 32) (currentByte!1914 thiss!1073)) ((_ sign_extend 32) (currentBit!1909 thiss!1073))) nBits!313))))

(declare-fun bs!1395 () Bool)

(assert (= bs!1395 d!5006))

(declare-fun m!22089 () Bool)

(assert (=> bs!1395 m!22089))

(assert (=> b!15388 d!5006))

(declare-fun d!5010 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!5010 (= (inv!12 thiss!1073) (invariant!0 (currentBit!1909 thiss!1073) (currentByte!1914 thiss!1073) (size!394 (buf!751 thiss!1073))))))

(declare-fun bs!1398 () Bool)

(assert (= bs!1398 d!5010))

(declare-fun m!22095 () Bool)

(assert (=> bs!1398 m!22095))

(assert (=> start!3520 d!5010))

(declare-fun d!5016 () Bool)

(assert (=> d!5016 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!394 (buf!751 (_2!982 lt!23317)))) ((_ sign_extend 32) (currentByte!1914 thiss!1073)) ((_ sign_extend 32) (currentBit!1909 thiss!1073)) nBits!313) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!394 (buf!751 (_2!982 lt!23317)))) ((_ sign_extend 32) (currentByte!1914 thiss!1073)) ((_ sign_extend 32) (currentBit!1909 thiss!1073))) nBits!313))))

(declare-fun bs!1399 () Bool)

(assert (= bs!1399 d!5016))

(declare-fun m!22097 () Bool)

(assert (=> bs!1399 m!22097))

(assert (=> b!15389 d!5016))

(declare-fun d!5018 () Bool)

(declare-fun e!9680 () Bool)

(assert (=> d!5018 e!9680))

(declare-fun res!14399 () Bool)

(assert (=> d!5018 (=> (not res!14399) (not e!9680))))

(declare-fun lt!23469 () tuple2!1840)

(assert (=> d!5018 (= res!14399 (isPrefixOf!0 (_1!981 lt!23469) (_2!981 lt!23469)))))

(declare-fun lt!23476 () BitStream!748)

(assert (=> d!5018 (= lt!23469 (tuple2!1841 lt!23476 (_2!982 lt!23317)))))

(declare-fun lt!23472 () Unit!1276)

(declare-fun lt!23477 () Unit!1276)

(assert (=> d!5018 (= lt!23472 lt!23477)))

(assert (=> d!5018 (isPrefixOf!0 lt!23476 (_2!982 lt!23317))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!748 BitStream!748 BitStream!748) Unit!1276)

(assert (=> d!5018 (= lt!23477 (lemmaIsPrefixTransitive!0 lt!23476 (_2!982 lt!23317) (_2!982 lt!23317)))))

(declare-fun lt!23485 () Unit!1276)

(declare-fun lt!23474 () Unit!1276)

(assert (=> d!5018 (= lt!23485 lt!23474)))

(assert (=> d!5018 (isPrefixOf!0 lt!23476 (_2!982 lt!23317))))

(assert (=> d!5018 (= lt!23474 (lemmaIsPrefixTransitive!0 lt!23476 thiss!1073 (_2!982 lt!23317)))))

(declare-fun lt!23478 () Unit!1276)

(declare-fun e!9679 () Unit!1276)

(assert (=> d!5018 (= lt!23478 e!9679)))

(declare-fun c!1042 () Bool)

(assert (=> d!5018 (= c!1042 (not (= (size!394 (buf!751 thiss!1073)) #b00000000000000000000000000000000)))))

(declare-fun lt!23487 () Unit!1276)

(declare-fun lt!23471 () Unit!1276)

(assert (=> d!5018 (= lt!23487 lt!23471)))

(assert (=> d!5018 (isPrefixOf!0 (_2!982 lt!23317) (_2!982 lt!23317))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!748) Unit!1276)

(assert (=> d!5018 (= lt!23471 (lemmaIsPrefixRefl!0 (_2!982 lt!23317)))))

(declare-fun lt!23475 () Unit!1276)

(declare-fun lt!23473 () Unit!1276)

(assert (=> d!5018 (= lt!23475 lt!23473)))

(assert (=> d!5018 (= lt!23473 (lemmaIsPrefixRefl!0 (_2!982 lt!23317)))))

(declare-fun lt!23481 () Unit!1276)

(declare-fun lt!23483 () Unit!1276)

(assert (=> d!5018 (= lt!23481 lt!23483)))

(assert (=> d!5018 (isPrefixOf!0 lt!23476 lt!23476)))

(assert (=> d!5018 (= lt!23483 (lemmaIsPrefixRefl!0 lt!23476))))

(declare-fun lt!23482 () Unit!1276)

(declare-fun lt!23480 () Unit!1276)

(assert (=> d!5018 (= lt!23482 lt!23480)))

(assert (=> d!5018 (isPrefixOf!0 thiss!1073 thiss!1073)))

(assert (=> d!5018 (= lt!23480 (lemmaIsPrefixRefl!0 thiss!1073))))

(assert (=> d!5018 (= lt!23476 (BitStream!749 (buf!751 (_2!982 lt!23317)) (currentByte!1914 thiss!1073) (currentBit!1909 thiss!1073)))))

(assert (=> d!5018 (isPrefixOf!0 thiss!1073 (_2!982 lt!23317))))

(assert (=> d!5018 (= (reader!0 thiss!1073 (_2!982 lt!23317)) lt!23469)))

(declare-fun b!15473 () Bool)

(declare-fun lt!23486 () Unit!1276)

(assert (=> b!15473 (= e!9679 lt!23486)))

(declare-fun lt!23488 () (_ BitVec 64))

(assert (=> b!15473 (= lt!23488 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23479 () (_ BitVec 64))

(assert (=> b!15473 (= lt!23479 (bitIndex!0 (size!394 (buf!751 thiss!1073)) (currentByte!1914 thiss!1073) (currentBit!1909 thiss!1073)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!927 array!927 (_ BitVec 64) (_ BitVec 64)) Unit!1276)

(assert (=> b!15473 (= lt!23486 (arrayBitRangesEqSymmetric!0 (buf!751 thiss!1073) (buf!751 (_2!982 lt!23317)) lt!23488 lt!23479))))

(declare-fun arrayBitRangesEq!0 (array!927 array!927 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15473 (arrayBitRangesEq!0 (buf!751 (_2!982 lt!23317)) (buf!751 thiss!1073) lt!23488 lt!23479)))

(declare-fun b!15474 () Bool)

(declare-fun res!14398 () Bool)

(assert (=> b!15474 (=> (not res!14398) (not e!9680))))

(assert (=> b!15474 (= res!14398 (isPrefixOf!0 (_2!981 lt!23469) (_2!982 lt!23317)))))

(declare-fun lt!23484 () (_ BitVec 64))

(declare-fun b!15475 () Bool)

(declare-fun lt!23470 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!748 (_ BitVec 64)) BitStream!748)

(assert (=> b!15475 (= e!9680 (= (_1!981 lt!23469) (withMovedBitIndex!0 (_2!981 lt!23469) (bvsub lt!23470 lt!23484))))))

(assert (=> b!15475 (or (= (bvand lt!23470 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!23484 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!23470 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!23470 lt!23484) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!15475 (= lt!23484 (bitIndex!0 (size!394 (buf!751 (_2!982 lt!23317))) (currentByte!1914 (_2!982 lt!23317)) (currentBit!1909 (_2!982 lt!23317))))))

(assert (=> b!15475 (= lt!23470 (bitIndex!0 (size!394 (buf!751 thiss!1073)) (currentByte!1914 thiss!1073) (currentBit!1909 thiss!1073)))))

(declare-fun b!15476 () Bool)

(declare-fun Unit!1282 () Unit!1276)

(assert (=> b!15476 (= e!9679 Unit!1282)))

(declare-fun b!15477 () Bool)

(declare-fun res!14400 () Bool)

(assert (=> b!15477 (=> (not res!14400) (not e!9680))))

(assert (=> b!15477 (= res!14400 (isPrefixOf!0 (_1!981 lt!23469) thiss!1073))))

(assert (= (and d!5018 c!1042) b!15473))

(assert (= (and d!5018 (not c!1042)) b!15476))

(assert (= (and d!5018 res!14399) b!15477))

(assert (= (and b!15477 res!14400) b!15474))

(assert (= (and b!15474 res!14398) b!15475))

(assert (=> b!15473 m!22019))

(declare-fun m!22125 () Bool)

(assert (=> b!15473 m!22125))

(declare-fun m!22127 () Bool)

(assert (=> b!15473 m!22127))

(declare-fun m!22129 () Bool)

(assert (=> d!5018 m!22129))

(declare-fun m!22131 () Bool)

(assert (=> d!5018 m!22131))

(declare-fun m!22133 () Bool)

(assert (=> d!5018 m!22133))

(assert (=> d!5018 m!22021))

(declare-fun m!22135 () Bool)

(assert (=> d!5018 m!22135))

(declare-fun m!22137 () Bool)

(assert (=> d!5018 m!22137))

(declare-fun m!22139 () Bool)

(assert (=> d!5018 m!22139))

(declare-fun m!22141 () Bool)

(assert (=> d!5018 m!22141))

(declare-fun m!22143 () Bool)

(assert (=> d!5018 m!22143))

(declare-fun m!22145 () Bool)

(assert (=> d!5018 m!22145))

(declare-fun m!22147 () Bool)

(assert (=> d!5018 m!22147))

(declare-fun m!22149 () Bool)

(assert (=> b!15475 m!22149))

(assert (=> b!15475 m!22017))

(assert (=> b!15475 m!22019))

(declare-fun m!22151 () Bool)

(assert (=> b!15477 m!22151))

(declare-fun m!22153 () Bool)

(assert (=> b!15474 m!22153))

(assert (=> b!15389 d!5018))

(declare-fun d!5046 () Bool)

(declare-fun e!9683 () Bool)

(assert (=> d!5046 e!9683))

(declare-fun res!14405 () Bool)

(assert (=> d!5046 (=> (not res!14405) (not e!9683))))

(declare-fun lt!23504 () (_ BitVec 64))

(declare-fun lt!23503 () (_ BitVec 64))

(declare-fun lt!23502 () (_ BitVec 64))

(assert (=> d!5046 (= res!14405 (= lt!23504 (bvsub lt!23502 lt!23503)))))

(assert (=> d!5046 (or (= (bvand lt!23502 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!23503 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!23502 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!23502 lt!23503) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!5046 (= lt!23503 (remainingBits!0 ((_ sign_extend 32) (size!394 (buf!751 thiss!1073))) ((_ sign_extend 32) (currentByte!1914 thiss!1073)) ((_ sign_extend 32) (currentBit!1909 thiss!1073))))))

(declare-fun lt!23501 () (_ BitVec 64))

(declare-fun lt!23505 () (_ BitVec 64))

(assert (=> d!5046 (= lt!23502 (bvmul lt!23501 lt!23505))))

(assert (=> d!5046 (or (= lt!23501 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!23505 (bvsdiv (bvmul lt!23501 lt!23505) lt!23501)))))

(assert (=> d!5046 (= lt!23505 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!5046 (= lt!23501 ((_ sign_extend 32) (size!394 (buf!751 thiss!1073))))))

(assert (=> d!5046 (= lt!23504 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1914 thiss!1073)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1909 thiss!1073))))))

(assert (=> d!5046 (invariant!0 (currentBit!1909 thiss!1073) (currentByte!1914 thiss!1073) (size!394 (buf!751 thiss!1073)))))

(assert (=> d!5046 (= (bitIndex!0 (size!394 (buf!751 thiss!1073)) (currentByte!1914 thiss!1073) (currentBit!1909 thiss!1073)) lt!23504)))

(declare-fun b!15482 () Bool)

(declare-fun res!14406 () Bool)

(assert (=> b!15482 (=> (not res!14406) (not e!9683))))

(assert (=> b!15482 (= res!14406 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!23504))))

(declare-fun b!15483 () Bool)

(declare-fun lt!23506 () (_ BitVec 64))

(assert (=> b!15483 (= e!9683 (bvsle lt!23504 (bvmul lt!23506 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!15483 (or (= lt!23506 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!23506 #b0000000000000000000000000000000000000000000000000000000000001000) lt!23506)))))

(assert (=> b!15483 (= lt!23506 ((_ sign_extend 32) (size!394 (buf!751 thiss!1073))))))

(assert (= (and d!5046 res!14405) b!15482))

(assert (= (and b!15482 res!14406) b!15483))

(assert (=> d!5046 m!22089))

(assert (=> d!5046 m!22095))

(assert (=> b!15389 d!5046))

(declare-fun d!5048 () Bool)

(declare-fun e!9684 () Bool)

(assert (=> d!5048 e!9684))

(declare-fun res!14407 () Bool)

(assert (=> d!5048 (=> (not res!14407) (not e!9684))))

(declare-fun lt!23510 () (_ BitVec 64))

(declare-fun lt!23508 () (_ BitVec 64))

(declare-fun lt!23509 () (_ BitVec 64))

(assert (=> d!5048 (= res!14407 (= lt!23510 (bvsub lt!23508 lt!23509)))))

(assert (=> d!5048 (or (= (bvand lt!23508 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!23509 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!23508 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!23508 lt!23509) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!5048 (= lt!23509 (remainingBits!0 ((_ sign_extend 32) (size!394 (buf!751 (_2!982 lt!23317)))) ((_ sign_extend 32) (currentByte!1914 (_2!982 lt!23317))) ((_ sign_extend 32) (currentBit!1909 (_2!982 lt!23317)))))))

(declare-fun lt!23507 () (_ BitVec 64))

(declare-fun lt!23511 () (_ BitVec 64))

(assert (=> d!5048 (= lt!23508 (bvmul lt!23507 lt!23511))))

(assert (=> d!5048 (or (= lt!23507 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!23511 (bvsdiv (bvmul lt!23507 lt!23511) lt!23507)))))

(assert (=> d!5048 (= lt!23511 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!5048 (= lt!23507 ((_ sign_extend 32) (size!394 (buf!751 (_2!982 lt!23317)))))))

(assert (=> d!5048 (= lt!23510 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1914 (_2!982 lt!23317))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1909 (_2!982 lt!23317)))))))

(assert (=> d!5048 (invariant!0 (currentBit!1909 (_2!982 lt!23317)) (currentByte!1914 (_2!982 lt!23317)) (size!394 (buf!751 (_2!982 lt!23317))))))

(assert (=> d!5048 (= (bitIndex!0 (size!394 (buf!751 (_2!982 lt!23317))) (currentByte!1914 (_2!982 lt!23317)) (currentBit!1909 (_2!982 lt!23317))) lt!23510)))

(declare-fun b!15484 () Bool)

(declare-fun res!14408 () Bool)

(assert (=> b!15484 (=> (not res!14408) (not e!9684))))

(assert (=> b!15484 (= res!14408 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!23510))))

(declare-fun b!15485 () Bool)

(declare-fun lt!23512 () (_ BitVec 64))

(assert (=> b!15485 (= e!9684 (bvsle lt!23510 (bvmul lt!23512 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!15485 (or (= lt!23512 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!23512 #b0000000000000000000000000000000000000000000000000000000000001000) lt!23512)))))

(assert (=> b!15485 (= lt!23512 ((_ sign_extend 32) (size!394 (buf!751 (_2!982 lt!23317)))))))

(assert (= (and d!5048 res!14407) b!15484))

(assert (= (and b!15484 res!14408) b!15485))

(declare-fun m!22155 () Bool)

(assert (=> d!5048 m!22155))

(declare-fun m!22157 () Bool)

(assert (=> d!5048 m!22157))

(assert (=> b!15389 d!5048))

(declare-fun d!5050 () Bool)

(assert (=> d!5050 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!394 (buf!751 (_1!981 lt!23318)))) ((_ sign_extend 32) (currentByte!1914 (_1!981 lt!23318))) ((_ sign_extend 32) (currentBit!1909 (_1!981 lt!23318))) nBits!313) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!394 (buf!751 (_1!981 lt!23318)))) ((_ sign_extend 32) (currentByte!1914 (_1!981 lt!23318))) ((_ sign_extend 32) (currentBit!1909 (_1!981 lt!23318)))) nBits!313))))

(declare-fun bs!1406 () Bool)

(assert (= bs!1406 d!5050))

(declare-fun m!22159 () Bool)

(assert (=> bs!1406 m!22159))

(assert (=> b!15389 d!5050))

(declare-fun d!5052 () Bool)

(declare-fun res!14415 () Bool)

(declare-fun e!9689 () Bool)

(assert (=> d!5052 (=> (not res!14415) (not e!9689))))

(assert (=> d!5052 (= res!14415 (= (size!394 (buf!751 thiss!1073)) (size!394 (buf!751 (_2!982 lt!23317)))))))

(assert (=> d!5052 (= (isPrefixOf!0 thiss!1073 (_2!982 lt!23317)) e!9689)))

(declare-fun b!15492 () Bool)

(declare-fun res!14416 () Bool)

(assert (=> b!15492 (=> (not res!14416) (not e!9689))))

(assert (=> b!15492 (= res!14416 (bvsle (bitIndex!0 (size!394 (buf!751 thiss!1073)) (currentByte!1914 thiss!1073) (currentBit!1909 thiss!1073)) (bitIndex!0 (size!394 (buf!751 (_2!982 lt!23317))) (currentByte!1914 (_2!982 lt!23317)) (currentBit!1909 (_2!982 lt!23317)))))))

(declare-fun b!15493 () Bool)

(declare-fun e!9690 () Bool)

(assert (=> b!15493 (= e!9689 e!9690)))

(declare-fun res!14417 () Bool)

(assert (=> b!15493 (=> res!14417 e!9690)))

(assert (=> b!15493 (= res!14417 (= (size!394 (buf!751 thiss!1073)) #b00000000000000000000000000000000))))

(declare-fun b!15494 () Bool)

(assert (=> b!15494 (= e!9690 (arrayBitRangesEq!0 (buf!751 thiss!1073) (buf!751 (_2!982 lt!23317)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!394 (buf!751 thiss!1073)) (currentByte!1914 thiss!1073) (currentBit!1909 thiss!1073))))))

(assert (= (and d!5052 res!14415) b!15492))

(assert (= (and b!15492 res!14416) b!15493))

(assert (= (and b!15493 (not res!14417)) b!15494))

(assert (=> b!15492 m!22019))

(assert (=> b!15492 m!22017))

(assert (=> b!15494 m!22019))

(assert (=> b!15494 m!22019))

(declare-fun m!22161 () Bool)

(assert (=> b!15494 m!22161))

(assert (=> b!15389 d!5052))

(declare-fun b!15541 () Bool)

(declare-fun res!14454 () Bool)

(declare-fun e!9712 () Bool)

(assert (=> b!15541 (=> (not res!14454) (not e!9712))))

(declare-fun lt!23647 () tuple2!1842)

(assert (=> b!15541 (= res!14454 (isPrefixOf!0 thiss!1073 (_2!982 lt!23647)))))

(declare-fun b!15543 () Bool)

(declare-fun e!9711 () Bool)

(assert (=> b!15543 (= e!9711 (validate_offset_bits!1 ((_ sign_extend 32) (size!394 (buf!751 thiss!1073))) ((_ sign_extend 32) (currentByte!1914 thiss!1073)) ((_ sign_extend 32) (currentBit!1909 thiss!1073)) nBits!313))))

(declare-fun b!15542 () Bool)

(declare-fun lt!23645 () tuple2!1838)

(declare-fun lt!23644 () tuple2!1840)

(assert (=> b!15542 (= e!9712 (and (_2!980 lt!23645) (= (_1!980 lt!23645) (_2!981 lt!23644))))))

(assert (=> b!15542 (= lt!23645 (checkBitsLoopPure!0 (_1!981 lt!23644) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!23648 () Unit!1276)

(declare-fun lt!23646 () Unit!1276)

(assert (=> b!15542 (= lt!23648 lt!23646)))

(assert (=> b!15542 (validate_offset_bits!1 ((_ sign_extend 32) (size!394 (buf!751 (_2!982 lt!23647)))) ((_ sign_extend 32) (currentByte!1914 thiss!1073)) ((_ sign_extend 32) (currentBit!1909 thiss!1073)) nBits!313)))

(assert (=> b!15542 (= lt!23646 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!751 (_2!982 lt!23647)) nBits!313))))

(assert (=> b!15542 e!9711))

(declare-fun res!14456 () Bool)

(assert (=> b!15542 (=> (not res!14456) (not e!9711))))

(assert (=> b!15542 (= res!14456 (and (= (size!394 (buf!751 thiss!1073)) (size!394 (buf!751 (_2!982 lt!23647)))) (bvsge nBits!313 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!15542 (= lt!23644 (reader!0 thiss!1073 (_2!982 lt!23647)))))

(declare-fun b!15540 () Bool)

(declare-fun res!14455 () Bool)

(assert (=> b!15540 (=> (not res!14455) (not e!9712))))

(declare-fun lt!23643 () (_ BitVec 64))

(assert (=> b!15540 (= res!14455 (= (bitIndex!0 (size!394 (buf!751 (_2!982 lt!23647))) (currentByte!1914 (_2!982 lt!23647)) (currentBit!1909 (_2!982 lt!23647))) (bvadd lt!23643 nBits!313)))))

(assert (=> b!15540 (or (not (= (bvand lt!23643 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!313 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!23643 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!23643 nBits!313) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!15540 (= lt!23643 (bitIndex!0 (size!394 (buf!751 thiss!1073)) (currentByte!1914 thiss!1073) (currentBit!1909 thiss!1073)))))

(declare-fun d!5054 () Bool)

(assert (=> d!5054 e!9712))

(declare-fun res!14453 () Bool)

(assert (=> d!5054 (=> (not res!14453) (not e!9712))))

(assert (=> d!5054 (= res!14453 (= (size!394 (buf!751 thiss!1073)) (size!394 (buf!751 (_2!982 lt!23647)))))))

(declare-fun choose!36 (BitStream!748 (_ BitVec 64) Bool) tuple2!1842)

(assert (=> d!5054 (= lt!23647 (choose!36 thiss!1073 nBits!313 true))))

(assert (=> d!5054 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!5054 (= (appendNBits!0 thiss!1073 nBits!313 true) lt!23647)))

(assert (= (and d!5054 res!14453) b!15540))

(assert (= (and b!15540 res!14455) b!15541))

(assert (= (and b!15541 res!14454) b!15542))

(assert (= (and b!15542 res!14456) b!15543))

(declare-fun m!22209 () Bool)

(assert (=> b!15541 m!22209))

(assert (=> b!15543 m!22033))

(declare-fun m!22211 () Bool)

(assert (=> d!5054 m!22211))

(declare-fun m!22213 () Bool)

(assert (=> b!15542 m!22213))

(declare-fun m!22215 () Bool)

(assert (=> b!15542 m!22215))

(declare-fun m!22217 () Bool)

(assert (=> b!15542 m!22217))

(declare-fun m!22219 () Bool)

(assert (=> b!15542 m!22219))

(declare-fun m!22221 () Bool)

(assert (=> b!15540 m!22221))

(assert (=> b!15540 m!22019))

(assert (=> b!15389 d!5054))

(declare-fun d!5062 () Bool)

(assert (=> d!5062 (validate_offset_bits!1 ((_ sign_extend 32) (size!394 (buf!751 (_2!982 lt!23317)))) ((_ sign_extend 32) (currentByte!1914 thiss!1073)) ((_ sign_extend 32) (currentBit!1909 thiss!1073)) nBits!313)))

(declare-fun lt!23671 () Unit!1276)

(declare-fun choose!9 (BitStream!748 array!927 (_ BitVec 64) BitStream!748) Unit!1276)

(assert (=> d!5062 (= lt!23671 (choose!9 thiss!1073 (buf!751 (_2!982 lt!23317)) nBits!313 (BitStream!749 (buf!751 (_2!982 lt!23317)) (currentByte!1914 thiss!1073) (currentBit!1909 thiss!1073))))))

(assert (=> d!5062 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!751 (_2!982 lt!23317)) nBits!313) lt!23671)))

(declare-fun bs!1408 () Bool)

(assert (= bs!1408 d!5062))

(assert (=> bs!1408 m!22031))

(declare-fun m!22253 () Bool)

(assert (=> bs!1408 m!22253))

(assert (=> b!15389 d!5062))

(assert (=> b!15390 d!5048))

(assert (=> b!15390 d!5046))

(declare-fun d!5066 () Bool)

(assert (=> d!5066 (= (array_inv!383 (buf!751 thiss!1073)) (bvsge (size!394 (buf!751 thiss!1073)) #b00000000000000000000000000000000))))

(assert (=> b!15391 d!5066))

(assert (=> b!15392 d!5052))

(declare-fun d!5068 () Bool)

(declare-datatypes ((tuple2!1856 0))(
  ( (tuple2!1857 (_1!989 Bool) (_2!989 BitStream!748)) )
))
(declare-fun lt!23677 () tuple2!1856)

(declare-fun checkBitsLoop!0 (BitStream!748 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1856)

(assert (=> d!5068 (= lt!23677 (checkBitsLoop!0 (_1!981 lt!23313) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!5068 (= (checkBitsLoopPure!0 (_1!981 lt!23313) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!1839 (_2!989 lt!23677) (_1!989 lt!23677)))))

(declare-fun bs!1410 () Bool)

(assert (= bs!1410 d!5068))

(declare-fun m!22257 () Bool)

(assert (=> bs!1410 m!22257))

(assert (=> b!15387 d!5068))

(assert (=> b!15387 d!5016))

(assert (=> b!15387 d!5062))

(assert (=> b!15387 d!5018))

(push 1)

(assert (not d!5054))

(assert (not d!5006))

(assert (not b!15541))

(assert (not b!15540))

(assert (not b!15494))

(assert (not b!15492))

(assert (not d!5068))

(assert (not d!5050))

(assert (not d!5046))

(assert (not d!5018))

(assert (not b!15542))

(assert (not d!5062))

(assert (not d!5010))

(assert (not b!15543))

(assert (not d!5048))

(assert (not b!15475))

(assert (not b!15474))

(assert (not b!15477))

(assert (not b!15473))

(assert (not d!5016))

(check-sat)

(pop 1)

(push 1)

(check-sat)

