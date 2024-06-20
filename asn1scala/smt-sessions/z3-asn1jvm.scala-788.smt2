; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22864 () Bool)

(assert start!22864)

(declare-fun b!115490 () Bool)

(declare-fun e!75697 () Bool)

(declare-fun e!75693 () Bool)

(assert (=> b!115490 (= e!75697 e!75693)))

(declare-fun res!95435 () Bool)

(assert (=> b!115490 (=> (not res!95435) (not e!75693))))

(declare-fun lt!176271 () Bool)

(declare-datatypes ((array!5209 0))(
  ( (array!5210 (arr!2956 (Array (_ BitVec 32) (_ BitVec 8))) (size!2363 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4200 0))(
  ( (BitStream!4201 (buf!2773 array!5209) (currentByte!5401 (_ BitVec 32)) (currentBit!5396 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!7107 0))(
  ( (Unit!7108) )
))
(declare-datatypes ((tuple2!9514 0))(
  ( (tuple2!9515 (_1!5022 Unit!7107) (_2!5022 BitStream!4200)) )
))
(declare-fun lt!176272 () tuple2!9514)

(declare-datatypes ((tuple2!9516 0))(
  ( (tuple2!9517 (_1!5023 BitStream!4200) (_2!5023 Bool)) )
))
(declare-fun lt!176275 () tuple2!9516)

(assert (=> b!115490 (= res!95435 (and (= (_2!5023 lt!176275) lt!176271) (= (_1!5023 lt!176275) (_2!5022 lt!176272))))))

(declare-fun thiss!1305 () BitStream!4200)

(declare-fun readBitPure!0 (BitStream!4200) tuple2!9516)

(declare-fun readerFrom!0 (BitStream!4200 (_ BitVec 32) (_ BitVec 32)) BitStream!4200)

(assert (=> b!115490 (= lt!176275 (readBitPure!0 (readerFrom!0 (_2!5022 lt!176272) (currentBit!5396 thiss!1305) (currentByte!5401 thiss!1305))))))

(declare-fun b!115491 () Bool)

(declare-fun e!75699 () Bool)

(assert (=> b!115491 (= e!75699 e!75697)))

(declare-fun res!95445 () Bool)

(assert (=> b!115491 (=> (not res!95445) (not e!75697))))

(declare-fun lt!176281 () (_ BitVec 64))

(declare-fun lt!176277 () (_ BitVec 64))

(assert (=> b!115491 (= res!95445 (= lt!176281 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!176277)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!115491 (= lt!176281 (bitIndex!0 (size!2363 (buf!2773 (_2!5022 lt!176272))) (currentByte!5401 (_2!5022 lt!176272)) (currentBit!5396 (_2!5022 lt!176272))))))

(assert (=> b!115491 (= lt!176277 (bitIndex!0 (size!2363 (buf!2773 thiss!1305)) (currentByte!5401 thiss!1305) (currentBit!5396 thiss!1305)))))

(declare-fun b!115492 () Bool)

(declare-fun res!95444 () Bool)

(declare-fun e!75696 () Bool)

(assert (=> b!115492 (=> (not res!95444) (not e!75696))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!115492 (= res!95444 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!115493 () Bool)

(declare-fun res!95438 () Bool)

(assert (=> b!115493 (=> (not res!95438) (not e!75696))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!115493 (= res!95438 (bvslt i!615 nBits!396))))

(declare-fun b!115494 () Bool)

(declare-fun res!95437 () Bool)

(assert (=> b!115494 (=> (not res!95437) (not e!75696))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!115494 (= res!95437 (validate_offset_bits!1 ((_ sign_extend 32) (size!2363 (buf!2773 thiss!1305))) ((_ sign_extend 32) (currentByte!5401 thiss!1305)) ((_ sign_extend 32) (currentBit!5396 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!115495 () Bool)

(declare-fun e!75694 () Bool)

(declare-fun array_inv!2165 (array!5209) Bool)

(assert (=> b!115495 (= e!75694 (array_inv!2165 (buf!2773 thiss!1305)))))

(declare-fun b!115496 () Bool)

(declare-fun e!75692 () Bool)

(declare-fun lt!176280 () tuple2!9516)

(declare-fun lt!176274 () tuple2!9516)

(assert (=> b!115496 (= e!75692 (= (_2!5023 lt!176280) (_2!5023 lt!176274)))))

(declare-fun b!115497 () Bool)

(assert (=> b!115497 (= e!75693 (= (bitIndex!0 (size!2363 (buf!2773 (_1!5023 lt!176275))) (currentByte!5401 (_1!5023 lt!176275)) (currentBit!5396 (_1!5023 lt!176275))) lt!176281))))

(declare-fun res!95436 () Bool)

(assert (=> start!22864 (=> (not res!95436) (not e!75696))))

(assert (=> start!22864 (= res!95436 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22864 e!75696))

(assert (=> start!22864 true))

(declare-fun inv!12 (BitStream!4200) Bool)

(assert (=> start!22864 (and (inv!12 thiss!1305) e!75694)))

(declare-fun b!115498 () Bool)

(declare-fun e!75695 () Bool)

(declare-fun lt!176282 () tuple2!9514)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!115498 (= e!75695 (invariant!0 (currentBit!5396 thiss!1305) (currentByte!5401 thiss!1305) (size!2363 (buf!2773 (_2!5022 lt!176282)))))))

(declare-fun b!115499 () Bool)

(assert (=> b!115499 (= e!75696 (not (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!9518 0))(
  ( (tuple2!9519 (_1!5024 BitStream!4200) (_2!5024 BitStream!4200)) )
))
(declare-fun lt!176276 () tuple2!9518)

(assert (=> b!115499 (= (_2!5023 (readBitPure!0 (_1!5024 lt!176276))) lt!176271)))

(declare-fun lt!176273 () tuple2!9518)

(declare-fun reader!0 (BitStream!4200 BitStream!4200) tuple2!9518)

(assert (=> b!115499 (= lt!176273 (reader!0 (_2!5022 lt!176272) (_2!5022 lt!176282)))))

(assert (=> b!115499 (= lt!176276 (reader!0 thiss!1305 (_2!5022 lt!176282)))))

(assert (=> b!115499 e!75692))

(declare-fun res!95441 () Bool)

(assert (=> b!115499 (=> (not res!95441) (not e!75692))))

(assert (=> b!115499 (= res!95441 (= (bitIndex!0 (size!2363 (buf!2773 (_1!5023 lt!176280))) (currentByte!5401 (_1!5023 lt!176280)) (currentBit!5396 (_1!5023 lt!176280))) (bitIndex!0 (size!2363 (buf!2773 (_1!5023 lt!176274))) (currentByte!5401 (_1!5023 lt!176274)) (currentBit!5396 (_1!5023 lt!176274)))))))

(declare-fun lt!176283 () Unit!7107)

(declare-fun lt!176279 () BitStream!4200)

(declare-fun readBitPrefixLemma!0 (BitStream!4200 BitStream!4200) Unit!7107)

(assert (=> b!115499 (= lt!176283 (readBitPrefixLemma!0 lt!176279 (_2!5022 lt!176282)))))

(assert (=> b!115499 (= lt!176274 (readBitPure!0 (BitStream!4201 (buf!2773 (_2!5022 lt!176282)) (currentByte!5401 thiss!1305) (currentBit!5396 thiss!1305))))))

(assert (=> b!115499 (= lt!176280 (readBitPure!0 lt!176279))))

(assert (=> b!115499 (= lt!176279 (BitStream!4201 (buf!2773 (_2!5022 lt!176272)) (currentByte!5401 thiss!1305) (currentBit!5396 thiss!1305)))))

(assert (=> b!115499 e!75695))

(declare-fun res!95443 () Bool)

(assert (=> b!115499 (=> (not res!95443) (not e!75695))))

(declare-fun isPrefixOf!0 (BitStream!4200 BitStream!4200) Bool)

(assert (=> b!115499 (= res!95443 (isPrefixOf!0 thiss!1305 (_2!5022 lt!176282)))))

(declare-fun lt!176278 () Unit!7107)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4200 BitStream!4200 BitStream!4200) Unit!7107)

(assert (=> b!115499 (= lt!176278 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5022 lt!176272) (_2!5022 lt!176282)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4200 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9514)

(assert (=> b!115499 (= lt!176282 (appendNLeastSignificantBitsLoop!0 (_2!5022 lt!176272) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!115499 e!75699))

(declare-fun res!95439 () Bool)

(assert (=> b!115499 (=> (not res!95439) (not e!75699))))

(assert (=> b!115499 (= res!95439 (= (size!2363 (buf!2773 thiss!1305)) (size!2363 (buf!2773 (_2!5022 lt!176272)))))))

(declare-fun appendBit!0 (BitStream!4200 Bool) tuple2!9514)

(assert (=> b!115499 (= lt!176272 (appendBit!0 thiss!1305 lt!176271))))

(assert (=> b!115499 (= lt!176271 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!115500 () Bool)

(declare-fun res!95442 () Bool)

(assert (=> b!115500 (=> (not res!95442) (not e!75697))))

(assert (=> b!115500 (= res!95442 (isPrefixOf!0 thiss!1305 (_2!5022 lt!176272)))))

(declare-fun b!115501 () Bool)

(declare-fun res!95440 () Bool)

(assert (=> b!115501 (=> (not res!95440) (not e!75695))))

(assert (=> b!115501 (= res!95440 (invariant!0 (currentBit!5396 thiss!1305) (currentByte!5401 thiss!1305) (size!2363 (buf!2773 (_2!5022 lt!176272)))))))

(assert (= (and start!22864 res!95436) b!115494))

(assert (= (and b!115494 res!95437) b!115492))

(assert (= (and b!115492 res!95444) b!115493))

(assert (= (and b!115493 res!95438) b!115499))

(assert (= (and b!115499 res!95439) b!115491))

(assert (= (and b!115491 res!95445) b!115500))

(assert (= (and b!115500 res!95442) b!115490))

(assert (= (and b!115490 res!95435) b!115497))

(assert (= (and b!115499 res!95443) b!115501))

(assert (= (and b!115501 res!95440) b!115498))

(assert (= (and b!115499 res!95441) b!115496))

(assert (= start!22864 b!115495))

(declare-fun m!172859 () Bool)

(assert (=> b!115498 m!172859))

(declare-fun m!172861 () Bool)

(assert (=> b!115490 m!172861))

(assert (=> b!115490 m!172861))

(declare-fun m!172863 () Bool)

(assert (=> b!115490 m!172863))

(declare-fun m!172865 () Bool)

(assert (=> b!115497 m!172865))

(declare-fun m!172867 () Bool)

(assert (=> start!22864 m!172867))

(declare-fun m!172869 () Bool)

(assert (=> b!115500 m!172869))

(declare-fun m!172871 () Bool)

(assert (=> b!115499 m!172871))

(declare-fun m!172873 () Bool)

(assert (=> b!115499 m!172873))

(declare-fun m!172875 () Bool)

(assert (=> b!115499 m!172875))

(declare-fun m!172877 () Bool)

(assert (=> b!115499 m!172877))

(declare-fun m!172879 () Bool)

(assert (=> b!115499 m!172879))

(declare-fun m!172881 () Bool)

(assert (=> b!115499 m!172881))

(declare-fun m!172883 () Bool)

(assert (=> b!115499 m!172883))

(declare-fun m!172885 () Bool)

(assert (=> b!115499 m!172885))

(declare-fun m!172887 () Bool)

(assert (=> b!115499 m!172887))

(declare-fun m!172889 () Bool)

(assert (=> b!115499 m!172889))

(declare-fun m!172891 () Bool)

(assert (=> b!115499 m!172891))

(declare-fun m!172893 () Bool)

(assert (=> b!115499 m!172893))

(declare-fun m!172895 () Bool)

(assert (=> b!115492 m!172895))

(declare-fun m!172897 () Bool)

(assert (=> b!115495 m!172897))

(declare-fun m!172899 () Bool)

(assert (=> b!115494 m!172899))

(declare-fun m!172901 () Bool)

(assert (=> b!115501 m!172901))

(declare-fun m!172903 () Bool)

(assert (=> b!115491 m!172903))

(declare-fun m!172905 () Bool)

(assert (=> b!115491 m!172905))

(check-sat (not b!115494) (not b!115499) (not b!115492) (not b!115495) (not b!115498) (not start!22864) (not b!115501) (not b!115490) (not b!115500) (not b!115491) (not b!115497))
(check-sat)
