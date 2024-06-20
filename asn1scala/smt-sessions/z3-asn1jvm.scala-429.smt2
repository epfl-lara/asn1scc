; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11480 () Bool)

(assert start!11480)

(declare-fun b!56803 () Bool)

(declare-fun res!47232 () Bool)

(declare-fun e!37756 () Bool)

(assert (=> b!56803 (=> res!47232 e!37756)))

(declare-datatypes ((array!2616 0))(
  ( (array!2617 (arr!1743 (Array (_ BitVec 32) (_ BitVec 8))) (size!1188 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2064 0))(
  ( (BitStream!2065 (buf!1560 array!2616) (currentByte!3160 (_ BitVec 32)) (currentBit!3155 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3927 0))(
  ( (Unit!3928) )
))
(declare-datatypes ((tuple2!5178 0))(
  ( (tuple2!5179 (_1!2700 Unit!3927) (_2!2700 BitStream!2064)) )
))
(declare-fun lt!89329 () tuple2!5178)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!56803 (= res!47232 (not (invariant!0 (currentBit!3155 (_2!2700 lt!89329)) (currentByte!3160 (_2!2700 lt!89329)) (size!1188 (buf!1560 (_2!2700 lt!89329))))))))

(declare-fun b!56804 () Bool)

(declare-fun res!47238 () Bool)

(assert (=> b!56804 (=> res!47238 e!37756)))

(declare-fun thiss!1379 () BitStream!2064)

(assert (=> b!56804 (= res!47238 (not (= (size!1188 (buf!1560 thiss!1379)) (size!1188 (buf!1560 (_2!2700 lt!89329))))))))

(declare-fun res!47231 () Bool)

(declare-fun e!37761 () Bool)

(assert (=> start!11480 (=> (not res!47231) (not e!37761))))

(declare-fun srcBuffer!2 () array!2616)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!11480 (= res!47231 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1188 srcBuffer!2))))))))

(assert (=> start!11480 e!37761))

(assert (=> start!11480 true))

(declare-fun array_inv!1091 (array!2616) Bool)

(assert (=> start!11480 (array_inv!1091 srcBuffer!2)))

(declare-fun e!37758 () Bool)

(declare-fun inv!12 (BitStream!2064) Bool)

(assert (=> start!11480 (and (inv!12 thiss!1379) e!37758)))

(declare-fun b!56805 () Bool)

(declare-fun res!47230 () Bool)

(assert (=> b!56805 (=> (not res!47230) (not e!37761))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!56805 (= res!47230 (validate_offset_bits!1 ((_ sign_extend 32) (size!1188 (buf!1560 thiss!1379))) ((_ sign_extend 32) (currentByte!3160 thiss!1379)) ((_ sign_extend 32) (currentBit!3155 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!56806 () Bool)

(declare-fun e!37760 () Bool)

(assert (=> b!56806 (= e!37760 e!37756)))

(declare-fun res!47233 () Bool)

(assert (=> b!56806 (=> res!47233 e!37756)))

(declare-fun lt!89335 () tuple2!5178)

(declare-fun isPrefixOf!0 (BitStream!2064 BitStream!2064) Bool)

(assert (=> b!56806 (= res!47233 (not (isPrefixOf!0 (_2!2700 lt!89335) (_2!2700 lt!89329))))))

(assert (=> b!56806 (isPrefixOf!0 thiss!1379 (_2!2700 lt!89329))))

(declare-fun lt!89331 () Unit!3927)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2064 BitStream!2064 BitStream!2064) Unit!3927)

(assert (=> b!56806 (= lt!89331 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2700 lt!89335) (_2!2700 lt!89329)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2064 array!2616 (_ BitVec 64) (_ BitVec 64)) tuple2!5178)

(assert (=> b!56806 (= lt!89329 (appendBitsMSBFirstLoop!0 (_2!2700 lt!89335) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!37762 () Bool)

(assert (=> b!56806 e!37762))

(declare-fun res!47235 () Bool)

(assert (=> b!56806 (=> (not res!47235) (not e!37762))))

(assert (=> b!56806 (= res!47235 (validate_offset_bits!1 ((_ sign_extend 32) (size!1188 (buf!1560 (_2!2700 lt!89335)))) ((_ sign_extend 32) (currentByte!3160 thiss!1379)) ((_ sign_extend 32) (currentBit!3155 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!89336 () Unit!3927)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2064 array!2616 (_ BitVec 64)) Unit!3927)

(assert (=> b!56806 (= lt!89336 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1560 (_2!2700 lt!89335)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5180 0))(
  ( (tuple2!5181 (_1!2701 BitStream!2064) (_2!2701 BitStream!2064)) )
))
(declare-fun lt!89337 () tuple2!5180)

(declare-fun reader!0 (BitStream!2064 BitStream!2064) tuple2!5180)

(assert (=> b!56806 (= lt!89337 (reader!0 thiss!1379 (_2!2700 lt!89335)))))

(declare-fun b!56807 () Bool)

(declare-fun e!37759 () Bool)

(assert (=> b!56807 (= e!37761 (not e!37759))))

(declare-fun res!47236 () Bool)

(assert (=> b!56807 (=> res!47236 e!37759)))

(assert (=> b!56807 (= res!47236 (bvsge i!635 to!314))))

(assert (=> b!56807 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!89334 () Unit!3927)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2064) Unit!3927)

(assert (=> b!56807 (= lt!89334 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!89332 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!56807 (= lt!89332 (bitIndex!0 (size!1188 (buf!1560 thiss!1379)) (currentByte!3160 thiss!1379) (currentBit!3155 thiss!1379)))))

(declare-fun b!56808 () Bool)

(declare-fun res!47237 () Bool)

(assert (=> b!56808 (=> res!47237 e!37756)))

(assert (=> b!56808 (= res!47237 (not (= (bitIndex!0 (size!1188 (buf!1560 (_2!2700 lt!89329))) (currentByte!3160 (_2!2700 lt!89329)) (currentBit!3155 (_2!2700 lt!89329))) (bvsub (bvadd lt!89332 to!314) i!635))))))

(declare-fun b!56809 () Bool)

(assert (=> b!56809 (= e!37758 (array_inv!1091 (buf!1560 thiss!1379)))))

(declare-fun b!56810 () Bool)

(assert (=> b!56810 (= e!37759 e!37760)))

(declare-fun res!47234 () Bool)

(assert (=> b!56810 (=> res!47234 e!37760)))

(assert (=> b!56810 (= res!47234 (not (isPrefixOf!0 thiss!1379 (_2!2700 lt!89335))))))

(assert (=> b!56810 (validate_offset_bits!1 ((_ sign_extend 32) (size!1188 (buf!1560 (_2!2700 lt!89335)))) ((_ sign_extend 32) (currentByte!3160 (_2!2700 lt!89335))) ((_ sign_extend 32) (currentBit!3155 (_2!2700 lt!89335))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!89338 () Unit!3927)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2064 BitStream!2064 (_ BitVec 64) (_ BitVec 64)) Unit!3927)

(assert (=> b!56810 (= lt!89338 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2700 lt!89335) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2064 (_ BitVec 8) (_ BitVec 32)) tuple2!5178)

(assert (=> b!56810 (= lt!89335 (appendBitFromByte!0 thiss!1379 (select (arr!1743 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!89330 () (_ BitVec 64))

(declare-fun lt!89333 () (_ BitVec 64))

(declare-fun b!56811 () Bool)

(assert (=> b!56811 (= e!37756 (or (= lt!89330 (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!89330 (bvand (bvsub lt!89333 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!56811 (= lt!89330 (bvand lt!89333 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!56811 (= lt!89333 (bvadd (bitIndex!0 (size!1188 (buf!1560 (_2!2700 lt!89335))) (currentByte!3160 (_2!2700 lt!89335)) (currentBit!3155 (_2!2700 lt!89335))) to!314))))

(assert (=> b!56811 (= (size!1188 (buf!1560 (_2!2700 lt!89329))) (size!1188 (buf!1560 thiss!1379)))))

(declare-fun b!56812 () Bool)

(declare-datatypes ((List!607 0))(
  ( (Nil!604) (Cons!603 (h!722 Bool) (t!1357 List!607)) )
))
(declare-fun head!426 (List!607) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2064 array!2616 (_ BitVec 64) (_ BitVec 64)) List!607)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2064 BitStream!2064 (_ BitVec 64)) List!607)

(assert (=> b!56812 (= e!37762 (= (head!426 (byteArrayBitContentToList!0 (_2!2700 lt!89335) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!426 (bitStreamReadBitsIntoList!0 (_2!2700 lt!89335) (_1!2701 lt!89337) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!11480 res!47231) b!56805))

(assert (= (and b!56805 res!47230) b!56807))

(assert (= (and b!56807 (not res!47236)) b!56810))

(assert (= (and b!56810 (not res!47234)) b!56806))

(assert (= (and b!56806 res!47235) b!56812))

(assert (= (and b!56806 (not res!47233)) b!56808))

(assert (= (and b!56808 (not res!47237)) b!56803))

(assert (= (and b!56803 (not res!47232)) b!56804))

(assert (= (and b!56804 (not res!47238)) b!56811))

(assert (= start!11480 b!56809))

(declare-fun m!89543 () Bool)

(assert (=> b!56805 m!89543))

(declare-fun m!89545 () Bool)

(assert (=> b!56807 m!89545))

(declare-fun m!89547 () Bool)

(assert (=> b!56807 m!89547))

(declare-fun m!89549 () Bool)

(assert (=> b!56807 m!89549))

(declare-fun m!89551 () Bool)

(assert (=> start!11480 m!89551))

(declare-fun m!89553 () Bool)

(assert (=> start!11480 m!89553))

(declare-fun m!89555 () Bool)

(assert (=> b!56806 m!89555))

(declare-fun m!89557 () Bool)

(assert (=> b!56806 m!89557))

(declare-fun m!89559 () Bool)

(assert (=> b!56806 m!89559))

(declare-fun m!89561 () Bool)

(assert (=> b!56806 m!89561))

(declare-fun m!89563 () Bool)

(assert (=> b!56806 m!89563))

(declare-fun m!89565 () Bool)

(assert (=> b!56806 m!89565))

(declare-fun m!89567 () Bool)

(assert (=> b!56806 m!89567))

(declare-fun m!89569 () Bool)

(assert (=> b!56808 m!89569))

(declare-fun m!89571 () Bool)

(assert (=> b!56810 m!89571))

(declare-fun m!89573 () Bool)

(assert (=> b!56810 m!89573))

(declare-fun m!89575 () Bool)

(assert (=> b!56810 m!89575))

(declare-fun m!89577 () Bool)

(assert (=> b!56810 m!89577))

(assert (=> b!56810 m!89573))

(declare-fun m!89579 () Bool)

(assert (=> b!56810 m!89579))

(declare-fun m!89581 () Bool)

(assert (=> b!56803 m!89581))

(declare-fun m!89583 () Bool)

(assert (=> b!56812 m!89583))

(assert (=> b!56812 m!89583))

(declare-fun m!89585 () Bool)

(assert (=> b!56812 m!89585))

(declare-fun m!89587 () Bool)

(assert (=> b!56812 m!89587))

(assert (=> b!56812 m!89587))

(declare-fun m!89589 () Bool)

(assert (=> b!56812 m!89589))

(declare-fun m!89591 () Bool)

(assert (=> b!56809 m!89591))

(declare-fun m!89593 () Bool)

(assert (=> b!56811 m!89593))

(check-sat (not b!56806) (not b!56805) (not b!56811) (not b!56809) (not b!56812) (not b!56803) (not start!11480) (not b!56810) (not b!56808) (not b!56807))
(check-sat)
(get-model)

(declare-fun d!18096 () Bool)

(declare-fun e!37790 () Bool)

(assert (=> d!18096 e!37790))

(declare-fun res!47270 () Bool)

(assert (=> d!18096 (=> (not res!47270) (not e!37790))))

(declare-fun lt!89383 () (_ BitVec 64))

(declare-fun lt!89384 () (_ BitVec 64))

(declare-fun lt!89385 () (_ BitVec 64))

(assert (=> d!18096 (= res!47270 (= lt!89383 (bvsub lt!89384 lt!89385)))))

(assert (=> d!18096 (or (= (bvand lt!89384 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!89385 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!89384 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!89384 lt!89385) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!18096 (= lt!89385 (remainingBits!0 ((_ sign_extend 32) (size!1188 (buf!1560 (_2!2700 lt!89335)))) ((_ sign_extend 32) (currentByte!3160 (_2!2700 lt!89335))) ((_ sign_extend 32) (currentBit!3155 (_2!2700 lt!89335)))))))

(declare-fun lt!89382 () (_ BitVec 64))

(declare-fun lt!89381 () (_ BitVec 64))

(assert (=> d!18096 (= lt!89384 (bvmul lt!89382 lt!89381))))

(assert (=> d!18096 (or (= lt!89382 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!89381 (bvsdiv (bvmul lt!89382 lt!89381) lt!89382)))))

(assert (=> d!18096 (= lt!89381 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18096 (= lt!89382 ((_ sign_extend 32) (size!1188 (buf!1560 (_2!2700 lt!89335)))))))

(assert (=> d!18096 (= lt!89383 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3160 (_2!2700 lt!89335))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3155 (_2!2700 lt!89335)))))))

(assert (=> d!18096 (invariant!0 (currentBit!3155 (_2!2700 lt!89335)) (currentByte!3160 (_2!2700 lt!89335)) (size!1188 (buf!1560 (_2!2700 lt!89335))))))

(assert (=> d!18096 (= (bitIndex!0 (size!1188 (buf!1560 (_2!2700 lt!89335))) (currentByte!3160 (_2!2700 lt!89335)) (currentBit!3155 (_2!2700 lt!89335))) lt!89383)))

(declare-fun b!56847 () Bool)

(declare-fun res!47271 () Bool)

(assert (=> b!56847 (=> (not res!47271) (not e!37790))))

(assert (=> b!56847 (= res!47271 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!89383))))

(declare-fun b!56848 () Bool)

(declare-fun lt!89386 () (_ BitVec 64))

(assert (=> b!56848 (= e!37790 (bvsle lt!89383 (bvmul lt!89386 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!56848 (or (= lt!89386 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!89386 #b0000000000000000000000000000000000000000000000000000000000001000) lt!89386)))))

(assert (=> b!56848 (= lt!89386 ((_ sign_extend 32) (size!1188 (buf!1560 (_2!2700 lt!89335)))))))

(assert (= (and d!18096 res!47270) b!56847))

(assert (= (and b!56847 res!47271) b!56848))

(declare-fun m!89647 () Bool)

(assert (=> d!18096 m!89647))

(declare-fun m!89649 () Bool)

(assert (=> d!18096 m!89649))

(assert (=> b!56811 d!18096))

(declare-fun d!18098 () Bool)

(declare-fun res!47278 () Bool)

(declare-fun e!37796 () Bool)

(assert (=> d!18098 (=> (not res!47278) (not e!37796))))

(assert (=> d!18098 (= res!47278 (= (size!1188 (buf!1560 thiss!1379)) (size!1188 (buf!1560 (_2!2700 lt!89329)))))))

(assert (=> d!18098 (= (isPrefixOf!0 thiss!1379 (_2!2700 lt!89329)) e!37796)))

(declare-fun b!56855 () Bool)

(declare-fun res!47279 () Bool)

(assert (=> b!56855 (=> (not res!47279) (not e!37796))))

(assert (=> b!56855 (= res!47279 (bvsle (bitIndex!0 (size!1188 (buf!1560 thiss!1379)) (currentByte!3160 thiss!1379) (currentBit!3155 thiss!1379)) (bitIndex!0 (size!1188 (buf!1560 (_2!2700 lt!89329))) (currentByte!3160 (_2!2700 lt!89329)) (currentBit!3155 (_2!2700 lt!89329)))))))

(declare-fun b!56856 () Bool)

(declare-fun e!37795 () Bool)

(assert (=> b!56856 (= e!37796 e!37795)))

(declare-fun res!47280 () Bool)

(assert (=> b!56856 (=> res!47280 e!37795)))

(assert (=> b!56856 (= res!47280 (= (size!1188 (buf!1560 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!56857 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2616 array!2616 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!56857 (= e!37795 (arrayBitRangesEq!0 (buf!1560 thiss!1379) (buf!1560 (_2!2700 lt!89329)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1188 (buf!1560 thiss!1379)) (currentByte!3160 thiss!1379) (currentBit!3155 thiss!1379))))))

(assert (= (and d!18098 res!47278) b!56855))

(assert (= (and b!56855 res!47279) b!56856))

(assert (= (and b!56856 (not res!47280)) b!56857))

(assert (=> b!56855 m!89549))

(assert (=> b!56855 m!89569))

(assert (=> b!56857 m!89549))

(assert (=> b!56857 m!89549))

(declare-fun m!89651 () Bool)

(assert (=> b!56857 m!89651))

(assert (=> b!56806 d!18098))

(declare-fun d!18100 () Bool)

(declare-fun res!47281 () Bool)

(declare-fun e!37798 () Bool)

(assert (=> d!18100 (=> (not res!47281) (not e!37798))))

(assert (=> d!18100 (= res!47281 (= (size!1188 (buf!1560 (_2!2700 lt!89335))) (size!1188 (buf!1560 (_2!2700 lt!89329)))))))

(assert (=> d!18100 (= (isPrefixOf!0 (_2!2700 lt!89335) (_2!2700 lt!89329)) e!37798)))

(declare-fun b!56858 () Bool)

(declare-fun res!47282 () Bool)

(assert (=> b!56858 (=> (not res!47282) (not e!37798))))

(assert (=> b!56858 (= res!47282 (bvsle (bitIndex!0 (size!1188 (buf!1560 (_2!2700 lt!89335))) (currentByte!3160 (_2!2700 lt!89335)) (currentBit!3155 (_2!2700 lt!89335))) (bitIndex!0 (size!1188 (buf!1560 (_2!2700 lt!89329))) (currentByte!3160 (_2!2700 lt!89329)) (currentBit!3155 (_2!2700 lt!89329)))))))

(declare-fun b!56859 () Bool)

(declare-fun e!37797 () Bool)

(assert (=> b!56859 (= e!37798 e!37797)))

(declare-fun res!47283 () Bool)

(assert (=> b!56859 (=> res!47283 e!37797)))

(assert (=> b!56859 (= res!47283 (= (size!1188 (buf!1560 (_2!2700 lt!89335))) #b00000000000000000000000000000000))))

(declare-fun b!56860 () Bool)

(assert (=> b!56860 (= e!37797 (arrayBitRangesEq!0 (buf!1560 (_2!2700 lt!89335)) (buf!1560 (_2!2700 lt!89329)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1188 (buf!1560 (_2!2700 lt!89335))) (currentByte!3160 (_2!2700 lt!89335)) (currentBit!3155 (_2!2700 lt!89335)))))))

(assert (= (and d!18100 res!47281) b!56858))

(assert (= (and b!56858 res!47282) b!56859))

(assert (= (and b!56859 (not res!47283)) b!56860))

(assert (=> b!56858 m!89593))

(assert (=> b!56858 m!89569))

(assert (=> b!56860 m!89593))

(assert (=> b!56860 m!89593))

(declare-fun m!89653 () Bool)

(assert (=> b!56860 m!89653))

(assert (=> b!56806 d!18100))

(declare-fun b!56991 () Bool)

(declare-fun res!47404 () Bool)

(declare-fun e!37868 () Bool)

(assert (=> b!56991 (=> (not res!47404) (not e!37868))))

(declare-fun lt!89706 () tuple2!5178)

(assert (=> b!56991 (= res!47404 (= (size!1188 (buf!1560 (_2!2700 lt!89706))) (size!1188 (buf!1560 (_2!2700 lt!89335)))))))

(declare-fun b!56992 () Bool)

(declare-fun res!47406 () Bool)

(assert (=> b!56992 (=> (not res!47406) (not e!37868))))

(assert (=> b!56992 (= res!47406 (isPrefixOf!0 (_2!2700 lt!89335) (_2!2700 lt!89706)))))

(declare-fun b!56993 () Bool)

(declare-fun lt!89683 () tuple2!5180)

(assert (=> b!56993 (= e!37868 (= (bitStreamReadBitsIntoList!0 (_2!2700 lt!89706) (_1!2701 lt!89683) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2700 lt!89706) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!56993 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56993 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!89712 () Unit!3927)

(declare-fun lt!89691 () Unit!3927)

(assert (=> b!56993 (= lt!89712 lt!89691)))

(declare-fun lt!89674 () (_ BitVec 64))

(assert (=> b!56993 (validate_offset_bits!1 ((_ sign_extend 32) (size!1188 (buf!1560 (_2!2700 lt!89706)))) ((_ sign_extend 32) (currentByte!3160 (_2!2700 lt!89335))) ((_ sign_extend 32) (currentBit!3155 (_2!2700 lt!89335))) lt!89674)))

(assert (=> b!56993 (= lt!89691 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2700 lt!89335) (buf!1560 (_2!2700 lt!89706)) lt!89674))))

(declare-fun e!37869 () Bool)

(assert (=> b!56993 e!37869))

(declare-fun res!47407 () Bool)

(assert (=> b!56993 (=> (not res!47407) (not e!37869))))

(assert (=> b!56993 (= res!47407 (and (= (size!1188 (buf!1560 (_2!2700 lt!89335))) (size!1188 (buf!1560 (_2!2700 lt!89706)))) (bvsge lt!89674 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56993 (= lt!89674 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!56993 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56993 (= lt!89683 (reader!0 (_2!2700 lt!89335) (_2!2700 lt!89706)))))

(declare-fun b!56994 () Bool)

(assert (=> b!56994 (= e!37869 (validate_offset_bits!1 ((_ sign_extend 32) (size!1188 (buf!1560 (_2!2700 lt!89335)))) ((_ sign_extend 32) (currentByte!3160 (_2!2700 lt!89335))) ((_ sign_extend 32) (currentBit!3155 (_2!2700 lt!89335))) lt!89674))))

(declare-fun b!56995 () Bool)

(declare-fun e!37867 () tuple2!5178)

(declare-fun Unit!3931 () Unit!3927)

(assert (=> b!56995 (= e!37867 (tuple2!5179 Unit!3931 (_2!2700 lt!89335)))))

(assert (=> b!56995 (= (size!1188 (buf!1560 (_2!2700 lt!89335))) (size!1188 (buf!1560 (_2!2700 lt!89335))))))

(declare-fun lt!89708 () Unit!3927)

(declare-fun Unit!3932 () Unit!3927)

(assert (=> b!56995 (= lt!89708 Unit!3932)))

(declare-fun call!739 () tuple2!5180)

(declare-fun checkByteArrayBitContent!0 (BitStream!2064 array!2616 array!2616 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5186 0))(
  ( (tuple2!5187 (_1!2704 array!2616) (_2!2704 BitStream!2064)) )
))
(declare-fun readBits!0 (BitStream!2064 (_ BitVec 64)) tuple2!5186)

(assert (=> b!56995 (checkByteArrayBitContent!0 (_2!2700 lt!89335) srcBuffer!2 (_1!2704 (readBits!0 (_1!2701 call!739) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun d!18102 () Bool)

(assert (=> d!18102 e!37868))

(declare-fun res!47405 () Bool)

(assert (=> d!18102 (=> (not res!47405) (not e!37868))))

(declare-fun lt!89685 () (_ BitVec 64))

(assert (=> d!18102 (= res!47405 (= (bitIndex!0 (size!1188 (buf!1560 (_2!2700 lt!89706))) (currentByte!3160 (_2!2700 lt!89706)) (currentBit!3155 (_2!2700 lt!89706))) (bvsub lt!89685 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!18102 (or (= (bvand lt!89685 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!89685 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!89685 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!89684 () (_ BitVec 64))

(assert (=> d!18102 (= lt!89685 (bvadd lt!89684 to!314))))

(assert (=> d!18102 (or (not (= (bvand lt!89684 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!89684 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!89684 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18102 (= lt!89684 (bitIndex!0 (size!1188 (buf!1560 (_2!2700 lt!89335))) (currentByte!3160 (_2!2700 lt!89335)) (currentBit!3155 (_2!2700 lt!89335))))))

(assert (=> d!18102 (= lt!89706 e!37867)))

(declare-fun c!4098 () Bool)

(assert (=> d!18102 (= c!4098 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!89701 () Unit!3927)

(declare-fun lt!89689 () Unit!3927)

(assert (=> d!18102 (= lt!89701 lt!89689)))

(assert (=> d!18102 (isPrefixOf!0 (_2!2700 lt!89335) (_2!2700 lt!89335))))

(assert (=> d!18102 (= lt!89689 (lemmaIsPrefixRefl!0 (_2!2700 lt!89335)))))

(declare-fun lt!89677 () (_ BitVec 64))

(assert (=> d!18102 (= lt!89677 (bitIndex!0 (size!1188 (buf!1560 (_2!2700 lt!89335))) (currentByte!3160 (_2!2700 lt!89335)) (currentBit!3155 (_2!2700 lt!89335))))))

(assert (=> d!18102 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18102 (= (appendBitsMSBFirstLoop!0 (_2!2700 lt!89335) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!89706)))

(declare-fun bm!736 () Bool)

(declare-fun lt!89693 () tuple2!5178)

(assert (=> bm!736 (= call!739 (reader!0 (_2!2700 lt!89335) (ite c!4098 (_2!2700 lt!89693) (_2!2700 lt!89335))))))

(declare-fun b!56996 () Bool)

(declare-fun res!47402 () Bool)

(assert (=> b!56996 (=> (not res!47402) (not e!37868))))

(assert (=> b!56996 (= res!47402 (invariant!0 (currentBit!3155 (_2!2700 lt!89706)) (currentByte!3160 (_2!2700 lt!89706)) (size!1188 (buf!1560 (_2!2700 lt!89706)))))))

(declare-fun b!56997 () Bool)

(declare-fun lt!89671 () tuple2!5178)

(declare-fun Unit!3933 () Unit!3927)

(assert (=> b!56997 (= e!37867 (tuple2!5179 Unit!3933 (_2!2700 lt!89671)))))

(assert (=> b!56997 (= lt!89693 (appendBitFromByte!0 (_2!2700 lt!89335) (select (arr!1743 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!89709 () (_ BitVec 64))

(assert (=> b!56997 (= lt!89709 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!89688 () (_ BitVec 64))

(assert (=> b!56997 (= lt!89688 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!89700 () Unit!3927)

(assert (=> b!56997 (= lt!89700 (validateOffsetBitsIneqLemma!0 (_2!2700 lt!89335) (_2!2700 lt!89693) lt!89709 lt!89688))))

(assert (=> b!56997 (validate_offset_bits!1 ((_ sign_extend 32) (size!1188 (buf!1560 (_2!2700 lt!89693)))) ((_ sign_extend 32) (currentByte!3160 (_2!2700 lt!89693))) ((_ sign_extend 32) (currentBit!3155 (_2!2700 lt!89693))) (bvsub lt!89709 lt!89688))))

(declare-fun lt!89705 () Unit!3927)

(assert (=> b!56997 (= lt!89705 lt!89700)))

(declare-fun lt!89695 () tuple2!5180)

(assert (=> b!56997 (= lt!89695 call!739)))

(declare-fun lt!89670 () (_ BitVec 64))

(assert (=> b!56997 (= lt!89670 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!89696 () Unit!3927)

(assert (=> b!56997 (= lt!89696 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2700 lt!89335) (buf!1560 (_2!2700 lt!89693)) lt!89670))))

(assert (=> b!56997 (validate_offset_bits!1 ((_ sign_extend 32) (size!1188 (buf!1560 (_2!2700 lt!89693)))) ((_ sign_extend 32) (currentByte!3160 (_2!2700 lt!89335))) ((_ sign_extend 32) (currentBit!3155 (_2!2700 lt!89335))) lt!89670)))

(declare-fun lt!89703 () Unit!3927)

(assert (=> b!56997 (= lt!89703 lt!89696)))

(assert (=> b!56997 (= (head!426 (byteArrayBitContentToList!0 (_2!2700 lt!89693) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!426 (bitStreamReadBitsIntoList!0 (_2!2700 lt!89693) (_1!2701 lt!89695) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!89679 () Unit!3927)

(declare-fun Unit!3934 () Unit!3927)

(assert (=> b!56997 (= lt!89679 Unit!3934)))

(assert (=> b!56997 (= lt!89671 (appendBitsMSBFirstLoop!0 (_2!2700 lt!89693) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!89692 () Unit!3927)

(assert (=> b!56997 (= lt!89692 (lemmaIsPrefixTransitive!0 (_2!2700 lt!89335) (_2!2700 lt!89693) (_2!2700 lt!89671)))))

(assert (=> b!56997 (isPrefixOf!0 (_2!2700 lt!89335) (_2!2700 lt!89671))))

(declare-fun lt!89711 () Unit!3927)

(assert (=> b!56997 (= lt!89711 lt!89692)))

(assert (=> b!56997 (= (size!1188 (buf!1560 (_2!2700 lt!89671))) (size!1188 (buf!1560 (_2!2700 lt!89335))))))

(declare-fun lt!89676 () Unit!3927)

(declare-fun Unit!3935 () Unit!3927)

(assert (=> b!56997 (= lt!89676 Unit!3935)))

(assert (=> b!56997 (= (bitIndex!0 (size!1188 (buf!1560 (_2!2700 lt!89671))) (currentByte!3160 (_2!2700 lt!89671)) (currentBit!3155 (_2!2700 lt!89671))) (bvsub (bvadd (bitIndex!0 (size!1188 (buf!1560 (_2!2700 lt!89335))) (currentByte!3160 (_2!2700 lt!89335)) (currentBit!3155 (_2!2700 lt!89335))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!89707 () Unit!3927)

(declare-fun Unit!3936 () Unit!3927)

(assert (=> b!56997 (= lt!89707 Unit!3936)))

(assert (=> b!56997 (= (bitIndex!0 (size!1188 (buf!1560 (_2!2700 lt!89671))) (currentByte!3160 (_2!2700 lt!89671)) (currentBit!3155 (_2!2700 lt!89671))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1188 (buf!1560 (_2!2700 lt!89693))) (currentByte!3160 (_2!2700 lt!89693)) (currentBit!3155 (_2!2700 lt!89693))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!89675 () Unit!3927)

(declare-fun Unit!3937 () Unit!3927)

(assert (=> b!56997 (= lt!89675 Unit!3937)))

(declare-fun lt!89697 () tuple2!5180)

(assert (=> b!56997 (= lt!89697 (reader!0 (_2!2700 lt!89335) (_2!2700 lt!89671)))))

(declare-fun lt!89672 () (_ BitVec 64))

(assert (=> b!56997 (= lt!89672 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!89702 () Unit!3927)

(assert (=> b!56997 (= lt!89702 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2700 lt!89335) (buf!1560 (_2!2700 lt!89671)) lt!89672))))

(assert (=> b!56997 (validate_offset_bits!1 ((_ sign_extend 32) (size!1188 (buf!1560 (_2!2700 lt!89671)))) ((_ sign_extend 32) (currentByte!3160 (_2!2700 lt!89335))) ((_ sign_extend 32) (currentBit!3155 (_2!2700 lt!89335))) lt!89672)))

(declare-fun lt!89687 () Unit!3927)

(assert (=> b!56997 (= lt!89687 lt!89702)))

(declare-fun lt!89682 () tuple2!5180)

(assert (=> b!56997 (= lt!89682 (reader!0 (_2!2700 lt!89693) (_2!2700 lt!89671)))))

(declare-fun lt!89694 () (_ BitVec 64))

(assert (=> b!56997 (= lt!89694 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!89690 () Unit!3927)

(assert (=> b!56997 (= lt!89690 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2700 lt!89693) (buf!1560 (_2!2700 lt!89671)) lt!89694))))

(assert (=> b!56997 (validate_offset_bits!1 ((_ sign_extend 32) (size!1188 (buf!1560 (_2!2700 lt!89671)))) ((_ sign_extend 32) (currentByte!3160 (_2!2700 lt!89693))) ((_ sign_extend 32) (currentBit!3155 (_2!2700 lt!89693))) lt!89694)))

(declare-fun lt!89680 () Unit!3927)

(assert (=> b!56997 (= lt!89680 lt!89690)))

(declare-fun lt!89710 () List!607)

(assert (=> b!56997 (= lt!89710 (byteArrayBitContentToList!0 (_2!2700 lt!89671) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!89699 () List!607)

(assert (=> b!56997 (= lt!89699 (byteArrayBitContentToList!0 (_2!2700 lt!89671) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!89681 () List!607)

(assert (=> b!56997 (= lt!89681 (bitStreamReadBitsIntoList!0 (_2!2700 lt!89671) (_1!2701 lt!89697) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!89704 () List!607)

(assert (=> b!56997 (= lt!89704 (bitStreamReadBitsIntoList!0 (_2!2700 lt!89671) (_1!2701 lt!89682) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!89678 () (_ BitVec 64))

(assert (=> b!56997 (= lt!89678 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!89713 () Unit!3927)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2064 BitStream!2064 BitStream!2064 BitStream!2064 (_ BitVec 64) List!607) Unit!3927)

(assert (=> b!56997 (= lt!89713 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2700 lt!89671) (_2!2700 lt!89671) (_1!2701 lt!89697) (_1!2701 lt!89682) lt!89678 lt!89681))))

(declare-fun tail!273 (List!607) List!607)

(assert (=> b!56997 (= (bitStreamReadBitsIntoList!0 (_2!2700 lt!89671) (_1!2701 lt!89682) (bvsub lt!89678 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!273 lt!89681))))

(declare-fun lt!89686 () Unit!3927)

(assert (=> b!56997 (= lt!89686 lt!89713)))

(declare-fun lt!89673 () Unit!3927)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2616 array!2616 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3927)

(assert (=> b!56997 (= lt!89673 (arrayBitRangesEqImpliesEq!0 (buf!1560 (_2!2700 lt!89693)) (buf!1560 (_2!2700 lt!89671)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!89677 (bitIndex!0 (size!1188 (buf!1560 (_2!2700 lt!89693))) (currentByte!3160 (_2!2700 lt!89693)) (currentBit!3155 (_2!2700 lt!89693)))))))

(declare-fun bitAt!0 (array!2616 (_ BitVec 64)) Bool)

(assert (=> b!56997 (= (bitAt!0 (buf!1560 (_2!2700 lt!89693)) lt!89677) (bitAt!0 (buf!1560 (_2!2700 lt!89671)) lt!89677))))

(declare-fun lt!89698 () Unit!3927)

(assert (=> b!56997 (= lt!89698 lt!89673)))

(declare-fun b!56998 () Bool)

(declare-fun res!47403 () Bool)

(assert (=> b!56998 (=> (not res!47403) (not e!37868))))

(assert (=> b!56998 (= res!47403 (= (size!1188 (buf!1560 (_2!2700 lt!89335))) (size!1188 (buf!1560 (_2!2700 lt!89706)))))))

(assert (= (and d!18102 c!4098) b!56997))

(assert (= (and d!18102 (not c!4098)) b!56995))

(assert (= (or b!56997 b!56995) bm!736))

(assert (= (and d!18102 res!47405) b!56996))

(assert (= (and b!56996 res!47402) b!56998))

(assert (= (and b!56998 res!47403) b!56992))

(assert (= (and b!56992 res!47406) b!56991))

(assert (= (and b!56991 res!47404) b!56993))

(assert (= (and b!56993 res!47407) b!56994))

(declare-fun m!89771 () Bool)

(assert (=> b!56994 m!89771))

(declare-fun m!89773 () Bool)

(assert (=> b!56996 m!89773))

(declare-fun m!89775 () Bool)

(assert (=> b!56995 m!89775))

(declare-fun m!89777 () Bool)

(assert (=> b!56995 m!89777))

(declare-fun m!89779 () Bool)

(assert (=> bm!736 m!89779))

(declare-fun m!89781 () Bool)

(assert (=> b!56997 m!89781))

(declare-fun m!89783 () Bool)

(assert (=> b!56997 m!89783))

(declare-fun m!89785 () Bool)

(assert (=> b!56997 m!89785))

(declare-fun m!89787 () Bool)

(assert (=> b!56997 m!89787))

(declare-fun m!89789 () Bool)

(assert (=> b!56997 m!89789))

(declare-fun m!89791 () Bool)

(assert (=> b!56997 m!89791))

(declare-fun m!89793 () Bool)

(assert (=> b!56997 m!89793))

(declare-fun m!89795 () Bool)

(assert (=> b!56997 m!89795))

(declare-fun m!89797 () Bool)

(assert (=> b!56997 m!89797))

(declare-fun m!89799 () Bool)

(assert (=> b!56997 m!89799))

(declare-fun m!89801 () Bool)

(assert (=> b!56997 m!89801))

(declare-fun m!89803 () Bool)

(assert (=> b!56997 m!89803))

(declare-fun m!89805 () Bool)

(assert (=> b!56997 m!89805))

(declare-fun m!89807 () Bool)

(assert (=> b!56997 m!89807))

(assert (=> b!56997 m!89593))

(declare-fun m!89809 () Bool)

(assert (=> b!56997 m!89809))

(assert (=> b!56997 m!89795))

(declare-fun m!89811 () Bool)

(assert (=> b!56997 m!89811))

(declare-fun m!89813 () Bool)

(assert (=> b!56997 m!89813))

(declare-fun m!89815 () Bool)

(assert (=> b!56997 m!89815))

(declare-fun m!89817 () Bool)

(assert (=> b!56997 m!89817))

(assert (=> b!56997 m!89791))

(declare-fun m!89819 () Bool)

(assert (=> b!56997 m!89819))

(declare-fun m!89821 () Bool)

(assert (=> b!56997 m!89821))

(declare-fun m!89823 () Bool)

(assert (=> b!56997 m!89823))

(declare-fun m!89825 () Bool)

(assert (=> b!56997 m!89825))

(declare-fun m!89827 () Bool)

(assert (=> b!56997 m!89827))

(declare-fun m!89829 () Bool)

(assert (=> b!56997 m!89829))

(declare-fun m!89831 () Bool)

(assert (=> b!56997 m!89831))

(assert (=> b!56997 m!89829))

(declare-fun m!89833 () Bool)

(assert (=> b!56997 m!89833))

(assert (=> b!56997 m!89785))

(declare-fun m!89835 () Bool)

(assert (=> b!56997 m!89835))

(declare-fun m!89837 () Bool)

(assert (=> b!56997 m!89837))

(declare-fun m!89839 () Bool)

(assert (=> b!56997 m!89839))

(declare-fun m!89841 () Bool)

(assert (=> b!56997 m!89841))

(declare-fun m!89843 () Bool)

(assert (=> d!18102 m!89843))

(assert (=> d!18102 m!89593))

(declare-fun m!89845 () Bool)

(assert (=> d!18102 m!89845))

(declare-fun m!89847 () Bool)

(assert (=> d!18102 m!89847))

(declare-fun m!89849 () Bool)

(assert (=> b!56993 m!89849))

(declare-fun m!89851 () Bool)

(assert (=> b!56993 m!89851))

(declare-fun m!89853 () Bool)

(assert (=> b!56993 m!89853))

(declare-fun m!89855 () Bool)

(assert (=> b!56993 m!89855))

(declare-fun m!89857 () Bool)

(assert (=> b!56993 m!89857))

(declare-fun m!89859 () Bool)

(assert (=> b!56992 m!89859))

(assert (=> b!56806 d!18102))

(declare-fun d!18154 () Bool)

(declare-fun e!37874 () Bool)

(assert (=> d!18154 e!37874))

(declare-fun res!47414 () Bool)

(assert (=> d!18154 (=> (not res!47414) (not e!37874))))

(declare-fun lt!89762 () tuple2!5180)

(assert (=> d!18154 (= res!47414 (isPrefixOf!0 (_1!2701 lt!89762) (_2!2701 lt!89762)))))

(declare-fun lt!89771 () BitStream!2064)

(assert (=> d!18154 (= lt!89762 (tuple2!5181 lt!89771 (_2!2700 lt!89335)))))

(declare-fun lt!89754 () Unit!3927)

(declare-fun lt!89766 () Unit!3927)

(assert (=> d!18154 (= lt!89754 lt!89766)))

(assert (=> d!18154 (isPrefixOf!0 lt!89771 (_2!2700 lt!89335))))

(assert (=> d!18154 (= lt!89766 (lemmaIsPrefixTransitive!0 lt!89771 (_2!2700 lt!89335) (_2!2700 lt!89335)))))

(declare-fun lt!89763 () Unit!3927)

(declare-fun lt!89757 () Unit!3927)

(assert (=> d!18154 (= lt!89763 lt!89757)))

(assert (=> d!18154 (isPrefixOf!0 lt!89771 (_2!2700 lt!89335))))

(assert (=> d!18154 (= lt!89757 (lemmaIsPrefixTransitive!0 lt!89771 thiss!1379 (_2!2700 lt!89335)))))

(declare-fun lt!89759 () Unit!3927)

(declare-fun e!37875 () Unit!3927)

(assert (=> d!18154 (= lt!89759 e!37875)))

(declare-fun c!4101 () Bool)

(assert (=> d!18154 (= c!4101 (not (= (size!1188 (buf!1560 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!89769 () Unit!3927)

(declare-fun lt!89764 () Unit!3927)

(assert (=> d!18154 (= lt!89769 lt!89764)))

(assert (=> d!18154 (isPrefixOf!0 (_2!2700 lt!89335) (_2!2700 lt!89335))))

(assert (=> d!18154 (= lt!89764 (lemmaIsPrefixRefl!0 (_2!2700 lt!89335)))))

(declare-fun lt!89773 () Unit!3927)

(declare-fun lt!89767 () Unit!3927)

(assert (=> d!18154 (= lt!89773 lt!89767)))

(assert (=> d!18154 (= lt!89767 (lemmaIsPrefixRefl!0 (_2!2700 lt!89335)))))

(declare-fun lt!89761 () Unit!3927)

(declare-fun lt!89758 () Unit!3927)

(assert (=> d!18154 (= lt!89761 lt!89758)))

(assert (=> d!18154 (isPrefixOf!0 lt!89771 lt!89771)))

(assert (=> d!18154 (= lt!89758 (lemmaIsPrefixRefl!0 lt!89771))))

(declare-fun lt!89770 () Unit!3927)

(declare-fun lt!89765 () Unit!3927)

(assert (=> d!18154 (= lt!89770 lt!89765)))

(assert (=> d!18154 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!18154 (= lt!89765 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!18154 (= lt!89771 (BitStream!2065 (buf!1560 (_2!2700 lt!89335)) (currentByte!3160 thiss!1379) (currentBit!3155 thiss!1379)))))

(assert (=> d!18154 (isPrefixOf!0 thiss!1379 (_2!2700 lt!89335))))

(assert (=> d!18154 (= (reader!0 thiss!1379 (_2!2700 lt!89335)) lt!89762)))

(declare-fun b!57009 () Bool)

(declare-fun res!47415 () Bool)

(assert (=> b!57009 (=> (not res!47415) (not e!37874))))

(assert (=> b!57009 (= res!47415 (isPrefixOf!0 (_2!2701 lt!89762) (_2!2700 lt!89335)))))

(declare-fun b!57010 () Bool)

(declare-fun Unit!3938 () Unit!3927)

(assert (=> b!57010 (= e!37875 Unit!3938)))

(declare-fun b!57011 () Bool)

(declare-fun lt!89756 () Unit!3927)

(assert (=> b!57011 (= e!37875 lt!89756)))

(declare-fun lt!89768 () (_ BitVec 64))

(assert (=> b!57011 (= lt!89768 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89772 () (_ BitVec 64))

(assert (=> b!57011 (= lt!89772 (bitIndex!0 (size!1188 (buf!1560 thiss!1379)) (currentByte!3160 thiss!1379) (currentBit!3155 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2616 array!2616 (_ BitVec 64) (_ BitVec 64)) Unit!3927)

(assert (=> b!57011 (= lt!89756 (arrayBitRangesEqSymmetric!0 (buf!1560 thiss!1379) (buf!1560 (_2!2700 lt!89335)) lt!89768 lt!89772))))

(assert (=> b!57011 (arrayBitRangesEq!0 (buf!1560 (_2!2700 lt!89335)) (buf!1560 thiss!1379) lt!89768 lt!89772)))

(declare-fun b!57012 () Bool)

(declare-fun res!47416 () Bool)

(assert (=> b!57012 (=> (not res!47416) (not e!37874))))

(assert (=> b!57012 (= res!47416 (isPrefixOf!0 (_1!2701 lt!89762) thiss!1379))))

(declare-fun lt!89760 () (_ BitVec 64))

(declare-fun lt!89755 () (_ BitVec 64))

(declare-fun b!57013 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2064 (_ BitVec 64)) BitStream!2064)

(assert (=> b!57013 (= e!37874 (= (_1!2701 lt!89762) (withMovedBitIndex!0 (_2!2701 lt!89762) (bvsub lt!89755 lt!89760))))))

(assert (=> b!57013 (or (= (bvand lt!89755 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!89760 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!89755 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!89755 lt!89760) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57013 (= lt!89760 (bitIndex!0 (size!1188 (buf!1560 (_2!2700 lt!89335))) (currentByte!3160 (_2!2700 lt!89335)) (currentBit!3155 (_2!2700 lt!89335))))))

(assert (=> b!57013 (= lt!89755 (bitIndex!0 (size!1188 (buf!1560 thiss!1379)) (currentByte!3160 thiss!1379) (currentBit!3155 thiss!1379)))))

(assert (= (and d!18154 c!4101) b!57011))

(assert (= (and d!18154 (not c!4101)) b!57010))

(assert (= (and d!18154 res!47414) b!57012))

(assert (= (and b!57012 res!47416) b!57009))

(assert (= (and b!57009 res!47415) b!57013))

(assert (=> d!18154 m!89547))

(assert (=> d!18154 m!89545))

(declare-fun m!89861 () Bool)

(assert (=> d!18154 m!89861))

(declare-fun m!89863 () Bool)

(assert (=> d!18154 m!89863))

(assert (=> d!18154 m!89571))

(declare-fun m!89865 () Bool)

(assert (=> d!18154 m!89865))

(declare-fun m!89867 () Bool)

(assert (=> d!18154 m!89867))

(assert (=> d!18154 m!89845))

(assert (=> d!18154 m!89847))

(declare-fun m!89869 () Bool)

(assert (=> d!18154 m!89869))

(declare-fun m!89871 () Bool)

(assert (=> d!18154 m!89871))

(declare-fun m!89873 () Bool)

(assert (=> b!57009 m!89873))

(assert (=> b!57011 m!89549))

(declare-fun m!89875 () Bool)

(assert (=> b!57011 m!89875))

(declare-fun m!89877 () Bool)

(assert (=> b!57011 m!89877))

(declare-fun m!89879 () Bool)

(assert (=> b!57013 m!89879))

(assert (=> b!57013 m!89593))

(assert (=> b!57013 m!89549))

(declare-fun m!89881 () Bool)

(assert (=> b!57012 m!89881))

(assert (=> b!56806 d!18154))

(declare-fun d!18156 () Bool)

(assert (=> d!18156 (isPrefixOf!0 thiss!1379 (_2!2700 lt!89329))))

(declare-fun lt!89776 () Unit!3927)

(declare-fun choose!30 (BitStream!2064 BitStream!2064 BitStream!2064) Unit!3927)

(assert (=> d!18156 (= lt!89776 (choose!30 thiss!1379 (_2!2700 lt!89335) (_2!2700 lt!89329)))))

(assert (=> d!18156 (isPrefixOf!0 thiss!1379 (_2!2700 lt!89335))))

(assert (=> d!18156 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2700 lt!89335) (_2!2700 lt!89329)) lt!89776)))

(declare-fun bs!4531 () Bool)

(assert (= bs!4531 d!18156))

(assert (=> bs!4531 m!89557))

(declare-fun m!89883 () Bool)

(assert (=> bs!4531 m!89883))

(assert (=> bs!4531 m!89571))

(assert (=> b!56806 d!18156))

(declare-fun d!18158 () Bool)

(assert (=> d!18158 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1188 (buf!1560 (_2!2700 lt!89335)))) ((_ sign_extend 32) (currentByte!3160 thiss!1379)) ((_ sign_extend 32) (currentBit!3155 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1188 (buf!1560 (_2!2700 lt!89335)))) ((_ sign_extend 32) (currentByte!3160 thiss!1379)) ((_ sign_extend 32) (currentBit!3155 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4532 () Bool)

(assert (= bs!4532 d!18158))

(declare-fun m!89885 () Bool)

(assert (=> bs!4532 m!89885))

(assert (=> b!56806 d!18158))

(declare-fun d!18160 () Bool)

(assert (=> d!18160 (validate_offset_bits!1 ((_ sign_extend 32) (size!1188 (buf!1560 (_2!2700 lt!89335)))) ((_ sign_extend 32) (currentByte!3160 thiss!1379)) ((_ sign_extend 32) (currentBit!3155 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!89779 () Unit!3927)

(declare-fun choose!9 (BitStream!2064 array!2616 (_ BitVec 64) BitStream!2064) Unit!3927)

(assert (=> d!18160 (= lt!89779 (choose!9 thiss!1379 (buf!1560 (_2!2700 lt!89335)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2065 (buf!1560 (_2!2700 lt!89335)) (currentByte!3160 thiss!1379) (currentBit!3155 thiss!1379))))))

(assert (=> d!18160 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1560 (_2!2700 lt!89335)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!89779)))

(declare-fun bs!4533 () Bool)

(assert (= bs!4533 d!18160))

(assert (=> bs!4533 m!89567))

(declare-fun m!89887 () Bool)

(assert (=> bs!4533 m!89887))

(assert (=> b!56806 d!18160))

(declare-fun d!18162 () Bool)

(assert (=> d!18162 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1188 (buf!1560 thiss!1379))) ((_ sign_extend 32) (currentByte!3160 thiss!1379)) ((_ sign_extend 32) (currentBit!3155 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1188 (buf!1560 thiss!1379))) ((_ sign_extend 32) (currentByte!3160 thiss!1379)) ((_ sign_extend 32) (currentBit!3155 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4534 () Bool)

(assert (= bs!4534 d!18162))

(declare-fun m!89889 () Bool)

(assert (=> bs!4534 m!89889))

(assert (=> b!56805 d!18162))

(declare-fun d!18164 () Bool)

(declare-fun res!47417 () Bool)

(declare-fun e!37877 () Bool)

(assert (=> d!18164 (=> (not res!47417) (not e!37877))))

(assert (=> d!18164 (= res!47417 (= (size!1188 (buf!1560 thiss!1379)) (size!1188 (buf!1560 thiss!1379))))))

(assert (=> d!18164 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!37877)))

(declare-fun b!57014 () Bool)

(declare-fun res!47418 () Bool)

(assert (=> b!57014 (=> (not res!47418) (not e!37877))))

(assert (=> b!57014 (= res!47418 (bvsle (bitIndex!0 (size!1188 (buf!1560 thiss!1379)) (currentByte!3160 thiss!1379) (currentBit!3155 thiss!1379)) (bitIndex!0 (size!1188 (buf!1560 thiss!1379)) (currentByte!3160 thiss!1379) (currentBit!3155 thiss!1379))))))

(declare-fun b!57015 () Bool)

(declare-fun e!37876 () Bool)

(assert (=> b!57015 (= e!37877 e!37876)))

(declare-fun res!47419 () Bool)

(assert (=> b!57015 (=> res!47419 e!37876)))

(assert (=> b!57015 (= res!47419 (= (size!1188 (buf!1560 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!57016 () Bool)

(assert (=> b!57016 (= e!37876 (arrayBitRangesEq!0 (buf!1560 thiss!1379) (buf!1560 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1188 (buf!1560 thiss!1379)) (currentByte!3160 thiss!1379) (currentBit!3155 thiss!1379))))))

(assert (= (and d!18164 res!47417) b!57014))

(assert (= (and b!57014 res!47418) b!57015))

(assert (= (and b!57015 (not res!47419)) b!57016))

(assert (=> b!57014 m!89549))

(assert (=> b!57014 m!89549))

(assert (=> b!57016 m!89549))

(assert (=> b!57016 m!89549))

(declare-fun m!89891 () Bool)

(assert (=> b!57016 m!89891))

(assert (=> b!56807 d!18164))

(declare-fun d!18166 () Bool)

(assert (=> d!18166 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!89782 () Unit!3927)

(declare-fun choose!11 (BitStream!2064) Unit!3927)

(assert (=> d!18166 (= lt!89782 (choose!11 thiss!1379))))

(assert (=> d!18166 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!89782)))

(declare-fun bs!4536 () Bool)

(assert (= bs!4536 d!18166))

(assert (=> bs!4536 m!89545))

(declare-fun m!89893 () Bool)

(assert (=> bs!4536 m!89893))

(assert (=> b!56807 d!18166))

(declare-fun d!18168 () Bool)

(declare-fun e!37878 () Bool)

(assert (=> d!18168 e!37878))

(declare-fun res!47420 () Bool)

(assert (=> d!18168 (=> (not res!47420) (not e!37878))))

(declare-fun lt!89787 () (_ BitVec 64))

(declare-fun lt!89786 () (_ BitVec 64))

(declare-fun lt!89785 () (_ BitVec 64))

(assert (=> d!18168 (= res!47420 (= lt!89785 (bvsub lt!89786 lt!89787)))))

(assert (=> d!18168 (or (= (bvand lt!89786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!89787 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!89786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!89786 lt!89787) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18168 (= lt!89787 (remainingBits!0 ((_ sign_extend 32) (size!1188 (buf!1560 thiss!1379))) ((_ sign_extend 32) (currentByte!3160 thiss!1379)) ((_ sign_extend 32) (currentBit!3155 thiss!1379))))))

(declare-fun lt!89784 () (_ BitVec 64))

(declare-fun lt!89783 () (_ BitVec 64))

(assert (=> d!18168 (= lt!89786 (bvmul lt!89784 lt!89783))))

(assert (=> d!18168 (or (= lt!89784 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!89783 (bvsdiv (bvmul lt!89784 lt!89783) lt!89784)))))

(assert (=> d!18168 (= lt!89783 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18168 (= lt!89784 ((_ sign_extend 32) (size!1188 (buf!1560 thiss!1379))))))

(assert (=> d!18168 (= lt!89785 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3160 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3155 thiss!1379))))))

(assert (=> d!18168 (invariant!0 (currentBit!3155 thiss!1379) (currentByte!3160 thiss!1379) (size!1188 (buf!1560 thiss!1379)))))

(assert (=> d!18168 (= (bitIndex!0 (size!1188 (buf!1560 thiss!1379)) (currentByte!3160 thiss!1379) (currentBit!3155 thiss!1379)) lt!89785)))

(declare-fun b!57017 () Bool)

(declare-fun res!47421 () Bool)

(assert (=> b!57017 (=> (not res!47421) (not e!37878))))

(assert (=> b!57017 (= res!47421 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!89785))))

(declare-fun b!57018 () Bool)

(declare-fun lt!89788 () (_ BitVec 64))

(assert (=> b!57018 (= e!37878 (bvsle lt!89785 (bvmul lt!89788 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!57018 (or (= lt!89788 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!89788 #b0000000000000000000000000000000000000000000000000000000000001000) lt!89788)))))

(assert (=> b!57018 (= lt!89788 ((_ sign_extend 32) (size!1188 (buf!1560 thiss!1379))))))

(assert (= (and d!18168 res!47420) b!57017))

(assert (= (and b!57017 res!47421) b!57018))

(assert (=> d!18168 m!89889))

(declare-fun m!89895 () Bool)

(assert (=> d!18168 m!89895))

(assert (=> b!56807 d!18168))

(declare-fun d!18170 () Bool)

(assert (=> d!18170 (= (head!426 (byteArrayBitContentToList!0 (_2!2700 lt!89335) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!722 (byteArrayBitContentToList!0 (_2!2700 lt!89335) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!56812 d!18170))

(declare-fun d!18172 () Bool)

(declare-fun c!4104 () Bool)

(assert (=> d!18172 (= c!4104 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!37881 () List!607)

(assert (=> d!18172 (= (byteArrayBitContentToList!0 (_2!2700 lt!89335) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!37881)))

(declare-fun b!57023 () Bool)

(assert (=> b!57023 (= e!37881 Nil!604)))

(declare-fun b!57024 () Bool)

(assert (=> b!57024 (= e!37881 (Cons!603 (not (= (bvand ((_ sign_extend 24) (select (arr!1743 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2700 lt!89335) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!18172 c!4104) b!57023))

(assert (= (and d!18172 (not c!4104)) b!57024))

(assert (=> b!57024 m!89573))

(declare-fun m!89897 () Bool)

(assert (=> b!57024 m!89897))

(declare-fun m!89899 () Bool)

(assert (=> b!57024 m!89899))

(assert (=> b!56812 d!18172))

(declare-fun d!18174 () Bool)

(assert (=> d!18174 (= (head!426 (bitStreamReadBitsIntoList!0 (_2!2700 lt!89335) (_1!2701 lt!89337) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!722 (bitStreamReadBitsIntoList!0 (_2!2700 lt!89335) (_1!2701 lt!89337) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!56812 d!18174))

(declare-fun d!18176 () Bool)

(declare-fun e!37886 () Bool)

(assert (=> d!18176 e!37886))

(declare-fun c!4109 () Bool)

(assert (=> d!18176 (= c!4109 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!89795 () List!607)

(declare-datatypes ((tuple2!5188 0))(
  ( (tuple2!5189 (_1!2705 List!607) (_2!2705 BitStream!2064)) )
))
(declare-fun e!37887 () tuple2!5188)

(assert (=> d!18176 (= lt!89795 (_1!2705 e!37887))))

(declare-fun c!4110 () Bool)

(assert (=> d!18176 (= c!4110 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18176 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18176 (= (bitStreamReadBitsIntoList!0 (_2!2700 lt!89335) (_1!2701 lt!89337) #b0000000000000000000000000000000000000000000000000000000000000001) lt!89795)))

(declare-fun b!57033 () Bool)

(assert (=> b!57033 (= e!37887 (tuple2!5189 Nil!604 (_1!2701 lt!89337)))))

(declare-datatypes ((tuple2!5190 0))(
  ( (tuple2!5191 (_1!2706 Bool) (_2!2706 BitStream!2064)) )
))
(declare-fun lt!89796 () tuple2!5190)

(declare-fun lt!89797 () (_ BitVec 64))

(declare-fun b!57034 () Bool)

(assert (=> b!57034 (= e!37887 (tuple2!5189 (Cons!603 (_1!2706 lt!89796) (bitStreamReadBitsIntoList!0 (_2!2700 lt!89335) (_2!2706 lt!89796) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!89797))) (_2!2706 lt!89796)))))

(declare-fun readBit!0 (BitStream!2064) tuple2!5190)

(assert (=> b!57034 (= lt!89796 (readBit!0 (_1!2701 lt!89337)))))

(assert (=> b!57034 (= lt!89797 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!57036 () Bool)

(declare-fun length!285 (List!607) Int)

(assert (=> b!57036 (= e!37886 (> (length!285 lt!89795) 0))))

(declare-fun b!57035 () Bool)

(declare-fun isEmpty!171 (List!607) Bool)

(assert (=> b!57035 (= e!37886 (isEmpty!171 lt!89795))))

(assert (= (and d!18176 c!4110) b!57033))

(assert (= (and d!18176 (not c!4110)) b!57034))

(assert (= (and d!18176 c!4109) b!57035))

(assert (= (and d!18176 (not c!4109)) b!57036))

(declare-fun m!89901 () Bool)

(assert (=> b!57034 m!89901))

(declare-fun m!89903 () Bool)

(assert (=> b!57034 m!89903))

(declare-fun m!89905 () Bool)

(assert (=> b!57036 m!89905))

(declare-fun m!89907 () Bool)

(assert (=> b!57035 m!89907))

(assert (=> b!56812 d!18176))

(declare-fun d!18178 () Bool)

(assert (=> d!18178 (= (invariant!0 (currentBit!3155 (_2!2700 lt!89329)) (currentByte!3160 (_2!2700 lt!89329)) (size!1188 (buf!1560 (_2!2700 lt!89329)))) (and (bvsge (currentBit!3155 (_2!2700 lt!89329)) #b00000000000000000000000000000000) (bvslt (currentBit!3155 (_2!2700 lt!89329)) #b00000000000000000000000000001000) (bvsge (currentByte!3160 (_2!2700 lt!89329)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3160 (_2!2700 lt!89329)) (size!1188 (buf!1560 (_2!2700 lt!89329)))) (and (= (currentBit!3155 (_2!2700 lt!89329)) #b00000000000000000000000000000000) (= (currentByte!3160 (_2!2700 lt!89329)) (size!1188 (buf!1560 (_2!2700 lt!89329))))))))))

(assert (=> b!56803 d!18178))

(declare-fun d!18180 () Bool)

(assert (=> d!18180 (= (array_inv!1091 srcBuffer!2) (bvsge (size!1188 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!11480 d!18180))

(declare-fun d!18182 () Bool)

(assert (=> d!18182 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3155 thiss!1379) (currentByte!3160 thiss!1379) (size!1188 (buf!1560 thiss!1379))))))

(declare-fun bs!4537 () Bool)

(assert (= bs!4537 d!18182))

(assert (=> bs!4537 m!89895))

(assert (=> start!11480 d!18182))

(declare-fun d!18184 () Bool)

(declare-fun e!37888 () Bool)

(assert (=> d!18184 e!37888))

(declare-fun res!47422 () Bool)

(assert (=> d!18184 (=> (not res!47422) (not e!37888))))

(declare-fun lt!89801 () (_ BitVec 64))

(declare-fun lt!89802 () (_ BitVec 64))

(declare-fun lt!89800 () (_ BitVec 64))

(assert (=> d!18184 (= res!47422 (= lt!89800 (bvsub lt!89801 lt!89802)))))

(assert (=> d!18184 (or (= (bvand lt!89801 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!89802 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!89801 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!89801 lt!89802) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18184 (= lt!89802 (remainingBits!0 ((_ sign_extend 32) (size!1188 (buf!1560 (_2!2700 lt!89329)))) ((_ sign_extend 32) (currentByte!3160 (_2!2700 lt!89329))) ((_ sign_extend 32) (currentBit!3155 (_2!2700 lt!89329)))))))

(declare-fun lt!89799 () (_ BitVec 64))

(declare-fun lt!89798 () (_ BitVec 64))

(assert (=> d!18184 (= lt!89801 (bvmul lt!89799 lt!89798))))

(assert (=> d!18184 (or (= lt!89799 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!89798 (bvsdiv (bvmul lt!89799 lt!89798) lt!89799)))))

(assert (=> d!18184 (= lt!89798 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18184 (= lt!89799 ((_ sign_extend 32) (size!1188 (buf!1560 (_2!2700 lt!89329)))))))

(assert (=> d!18184 (= lt!89800 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3160 (_2!2700 lt!89329))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3155 (_2!2700 lt!89329)))))))

(assert (=> d!18184 (invariant!0 (currentBit!3155 (_2!2700 lt!89329)) (currentByte!3160 (_2!2700 lt!89329)) (size!1188 (buf!1560 (_2!2700 lt!89329))))))

(assert (=> d!18184 (= (bitIndex!0 (size!1188 (buf!1560 (_2!2700 lt!89329))) (currentByte!3160 (_2!2700 lt!89329)) (currentBit!3155 (_2!2700 lt!89329))) lt!89800)))

(declare-fun b!57037 () Bool)

(declare-fun res!47423 () Bool)

(assert (=> b!57037 (=> (not res!47423) (not e!37888))))

(assert (=> b!57037 (= res!47423 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!89800))))

(declare-fun b!57038 () Bool)

(declare-fun lt!89803 () (_ BitVec 64))

(assert (=> b!57038 (= e!37888 (bvsle lt!89800 (bvmul lt!89803 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!57038 (or (= lt!89803 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!89803 #b0000000000000000000000000000000000000000000000000000000000001000) lt!89803)))))

(assert (=> b!57038 (= lt!89803 ((_ sign_extend 32) (size!1188 (buf!1560 (_2!2700 lt!89329)))))))

(assert (= (and d!18184 res!47422) b!57037))

(assert (= (and b!57037 res!47423) b!57038))

(declare-fun m!89909 () Bool)

(assert (=> d!18184 m!89909))

(assert (=> d!18184 m!89581))

(assert (=> b!56808 d!18184))

(declare-fun d!18186 () Bool)

(declare-fun res!47424 () Bool)

(declare-fun e!37890 () Bool)

(assert (=> d!18186 (=> (not res!47424) (not e!37890))))

(assert (=> d!18186 (= res!47424 (= (size!1188 (buf!1560 thiss!1379)) (size!1188 (buf!1560 (_2!2700 lt!89335)))))))

(assert (=> d!18186 (= (isPrefixOf!0 thiss!1379 (_2!2700 lt!89335)) e!37890)))

(declare-fun b!57039 () Bool)

(declare-fun res!47425 () Bool)

(assert (=> b!57039 (=> (not res!47425) (not e!37890))))

(assert (=> b!57039 (= res!47425 (bvsle (bitIndex!0 (size!1188 (buf!1560 thiss!1379)) (currentByte!3160 thiss!1379) (currentBit!3155 thiss!1379)) (bitIndex!0 (size!1188 (buf!1560 (_2!2700 lt!89335))) (currentByte!3160 (_2!2700 lt!89335)) (currentBit!3155 (_2!2700 lt!89335)))))))

(declare-fun b!57040 () Bool)

(declare-fun e!37889 () Bool)

(assert (=> b!57040 (= e!37890 e!37889)))

(declare-fun res!47426 () Bool)

(assert (=> b!57040 (=> res!47426 e!37889)))

(assert (=> b!57040 (= res!47426 (= (size!1188 (buf!1560 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!57041 () Bool)

(assert (=> b!57041 (= e!37889 (arrayBitRangesEq!0 (buf!1560 thiss!1379) (buf!1560 (_2!2700 lt!89335)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1188 (buf!1560 thiss!1379)) (currentByte!3160 thiss!1379) (currentBit!3155 thiss!1379))))))

(assert (= (and d!18186 res!47424) b!57039))

(assert (= (and b!57039 res!47425) b!57040))

(assert (= (and b!57040 (not res!47426)) b!57041))

(assert (=> b!57039 m!89549))

(assert (=> b!57039 m!89593))

(assert (=> b!57041 m!89549))

(assert (=> b!57041 m!89549))

(declare-fun m!89911 () Bool)

(assert (=> b!57041 m!89911))

(assert (=> b!56810 d!18186))

(declare-fun d!18188 () Bool)

(assert (=> d!18188 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1188 (buf!1560 (_2!2700 lt!89335)))) ((_ sign_extend 32) (currentByte!3160 (_2!2700 lt!89335))) ((_ sign_extend 32) (currentBit!3155 (_2!2700 lt!89335))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1188 (buf!1560 (_2!2700 lt!89335)))) ((_ sign_extend 32) (currentByte!3160 (_2!2700 lt!89335))) ((_ sign_extend 32) (currentBit!3155 (_2!2700 lt!89335)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4538 () Bool)

(assert (= bs!4538 d!18188))

(assert (=> bs!4538 m!89647))

(assert (=> b!56810 d!18188))

(declare-fun d!18190 () Bool)

(declare-fun e!37893 () Bool)

(assert (=> d!18190 e!37893))

(declare-fun res!47429 () Bool)

(assert (=> d!18190 (=> (not res!47429) (not e!37893))))

(assert (=> d!18190 (= res!47429 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!89806 () Unit!3927)

(declare-fun choose!27 (BitStream!2064 BitStream!2064 (_ BitVec 64) (_ BitVec 64)) Unit!3927)

(assert (=> d!18190 (= lt!89806 (choose!27 thiss!1379 (_2!2700 lt!89335) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!18190 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!18190 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2700 lt!89335) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!89806)))

(declare-fun b!57044 () Bool)

(assert (=> b!57044 (= e!37893 (validate_offset_bits!1 ((_ sign_extend 32) (size!1188 (buf!1560 (_2!2700 lt!89335)))) ((_ sign_extend 32) (currentByte!3160 (_2!2700 lt!89335))) ((_ sign_extend 32) (currentBit!3155 (_2!2700 lt!89335))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!18190 res!47429) b!57044))

(declare-fun m!89913 () Bool)

(assert (=> d!18190 m!89913))

(assert (=> b!57044 m!89575))

(assert (=> b!56810 d!18190))

(declare-fun b!57062 () Bool)

(declare-fun e!37903 () Bool)

(declare-datatypes ((tuple2!5192 0))(
  ( (tuple2!5193 (_1!2707 BitStream!2064) (_2!2707 Bool)) )
))
(declare-fun lt!89836 () tuple2!5192)

(declare-fun lt!89832 () tuple2!5178)

(assert (=> b!57062 (= e!37903 (= (bitIndex!0 (size!1188 (buf!1560 (_1!2707 lt!89836))) (currentByte!3160 (_1!2707 lt!89836)) (currentBit!3155 (_1!2707 lt!89836))) (bitIndex!0 (size!1188 (buf!1560 (_2!2700 lt!89832))) (currentByte!3160 (_2!2700 lt!89832)) (currentBit!3155 (_2!2700 lt!89832)))))))

(declare-fun d!18192 () Bool)

(declare-fun e!37902 () Bool)

(assert (=> d!18192 e!37902))

(declare-fun res!47448 () Bool)

(assert (=> d!18192 (=> (not res!47448) (not e!37902))))

(declare-fun lt!89837 () tuple2!5178)

(assert (=> d!18192 (= res!47448 (= (size!1188 (buf!1560 (_2!2700 lt!89837))) (size!1188 (buf!1560 thiss!1379))))))

(declare-fun lt!89841 () (_ BitVec 8))

(declare-fun lt!89840 () array!2616)

(assert (=> d!18192 (= lt!89841 (select (arr!1743 lt!89840) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!18192 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1188 lt!89840)))))

(assert (=> d!18192 (= lt!89840 (array!2617 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!89835 () tuple2!5178)

(assert (=> d!18192 (= lt!89837 (tuple2!5179 (_1!2700 lt!89835) (_2!2700 lt!89835)))))

(assert (=> d!18192 (= lt!89835 lt!89832)))

(declare-fun e!37904 () Bool)

(assert (=> d!18192 e!37904))

(declare-fun res!47453 () Bool)

(assert (=> d!18192 (=> (not res!47453) (not e!37904))))

(assert (=> d!18192 (= res!47453 (= (size!1188 (buf!1560 thiss!1379)) (size!1188 (buf!1560 (_2!2700 lt!89832)))))))

(declare-fun lt!89831 () Bool)

(declare-fun appendBit!0 (BitStream!2064 Bool) tuple2!5178)

(assert (=> d!18192 (= lt!89832 (appendBit!0 thiss!1379 lt!89831))))

(assert (=> d!18192 (= lt!89831 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1743 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!18192 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!18192 (= (appendBitFromByte!0 thiss!1379 (select (arr!1743 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!89837)))

(declare-fun b!57063 () Bool)

(assert (=> b!57063 (= e!37904 e!37903)))

(declare-fun res!47451 () Bool)

(assert (=> b!57063 (=> (not res!47451) (not e!37903))))

(assert (=> b!57063 (= res!47451 (and (= (_2!2707 lt!89836) lt!89831) (= (_1!2707 lt!89836) (_2!2700 lt!89832))))))

(declare-fun readBitPure!0 (BitStream!2064) tuple2!5192)

(declare-fun readerFrom!0 (BitStream!2064 (_ BitVec 32) (_ BitVec 32)) BitStream!2064)

(assert (=> b!57063 (= lt!89836 (readBitPure!0 (readerFrom!0 (_2!2700 lt!89832) (currentBit!3155 thiss!1379) (currentByte!3160 thiss!1379))))))

(declare-fun b!57064 () Bool)

(declare-fun res!47449 () Bool)

(assert (=> b!57064 (=> (not res!47449) (not e!37904))))

(assert (=> b!57064 (= res!47449 (isPrefixOf!0 thiss!1379 (_2!2700 lt!89832)))))

(declare-fun b!57065 () Bool)

(declare-fun res!47450 () Bool)

(assert (=> b!57065 (=> (not res!47450) (not e!37902))))

(assert (=> b!57065 (= res!47450 (isPrefixOf!0 thiss!1379 (_2!2700 lt!89837)))))

(declare-fun b!57066 () Bool)

(declare-fun e!37905 () Bool)

(assert (=> b!57066 (= e!37902 e!37905)))

(declare-fun res!47446 () Bool)

(assert (=> b!57066 (=> (not res!47446) (not e!37905))))

(declare-fun lt!89834 () tuple2!5192)

(assert (=> b!57066 (= res!47446 (and (= (_2!2707 lt!89834) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1743 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!89841)) #b00000000000000000000000000000000))) (= (_1!2707 lt!89834) (_2!2700 lt!89837))))))

(declare-fun lt!89839 () tuple2!5186)

(declare-fun lt!89838 () BitStream!2064)

(assert (=> b!57066 (= lt!89839 (readBits!0 lt!89838 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!57066 (= lt!89834 (readBitPure!0 lt!89838))))

(assert (=> b!57066 (= lt!89838 (readerFrom!0 (_2!2700 lt!89837) (currentBit!3155 thiss!1379) (currentByte!3160 thiss!1379)))))

(declare-fun b!57067 () Bool)

(assert (=> b!57067 (= e!37905 (= (bitIndex!0 (size!1188 (buf!1560 (_1!2707 lt!89834))) (currentByte!3160 (_1!2707 lt!89834)) (currentBit!3155 (_1!2707 lt!89834))) (bitIndex!0 (size!1188 (buf!1560 (_2!2700 lt!89837))) (currentByte!3160 (_2!2700 lt!89837)) (currentBit!3155 (_2!2700 lt!89837)))))))

(declare-fun b!57068 () Bool)

(declare-fun res!47447 () Bool)

(assert (=> b!57068 (=> (not res!47447) (not e!37904))))

(assert (=> b!57068 (= res!47447 (= (bitIndex!0 (size!1188 (buf!1560 (_2!2700 lt!89832))) (currentByte!3160 (_2!2700 lt!89832)) (currentBit!3155 (_2!2700 lt!89832))) (bvadd (bitIndex!0 (size!1188 (buf!1560 thiss!1379)) (currentByte!3160 thiss!1379) (currentBit!3155 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!57069 () Bool)

(declare-fun res!47452 () Bool)

(assert (=> b!57069 (=> (not res!47452) (not e!37902))))

(declare-fun lt!89842 () (_ BitVec 64))

(declare-fun lt!89833 () (_ BitVec 64))

(assert (=> b!57069 (= res!47452 (= (bitIndex!0 (size!1188 (buf!1560 (_2!2700 lt!89837))) (currentByte!3160 (_2!2700 lt!89837)) (currentBit!3155 (_2!2700 lt!89837))) (bvadd lt!89833 lt!89842)))))

(assert (=> b!57069 (or (not (= (bvand lt!89833 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!89842 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!89833 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!89833 lt!89842) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57069 (= lt!89842 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!57069 (= lt!89833 (bitIndex!0 (size!1188 (buf!1560 thiss!1379)) (currentByte!3160 thiss!1379) (currentBit!3155 thiss!1379)))))

(assert (= (and d!18192 res!47453) b!57068))

(assert (= (and b!57068 res!47447) b!57064))

(assert (= (and b!57064 res!47449) b!57063))

(assert (= (and b!57063 res!47451) b!57062))

(assert (= (and d!18192 res!47448) b!57069))

(assert (= (and b!57069 res!47452) b!57065))

(assert (= (and b!57065 res!47450) b!57066))

(assert (= (and b!57066 res!47446) b!57067))

(declare-fun m!89915 () Bool)

(assert (=> b!57067 m!89915))

(declare-fun m!89917 () Bool)

(assert (=> b!57067 m!89917))

(declare-fun m!89919 () Bool)

(assert (=> b!57064 m!89919))

(declare-fun m!89921 () Bool)

(assert (=> b!57063 m!89921))

(assert (=> b!57063 m!89921))

(declare-fun m!89923 () Bool)

(assert (=> b!57063 m!89923))

(declare-fun m!89925 () Bool)

(assert (=> b!57065 m!89925))

(declare-fun m!89927 () Bool)

(assert (=> b!57068 m!89927))

(assert (=> b!57068 m!89549))

(assert (=> b!57069 m!89917))

(assert (=> b!57069 m!89549))

(declare-fun m!89929 () Bool)

(assert (=> b!57066 m!89929))

(declare-fun m!89931 () Bool)

(assert (=> b!57066 m!89931))

(declare-fun m!89933 () Bool)

(assert (=> b!57066 m!89933))

(declare-fun m!89935 () Bool)

(assert (=> d!18192 m!89935))

(declare-fun m!89937 () Bool)

(assert (=> d!18192 m!89937))

(assert (=> d!18192 m!89897))

(declare-fun m!89939 () Bool)

(assert (=> b!57062 m!89939))

(assert (=> b!57062 m!89927))

(assert (=> b!56810 d!18192))

(declare-fun d!18194 () Bool)

(assert (=> d!18194 (= (array_inv!1091 (buf!1560 thiss!1379)) (bvsge (size!1188 (buf!1560 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!56809 d!18194))

(check-sat (not b!57066) (not d!18188) (not b!57044) (not b!56994) (not b!57068) (not b!57062) (not b!56993) (not b!57013) (not b!57016) (not b!57069) (not b!56992) (not b!56995) (not b!56860) (not b!57009) (not d!18192) (not b!56996) (not d!18168) (not b!57034) (not d!18156) (not d!18190) (not b!57024) (not bm!736) (not b!56855) (not b!57039) (not b!57064) (not d!18158) (not b!57014) (not b!56997) (not b!56858) (not b!57065) (not b!57035) (not b!57011) (not b!57036) (not d!18102) (not b!57067) (not b!56857) (not b!57063) (not d!18160) (not d!18166) (not d!18184) (not d!18182) (not d!18162) (not d!18096) (not d!18154) (not b!57012) (not b!57041))
