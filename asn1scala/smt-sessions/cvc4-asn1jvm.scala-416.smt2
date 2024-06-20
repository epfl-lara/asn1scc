; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10624 () Bool)

(assert start!10624)

(declare-fun b!53183 () Bool)

(declare-fun res!44430 () Bool)

(declare-fun e!35458 () Bool)

(assert (=> b!53183 (=> (not res!44430) (not e!35458))))

(declare-datatypes ((array!2516 0))(
  ( (array!2517 (arr!1684 (Array (_ BitVec 32) (_ BitVec 8))) (size!1148 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1988 0))(
  ( (BitStream!1989 (buf!1498 array!2516) (currentByte!3059 (_ BitVec 32)) (currentBit!3054 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1988)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!53183 (= res!44430 (validate_offset_bits!1 ((_ sign_extend 32) (size!1148 (buf!1498 thiss!1379))) ((_ sign_extend 32) (currentByte!3059 thiss!1379)) ((_ sign_extend 32) (currentBit!3054 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!53184 () Bool)

(declare-fun e!35456 () Bool)

(declare-fun array_inv!1053 (array!2516) Bool)

(assert (=> b!53184 (= e!35456 (array_inv!1053 (buf!1498 thiss!1379)))))

(declare-fun b!53185 () Bool)

(declare-fun e!35454 () Bool)

(declare-fun e!35459 () Bool)

(assert (=> b!53185 (= e!35454 e!35459)))

(declare-fun res!44426 () Bool)

(assert (=> b!53185 (=> res!44426 e!35459)))

(declare-datatypes ((Unit!3703 0))(
  ( (Unit!3704) )
))
(declare-datatypes ((tuple2!4850 0))(
  ( (tuple2!4851 (_1!2530 Unit!3703) (_2!2530 BitStream!1988)) )
))
(declare-fun lt!82396 () tuple2!4850)

(assert (=> b!53185 (= res!44426 (not (= (size!1148 (buf!1498 thiss!1379)) (size!1148 (buf!1498 (_2!2530 lt!82396))))))))

(declare-datatypes ((tuple2!4852 0))(
  ( (tuple2!4853 (_1!2531 BitStream!1988) (_2!2531 BitStream!1988)) )
))
(declare-fun lt!82397 () tuple2!4852)

(declare-fun reader!0 (BitStream!1988 BitStream!1988) tuple2!4852)

(assert (=> b!53185 (= lt!82397 (reader!0 thiss!1379 (_2!2530 lt!82396)))))

(declare-fun res!44428 () Bool)

(assert (=> start!10624 (=> (not res!44428) (not e!35458))))

(declare-fun srcBuffer!2 () array!2516)

(assert (=> start!10624 (= res!44428 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1148 srcBuffer!2))))))))

(assert (=> start!10624 e!35458))

(assert (=> start!10624 true))

(assert (=> start!10624 (array_inv!1053 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1988) Bool)

(assert (=> start!10624 (and (inv!12 thiss!1379) e!35456)))

(declare-fun b!53186 () Bool)

(assert (=> b!53186 (= e!35459 (validate_offset_bits!1 ((_ sign_extend 32) (size!1148 (buf!1498 thiss!1379))) ((_ sign_extend 32) (currentByte!3059 thiss!1379)) ((_ sign_extend 32) (currentBit!3054 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!53187 () Bool)

(declare-fun e!35455 () Bool)

(assert (=> b!53187 (= e!35455 e!35454)))

(declare-fun res!44427 () Bool)

(assert (=> b!53187 (=> res!44427 e!35454)))

(declare-fun isPrefixOf!0 (BitStream!1988 BitStream!1988) Bool)

(assert (=> b!53187 (= res!44427 (not (isPrefixOf!0 thiss!1379 (_2!2530 lt!82396))))))

(assert (=> b!53187 (validate_offset_bits!1 ((_ sign_extend 32) (size!1148 (buf!1498 (_2!2530 lt!82396)))) ((_ sign_extend 32) (currentByte!3059 (_2!2530 lt!82396))) ((_ sign_extend 32) (currentBit!3054 (_2!2530 lt!82396))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!82398 () Unit!3703)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1988 BitStream!1988 (_ BitVec 64) (_ BitVec 64)) Unit!3703)

(assert (=> b!53187 (= lt!82398 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2530 lt!82396) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1988 (_ BitVec 8) (_ BitVec 32)) tuple2!4850)

(assert (=> b!53187 (= lt!82396 (appendBitFromByte!0 thiss!1379 (select (arr!1684 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!53188 () Bool)

(assert (=> b!53188 (= e!35458 (not e!35455))))

(declare-fun res!44429 () Bool)

(assert (=> b!53188 (=> res!44429 e!35455)))

(assert (=> b!53188 (= res!44429 (bvsge i!635 to!314))))

(assert (=> b!53188 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!82399 () Unit!3703)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1988) Unit!3703)

(assert (=> b!53188 (= lt!82399 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!82395 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!53188 (= lt!82395 (bitIndex!0 (size!1148 (buf!1498 thiss!1379)) (currentByte!3059 thiss!1379) (currentBit!3054 thiss!1379)))))

(assert (= (and start!10624 res!44428) b!53183))

(assert (= (and b!53183 res!44430) b!53188))

(assert (= (and b!53188 (not res!44429)) b!53187))

(assert (= (and b!53187 (not res!44427)) b!53185))

(assert (= (and b!53185 (not res!44426)) b!53186))

(assert (= start!10624 b!53184))

(declare-fun m!83703 () Bool)

(assert (=> b!53187 m!83703))

(declare-fun m!83705 () Bool)

(assert (=> b!53187 m!83705))

(assert (=> b!53187 m!83703))

(declare-fun m!83707 () Bool)

(assert (=> b!53187 m!83707))

(declare-fun m!83709 () Bool)

(assert (=> b!53187 m!83709))

(declare-fun m!83711 () Bool)

(assert (=> b!53187 m!83711))

(declare-fun m!83713 () Bool)

(assert (=> b!53186 m!83713))

(declare-fun m!83715 () Bool)

(assert (=> start!10624 m!83715))

(declare-fun m!83717 () Bool)

(assert (=> start!10624 m!83717))

(declare-fun m!83719 () Bool)

(assert (=> b!53183 m!83719))

(declare-fun m!83721 () Bool)

(assert (=> b!53185 m!83721))

(declare-fun m!83723 () Bool)

(assert (=> b!53188 m!83723))

(declare-fun m!83725 () Bool)

(assert (=> b!53188 m!83725))

(declare-fun m!83727 () Bool)

(assert (=> b!53188 m!83727))

(declare-fun m!83729 () Bool)

(assert (=> b!53184 m!83729))

(push 1)

(assert (not b!53188))

(assert (not b!53183))

(assert (not b!53187))

(assert (not b!53184))

(assert (not b!53185))

(assert (not start!10624))

(assert (not b!53186))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!16852 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!16852 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1148 (buf!1498 thiss!1379))) ((_ sign_extend 32) (currentByte!3059 thiss!1379)) ((_ sign_extend 32) (currentBit!3054 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1148 (buf!1498 thiss!1379))) ((_ sign_extend 32) (currentByte!3059 thiss!1379)) ((_ sign_extend 32) (currentBit!3054 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4275 () Bool)

(assert (= bs!4275 d!16852))

(declare-fun m!83755 () Bool)

(assert (=> bs!4275 m!83755))

(assert (=> b!53186 d!16852))

(declare-fun d!16854 () Bool)

(assert (=> d!16854 (= (array_inv!1053 (buf!1498 thiss!1379)) (bvsge (size!1148 (buf!1498 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!53184 d!16854))

(declare-fun b!53300 () Bool)

(declare-fun e!35520 () Unit!3703)

(declare-fun lt!82616 () Unit!3703)

(assert (=> b!53300 (= e!35520 lt!82616)))

(declare-fun lt!82610 () (_ BitVec 64))

(assert (=> b!53300 (= lt!82610 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!82611 () (_ BitVec 64))

(assert (=> b!53300 (= lt!82611 (bitIndex!0 (size!1148 (buf!1498 thiss!1379)) (currentByte!3059 thiss!1379) (currentBit!3054 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2516 array!2516 (_ BitVec 64) (_ BitVec 64)) Unit!3703)

(assert (=> b!53300 (= lt!82616 (arrayBitRangesEqSymmetric!0 (buf!1498 thiss!1379) (buf!1498 (_2!2530 lt!82396)) lt!82610 lt!82611))))

(declare-fun arrayBitRangesEq!0 (array!2516 array!2516 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!53300 (arrayBitRangesEq!0 (buf!1498 (_2!2530 lt!82396)) (buf!1498 thiss!1379) lt!82610 lt!82611)))

(declare-fun b!53301 () Bool)

(declare-fun res!44530 () Bool)

(declare-fun e!35519 () Bool)

(assert (=> b!53301 (=> (not res!44530) (not e!35519))))

(declare-fun lt!82605 () tuple2!4852)

(assert (=> b!53301 (= res!44530 (isPrefixOf!0 (_2!2531 lt!82605) (_2!2530 lt!82396)))))

(declare-fun b!53302 () Bool)

(declare-fun res!44531 () Bool)

(assert (=> b!53302 (=> (not res!44531) (not e!35519))))

(assert (=> b!53302 (= res!44531 (isPrefixOf!0 (_1!2531 lt!82605) thiss!1379))))

(declare-fun d!16856 () Bool)

(assert (=> d!16856 e!35519))

(declare-fun res!44532 () Bool)

(assert (=> d!16856 (=> (not res!44532) (not e!35519))))

(assert (=> d!16856 (= res!44532 (isPrefixOf!0 (_1!2531 lt!82605) (_2!2531 lt!82605)))))

(declare-fun lt!82618 () BitStream!1988)

(assert (=> d!16856 (= lt!82605 (tuple2!4853 lt!82618 (_2!2530 lt!82396)))))

(declare-fun lt!82608 () Unit!3703)

(declare-fun lt!82612 () Unit!3703)

(assert (=> d!16856 (= lt!82608 lt!82612)))

(assert (=> d!16856 (isPrefixOf!0 lt!82618 (_2!2530 lt!82396))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1988 BitStream!1988 BitStream!1988) Unit!3703)

(assert (=> d!16856 (= lt!82612 (lemmaIsPrefixTransitive!0 lt!82618 (_2!2530 lt!82396) (_2!2530 lt!82396)))))

(declare-fun lt!82603 () Unit!3703)

(declare-fun lt!82614 () Unit!3703)

(assert (=> d!16856 (= lt!82603 lt!82614)))

(assert (=> d!16856 (isPrefixOf!0 lt!82618 (_2!2530 lt!82396))))

(assert (=> d!16856 (= lt!82614 (lemmaIsPrefixTransitive!0 lt!82618 thiss!1379 (_2!2530 lt!82396)))))

(declare-fun lt!82607 () Unit!3703)

(assert (=> d!16856 (= lt!82607 e!35520)))

(declare-fun c!3759 () Bool)

(assert (=> d!16856 (= c!3759 (not (= (size!1148 (buf!1498 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!82619 () Unit!3703)

(declare-fun lt!82602 () Unit!3703)

(assert (=> d!16856 (= lt!82619 lt!82602)))

(assert (=> d!16856 (isPrefixOf!0 (_2!2530 lt!82396) (_2!2530 lt!82396))))

(assert (=> d!16856 (= lt!82602 (lemmaIsPrefixRefl!0 (_2!2530 lt!82396)))))

(declare-fun lt!82606 () Unit!3703)

(declare-fun lt!82615 () Unit!3703)

(assert (=> d!16856 (= lt!82606 lt!82615)))

(assert (=> d!16856 (= lt!82615 (lemmaIsPrefixRefl!0 (_2!2530 lt!82396)))))

(declare-fun lt!82613 () Unit!3703)

(declare-fun lt!82604 () Unit!3703)

(assert (=> d!16856 (= lt!82613 lt!82604)))

(assert (=> d!16856 (isPrefixOf!0 lt!82618 lt!82618)))

(assert (=> d!16856 (= lt!82604 (lemmaIsPrefixRefl!0 lt!82618))))

(declare-fun lt!82617 () Unit!3703)

(declare-fun lt!82621 () Unit!3703)

(assert (=> d!16856 (= lt!82617 lt!82621)))

(assert (=> d!16856 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!16856 (= lt!82621 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!16856 (= lt!82618 (BitStream!1989 (buf!1498 (_2!2530 lt!82396)) (currentByte!3059 thiss!1379) (currentBit!3054 thiss!1379)))))

(assert (=> d!16856 (isPrefixOf!0 thiss!1379 (_2!2530 lt!82396))))

(assert (=> d!16856 (= (reader!0 thiss!1379 (_2!2530 lt!82396)) lt!82605)))

(declare-fun b!53303 () Bool)

(declare-fun lt!82609 () (_ BitVec 64))

(declare-fun lt!82620 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1988 (_ BitVec 64)) BitStream!1988)

(assert (=> b!53303 (= e!35519 (= (_1!2531 lt!82605) (withMovedBitIndex!0 (_2!2531 lt!82605) (bvsub lt!82609 lt!82620))))))

(assert (=> b!53303 (or (= (bvand lt!82609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!82620 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!82609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!82609 lt!82620) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!53303 (= lt!82620 (bitIndex!0 (size!1148 (buf!1498 (_2!2530 lt!82396))) (currentByte!3059 (_2!2530 lt!82396)) (currentBit!3054 (_2!2530 lt!82396))))))

(assert (=> b!53303 (= lt!82609 (bitIndex!0 (size!1148 (buf!1498 thiss!1379)) (currentByte!3059 thiss!1379) (currentBit!3054 thiss!1379)))))

(declare-fun b!53304 () Bool)

(declare-fun Unit!3707 () Unit!3703)

(assert (=> b!53304 (= e!35520 Unit!3707)))

(assert (= (and d!16856 c!3759) b!53300))

(assert (= (and d!16856 (not c!3759)) b!53304))

(assert (= (and d!16856 res!44532) b!53302))

(assert (= (and b!53302 res!44531) b!53301))

(assert (= (and b!53301 res!44530) b!53303))

(declare-fun m!83847 () Bool)

(assert (=> b!53302 m!83847))

(assert (=> b!53300 m!83727))

(declare-fun m!83849 () Bool)

(assert (=> b!53300 m!83849))

(declare-fun m!83851 () Bool)

(assert (=> b!53300 m!83851))

(declare-fun m!83853 () Bool)

(assert (=> b!53303 m!83853))

(declare-fun m!83855 () Bool)

(assert (=> b!53303 m!83855))

(assert (=> b!53303 m!83727))

(declare-fun m!83857 () Bool)

(assert (=> d!16856 m!83857))

(declare-fun m!83859 () Bool)

(assert (=> d!16856 m!83859))

(declare-fun m!83861 () Bool)

(assert (=> d!16856 m!83861))

(declare-fun m!83863 () Bool)

(assert (=> d!16856 m!83863))

(declare-fun m!83865 () Bool)

(assert (=> d!16856 m!83865))

(declare-fun m!83867 () Bool)

(assert (=> d!16856 m!83867))

(assert (=> d!16856 m!83725))

(declare-fun m!83869 () Bool)

(assert (=> d!16856 m!83869))

(assert (=> d!16856 m!83723))

(assert (=> d!16856 m!83705))

(declare-fun m!83871 () Bool)

(assert (=> d!16856 m!83871))

(declare-fun m!83873 () Bool)

(assert (=> b!53301 m!83873))

(assert (=> b!53185 d!16856))

(declare-fun d!16878 () Bool)

(assert (=> d!16878 (= (array_inv!1053 srcBuffer!2) (bvsge (size!1148 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!10624 d!16878))

(declare-fun d!16880 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!16880 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3054 thiss!1379) (currentByte!3059 thiss!1379) (size!1148 (buf!1498 thiss!1379))))))

(declare-fun bs!4281 () Bool)

(assert (= bs!4281 d!16880))

(declare-fun m!83875 () Bool)

(assert (=> bs!4281 m!83875))

(assert (=> start!10624 d!16880))

(declare-fun d!16882 () Bool)

(assert (=> d!16882 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1148 (buf!1498 thiss!1379))) ((_ sign_extend 32) (currentByte!3059 thiss!1379)) ((_ sign_extend 32) (currentBit!3054 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1148 (buf!1498 thiss!1379))) ((_ sign_extend 32) (currentByte!3059 thiss!1379)) ((_ sign_extend 32) (currentBit!3054 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4282 () Bool)

(assert (= bs!4282 d!16882))

(assert (=> bs!4282 m!83755))

(assert (=> b!53183 d!16882))

(declare-fun d!16884 () Bool)

(declare-fun res!44545 () Bool)

(declare-fun e!35529 () Bool)

(assert (=> d!16884 (=> (not res!44545) (not e!35529))))

(assert (=> d!16884 (= res!44545 (= (size!1148 (buf!1498 thiss!1379)) (size!1148 (buf!1498 thiss!1379))))))

(assert (=> d!16884 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!35529)))

(declare-fun b!53317 () Bool)

(declare-fun res!44546 () Bool)

(assert (=> b!53317 (=> (not res!44546) (not e!35529))))

(assert (=> b!53317 (= res!44546 (bvsle (bitIndex!0 (size!1148 (buf!1498 thiss!1379)) (currentByte!3059 thiss!1379) (currentBit!3054 thiss!1379)) (bitIndex!0 (size!1148 (buf!1498 thiss!1379)) (currentByte!3059 thiss!1379) (currentBit!3054 thiss!1379))))))

(declare-fun b!53318 () Bool)

(declare-fun e!35528 () Bool)

(assert (=> b!53318 (= e!35529 e!35528)))

(declare-fun res!44547 () Bool)

(assert (=> b!53318 (=> res!44547 e!35528)))

(assert (=> b!53318 (= res!44547 (= (size!1148 (buf!1498 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!53319 () Bool)

(assert (=> b!53319 (= e!35528 (arrayBitRangesEq!0 (buf!1498 thiss!1379) (buf!1498 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1148 (buf!1498 thiss!1379)) (currentByte!3059 thiss!1379) (currentBit!3054 thiss!1379))))))

(assert (= (and d!16884 res!44545) b!53317))

(assert (= (and b!53317 res!44546) b!53318))

(assert (= (and b!53318 (not res!44547)) b!53319))

(assert (=> b!53317 m!83727))

(assert (=> b!53317 m!83727))

(assert (=> b!53319 m!83727))

(assert (=> b!53319 m!83727))

(declare-fun m!83877 () Bool)

(assert (=> b!53319 m!83877))

(assert (=> b!53188 d!16884))

(declare-fun d!16886 () Bool)

(assert (=> d!16886 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!82642 () Unit!3703)

(declare-fun choose!11 (BitStream!1988) Unit!3703)

(assert (=> d!16886 (= lt!82642 (choose!11 thiss!1379))))

(assert (=> d!16886 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!82642)))

(declare-fun bs!4284 () Bool)

(assert (= bs!4284 d!16886))

(assert (=> bs!4284 m!83723))

(declare-fun m!83879 () Bool)

(assert (=> bs!4284 m!83879))

(assert (=> b!53188 d!16886))

(declare-fun d!16888 () Bool)

(declare-fun e!35536 () Bool)

(assert (=> d!16888 e!35536))

(declare-fun res!44558 () Bool)

(assert (=> d!16888 (=> (not res!44558) (not e!35536))))

(declare-fun lt!82699 () (_ BitVec 64))

(declare-fun lt!82696 () (_ BitVec 64))

(declare-fun lt!82698 () (_ BitVec 64))

(assert (=> d!16888 (= res!44558 (= lt!82698 (bvsub lt!82699 lt!82696)))))

(assert (=> d!16888 (or (= (bvand lt!82699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!82696 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!82699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!82699 lt!82696) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16888 (= lt!82696 (remainingBits!0 ((_ sign_extend 32) (size!1148 (buf!1498 thiss!1379))) ((_ sign_extend 32) (currentByte!3059 thiss!1379)) ((_ sign_extend 32) (currentBit!3054 thiss!1379))))))

(declare-fun lt!82700 () (_ BitVec 64))

(declare-fun lt!82695 () (_ BitVec 64))

(assert (=> d!16888 (= lt!82699 (bvmul lt!82700 lt!82695))))

(assert (=> d!16888 (or (= lt!82700 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!82695 (bvsdiv (bvmul lt!82700 lt!82695) lt!82700)))))

(assert (=> d!16888 (= lt!82695 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16888 (= lt!82700 ((_ sign_extend 32) (size!1148 (buf!1498 thiss!1379))))))

(assert (=> d!16888 (= lt!82698 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3059 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3054 thiss!1379))))))

(assert (=> d!16888 (invariant!0 (currentBit!3054 thiss!1379) (currentByte!3059 thiss!1379) (size!1148 (buf!1498 thiss!1379)))))

(assert (=> d!16888 (= (bitIndex!0 (size!1148 (buf!1498 thiss!1379)) (currentByte!3059 thiss!1379) (currentBit!3054 thiss!1379)) lt!82698)))

(declare-fun b!53334 () Bool)

(declare-fun res!44559 () Bool)

(assert (=> b!53334 (=> (not res!44559) (not e!35536))))

(assert (=> b!53334 (= res!44559 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!82698))))

(declare-fun b!53335 () Bool)

(declare-fun lt!82697 () (_ BitVec 64))

(assert (=> b!53335 (= e!35536 (bvsle lt!82698 (bvmul lt!82697 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53335 (or (= lt!82697 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!82697 #b0000000000000000000000000000000000000000000000000000000000001000) lt!82697)))))

(assert (=> b!53335 (= lt!82697 ((_ sign_extend 32) (size!1148 (buf!1498 thiss!1379))))))

(assert (= (and d!16888 res!44558) b!53334))

(assert (= (and b!53334 res!44559) b!53335))

(assert (=> d!16888 m!83755))

(assert (=> d!16888 m!83875))

(assert (=> b!53188 d!16888))

(declare-fun d!16890 () Bool)

(declare-fun res!44560 () Bool)

(declare-fun e!35538 () Bool)

(assert (=> d!16890 (=> (not res!44560) (not e!35538))))

(assert (=> d!16890 (= res!44560 (= (size!1148 (buf!1498 thiss!1379)) (size!1148 (buf!1498 (_2!2530 lt!82396)))))))

(assert (=> d!16890 (= (isPrefixOf!0 thiss!1379 (_2!2530 lt!82396)) e!35538)))

(declare-fun b!53336 () Bool)

(declare-fun res!44561 () Bool)

(assert (=> b!53336 (=> (not res!44561) (not e!35538))))

(assert (=> b!53336 (= res!44561 (bvsle (bitIndex!0 (size!1148 (buf!1498 thiss!1379)) (currentByte!3059 thiss!1379) (currentBit!3054 thiss!1379)) (bitIndex!0 (size!1148 (buf!1498 (_2!2530 lt!82396))) (currentByte!3059 (_2!2530 lt!82396)) (currentBit!3054 (_2!2530 lt!82396)))))))

(declare-fun b!53337 () Bool)

(declare-fun e!35537 () Bool)

(assert (=> b!53337 (= e!35538 e!35537)))

(declare-fun res!44562 () Bool)

(assert (=> b!53337 (=> res!44562 e!35537)))

(assert (=> b!53337 (= res!44562 (= (size!1148 (buf!1498 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!53338 () Bool)

(assert (=> b!53338 (= e!35537 (arrayBitRangesEq!0 (buf!1498 thiss!1379) (buf!1498 (_2!2530 lt!82396)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1148 (buf!1498 thiss!1379)) (currentByte!3059 thiss!1379) (currentBit!3054 thiss!1379))))))

(assert (= (and d!16890 res!44560) b!53336))

(assert (= (and b!53336 res!44561) b!53337))

(assert (= (and b!53337 (not res!44562)) b!53338))

(assert (=> b!53336 m!83727))

(assert (=> b!53336 m!83855))

(assert (=> b!53338 m!83727))

(assert (=> b!53338 m!83727))

(declare-fun m!83881 () Bool)

(assert (=> b!53338 m!83881))

(assert (=> b!53187 d!16890))

(declare-fun d!16892 () Bool)

(assert (=> d!16892 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1148 (buf!1498 (_2!2530 lt!82396)))) ((_ sign_extend 32) (currentByte!3059 (_2!2530 lt!82396))) ((_ sign_extend 32) (currentBit!3054 (_2!2530 lt!82396))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1148 (buf!1498 (_2!2530 lt!82396)))) ((_ sign_extend 32) (currentByte!3059 (_2!2530 lt!82396))) ((_ sign_extend 32) (currentBit!3054 (_2!2530 lt!82396)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4285 () Bool)

(assert (= bs!4285 d!16892))

(declare-fun m!83883 () Bool)

(assert (=> bs!4285 m!83883))

(assert (=> b!53187 d!16892))

(declare-fun d!16894 () Bool)

(declare-fun e!35543 () Bool)

(assert (=> d!16894 e!35543))

(declare-fun res!44568 () Bool)

(assert (=> d!16894 (=> (not res!44568) (not e!35543))))

(assert (=> d!16894 (= res!44568 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!82723 () Unit!3703)

(declare-fun choose!27 (BitStream!1988 BitStream!1988 (_ BitVec 64) (_ BitVec 64)) Unit!3703)

(assert (=> d!16894 (= lt!82723 (choose!27 thiss!1379 (_2!2530 lt!82396) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!16894 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!16894 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2530 lt!82396) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!82723)))

(declare-fun b!53346 () Bool)

(assert (=> b!53346 (= e!35543 (validate_offset_bits!1 ((_ sign_extend 32) (size!1148 (buf!1498 (_2!2530 lt!82396)))) ((_ sign_extend 32) (currentByte!3059 (_2!2530 lt!82396))) ((_ sign_extend 32) (currentBit!3054 (_2!2530 lt!82396))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!16894 res!44568) b!53346))

(declare-fun m!83911 () Bool)

(assert (=> d!16894 m!83911))

(assert (=> b!53346 m!83711))

(assert (=> b!53187 d!16894))

(declare-fun b!53364 () Bool)

(declare-fun e!35554 () Bool)

(declare-datatypes ((tuple2!4862 0))(
  ( (tuple2!4863 (_1!2536 BitStream!1988) (_2!2536 Bool)) )
))
(declare-fun lt!82759 () tuple2!4862)

(declare-fun lt!82755 () tuple2!4850)

(assert (=> b!53364 (= e!35554 (= (bitIndex!0 (size!1148 (buf!1498 (_1!2536 lt!82759))) (currentByte!3059 (_1!2536 lt!82759)) (currentBit!3054 (_1!2536 lt!82759))) (bitIndex!0 (size!1148 (buf!1498 (_2!2530 lt!82755))) (currentByte!3059 (_2!2530 lt!82755)) (currentBit!3054 (_2!2530 lt!82755)))))))

(declare-fun d!16898 () Bool)

(declare-fun e!35552 () Bool)

(assert (=> d!16898 e!35552))

(declare-fun res!44588 () Bool)

(assert (=> d!16898 (=> (not res!44588) (not e!35552))))

(declare-fun lt!82754 () tuple2!4850)

(assert (=> d!16898 (= res!44588 (= (size!1148 (buf!1498 (_2!2530 lt!82754))) (size!1148 (buf!1498 thiss!1379))))))

(declare-fun lt!82753 () (_ BitVec 8))

(declare-fun lt!82749 () array!2516)

(assert (=> d!16898 (= lt!82753 (select (arr!1684 lt!82749) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!16898 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1148 lt!82749)))))

(assert (=> d!16898 (= lt!82749 (array!2517 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!82751 () tuple2!4850)

(assert (=> d!16898 (= lt!82754 (tuple2!4851 (_1!2530 lt!82751) (_2!2530 lt!82751)))))

(assert (=> d!16898 (= lt!82751 lt!82755)))

(declare-fun e!35553 () Bool)

(assert (=> d!16898 e!35553))

(declare-fun res!44585 () Bool)

(assert (=> d!16898 (=> (not res!44585) (not e!35553))))

(assert (=> d!16898 (= res!44585 (= (size!1148 (buf!1498 thiss!1379)) (size!1148 (buf!1498 (_2!2530 lt!82755)))))))

(declare-fun lt!82758 () Bool)

(declare-fun appendBit!0 (BitStream!1988 Bool) tuple2!4850)

(assert (=> d!16898 (= lt!82755 (appendBit!0 thiss!1379 lt!82758))))

(assert (=> d!16898 (= lt!82758 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1684 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!16898 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!16898 (= (appendBitFromByte!0 thiss!1379 (select (arr!1684 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!82754)))

(declare-fun b!53365 () Bool)

(assert (=> b!53365 (= e!35553 e!35554)))

(declare-fun res!44586 () Bool)

(assert (=> b!53365 (=> (not res!44586) (not e!35554))))

(assert (=> b!53365 (= res!44586 (and (= (_2!2536 lt!82759) lt!82758) (= (_1!2536 lt!82759) (_2!2530 lt!82755))))))

(declare-fun readBitPure!0 (BitStream!1988) tuple2!4862)

(declare-fun readerFrom!0 (BitStream!1988 (_ BitVec 32) (_ BitVec 32)) BitStream!1988)

(assert (=> b!53365 (= lt!82759 (readBitPure!0 (readerFrom!0 (_2!2530 lt!82755) (currentBit!3054 thiss!1379) (currentByte!3059 thiss!1379))))))

(declare-fun b!53366 () Bool)

(declare-fun res!44592 () Bool)

(assert (=> b!53366 (=> (not res!44592) (not e!35552))))

(declare-fun lt!82752 () (_ BitVec 64))

(declare-fun lt!82748 () (_ BitVec 64))

(assert (=> b!53366 (= res!44592 (= (bitIndex!0 (size!1148 (buf!1498 (_2!2530 lt!82754))) (currentByte!3059 (_2!2530 lt!82754)) (currentBit!3054 (_2!2530 lt!82754))) (bvadd lt!82752 lt!82748)))))

(assert (=> b!53366 (or (not (= (bvand lt!82752 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!82748 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!82752 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!82752 lt!82748) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!53366 (= lt!82748 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!53366 (= lt!82752 (bitIndex!0 (size!1148 (buf!1498 thiss!1379)) (currentByte!3059 thiss!1379) (currentBit!3054 thiss!1379)))))

(declare-fun b!53367 () Bool)

(declare-fun res!44591 () Bool)

(assert (=> b!53367 (=> (not res!44591) (not e!35553))))

(assert (=> b!53367 (= res!44591 (isPrefixOf!0 thiss!1379 (_2!2530 lt!82755)))))

(declare-fun b!53368 () Bool)

(declare-fun e!35555 () Bool)

(declare-fun lt!82757 () tuple2!4862)

(assert (=> b!53368 (= e!35555 (= (bitIndex!0 (size!1148 (buf!1498 (_1!2536 lt!82757))) (currentByte!3059 (_1!2536 lt!82757)) (currentBit!3054 (_1!2536 lt!82757))) (bitIndex!0 (size!1148 (buf!1498 (_2!2530 lt!82754))) (currentByte!3059 (_2!2530 lt!82754)) (currentBit!3054 (_2!2530 lt!82754)))))))

(declare-fun b!53369 () Bool)

(declare-fun res!44587 () Bool)

(assert (=> b!53369 (=> (not res!44587) (not e!35553))))

(assert (=> b!53369 (= res!44587 (= (bitIndex!0 (size!1148 (buf!1498 (_2!2530 lt!82755))) (currentByte!3059 (_2!2530 lt!82755)) (currentBit!3054 (_2!2530 lt!82755))) (bvadd (bitIndex!0 (size!1148 (buf!1498 thiss!1379)) (currentByte!3059 thiss!1379) (currentBit!3054 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!53370 () Bool)

(declare-fun res!44590 () Bool)

(assert (=> b!53370 (=> (not res!44590) (not e!35552))))

(assert (=> b!53370 (= res!44590 (isPrefixOf!0 thiss!1379 (_2!2530 lt!82754)))))

(declare-fun b!53371 () Bool)

(assert (=> b!53371 (= e!35552 e!35555)))

(declare-fun res!44589 () Bool)

(assert (=> b!53371 (=> (not res!44589) (not e!35555))))

(assert (=> b!53371 (= res!44589 (and (= (_2!2536 lt!82757) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1684 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!82753)) #b00000000000000000000000000000000))) (= (_1!2536 lt!82757) (_2!2530 lt!82754))))))

(declare-datatypes ((tuple2!4864 0))(
  ( (tuple2!4865 (_1!2537 array!2516) (_2!2537 BitStream!1988)) )
))
(declare-fun lt!82750 () tuple2!4864)

(declare-fun lt!82756 () BitStream!1988)

(declare-fun readBits!0 (BitStream!1988 (_ BitVec 64)) tuple2!4864)

(assert (=> b!53371 (= lt!82750 (readBits!0 lt!82756 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!53371 (= lt!82757 (readBitPure!0 lt!82756))))

(assert (=> b!53371 (= lt!82756 (readerFrom!0 (_2!2530 lt!82754) (currentBit!3054 thiss!1379) (currentByte!3059 thiss!1379)))))

(assert (= (and d!16898 res!44585) b!53369))

(assert (= (and b!53369 res!44587) b!53367))

(assert (= (and b!53367 res!44591) b!53365))

(assert (= (and b!53365 res!44586) b!53364))

(assert (= (and d!16898 res!44588) b!53366))

(assert (= (and b!53366 res!44592) b!53370))

(assert (= (and b!53370 res!44590) b!53371))

(assert (= (and b!53371 res!44589) b!53368))

(declare-fun m!83913 () Bool)

(assert (=> b!53367 m!83913))

(declare-fun m!83915 () Bool)

(assert (=> b!53366 m!83915))

(assert (=> b!53366 m!83727))

(declare-fun m!83917 () Bool)

(assert (=> b!53370 m!83917))

(declare-fun m!83919 () Bool)

(assert (=> b!53369 m!83919))

(assert (=> b!53369 m!83727))

(declare-fun m!83921 () Bool)

(assert (=> b!53371 m!83921))

(declare-fun m!83923 () Bool)

(assert (=> b!53371 m!83923))

(declare-fun m!83925 () Bool)

(assert (=> b!53371 m!83925))

(declare-fun m!83927 () Bool)

(assert (=> b!53364 m!83927))

(assert (=> b!53364 m!83919))

(declare-fun m!83929 () Bool)

(assert (=> b!53365 m!83929))

(assert (=> b!53365 m!83929))

(declare-fun m!83931 () Bool)

(assert (=> b!53365 m!83931))

(declare-fun m!83933 () Bool)

(assert (=> d!16898 m!83933))

(declare-fun m!83935 () Bool)

(assert (=> d!16898 m!83935))

(declare-fun m!83937 () Bool)

(assert (=> d!16898 m!83937))

(declare-fun m!83939 () Bool)

(assert (=> b!53368 m!83939))

(assert (=> b!53368 m!83915))

(assert (=> b!53187 d!16898))

(push 1)

(assert (not b!53303))

(assert (not d!16886))

(assert (not b!53300))

(assert (not d!16880))

(assert (not b!53365))

(assert (not b!53319))

(assert (not b!53367))

(assert (not b!53371))

(assert (not d!16882))

(assert (not b!53317))

(assert (not d!16852))

(assert (not b!53369))

(assert (not b!53366))

(assert (not b!53346))

(assert (not b!53364))

(assert (not d!16892))

(assert (not b!53301))

(assert (not b!53368))

(assert (not b!53302))

(assert (not b!53338))

(assert (not b!53336))

(assert (not d!16894))

(assert (not d!16898))

(assert (not d!16888))

(assert (not b!53370))

(assert (not d!16856))

(check-sat)

(pop 1)

(push 1)

(check-sat)

