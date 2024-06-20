; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20472 () Bool)

(assert start!20472)

(declare-fun b!103081 () Bool)

(declare-fun res!84797 () Bool)

(declare-fun e!67461 () Bool)

(assert (=> b!103081 (=> (not res!84797) (not e!67461))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!103081 (= res!84797 (bvslt i!615 nBits!396))))

(declare-fun b!103082 () Bool)

(declare-fun e!67454 () Bool)

(declare-datatypes ((array!4823 0))(
  ( (array!4824 (arr!2794 (Array (_ BitVec 32) (_ BitVec 8))) (size!2201 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3876 0))(
  ( (BitStream!3877 (buf!2564 array!4823) (currentByte!5043 (_ BitVec 32)) (currentBit!5038 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3876)

(declare-datatypes ((Unit!6322 0))(
  ( (Unit!6323) )
))
(declare-datatypes ((tuple2!8442 0))(
  ( (tuple2!8443 (_1!4476 Unit!6322) (_2!4476 BitStream!3876)) )
))
(declare-fun lt!150388 () tuple2!8442)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!103082 (= e!67454 (invariant!0 (currentBit!5038 thiss!1305) (currentByte!5043 thiss!1305) (size!2201 (buf!2564 (_2!4476 lt!150388)))))))

(declare-datatypes ((tuple2!8444 0))(
  ( (tuple2!8445 (_1!4477 BitStream!3876) (_2!4477 Bool)) )
))
(declare-fun lt!150370 () tuple2!8444)

(declare-fun b!103083 () Bool)

(declare-fun lt!150377 () (_ BitVec 64))

(declare-fun lt!150389 () (_ BitVec 64))

(declare-fun e!67459 () Bool)

(declare-fun lt!150384 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103083 (= e!67459 (= (bvand (bvor lt!150377 (ite (_2!4477 lt!150370) lt!150389 #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 lt!150384)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!103085 () Bool)

(declare-fun res!84793 () Bool)

(assert (=> b!103085 (=> (not res!84793) (not e!67461))))

(declare-fun v!199 () (_ BitVec 64))

(assert (=> b!103085 (= res!84793 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!103086 () Bool)

(declare-fun e!67451 () Bool)

(declare-fun lt!150391 () tuple2!8444)

(declare-fun lt!150381 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103086 (= e!67451 (= (bitIndex!0 (size!2201 (buf!2564 (_1!4477 lt!150391))) (currentByte!5043 (_1!4477 lt!150391)) (currentBit!5038 (_1!4477 lt!150391))) lt!150381))))

(declare-fun b!103087 () Bool)

(declare-fun e!67452 () Bool)

(assert (=> b!103087 (= e!67452 e!67459)))

(declare-fun res!84795 () Bool)

(assert (=> b!103087 (=> res!84795 e!67459)))

(declare-datatypes ((tuple2!8446 0))(
  ( (tuple2!8447 (_1!4478 BitStream!3876) (_2!4478 BitStream!3876)) )
))
(declare-fun lt!150390 () tuple2!8446)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!103087 (= res!84795 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2201 (buf!2564 (_1!4478 lt!150390)))) ((_ sign_extend 32) (currentByte!5043 (_1!4478 lt!150390))) ((_ sign_extend 32) (currentBit!5038 (_1!4478 lt!150390))) ((_ sign_extend 32) lt!150384))))))

(assert (=> b!103087 (= lt!150384 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun b!103088 () Bool)

(declare-fun res!84789 () Bool)

(assert (=> b!103088 (=> (not res!84789) (not e!67454))))

(declare-fun lt!150387 () tuple2!8442)

(assert (=> b!103088 (= res!84789 (invariant!0 (currentBit!5038 thiss!1305) (currentByte!5043 thiss!1305) (size!2201 (buf!2564 (_2!4476 lt!150387)))))))

(declare-fun b!103089 () Bool)

(declare-fun e!67458 () Bool)

(declare-fun lt!150372 () tuple2!8444)

(declare-fun lt!150378 () tuple2!8444)

(assert (=> b!103089 (= e!67458 (= (_2!4477 lt!150372) (_2!4477 lt!150378)))))

(declare-fun b!103090 () Bool)

(declare-fun e!67456 () Bool)

(declare-fun e!67453 () Bool)

(assert (=> b!103090 (= e!67456 e!67453)))

(declare-fun res!84798 () Bool)

(assert (=> b!103090 (=> (not res!84798) (not e!67453))))

(declare-fun lt!150382 () (_ BitVec 64))

(assert (=> b!103090 (= res!84798 (= lt!150381 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!150382)))))

(assert (=> b!103090 (= lt!150381 (bitIndex!0 (size!2201 (buf!2564 (_2!4476 lt!150387))) (currentByte!5043 (_2!4476 lt!150387)) (currentBit!5038 (_2!4476 lt!150387))))))

(assert (=> b!103090 (= lt!150382 (bitIndex!0 (size!2201 (buf!2564 thiss!1305)) (currentByte!5043 thiss!1305) (currentBit!5038 thiss!1305)))))

(declare-fun b!103091 () Bool)

(assert (=> b!103091 (= e!67453 e!67451)))

(declare-fun res!84794 () Bool)

(assert (=> b!103091 (=> (not res!84794) (not e!67451))))

(declare-fun lt!150380 () Bool)

(assert (=> b!103091 (= res!84794 (and (= (_2!4477 lt!150391) lt!150380) (= (_1!4477 lt!150391) (_2!4476 lt!150387))))))

(declare-fun readBitPure!0 (BitStream!3876) tuple2!8444)

(declare-fun readerFrom!0 (BitStream!3876 (_ BitVec 32) (_ BitVec 32)) BitStream!3876)

(assert (=> b!103091 (= lt!150391 (readBitPure!0 (readerFrom!0 (_2!4476 lt!150387) (currentBit!5038 thiss!1305) (currentByte!5043 thiss!1305))))))

(declare-fun b!103092 () Bool)

(declare-fun e!67457 () Bool)

(declare-fun array_inv!2003 (array!4823) Bool)

(assert (=> b!103092 (= e!67457 (array_inv!2003 (buf!2564 thiss!1305)))))

(declare-fun res!84790 () Bool)

(declare-fun e!67460 () Bool)

(assert (=> start!20472 (=> (not res!84790) (not e!67460))))

(assert (=> start!20472 (= res!84790 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20472 e!67460))

(assert (=> start!20472 true))

(declare-fun inv!12 (BitStream!3876) Bool)

(assert (=> start!20472 (and (inv!12 thiss!1305) e!67457)))

(declare-fun b!103084 () Bool)

(declare-fun res!84788 () Bool)

(assert (=> b!103084 (=> (not res!84788) (not e!67453))))

(declare-fun isPrefixOf!0 (BitStream!3876 BitStream!3876) Bool)

(assert (=> b!103084 (= res!84788 (isPrefixOf!0 thiss!1305 (_2!4476 lt!150387)))))

(declare-fun b!103093 () Bool)

(assert (=> b!103093 (= e!67461 (not e!67452))))

(declare-fun res!84800 () Bool)

(assert (=> b!103093 (=> res!84800 e!67452)))

(assert (=> b!103093 (= res!84800 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun lt!150374 () (_ BitVec 64))

(assert (=> b!103093 (validate_offset_bits!1 ((_ sign_extend 32) (size!2201 (buf!2564 (_2!4476 lt!150388)))) ((_ sign_extend 32) (currentByte!5043 (_2!4476 lt!150387))) ((_ sign_extend 32) (currentBit!5038 (_2!4476 lt!150387))) lt!150374)))

(declare-fun lt!150375 () Unit!6322)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3876 array!4823 (_ BitVec 64)) Unit!6322)

(assert (=> b!103093 (= lt!150375 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4476 lt!150387) (buf!2564 (_2!4476 lt!150388)) lt!150374))))

(assert (=> b!103093 (= lt!150374 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!150373 () tuple2!8446)

(declare-datatypes ((tuple2!8448 0))(
  ( (tuple2!8449 (_1!4479 BitStream!3876) (_2!4479 (_ BitVec 64))) )
))
(declare-fun lt!150385 () tuple2!8448)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3876 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8448)

(assert (=> b!103093 (= lt!150385 (readNLeastSignificantBitsLoopPure!0 (_1!4478 lt!150373) nBits!396 i!615 lt!150377))))

(declare-fun lt!150386 () (_ BitVec 64))

(assert (=> b!103093 (validate_offset_bits!1 ((_ sign_extend 32) (size!2201 (buf!2564 (_2!4476 lt!150388)))) ((_ sign_extend 32) (currentByte!5043 thiss!1305)) ((_ sign_extend 32) (currentBit!5038 thiss!1305)) lt!150386)))

(declare-fun lt!150379 () Unit!6322)

(assert (=> b!103093 (= lt!150379 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2564 (_2!4476 lt!150388)) lt!150386))))

(assert (=> b!103093 (= lt!150377 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!103093 (= (_2!4477 lt!150370) lt!150380)))

(assert (=> b!103093 (= lt!150370 (readBitPure!0 (_1!4478 lt!150373)))))

(declare-fun reader!0 (BitStream!3876 BitStream!3876) tuple2!8446)

(assert (=> b!103093 (= lt!150390 (reader!0 (_2!4476 lt!150387) (_2!4476 lt!150388)))))

(assert (=> b!103093 (= lt!150373 (reader!0 thiss!1305 (_2!4476 lt!150388)))))

(assert (=> b!103093 e!67458))

(declare-fun res!84791 () Bool)

(assert (=> b!103093 (=> (not res!84791) (not e!67458))))

(assert (=> b!103093 (= res!84791 (= (bitIndex!0 (size!2201 (buf!2564 (_1!4477 lt!150372))) (currentByte!5043 (_1!4477 lt!150372)) (currentBit!5038 (_1!4477 lt!150372))) (bitIndex!0 (size!2201 (buf!2564 (_1!4477 lt!150378))) (currentByte!5043 (_1!4477 lt!150378)) (currentBit!5038 (_1!4477 lt!150378)))))))

(declare-fun lt!150383 () Unit!6322)

(declare-fun lt!150376 () BitStream!3876)

(declare-fun readBitPrefixLemma!0 (BitStream!3876 BitStream!3876) Unit!6322)

(assert (=> b!103093 (= lt!150383 (readBitPrefixLemma!0 lt!150376 (_2!4476 lt!150388)))))

(assert (=> b!103093 (= lt!150378 (readBitPure!0 (BitStream!3877 (buf!2564 (_2!4476 lt!150388)) (currentByte!5043 thiss!1305) (currentBit!5038 thiss!1305))))))

(assert (=> b!103093 (= lt!150372 (readBitPure!0 lt!150376))))

(assert (=> b!103093 (= lt!150376 (BitStream!3877 (buf!2564 (_2!4476 lt!150387)) (currentByte!5043 thiss!1305) (currentBit!5038 thiss!1305)))))

(assert (=> b!103093 e!67454))

(declare-fun res!84796 () Bool)

(assert (=> b!103093 (=> (not res!84796) (not e!67454))))

(assert (=> b!103093 (= res!84796 (isPrefixOf!0 thiss!1305 (_2!4476 lt!150388)))))

(declare-fun lt!150371 () Unit!6322)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3876 BitStream!3876 BitStream!3876) Unit!6322)

(assert (=> b!103093 (= lt!150371 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4476 lt!150387) (_2!4476 lt!150388)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3876 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8442)

(assert (=> b!103093 (= lt!150388 (appendNLeastSignificantBitsLoop!0 (_2!4476 lt!150387) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!103093 e!67456))

(declare-fun res!84799 () Bool)

(assert (=> b!103093 (=> (not res!84799) (not e!67456))))

(assert (=> b!103093 (= res!84799 (= (size!2201 (buf!2564 thiss!1305)) (size!2201 (buf!2564 (_2!4476 lt!150387)))))))

(declare-fun appendBit!0 (BitStream!3876 Bool) tuple2!8442)

(assert (=> b!103093 (= lt!150387 (appendBit!0 thiss!1305 lt!150380))))

(assert (=> b!103093 (= lt!150380 (not (= (bvand v!199 lt!150389) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103093 (= lt!150389 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!103094 () Bool)

(assert (=> b!103094 (= e!67460 e!67461)))

(declare-fun res!84792 () Bool)

(assert (=> b!103094 (=> (not res!84792) (not e!67461))))

(assert (=> b!103094 (= res!84792 (validate_offset_bits!1 ((_ sign_extend 32) (size!2201 (buf!2564 thiss!1305))) ((_ sign_extend 32) (currentByte!5043 thiss!1305)) ((_ sign_extend 32) (currentBit!5038 thiss!1305)) lt!150386))))

(assert (=> b!103094 (= lt!150386 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (= (and start!20472 res!84790) b!103094))

(assert (= (and b!103094 res!84792) b!103085))

(assert (= (and b!103085 res!84793) b!103081))

(assert (= (and b!103081 res!84797) b!103093))

(assert (= (and b!103093 res!84799) b!103090))

(assert (= (and b!103090 res!84798) b!103084))

(assert (= (and b!103084 res!84788) b!103091))

(assert (= (and b!103091 res!84794) b!103086))

(assert (= (and b!103093 res!84796) b!103088))

(assert (= (and b!103088 res!84789) b!103082))

(assert (= (and b!103093 res!84791) b!103089))

(assert (= (and b!103093 (not res!84800)) b!103087))

(assert (= (and b!103087 (not res!84795)) b!103083))

(assert (= start!20472 b!103092))

(declare-fun m!150341 () Bool)

(assert (=> start!20472 m!150341))

(declare-fun m!150343 () Bool)

(assert (=> b!103090 m!150343))

(declare-fun m!150345 () Bool)

(assert (=> b!103090 m!150345))

(declare-fun m!150347 () Bool)

(assert (=> b!103082 m!150347))

(declare-fun m!150349 () Bool)

(assert (=> b!103083 m!150349))

(declare-fun m!150351 () Bool)

(assert (=> b!103091 m!150351))

(assert (=> b!103091 m!150351))

(declare-fun m!150353 () Bool)

(assert (=> b!103091 m!150353))

(declare-fun m!150355 () Bool)

(assert (=> b!103087 m!150355))

(declare-fun m!150357 () Bool)

(assert (=> b!103084 m!150357))

(declare-fun m!150359 () Bool)

(assert (=> b!103092 m!150359))

(declare-fun m!150361 () Bool)

(assert (=> b!103085 m!150361))

(declare-fun m!150363 () Bool)

(assert (=> b!103094 m!150363))

(declare-fun m!150365 () Bool)

(assert (=> b!103088 m!150365))

(declare-fun m!150367 () Bool)

(assert (=> b!103086 m!150367))

(declare-fun m!150369 () Bool)

(assert (=> b!103093 m!150369))

(declare-fun m!150371 () Bool)

(assert (=> b!103093 m!150371))

(declare-fun m!150373 () Bool)

(assert (=> b!103093 m!150373))

(declare-fun m!150375 () Bool)

(assert (=> b!103093 m!150375))

(declare-fun m!150377 () Bool)

(assert (=> b!103093 m!150377))

(declare-fun m!150379 () Bool)

(assert (=> b!103093 m!150379))

(declare-fun m!150381 () Bool)

(assert (=> b!103093 m!150381))

(declare-fun m!150383 () Bool)

(assert (=> b!103093 m!150383))

(declare-fun m!150385 () Bool)

(assert (=> b!103093 m!150385))

(declare-fun m!150387 () Bool)

(assert (=> b!103093 m!150387))

(declare-fun m!150389 () Bool)

(assert (=> b!103093 m!150389))

(declare-fun m!150391 () Bool)

(assert (=> b!103093 m!150391))

(declare-fun m!150393 () Bool)

(assert (=> b!103093 m!150393))

(declare-fun m!150395 () Bool)

(assert (=> b!103093 m!150395))

(declare-fun m!150397 () Bool)

(assert (=> b!103093 m!150397))

(declare-fun m!150399 () Bool)

(assert (=> b!103093 m!150399))

(declare-fun m!150401 () Bool)

(assert (=> b!103093 m!150401))

(declare-fun m!150403 () Bool)

(assert (=> b!103093 m!150403))

(check-sat (not b!103083) (not b!103091) (not b!103087) (not b!103092) (not b!103084) (not b!103090) (not b!103093) (not b!103094) (not start!20472) (not b!103082) (not b!103088) (not b!103086) (not b!103085))
(check-sat)
(get-model)

(declare-fun d!32040 () Bool)

(declare-fun e!67497 () Bool)

(assert (=> d!32040 e!67497))

(declare-fun res!84844 () Bool)

(assert (=> d!32040 (=> (not res!84844) (not e!67497))))

(declare-fun lt!150475 () (_ BitVec 64))

(declare-fun lt!150470 () (_ BitVec 64))

(declare-fun lt!150472 () (_ BitVec 64))

(assert (=> d!32040 (= res!84844 (= lt!150475 (bvsub lt!150472 lt!150470)))))

(assert (=> d!32040 (or (= (bvand lt!150472 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!150470 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!150472 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!150472 lt!150470) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!32040 (= lt!150470 (remainingBits!0 ((_ sign_extend 32) (size!2201 (buf!2564 (_1!4477 lt!150391)))) ((_ sign_extend 32) (currentByte!5043 (_1!4477 lt!150391))) ((_ sign_extend 32) (currentBit!5038 (_1!4477 lt!150391)))))))

(declare-fun lt!150471 () (_ BitVec 64))

(declare-fun lt!150474 () (_ BitVec 64))

(assert (=> d!32040 (= lt!150472 (bvmul lt!150471 lt!150474))))

(assert (=> d!32040 (or (= lt!150471 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!150474 (bvsdiv (bvmul lt!150471 lt!150474) lt!150471)))))

(assert (=> d!32040 (= lt!150474 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32040 (= lt!150471 ((_ sign_extend 32) (size!2201 (buf!2564 (_1!4477 lt!150391)))))))

(assert (=> d!32040 (= lt!150475 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5043 (_1!4477 lt!150391))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5038 (_1!4477 lt!150391)))))))

(assert (=> d!32040 (invariant!0 (currentBit!5038 (_1!4477 lt!150391)) (currentByte!5043 (_1!4477 lt!150391)) (size!2201 (buf!2564 (_1!4477 lt!150391))))))

(assert (=> d!32040 (= (bitIndex!0 (size!2201 (buf!2564 (_1!4477 lt!150391))) (currentByte!5043 (_1!4477 lt!150391)) (currentBit!5038 (_1!4477 lt!150391))) lt!150475)))

(declare-fun b!103141 () Bool)

(declare-fun res!84845 () Bool)

(assert (=> b!103141 (=> (not res!84845) (not e!67497))))

(assert (=> b!103141 (= res!84845 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!150475))))

(declare-fun b!103142 () Bool)

(declare-fun lt!150473 () (_ BitVec 64))

(assert (=> b!103142 (= e!67497 (bvsle lt!150475 (bvmul lt!150473 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!103142 (or (= lt!150473 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!150473 #b0000000000000000000000000000000000000000000000000000000000001000) lt!150473)))))

(assert (=> b!103142 (= lt!150473 ((_ sign_extend 32) (size!2201 (buf!2564 (_1!4477 lt!150391)))))))

(assert (= (and d!32040 res!84844) b!103141))

(assert (= (and b!103141 res!84845) b!103142))

(declare-fun m!150469 () Bool)

(assert (=> d!32040 m!150469))

(declare-fun m!150471 () Bool)

(assert (=> d!32040 m!150471))

(assert (=> b!103086 d!32040))

(declare-fun d!32042 () Bool)

(assert (=> d!32042 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2201 (buf!2564 (_1!4478 lt!150390)))) ((_ sign_extend 32) (currentByte!5043 (_1!4478 lt!150390))) ((_ sign_extend 32) (currentBit!5038 (_1!4478 lt!150390))) ((_ sign_extend 32) lt!150384)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2201 (buf!2564 (_1!4478 lt!150390)))) ((_ sign_extend 32) (currentByte!5043 (_1!4478 lt!150390))) ((_ sign_extend 32) (currentBit!5038 (_1!4478 lt!150390)))) ((_ sign_extend 32) lt!150384)))))

(declare-fun bs!7858 () Bool)

(assert (= bs!7858 d!32042))

(declare-fun m!150473 () Bool)

(assert (=> bs!7858 m!150473))

(assert (=> b!103087 d!32042))

(declare-fun d!32044 () Bool)

(assert (=> d!32044 (= (invariant!0 (currentBit!5038 thiss!1305) (currentByte!5043 thiss!1305) (size!2201 (buf!2564 (_2!4476 lt!150387)))) (and (bvsge (currentBit!5038 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5038 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5043 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5043 thiss!1305) (size!2201 (buf!2564 (_2!4476 lt!150387)))) (and (= (currentBit!5038 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5043 thiss!1305) (size!2201 (buf!2564 (_2!4476 lt!150387))))))))))

(assert (=> b!103088 d!32044))

(declare-fun d!32046 () Bool)

(assert (=> d!32046 (= (onesLSBLong!0 lt!150384) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 lt!150384))))))

(assert (=> b!103083 d!32046))

(declare-fun d!32048 () Bool)

(assert (=> d!32048 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2201 (buf!2564 thiss!1305))) ((_ sign_extend 32) (currentByte!5043 thiss!1305)) ((_ sign_extend 32) (currentBit!5038 thiss!1305)) lt!150386) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2201 (buf!2564 thiss!1305))) ((_ sign_extend 32) (currentByte!5043 thiss!1305)) ((_ sign_extend 32) (currentBit!5038 thiss!1305))) lt!150386))))

(declare-fun bs!7859 () Bool)

(assert (= bs!7859 d!32048))

(declare-fun m!150475 () Bool)

(assert (=> bs!7859 m!150475))

(assert (=> b!103094 d!32048))

(declare-fun d!32050 () Bool)

(assert (=> d!32050 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5038 thiss!1305) (currentByte!5043 thiss!1305) (size!2201 (buf!2564 thiss!1305))))))

(declare-fun bs!7860 () Bool)

(assert (= bs!7860 d!32050))

(declare-fun m!150477 () Bool)

(assert (=> bs!7860 m!150477))

(assert (=> start!20472 d!32050))

(declare-fun d!32052 () Bool)

(declare-fun res!84852 () Bool)

(declare-fun e!67502 () Bool)

(assert (=> d!32052 (=> (not res!84852) (not e!67502))))

(assert (=> d!32052 (= res!84852 (= (size!2201 (buf!2564 thiss!1305)) (size!2201 (buf!2564 (_2!4476 lt!150387)))))))

(assert (=> d!32052 (= (isPrefixOf!0 thiss!1305 (_2!4476 lt!150387)) e!67502)))

(declare-fun b!103149 () Bool)

(declare-fun res!84853 () Bool)

(assert (=> b!103149 (=> (not res!84853) (not e!67502))))

(assert (=> b!103149 (= res!84853 (bvsle (bitIndex!0 (size!2201 (buf!2564 thiss!1305)) (currentByte!5043 thiss!1305) (currentBit!5038 thiss!1305)) (bitIndex!0 (size!2201 (buf!2564 (_2!4476 lt!150387))) (currentByte!5043 (_2!4476 lt!150387)) (currentBit!5038 (_2!4476 lt!150387)))))))

(declare-fun b!103150 () Bool)

(declare-fun e!67503 () Bool)

(assert (=> b!103150 (= e!67502 e!67503)))

(declare-fun res!84854 () Bool)

(assert (=> b!103150 (=> res!84854 e!67503)))

(assert (=> b!103150 (= res!84854 (= (size!2201 (buf!2564 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!103151 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4823 array!4823 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!103151 (= e!67503 (arrayBitRangesEq!0 (buf!2564 thiss!1305) (buf!2564 (_2!4476 lt!150387)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2201 (buf!2564 thiss!1305)) (currentByte!5043 thiss!1305) (currentBit!5038 thiss!1305))))))

(assert (= (and d!32052 res!84852) b!103149))

(assert (= (and b!103149 res!84853) b!103150))

(assert (= (and b!103150 (not res!84854)) b!103151))

(assert (=> b!103149 m!150345))

(assert (=> b!103149 m!150343))

(assert (=> b!103151 m!150345))

(assert (=> b!103151 m!150345))

(declare-fun m!150479 () Bool)

(assert (=> b!103151 m!150479))

(assert (=> b!103084 d!32052))

(declare-fun d!32054 () Bool)

(assert (=> d!32054 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!103085 d!32054))

(declare-fun d!32056 () Bool)

(declare-datatypes ((tuple2!8458 0))(
  ( (tuple2!8459 (_1!4484 Bool) (_2!4484 BitStream!3876)) )
))
(declare-fun lt!150478 () tuple2!8458)

(declare-fun readBit!0 (BitStream!3876) tuple2!8458)

(assert (=> d!32056 (= lt!150478 (readBit!0 (readerFrom!0 (_2!4476 lt!150387) (currentBit!5038 thiss!1305) (currentByte!5043 thiss!1305))))))

(assert (=> d!32056 (= (readBitPure!0 (readerFrom!0 (_2!4476 lt!150387) (currentBit!5038 thiss!1305) (currentByte!5043 thiss!1305))) (tuple2!8445 (_2!4484 lt!150478) (_1!4484 lt!150478)))))

(declare-fun bs!7861 () Bool)

(assert (= bs!7861 d!32056))

(assert (=> bs!7861 m!150351))

(declare-fun m!150481 () Bool)

(assert (=> bs!7861 m!150481))

(assert (=> b!103091 d!32056))

(declare-fun d!32058 () Bool)

(declare-fun e!67506 () Bool)

(assert (=> d!32058 e!67506))

(declare-fun res!84858 () Bool)

(assert (=> d!32058 (=> (not res!84858) (not e!67506))))

(assert (=> d!32058 (= res!84858 (invariant!0 (currentBit!5038 (_2!4476 lt!150387)) (currentByte!5043 (_2!4476 lt!150387)) (size!2201 (buf!2564 (_2!4476 lt!150387)))))))

(assert (=> d!32058 (= (readerFrom!0 (_2!4476 lt!150387) (currentBit!5038 thiss!1305) (currentByte!5043 thiss!1305)) (BitStream!3877 (buf!2564 (_2!4476 lt!150387)) (currentByte!5043 thiss!1305) (currentBit!5038 thiss!1305)))))

(declare-fun b!103154 () Bool)

(assert (=> b!103154 (= e!67506 (invariant!0 (currentBit!5038 thiss!1305) (currentByte!5043 thiss!1305) (size!2201 (buf!2564 (_2!4476 lt!150387)))))))

(assert (= (and d!32058 res!84858) b!103154))

(declare-fun m!150483 () Bool)

(assert (=> d!32058 m!150483))

(assert (=> b!103154 m!150365))

(assert (=> b!103091 d!32058))

(declare-fun d!32060 () Bool)

(assert (=> d!32060 (= (array_inv!2003 (buf!2564 thiss!1305)) (bvsge (size!2201 (buf!2564 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!103092 d!32060))

(declare-fun d!32062 () Bool)

(assert (=> d!32062 (= (invariant!0 (currentBit!5038 thiss!1305) (currentByte!5043 thiss!1305) (size!2201 (buf!2564 (_2!4476 lt!150388)))) (and (bvsge (currentBit!5038 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5038 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5043 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5043 thiss!1305) (size!2201 (buf!2564 (_2!4476 lt!150388)))) (and (= (currentBit!5038 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5043 thiss!1305) (size!2201 (buf!2564 (_2!4476 lt!150388))))))))))

(assert (=> b!103082 d!32062))

(declare-fun d!32064 () Bool)

(assert (=> d!32064 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!103093 d!32064))

(declare-fun d!32066 () Bool)

(assert (=> d!32066 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2201 (buf!2564 (_2!4476 lt!150388)))) ((_ sign_extend 32) (currentByte!5043 (_2!4476 lt!150387))) ((_ sign_extend 32) (currentBit!5038 (_2!4476 lt!150387))) lt!150374) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2201 (buf!2564 (_2!4476 lt!150388)))) ((_ sign_extend 32) (currentByte!5043 (_2!4476 lt!150387))) ((_ sign_extend 32) (currentBit!5038 (_2!4476 lt!150387)))) lt!150374))))

(declare-fun bs!7862 () Bool)

(assert (= bs!7862 d!32066))

(declare-fun m!150485 () Bool)

(assert (=> bs!7862 m!150485))

(assert (=> b!103093 d!32066))

(declare-fun d!32068 () Bool)

(declare-fun e!67507 () Bool)

(assert (=> d!32068 e!67507))

(declare-fun res!84859 () Bool)

(assert (=> d!32068 (=> (not res!84859) (not e!67507))))

(declare-fun lt!150484 () (_ BitVec 64))

(declare-fun lt!150481 () (_ BitVec 64))

(declare-fun lt!150479 () (_ BitVec 64))

(assert (=> d!32068 (= res!84859 (= lt!150484 (bvsub lt!150481 lt!150479)))))

(assert (=> d!32068 (or (= (bvand lt!150481 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!150479 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!150481 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!150481 lt!150479) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32068 (= lt!150479 (remainingBits!0 ((_ sign_extend 32) (size!2201 (buf!2564 (_1!4477 lt!150372)))) ((_ sign_extend 32) (currentByte!5043 (_1!4477 lt!150372))) ((_ sign_extend 32) (currentBit!5038 (_1!4477 lt!150372)))))))

(declare-fun lt!150480 () (_ BitVec 64))

(declare-fun lt!150483 () (_ BitVec 64))

(assert (=> d!32068 (= lt!150481 (bvmul lt!150480 lt!150483))))

(assert (=> d!32068 (or (= lt!150480 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!150483 (bvsdiv (bvmul lt!150480 lt!150483) lt!150480)))))

(assert (=> d!32068 (= lt!150483 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32068 (= lt!150480 ((_ sign_extend 32) (size!2201 (buf!2564 (_1!4477 lt!150372)))))))

(assert (=> d!32068 (= lt!150484 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5043 (_1!4477 lt!150372))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5038 (_1!4477 lt!150372)))))))

(assert (=> d!32068 (invariant!0 (currentBit!5038 (_1!4477 lt!150372)) (currentByte!5043 (_1!4477 lt!150372)) (size!2201 (buf!2564 (_1!4477 lt!150372))))))

(assert (=> d!32068 (= (bitIndex!0 (size!2201 (buf!2564 (_1!4477 lt!150372))) (currentByte!5043 (_1!4477 lt!150372)) (currentBit!5038 (_1!4477 lt!150372))) lt!150484)))

(declare-fun b!103155 () Bool)

(declare-fun res!84860 () Bool)

(assert (=> b!103155 (=> (not res!84860) (not e!67507))))

(assert (=> b!103155 (= res!84860 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!150484))))

(declare-fun b!103156 () Bool)

(declare-fun lt!150482 () (_ BitVec 64))

(assert (=> b!103156 (= e!67507 (bvsle lt!150484 (bvmul lt!150482 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!103156 (or (= lt!150482 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!150482 #b0000000000000000000000000000000000000000000000000000000000001000) lt!150482)))))

(assert (=> b!103156 (= lt!150482 ((_ sign_extend 32) (size!2201 (buf!2564 (_1!4477 lt!150372)))))))

(assert (= (and d!32068 res!84859) b!103155))

(assert (= (and b!103155 res!84860) b!103156))

(declare-fun m!150487 () Bool)

(assert (=> d!32068 m!150487))

(declare-fun m!150489 () Bool)

(assert (=> d!32068 m!150489))

(assert (=> b!103093 d!32068))

(declare-fun d!32070 () Bool)

(declare-fun e!67510 () Bool)

(assert (=> d!32070 e!67510))

(declare-fun res!84863 () Bool)

(assert (=> d!32070 (=> (not res!84863) (not e!67510))))

(declare-fun lt!150493 () tuple2!8444)

(declare-fun lt!150495 () tuple2!8444)

(assert (=> d!32070 (= res!84863 (= (bitIndex!0 (size!2201 (buf!2564 (_1!4477 lt!150493))) (currentByte!5043 (_1!4477 lt!150493)) (currentBit!5038 (_1!4477 lt!150493))) (bitIndex!0 (size!2201 (buf!2564 (_1!4477 lt!150495))) (currentByte!5043 (_1!4477 lt!150495)) (currentBit!5038 (_1!4477 lt!150495)))))))

(declare-fun lt!150496 () BitStream!3876)

(declare-fun lt!150494 () Unit!6322)

(declare-fun choose!50 (BitStream!3876 BitStream!3876 BitStream!3876 tuple2!8444 tuple2!8444 BitStream!3876 Bool tuple2!8444 tuple2!8444 BitStream!3876 Bool) Unit!6322)

(assert (=> d!32070 (= lt!150494 (choose!50 lt!150376 (_2!4476 lt!150388) lt!150496 lt!150493 (tuple2!8445 (_1!4477 lt!150493) (_2!4477 lt!150493)) (_1!4477 lt!150493) (_2!4477 lt!150493) lt!150495 (tuple2!8445 (_1!4477 lt!150495) (_2!4477 lt!150495)) (_1!4477 lt!150495) (_2!4477 lt!150495)))))

(assert (=> d!32070 (= lt!150495 (readBitPure!0 lt!150496))))

(assert (=> d!32070 (= lt!150493 (readBitPure!0 lt!150376))))

(assert (=> d!32070 (= lt!150496 (BitStream!3877 (buf!2564 (_2!4476 lt!150388)) (currentByte!5043 lt!150376) (currentBit!5038 lt!150376)))))

(assert (=> d!32070 (invariant!0 (currentBit!5038 lt!150376) (currentByte!5043 lt!150376) (size!2201 (buf!2564 (_2!4476 lt!150388))))))

(assert (=> d!32070 (= (readBitPrefixLemma!0 lt!150376 (_2!4476 lt!150388)) lt!150494)))

(declare-fun b!103159 () Bool)

(assert (=> b!103159 (= e!67510 (= (_2!4477 lt!150493) (_2!4477 lt!150495)))))

(assert (= (and d!32070 res!84863) b!103159))

(declare-fun m!150491 () Bool)

(assert (=> d!32070 m!150491))

(declare-fun m!150493 () Bool)

(assert (=> d!32070 m!150493))

(assert (=> d!32070 m!150399))

(declare-fun m!150495 () Bool)

(assert (=> d!32070 m!150495))

(declare-fun m!150497 () Bool)

(assert (=> d!32070 m!150497))

(declare-fun m!150499 () Bool)

(assert (=> d!32070 m!150499))

(assert (=> b!103093 d!32070))

(declare-fun d!32072 () Bool)

(assert (=> d!32072 (isPrefixOf!0 thiss!1305 (_2!4476 lt!150388))))

(declare-fun lt!150499 () Unit!6322)

(declare-fun choose!30 (BitStream!3876 BitStream!3876 BitStream!3876) Unit!6322)

(assert (=> d!32072 (= lt!150499 (choose!30 thiss!1305 (_2!4476 lt!150387) (_2!4476 lt!150388)))))

(assert (=> d!32072 (isPrefixOf!0 thiss!1305 (_2!4476 lt!150387))))

(assert (=> d!32072 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4476 lt!150387) (_2!4476 lt!150388)) lt!150499)))

(declare-fun bs!7863 () Bool)

(assert (= bs!7863 d!32072))

(assert (=> bs!7863 m!150387))

(declare-fun m!150501 () Bool)

(assert (=> bs!7863 m!150501))

(assert (=> bs!7863 m!150357))

(assert (=> b!103093 d!32072))

(declare-fun d!32074 () Bool)

(declare-fun lt!150500 () tuple2!8458)

(assert (=> d!32074 (= lt!150500 (readBit!0 (BitStream!3877 (buf!2564 (_2!4476 lt!150388)) (currentByte!5043 thiss!1305) (currentBit!5038 thiss!1305))))))

(assert (=> d!32074 (= (readBitPure!0 (BitStream!3877 (buf!2564 (_2!4476 lt!150388)) (currentByte!5043 thiss!1305) (currentBit!5038 thiss!1305))) (tuple2!8445 (_2!4484 lt!150500) (_1!4484 lt!150500)))))

(declare-fun bs!7864 () Bool)

(assert (= bs!7864 d!32074))

(declare-fun m!150503 () Bool)

(assert (=> bs!7864 m!150503))

(assert (=> b!103093 d!32074))

(declare-fun d!32076 () Bool)

(assert (=> d!32076 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2201 (buf!2564 (_2!4476 lt!150388)))) ((_ sign_extend 32) (currentByte!5043 thiss!1305)) ((_ sign_extend 32) (currentBit!5038 thiss!1305)) lt!150386) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2201 (buf!2564 (_2!4476 lt!150388)))) ((_ sign_extend 32) (currentByte!5043 thiss!1305)) ((_ sign_extend 32) (currentBit!5038 thiss!1305))) lt!150386))))

(declare-fun bs!7865 () Bool)

(assert (= bs!7865 d!32076))

(declare-fun m!150505 () Bool)

(assert (=> bs!7865 m!150505))

(assert (=> b!103093 d!32076))

(declare-fun d!32078 () Bool)

(declare-fun e!67516 () Bool)

(assert (=> d!32078 e!67516))

(declare-fun res!84870 () Bool)

(assert (=> d!32078 (=> (not res!84870) (not e!67516))))

(declare-fun lt!150544 () tuple2!8446)

(assert (=> d!32078 (= res!84870 (isPrefixOf!0 (_1!4478 lt!150544) (_2!4478 lt!150544)))))

(declare-fun lt!150547 () BitStream!3876)

(assert (=> d!32078 (= lt!150544 (tuple2!8447 lt!150547 (_2!4476 lt!150388)))))

(declare-fun lt!150560 () Unit!6322)

(declare-fun lt!150548 () Unit!6322)

(assert (=> d!32078 (= lt!150560 lt!150548)))

(assert (=> d!32078 (isPrefixOf!0 lt!150547 (_2!4476 lt!150388))))

(assert (=> d!32078 (= lt!150548 (lemmaIsPrefixTransitive!0 lt!150547 (_2!4476 lt!150388) (_2!4476 lt!150388)))))

(declare-fun lt!150554 () Unit!6322)

(declare-fun lt!150549 () Unit!6322)

(assert (=> d!32078 (= lt!150554 lt!150549)))

(assert (=> d!32078 (isPrefixOf!0 lt!150547 (_2!4476 lt!150388))))

(assert (=> d!32078 (= lt!150549 (lemmaIsPrefixTransitive!0 lt!150547 (_2!4476 lt!150387) (_2!4476 lt!150388)))))

(declare-fun lt!150557 () Unit!6322)

(declare-fun e!67515 () Unit!6322)

(assert (=> d!32078 (= lt!150557 e!67515)))

(declare-fun c!6389 () Bool)

(assert (=> d!32078 (= c!6389 (not (= (size!2201 (buf!2564 (_2!4476 lt!150387))) #b00000000000000000000000000000000)))))

(declare-fun lt!150555 () Unit!6322)

(declare-fun lt!150551 () Unit!6322)

(assert (=> d!32078 (= lt!150555 lt!150551)))

(assert (=> d!32078 (isPrefixOf!0 (_2!4476 lt!150388) (_2!4476 lt!150388))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3876) Unit!6322)

(assert (=> d!32078 (= lt!150551 (lemmaIsPrefixRefl!0 (_2!4476 lt!150388)))))

(declare-fun lt!150546 () Unit!6322)

(declare-fun lt!150559 () Unit!6322)

(assert (=> d!32078 (= lt!150546 lt!150559)))

(assert (=> d!32078 (= lt!150559 (lemmaIsPrefixRefl!0 (_2!4476 lt!150388)))))

(declare-fun lt!150556 () Unit!6322)

(declare-fun lt!150541 () Unit!6322)

(assert (=> d!32078 (= lt!150556 lt!150541)))

(assert (=> d!32078 (isPrefixOf!0 lt!150547 lt!150547)))

(assert (=> d!32078 (= lt!150541 (lemmaIsPrefixRefl!0 lt!150547))))

(declare-fun lt!150552 () Unit!6322)

(declare-fun lt!150553 () Unit!6322)

(assert (=> d!32078 (= lt!150552 lt!150553)))

(assert (=> d!32078 (isPrefixOf!0 (_2!4476 lt!150387) (_2!4476 lt!150387))))

(assert (=> d!32078 (= lt!150553 (lemmaIsPrefixRefl!0 (_2!4476 lt!150387)))))

(assert (=> d!32078 (= lt!150547 (BitStream!3877 (buf!2564 (_2!4476 lt!150388)) (currentByte!5043 (_2!4476 lt!150387)) (currentBit!5038 (_2!4476 lt!150387))))))

(assert (=> d!32078 (isPrefixOf!0 (_2!4476 lt!150387) (_2!4476 lt!150388))))

(assert (=> d!32078 (= (reader!0 (_2!4476 lt!150387) (_2!4476 lt!150388)) lt!150544)))

(declare-fun b!103170 () Bool)

(declare-fun res!84872 () Bool)

(assert (=> b!103170 (=> (not res!84872) (not e!67516))))

(assert (=> b!103170 (= res!84872 (isPrefixOf!0 (_1!4478 lt!150544) (_2!4476 lt!150387)))))

(declare-fun b!103171 () Bool)

(declare-fun res!84871 () Bool)

(assert (=> b!103171 (=> (not res!84871) (not e!67516))))

(assert (=> b!103171 (= res!84871 (isPrefixOf!0 (_2!4478 lt!150544) (_2!4476 lt!150388)))))

(declare-fun b!103172 () Bool)

(declare-fun Unit!6326 () Unit!6322)

(assert (=> b!103172 (= e!67515 Unit!6326)))

(declare-fun b!103173 () Bool)

(declare-fun lt!150558 () (_ BitVec 64))

(declare-fun lt!150550 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3876 (_ BitVec 64)) BitStream!3876)

(assert (=> b!103173 (= e!67516 (= (_1!4478 lt!150544) (withMovedBitIndex!0 (_2!4478 lt!150544) (bvsub lt!150558 lt!150550))))))

(assert (=> b!103173 (or (= (bvand lt!150558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!150550 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!150558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!150558 lt!150550) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103173 (= lt!150550 (bitIndex!0 (size!2201 (buf!2564 (_2!4476 lt!150388))) (currentByte!5043 (_2!4476 lt!150388)) (currentBit!5038 (_2!4476 lt!150388))))))

(assert (=> b!103173 (= lt!150558 (bitIndex!0 (size!2201 (buf!2564 (_2!4476 lt!150387))) (currentByte!5043 (_2!4476 lt!150387)) (currentBit!5038 (_2!4476 lt!150387))))))

(declare-fun b!103174 () Bool)

(declare-fun lt!150542 () Unit!6322)

(assert (=> b!103174 (= e!67515 lt!150542)))

(declare-fun lt!150545 () (_ BitVec 64))

(assert (=> b!103174 (= lt!150545 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!150543 () (_ BitVec 64))

(assert (=> b!103174 (= lt!150543 (bitIndex!0 (size!2201 (buf!2564 (_2!4476 lt!150387))) (currentByte!5043 (_2!4476 lt!150387)) (currentBit!5038 (_2!4476 lt!150387))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4823 array!4823 (_ BitVec 64) (_ BitVec 64)) Unit!6322)

(assert (=> b!103174 (= lt!150542 (arrayBitRangesEqSymmetric!0 (buf!2564 (_2!4476 lt!150387)) (buf!2564 (_2!4476 lt!150388)) lt!150545 lt!150543))))

(assert (=> b!103174 (arrayBitRangesEq!0 (buf!2564 (_2!4476 lt!150388)) (buf!2564 (_2!4476 lt!150387)) lt!150545 lt!150543)))

(assert (= (and d!32078 c!6389) b!103174))

(assert (= (and d!32078 (not c!6389)) b!103172))

(assert (= (and d!32078 res!84870) b!103170))

(assert (= (and b!103170 res!84872) b!103171))

(assert (= (and b!103171 res!84871) b!103173))

(declare-fun m!150507 () Bool)

(assert (=> d!32078 m!150507))

(declare-fun m!150509 () Bool)

(assert (=> d!32078 m!150509))

(declare-fun m!150511 () Bool)

(assert (=> d!32078 m!150511))

(declare-fun m!150513 () Bool)

(assert (=> d!32078 m!150513))

(declare-fun m!150515 () Bool)

(assert (=> d!32078 m!150515))

(declare-fun m!150517 () Bool)

(assert (=> d!32078 m!150517))

(declare-fun m!150519 () Bool)

(assert (=> d!32078 m!150519))

(declare-fun m!150521 () Bool)

(assert (=> d!32078 m!150521))

(declare-fun m!150523 () Bool)

(assert (=> d!32078 m!150523))

(declare-fun m!150525 () Bool)

(assert (=> d!32078 m!150525))

(declare-fun m!150527 () Bool)

(assert (=> d!32078 m!150527))

(assert (=> b!103174 m!150343))

(declare-fun m!150529 () Bool)

(assert (=> b!103174 m!150529))

(declare-fun m!150531 () Bool)

(assert (=> b!103174 m!150531))

(declare-fun m!150533 () Bool)

(assert (=> b!103170 m!150533))

(declare-fun m!150535 () Bool)

(assert (=> b!103171 m!150535))

(declare-fun m!150537 () Bool)

(assert (=> b!103173 m!150537))

(declare-fun m!150539 () Bool)

(assert (=> b!103173 m!150539))

(assert (=> b!103173 m!150343))

(assert (=> b!103093 d!32078))

(declare-fun d!32080 () Bool)

(declare-fun lt!150561 () tuple2!8458)

(assert (=> d!32080 (= lt!150561 (readBit!0 (_1!4478 lt!150373)))))

(assert (=> d!32080 (= (readBitPure!0 (_1!4478 lt!150373)) (tuple2!8445 (_2!4484 lt!150561) (_1!4484 lt!150561)))))

(declare-fun bs!7866 () Bool)

(assert (= bs!7866 d!32080))

(declare-fun m!150541 () Bool)

(assert (=> bs!7866 m!150541))

(assert (=> b!103093 d!32080))

(declare-fun d!32082 () Bool)

(declare-fun e!67521 () Bool)

(assert (=> d!32082 e!67521))

(declare-fun res!84883 () Bool)

(assert (=> d!32082 (=> (not res!84883) (not e!67521))))

(declare-fun lt!150573 () tuple2!8442)

(assert (=> d!32082 (= res!84883 (= (size!2201 (buf!2564 thiss!1305)) (size!2201 (buf!2564 (_2!4476 lt!150573)))))))

(declare-fun choose!16 (BitStream!3876 Bool) tuple2!8442)

(assert (=> d!32082 (= lt!150573 (choose!16 thiss!1305 lt!150380))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!32082 (validate_offset_bit!0 ((_ sign_extend 32) (size!2201 (buf!2564 thiss!1305))) ((_ sign_extend 32) (currentByte!5043 thiss!1305)) ((_ sign_extend 32) (currentBit!5038 thiss!1305)))))

(assert (=> d!32082 (= (appendBit!0 thiss!1305 lt!150380) lt!150573)))

(declare-fun b!103187 () Bool)

(declare-fun e!67522 () Bool)

(declare-fun lt!150570 () tuple2!8444)

(assert (=> b!103187 (= e!67522 (= (bitIndex!0 (size!2201 (buf!2564 (_1!4477 lt!150570))) (currentByte!5043 (_1!4477 lt!150570)) (currentBit!5038 (_1!4477 lt!150570))) (bitIndex!0 (size!2201 (buf!2564 (_2!4476 lt!150573))) (currentByte!5043 (_2!4476 lt!150573)) (currentBit!5038 (_2!4476 lt!150573)))))))

(declare-fun b!103186 () Bool)

(assert (=> b!103186 (= e!67521 e!67522)))

(declare-fun res!84884 () Bool)

(assert (=> b!103186 (=> (not res!84884) (not e!67522))))

(assert (=> b!103186 (= res!84884 (and (= (_2!4477 lt!150570) lt!150380) (= (_1!4477 lt!150570) (_2!4476 lt!150573))))))

(assert (=> b!103186 (= lt!150570 (readBitPure!0 (readerFrom!0 (_2!4476 lt!150573) (currentBit!5038 thiss!1305) (currentByte!5043 thiss!1305))))))

(declare-fun b!103185 () Bool)

(declare-fun res!84882 () Bool)

(assert (=> b!103185 (=> (not res!84882) (not e!67521))))

(assert (=> b!103185 (= res!84882 (isPrefixOf!0 thiss!1305 (_2!4476 lt!150573)))))

(declare-fun b!103184 () Bool)

(declare-fun res!84881 () Bool)

(assert (=> b!103184 (=> (not res!84881) (not e!67521))))

(declare-fun lt!150571 () (_ BitVec 64))

(declare-fun lt!150572 () (_ BitVec 64))

(assert (=> b!103184 (= res!84881 (= (bitIndex!0 (size!2201 (buf!2564 (_2!4476 lt!150573))) (currentByte!5043 (_2!4476 lt!150573)) (currentBit!5038 (_2!4476 lt!150573))) (bvadd lt!150572 lt!150571)))))

(assert (=> b!103184 (or (not (= (bvand lt!150572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!150571 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!150572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!150572 lt!150571) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103184 (= lt!150571 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!103184 (= lt!150572 (bitIndex!0 (size!2201 (buf!2564 thiss!1305)) (currentByte!5043 thiss!1305) (currentBit!5038 thiss!1305)))))

(assert (= (and d!32082 res!84883) b!103184))

(assert (= (and b!103184 res!84881) b!103185))

(assert (= (and b!103185 res!84882) b!103186))

(assert (= (and b!103186 res!84884) b!103187))

(declare-fun m!150543 () Bool)

(assert (=> b!103187 m!150543))

(declare-fun m!150545 () Bool)

(assert (=> b!103187 m!150545))

(assert (=> b!103184 m!150545))

(assert (=> b!103184 m!150345))

(declare-fun m!150547 () Bool)

(assert (=> b!103186 m!150547))

(assert (=> b!103186 m!150547))

(declare-fun m!150549 () Bool)

(assert (=> b!103186 m!150549))

(declare-fun m!150551 () Bool)

(assert (=> b!103185 m!150551))

(declare-fun m!150553 () Bool)

(assert (=> d!32082 m!150553))

(declare-fun m!150555 () Bool)

(assert (=> d!32082 m!150555))

(assert (=> b!103093 d!32082))

(declare-fun d!32084 () Bool)

(declare-fun lt!150574 () tuple2!8458)

(assert (=> d!32084 (= lt!150574 (readBit!0 lt!150376))))

(assert (=> d!32084 (= (readBitPure!0 lt!150376) (tuple2!8445 (_2!4484 lt!150574) (_1!4484 lt!150574)))))

(declare-fun bs!7867 () Bool)

(assert (= bs!7867 d!32084))

(declare-fun m!150557 () Bool)

(assert (=> bs!7867 m!150557))

(assert (=> b!103093 d!32084))

(declare-fun d!32086 () Bool)

(declare-fun e!67523 () Bool)

(assert (=> d!32086 e!67523))

(declare-fun res!84885 () Bool)

(assert (=> d!32086 (=> (not res!84885) (not e!67523))))

(declare-fun lt!150580 () (_ BitVec 64))

(declare-fun lt!150577 () (_ BitVec 64))

(declare-fun lt!150575 () (_ BitVec 64))

(assert (=> d!32086 (= res!84885 (= lt!150580 (bvsub lt!150577 lt!150575)))))

(assert (=> d!32086 (or (= (bvand lt!150577 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!150575 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!150577 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!150577 lt!150575) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32086 (= lt!150575 (remainingBits!0 ((_ sign_extend 32) (size!2201 (buf!2564 (_1!4477 lt!150378)))) ((_ sign_extend 32) (currentByte!5043 (_1!4477 lt!150378))) ((_ sign_extend 32) (currentBit!5038 (_1!4477 lt!150378)))))))

(declare-fun lt!150576 () (_ BitVec 64))

(declare-fun lt!150579 () (_ BitVec 64))

(assert (=> d!32086 (= lt!150577 (bvmul lt!150576 lt!150579))))

(assert (=> d!32086 (or (= lt!150576 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!150579 (bvsdiv (bvmul lt!150576 lt!150579) lt!150576)))))

(assert (=> d!32086 (= lt!150579 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32086 (= lt!150576 ((_ sign_extend 32) (size!2201 (buf!2564 (_1!4477 lt!150378)))))))

(assert (=> d!32086 (= lt!150580 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5043 (_1!4477 lt!150378))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5038 (_1!4477 lt!150378)))))))

(assert (=> d!32086 (invariant!0 (currentBit!5038 (_1!4477 lt!150378)) (currentByte!5043 (_1!4477 lt!150378)) (size!2201 (buf!2564 (_1!4477 lt!150378))))))

(assert (=> d!32086 (= (bitIndex!0 (size!2201 (buf!2564 (_1!4477 lt!150378))) (currentByte!5043 (_1!4477 lt!150378)) (currentBit!5038 (_1!4477 lt!150378))) lt!150580)))

(declare-fun b!103188 () Bool)

(declare-fun res!84886 () Bool)

(assert (=> b!103188 (=> (not res!84886) (not e!67523))))

(assert (=> b!103188 (= res!84886 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!150580))))

(declare-fun b!103189 () Bool)

(declare-fun lt!150578 () (_ BitVec 64))

(assert (=> b!103189 (= e!67523 (bvsle lt!150580 (bvmul lt!150578 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!103189 (or (= lt!150578 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!150578 #b0000000000000000000000000000000000000000000000000000000000001000) lt!150578)))))

(assert (=> b!103189 (= lt!150578 ((_ sign_extend 32) (size!2201 (buf!2564 (_1!4477 lt!150378)))))))

(assert (= (and d!32086 res!84885) b!103188))

(assert (= (and b!103188 res!84886) b!103189))

(declare-fun m!150559 () Bool)

(assert (=> d!32086 m!150559))

(declare-fun m!150561 () Bool)

(assert (=> d!32086 m!150561))

(assert (=> b!103093 d!32086))

(declare-fun d!32088 () Bool)

(declare-fun e!67525 () Bool)

(assert (=> d!32088 e!67525))

(declare-fun res!84887 () Bool)

(assert (=> d!32088 (=> (not res!84887) (not e!67525))))

(declare-fun lt!150584 () tuple2!8446)

(assert (=> d!32088 (= res!84887 (isPrefixOf!0 (_1!4478 lt!150584) (_2!4478 lt!150584)))))

(declare-fun lt!150587 () BitStream!3876)

(assert (=> d!32088 (= lt!150584 (tuple2!8447 lt!150587 (_2!4476 lt!150388)))))

(declare-fun lt!150600 () Unit!6322)

(declare-fun lt!150588 () Unit!6322)

(assert (=> d!32088 (= lt!150600 lt!150588)))

(assert (=> d!32088 (isPrefixOf!0 lt!150587 (_2!4476 lt!150388))))

(assert (=> d!32088 (= lt!150588 (lemmaIsPrefixTransitive!0 lt!150587 (_2!4476 lt!150388) (_2!4476 lt!150388)))))

(declare-fun lt!150594 () Unit!6322)

(declare-fun lt!150589 () Unit!6322)

(assert (=> d!32088 (= lt!150594 lt!150589)))

(assert (=> d!32088 (isPrefixOf!0 lt!150587 (_2!4476 lt!150388))))

(assert (=> d!32088 (= lt!150589 (lemmaIsPrefixTransitive!0 lt!150587 thiss!1305 (_2!4476 lt!150388)))))

(declare-fun lt!150597 () Unit!6322)

(declare-fun e!67524 () Unit!6322)

(assert (=> d!32088 (= lt!150597 e!67524)))

(declare-fun c!6390 () Bool)

(assert (=> d!32088 (= c!6390 (not (= (size!2201 (buf!2564 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!150595 () Unit!6322)

(declare-fun lt!150591 () Unit!6322)

(assert (=> d!32088 (= lt!150595 lt!150591)))

(assert (=> d!32088 (isPrefixOf!0 (_2!4476 lt!150388) (_2!4476 lt!150388))))

(assert (=> d!32088 (= lt!150591 (lemmaIsPrefixRefl!0 (_2!4476 lt!150388)))))

(declare-fun lt!150586 () Unit!6322)

(declare-fun lt!150599 () Unit!6322)

(assert (=> d!32088 (= lt!150586 lt!150599)))

(assert (=> d!32088 (= lt!150599 (lemmaIsPrefixRefl!0 (_2!4476 lt!150388)))))

(declare-fun lt!150596 () Unit!6322)

(declare-fun lt!150581 () Unit!6322)

(assert (=> d!32088 (= lt!150596 lt!150581)))

(assert (=> d!32088 (isPrefixOf!0 lt!150587 lt!150587)))

(assert (=> d!32088 (= lt!150581 (lemmaIsPrefixRefl!0 lt!150587))))

(declare-fun lt!150592 () Unit!6322)

(declare-fun lt!150593 () Unit!6322)

(assert (=> d!32088 (= lt!150592 lt!150593)))

(assert (=> d!32088 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!32088 (= lt!150593 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!32088 (= lt!150587 (BitStream!3877 (buf!2564 (_2!4476 lt!150388)) (currentByte!5043 thiss!1305) (currentBit!5038 thiss!1305)))))

(assert (=> d!32088 (isPrefixOf!0 thiss!1305 (_2!4476 lt!150388))))

(assert (=> d!32088 (= (reader!0 thiss!1305 (_2!4476 lt!150388)) lt!150584)))

(declare-fun b!103190 () Bool)

(declare-fun res!84889 () Bool)

(assert (=> b!103190 (=> (not res!84889) (not e!67525))))

(assert (=> b!103190 (= res!84889 (isPrefixOf!0 (_1!4478 lt!150584) thiss!1305))))

(declare-fun b!103191 () Bool)

(declare-fun res!84888 () Bool)

(assert (=> b!103191 (=> (not res!84888) (not e!67525))))

(assert (=> b!103191 (= res!84888 (isPrefixOf!0 (_2!4478 lt!150584) (_2!4476 lt!150388)))))

(declare-fun b!103192 () Bool)

(declare-fun Unit!6327 () Unit!6322)

(assert (=> b!103192 (= e!67524 Unit!6327)))

(declare-fun lt!150598 () (_ BitVec 64))

(declare-fun lt!150590 () (_ BitVec 64))

(declare-fun b!103193 () Bool)

(assert (=> b!103193 (= e!67525 (= (_1!4478 lt!150584) (withMovedBitIndex!0 (_2!4478 lt!150584) (bvsub lt!150598 lt!150590))))))

(assert (=> b!103193 (or (= (bvand lt!150598 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!150590 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!150598 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!150598 lt!150590) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103193 (= lt!150590 (bitIndex!0 (size!2201 (buf!2564 (_2!4476 lt!150388))) (currentByte!5043 (_2!4476 lt!150388)) (currentBit!5038 (_2!4476 lt!150388))))))

(assert (=> b!103193 (= lt!150598 (bitIndex!0 (size!2201 (buf!2564 thiss!1305)) (currentByte!5043 thiss!1305) (currentBit!5038 thiss!1305)))))

(declare-fun b!103194 () Bool)

(declare-fun lt!150582 () Unit!6322)

(assert (=> b!103194 (= e!67524 lt!150582)))

(declare-fun lt!150585 () (_ BitVec 64))

(assert (=> b!103194 (= lt!150585 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!150583 () (_ BitVec 64))

(assert (=> b!103194 (= lt!150583 (bitIndex!0 (size!2201 (buf!2564 thiss!1305)) (currentByte!5043 thiss!1305) (currentBit!5038 thiss!1305)))))

(assert (=> b!103194 (= lt!150582 (arrayBitRangesEqSymmetric!0 (buf!2564 thiss!1305) (buf!2564 (_2!4476 lt!150388)) lt!150585 lt!150583))))

(assert (=> b!103194 (arrayBitRangesEq!0 (buf!2564 (_2!4476 lt!150388)) (buf!2564 thiss!1305) lt!150585 lt!150583)))

(assert (= (and d!32088 c!6390) b!103194))

(assert (= (and d!32088 (not c!6390)) b!103192))

(assert (= (and d!32088 res!84887) b!103190))

(assert (= (and b!103190 res!84889) b!103191))

(assert (= (and b!103191 res!84888) b!103193))

(assert (=> d!32088 m!150507))

(assert (=> d!32088 m!150509))

(declare-fun m!150563 () Bool)

(assert (=> d!32088 m!150563))

(declare-fun m!150565 () Bool)

(assert (=> d!32088 m!150565))

(declare-fun m!150567 () Bool)

(assert (=> d!32088 m!150567))

(declare-fun m!150569 () Bool)

(assert (=> d!32088 m!150569))

(declare-fun m!150571 () Bool)

(assert (=> d!32088 m!150571))

(declare-fun m!150573 () Bool)

(assert (=> d!32088 m!150573))

(assert (=> d!32088 m!150387))

(declare-fun m!150575 () Bool)

(assert (=> d!32088 m!150575))

(declare-fun m!150577 () Bool)

(assert (=> d!32088 m!150577))

(assert (=> b!103194 m!150345))

(declare-fun m!150579 () Bool)

(assert (=> b!103194 m!150579))

(declare-fun m!150581 () Bool)

(assert (=> b!103194 m!150581))

(declare-fun m!150583 () Bool)

(assert (=> b!103190 m!150583))

(declare-fun m!150585 () Bool)

(assert (=> b!103191 m!150585))

(declare-fun m!150587 () Bool)

(assert (=> b!103193 m!150587))

(assert (=> b!103193 m!150539))

(assert (=> b!103193 m!150345))

(assert (=> b!103093 d!32088))

(declare-fun d!32090 () Bool)

(assert (=> d!32090 (validate_offset_bits!1 ((_ sign_extend 32) (size!2201 (buf!2564 (_2!4476 lt!150388)))) ((_ sign_extend 32) (currentByte!5043 (_2!4476 lt!150387))) ((_ sign_extend 32) (currentBit!5038 (_2!4476 lt!150387))) lt!150374)))

(declare-fun lt!150603 () Unit!6322)

(declare-fun choose!9 (BitStream!3876 array!4823 (_ BitVec 64) BitStream!3876) Unit!6322)

(assert (=> d!32090 (= lt!150603 (choose!9 (_2!4476 lt!150387) (buf!2564 (_2!4476 lt!150388)) lt!150374 (BitStream!3877 (buf!2564 (_2!4476 lt!150388)) (currentByte!5043 (_2!4476 lt!150387)) (currentBit!5038 (_2!4476 lt!150387)))))))

(assert (=> d!32090 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4476 lt!150387) (buf!2564 (_2!4476 lt!150388)) lt!150374) lt!150603)))

(declare-fun bs!7868 () Bool)

(assert (= bs!7868 d!32090))

(assert (=> bs!7868 m!150377))

(declare-fun m!150589 () Bool)

(assert (=> bs!7868 m!150589))

(assert (=> b!103093 d!32090))

(declare-fun d!32092 () Bool)

(assert (=> d!32092 (validate_offset_bits!1 ((_ sign_extend 32) (size!2201 (buf!2564 (_2!4476 lt!150388)))) ((_ sign_extend 32) (currentByte!5043 thiss!1305)) ((_ sign_extend 32) (currentBit!5038 thiss!1305)) lt!150386)))

(declare-fun lt!150604 () Unit!6322)

(assert (=> d!32092 (= lt!150604 (choose!9 thiss!1305 (buf!2564 (_2!4476 lt!150388)) lt!150386 (BitStream!3877 (buf!2564 (_2!4476 lt!150388)) (currentByte!5043 thiss!1305) (currentBit!5038 thiss!1305))))))

(assert (=> d!32092 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2564 (_2!4476 lt!150388)) lt!150386) lt!150604)))

(declare-fun bs!7869 () Bool)

(assert (= bs!7869 d!32092))

(assert (=> bs!7869 m!150401))

(declare-fun m!150591 () Bool)

(assert (=> bs!7869 m!150591))

(assert (=> b!103093 d!32092))

(declare-fun d!32094 () Bool)

(declare-fun res!84890 () Bool)

(declare-fun e!67526 () Bool)

(assert (=> d!32094 (=> (not res!84890) (not e!67526))))

(assert (=> d!32094 (= res!84890 (= (size!2201 (buf!2564 thiss!1305)) (size!2201 (buf!2564 (_2!4476 lt!150388)))))))

(assert (=> d!32094 (= (isPrefixOf!0 thiss!1305 (_2!4476 lt!150388)) e!67526)))

(declare-fun b!103195 () Bool)

(declare-fun res!84891 () Bool)

(assert (=> b!103195 (=> (not res!84891) (not e!67526))))

(assert (=> b!103195 (= res!84891 (bvsle (bitIndex!0 (size!2201 (buf!2564 thiss!1305)) (currentByte!5043 thiss!1305) (currentBit!5038 thiss!1305)) (bitIndex!0 (size!2201 (buf!2564 (_2!4476 lt!150388))) (currentByte!5043 (_2!4476 lt!150388)) (currentBit!5038 (_2!4476 lt!150388)))))))

(declare-fun b!103196 () Bool)

(declare-fun e!67527 () Bool)

(assert (=> b!103196 (= e!67526 e!67527)))

(declare-fun res!84892 () Bool)

(assert (=> b!103196 (=> res!84892 e!67527)))

(assert (=> b!103196 (= res!84892 (= (size!2201 (buf!2564 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!103197 () Bool)

(assert (=> b!103197 (= e!67527 (arrayBitRangesEq!0 (buf!2564 thiss!1305) (buf!2564 (_2!4476 lt!150388)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2201 (buf!2564 thiss!1305)) (currentByte!5043 thiss!1305) (currentBit!5038 thiss!1305))))))

(assert (= (and d!32094 res!84890) b!103195))

(assert (= (and b!103195 res!84891) b!103196))

(assert (= (and b!103196 (not res!84892)) b!103197))

(assert (=> b!103195 m!150345))

(assert (=> b!103195 m!150539))

(assert (=> b!103197 m!150345))

(assert (=> b!103197 m!150345))

(declare-fun m!150593 () Bool)

(assert (=> b!103197 m!150593))

(assert (=> b!103093 d!32094))

(declare-fun d!32096 () Bool)

(declare-fun e!67578 () Bool)

(assert (=> d!32096 e!67578))

(declare-fun res!84973 () Bool)

(assert (=> d!32096 (=> (not res!84973) (not e!67578))))

(declare-fun lt!150881 () tuple2!8442)

(assert (=> d!32096 (= res!84973 (= (size!2201 (buf!2564 (_2!4476 lt!150387))) (size!2201 (buf!2564 (_2!4476 lt!150881)))))))

(declare-fun e!67582 () tuple2!8442)

(assert (=> d!32096 (= lt!150881 e!67582)))

(declare-fun c!6400 () Bool)

(assert (=> d!32096 (= c!6400 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!32096 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!32096 (= (appendNLeastSignificantBitsLoop!0 (_2!4476 lt!150387) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!150881)))

(declare-fun b!103290 () Bool)

(declare-fun e!67579 () (_ BitVec 64))

(assert (=> b!103290 (= e!67579 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!103291 () Bool)

(declare-fun lt!150893 () tuple2!8442)

(declare-fun Unit!6328 () Unit!6322)

(assert (=> b!103291 (= e!67582 (tuple2!8443 Unit!6328 (_2!4476 lt!150893)))))

(declare-fun lt!150886 () Bool)

(assert (=> b!103291 (= lt!150886 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!150882 () tuple2!8442)

(assert (=> b!103291 (= lt!150882 (appendBit!0 (_2!4476 lt!150387) lt!150886))))

(declare-fun res!84974 () Bool)

(assert (=> b!103291 (= res!84974 (= (size!2201 (buf!2564 (_2!4476 lt!150387))) (size!2201 (buf!2564 (_2!4476 lt!150882)))))))

(declare-fun e!67583 () Bool)

(assert (=> b!103291 (=> (not res!84974) (not e!67583))))

(assert (=> b!103291 e!67583))

(declare-fun lt!150872 () tuple2!8442)

(assert (=> b!103291 (= lt!150872 lt!150882)))

(assert (=> b!103291 (= lt!150893 (appendNLeastSignificantBitsLoop!0 (_2!4476 lt!150872) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!150878 () Unit!6322)

(assert (=> b!103291 (= lt!150878 (lemmaIsPrefixTransitive!0 (_2!4476 lt!150387) (_2!4476 lt!150872) (_2!4476 lt!150893)))))

(assert (=> b!103291 (isPrefixOf!0 (_2!4476 lt!150387) (_2!4476 lt!150893))))

(declare-fun lt!150870 () Unit!6322)

(assert (=> b!103291 (= lt!150870 lt!150878)))

(assert (=> b!103291 (invariant!0 (currentBit!5038 (_2!4476 lt!150387)) (currentByte!5043 (_2!4476 lt!150387)) (size!2201 (buf!2564 (_2!4476 lt!150872))))))

(declare-fun lt!150858 () BitStream!3876)

(assert (=> b!103291 (= lt!150858 (BitStream!3877 (buf!2564 (_2!4476 lt!150872)) (currentByte!5043 (_2!4476 lt!150387)) (currentBit!5038 (_2!4476 lt!150387))))))

(assert (=> b!103291 (invariant!0 (currentBit!5038 lt!150858) (currentByte!5043 lt!150858) (size!2201 (buf!2564 (_2!4476 lt!150893))))))

(declare-fun lt!150857 () BitStream!3876)

(assert (=> b!103291 (= lt!150857 (BitStream!3877 (buf!2564 (_2!4476 lt!150893)) (currentByte!5043 lt!150858) (currentBit!5038 lt!150858)))))

(declare-fun lt!150880 () tuple2!8444)

(assert (=> b!103291 (= lt!150880 (readBitPure!0 lt!150858))))

(declare-fun lt!150887 () tuple2!8444)

(assert (=> b!103291 (= lt!150887 (readBitPure!0 lt!150857))))

(declare-fun lt!150895 () Unit!6322)

(assert (=> b!103291 (= lt!150895 (readBitPrefixLemma!0 lt!150858 (_2!4476 lt!150893)))))

(declare-fun res!84971 () Bool)

(assert (=> b!103291 (= res!84971 (= (bitIndex!0 (size!2201 (buf!2564 (_1!4477 lt!150880))) (currentByte!5043 (_1!4477 lt!150880)) (currentBit!5038 (_1!4477 lt!150880))) (bitIndex!0 (size!2201 (buf!2564 (_1!4477 lt!150887))) (currentByte!5043 (_1!4477 lt!150887)) (currentBit!5038 (_1!4477 lt!150887)))))))

(declare-fun e!67580 () Bool)

(assert (=> b!103291 (=> (not res!84971) (not e!67580))))

(assert (=> b!103291 e!67580))

(declare-fun lt!150869 () Unit!6322)

(assert (=> b!103291 (= lt!150869 lt!150895)))

(declare-fun lt!150896 () tuple2!8446)

(assert (=> b!103291 (= lt!150896 (reader!0 (_2!4476 lt!150387) (_2!4476 lt!150893)))))

(declare-fun lt!150871 () tuple2!8446)

(assert (=> b!103291 (= lt!150871 (reader!0 (_2!4476 lt!150872) (_2!4476 lt!150893)))))

(declare-fun lt!150894 () tuple2!8444)

(assert (=> b!103291 (= lt!150894 (readBitPure!0 (_1!4478 lt!150896)))))

(assert (=> b!103291 (= (_2!4477 lt!150894) lt!150886)))

(declare-fun lt!150861 () Unit!6322)

(declare-fun Unit!6329 () Unit!6322)

(assert (=> b!103291 (= lt!150861 Unit!6329)))

(declare-fun lt!150867 () (_ BitVec 64))

(assert (=> b!103291 (= lt!150867 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!150874 () (_ BitVec 64))

(assert (=> b!103291 (= lt!150874 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!150885 () Unit!6322)

(assert (=> b!103291 (= lt!150885 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4476 lt!150387) (buf!2564 (_2!4476 lt!150893)) lt!150874))))

(assert (=> b!103291 (validate_offset_bits!1 ((_ sign_extend 32) (size!2201 (buf!2564 (_2!4476 lt!150893)))) ((_ sign_extend 32) (currentByte!5043 (_2!4476 lt!150387))) ((_ sign_extend 32) (currentBit!5038 (_2!4476 lt!150387))) lt!150874)))

(declare-fun lt!150854 () Unit!6322)

(assert (=> b!103291 (= lt!150854 lt!150885)))

(declare-fun lt!150860 () tuple2!8448)

(assert (=> b!103291 (= lt!150860 (readNLeastSignificantBitsLoopPure!0 (_1!4478 lt!150896) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!150867))))

(declare-fun lt!150877 () (_ BitVec 64))

(assert (=> b!103291 (= lt!150877 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!150865 () Unit!6322)

(assert (=> b!103291 (= lt!150865 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4476 lt!150872) (buf!2564 (_2!4476 lt!150893)) lt!150877))))

(assert (=> b!103291 (validate_offset_bits!1 ((_ sign_extend 32) (size!2201 (buf!2564 (_2!4476 lt!150893)))) ((_ sign_extend 32) (currentByte!5043 (_2!4476 lt!150872))) ((_ sign_extend 32) (currentBit!5038 (_2!4476 lt!150872))) lt!150877)))

(declare-fun lt!150897 () Unit!6322)

(assert (=> b!103291 (= lt!150897 lt!150865)))

(declare-fun lt!150884 () tuple2!8448)

(assert (=> b!103291 (= lt!150884 (readNLeastSignificantBitsLoopPure!0 (_1!4478 lt!150871) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!150867 (ite (_2!4477 lt!150894) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!150856 () tuple2!8448)

(assert (=> b!103291 (= lt!150856 (readNLeastSignificantBitsLoopPure!0 (_1!4478 lt!150896) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!150867))))

(declare-fun c!6399 () Bool)

(assert (=> b!103291 (= c!6399 (_2!4477 (readBitPure!0 (_1!4478 lt!150896))))))

(declare-fun lt!150892 () tuple2!8448)

(assert (=> b!103291 (= lt!150892 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4478 lt!150896) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!150867 e!67579)))))

(declare-fun lt!150863 () Unit!6322)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3876 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6322)

(assert (=> b!103291 (= lt!150863 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4478 lt!150896) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!150867))))

(assert (=> b!103291 (and (= (_2!4479 lt!150856) (_2!4479 lt!150892)) (= (_1!4479 lt!150856) (_1!4479 lt!150892)))))

(declare-fun lt!150889 () Unit!6322)

(assert (=> b!103291 (= lt!150889 lt!150863)))

(assert (=> b!103291 (= (_1!4478 lt!150896) (withMovedBitIndex!0 (_2!4478 lt!150896) (bvsub (bitIndex!0 (size!2201 (buf!2564 (_2!4476 lt!150387))) (currentByte!5043 (_2!4476 lt!150387)) (currentBit!5038 (_2!4476 lt!150387))) (bitIndex!0 (size!2201 (buf!2564 (_2!4476 lt!150893))) (currentByte!5043 (_2!4476 lt!150893)) (currentBit!5038 (_2!4476 lt!150893))))))))

(declare-fun lt!150873 () Unit!6322)

(declare-fun Unit!6330 () Unit!6322)

(assert (=> b!103291 (= lt!150873 Unit!6330)))

(assert (=> b!103291 (= (_1!4478 lt!150871) (withMovedBitIndex!0 (_2!4478 lt!150871) (bvsub (bitIndex!0 (size!2201 (buf!2564 (_2!4476 lt!150872))) (currentByte!5043 (_2!4476 lt!150872)) (currentBit!5038 (_2!4476 lt!150872))) (bitIndex!0 (size!2201 (buf!2564 (_2!4476 lt!150893))) (currentByte!5043 (_2!4476 lt!150893)) (currentBit!5038 (_2!4476 lt!150893))))))))

(declare-fun lt!150891 () Unit!6322)

(declare-fun Unit!6331 () Unit!6322)

(assert (=> b!103291 (= lt!150891 Unit!6331)))

(assert (=> b!103291 (= (bitIndex!0 (size!2201 (buf!2564 (_2!4476 lt!150387))) (currentByte!5043 (_2!4476 lt!150387)) (currentBit!5038 (_2!4476 lt!150387))) (bvsub (bitIndex!0 (size!2201 (buf!2564 (_2!4476 lt!150872))) (currentByte!5043 (_2!4476 lt!150872)) (currentBit!5038 (_2!4476 lt!150872))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!150866 () Unit!6322)

(declare-fun Unit!6332 () Unit!6322)

(assert (=> b!103291 (= lt!150866 Unit!6332)))

(assert (=> b!103291 (= (_2!4479 lt!150860) (_2!4479 lt!150884))))

(declare-fun lt!150879 () Unit!6322)

(declare-fun Unit!6333 () Unit!6322)

(assert (=> b!103291 (= lt!150879 Unit!6333)))

(assert (=> b!103291 (= (_1!4479 lt!150860) (_2!4478 lt!150896))))

(declare-fun b!103292 () Bool)

(declare-fun res!84977 () Bool)

(assert (=> b!103292 (=> (not res!84977) (not e!67578))))

(assert (=> b!103292 (= res!84977 (isPrefixOf!0 (_2!4476 lt!150387) (_2!4476 lt!150881)))))

(declare-fun b!103293 () Bool)

(declare-fun lt!150864 () tuple2!8444)

(assert (=> b!103293 (= lt!150864 (readBitPure!0 (readerFrom!0 (_2!4476 lt!150882) (currentBit!5038 (_2!4476 lt!150387)) (currentByte!5043 (_2!4476 lt!150387)))))))

(declare-fun res!84978 () Bool)

(assert (=> b!103293 (= res!84978 (and (= (_2!4477 lt!150864) lt!150886) (= (_1!4477 lt!150864) (_2!4476 lt!150882))))))

(declare-fun e!67577 () Bool)

(assert (=> b!103293 (=> (not res!84978) (not e!67577))))

(assert (=> b!103293 (= e!67583 e!67577)))

(declare-fun b!103294 () Bool)

(declare-fun res!84976 () Bool)

(assert (=> b!103294 (=> (not res!84976) (not e!67578))))

(declare-fun lt!150855 () (_ BitVec 64))

(declare-fun lt!150875 () (_ BitVec 64))

(assert (=> b!103294 (= res!84976 (= (bitIndex!0 (size!2201 (buf!2564 (_2!4476 lt!150881))) (currentByte!5043 (_2!4476 lt!150881)) (currentBit!5038 (_2!4476 lt!150881))) (bvadd lt!150855 lt!150875)))))

(assert (=> b!103294 (or (not (= (bvand lt!150855 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!150875 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!150855 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!150855 lt!150875) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103294 (= lt!150875 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!103294 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!103294 (= lt!150855 (bitIndex!0 (size!2201 (buf!2564 (_2!4476 lt!150387))) (currentByte!5043 (_2!4476 lt!150387)) (currentBit!5038 (_2!4476 lt!150387))))))

(declare-fun b!103295 () Bool)

(assert (=> b!103295 (= e!67580 (= (_2!4477 lt!150880) (_2!4477 lt!150887)))))

(declare-fun b!103296 () Bool)

(assert (=> b!103296 (= e!67579 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!103297 () Bool)

(declare-fun res!84972 () Bool)

(assert (=> b!103297 (= res!84972 (= (bitIndex!0 (size!2201 (buf!2564 (_2!4476 lt!150882))) (currentByte!5043 (_2!4476 lt!150882)) (currentBit!5038 (_2!4476 lt!150882))) (bvadd (bitIndex!0 (size!2201 (buf!2564 (_2!4476 lt!150387))) (currentByte!5043 (_2!4476 lt!150387)) (currentBit!5038 (_2!4476 lt!150387))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!103297 (=> (not res!84972) (not e!67583))))

(declare-fun b!103298 () Bool)

(declare-fun res!84975 () Bool)

(declare-fun call!1285 () Bool)

(assert (=> b!103298 (= res!84975 call!1285)))

(assert (=> b!103298 (=> (not res!84975) (not e!67583))))

(declare-fun b!103299 () Bool)

(assert (=> b!103299 (= e!67577 (= (bitIndex!0 (size!2201 (buf!2564 (_1!4477 lt!150864))) (currentByte!5043 (_1!4477 lt!150864)) (currentBit!5038 (_1!4477 lt!150864))) (bitIndex!0 (size!2201 (buf!2564 (_2!4476 lt!150882))) (currentByte!5043 (_2!4476 lt!150882)) (currentBit!5038 (_2!4476 lt!150882)))))))

(declare-fun b!103300 () Bool)

(declare-fun lt!150883 () Unit!6322)

(assert (=> b!103300 (= e!67582 (tuple2!8443 lt!150883 (_2!4476 lt!150387)))))

(declare-fun lt!150868 () BitStream!3876)

(assert (=> b!103300 (= lt!150868 (_2!4476 lt!150387))))

(assert (=> b!103300 (= lt!150883 (lemmaIsPrefixRefl!0 lt!150868))))

(assert (=> b!103300 call!1285))

(declare-fun bm!1282 () Bool)

(assert (=> bm!1282 (= call!1285 (isPrefixOf!0 (ite c!6400 (_2!4476 lt!150387) lt!150868) (ite c!6400 (_2!4476 lt!150882) lt!150868)))))

(declare-fun b!103301 () Bool)

(declare-fun e!67581 () Bool)

(declare-fun lt!150853 () (_ BitVec 64))

(assert (=> b!103301 (= e!67581 (validate_offset_bits!1 ((_ sign_extend 32) (size!2201 (buf!2564 (_2!4476 lt!150387)))) ((_ sign_extend 32) (currentByte!5043 (_2!4476 lt!150387))) ((_ sign_extend 32) (currentBit!5038 (_2!4476 lt!150387))) lt!150853))))

(declare-fun lt!150888 () tuple2!8448)

(declare-fun b!103302 () Bool)

(declare-fun lt!150862 () tuple2!8446)

(assert (=> b!103302 (= e!67578 (and (= (_2!4479 lt!150888) v!199) (= (_1!4479 lt!150888) (_2!4478 lt!150862))))))

(declare-fun lt!150876 () (_ BitVec 64))

(assert (=> b!103302 (= lt!150888 (readNLeastSignificantBitsLoopPure!0 (_1!4478 lt!150862) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!150876))))

(declare-fun lt!150859 () Unit!6322)

(declare-fun lt!150890 () Unit!6322)

(assert (=> b!103302 (= lt!150859 lt!150890)))

(assert (=> b!103302 (validate_offset_bits!1 ((_ sign_extend 32) (size!2201 (buf!2564 (_2!4476 lt!150881)))) ((_ sign_extend 32) (currentByte!5043 (_2!4476 lt!150387))) ((_ sign_extend 32) (currentBit!5038 (_2!4476 lt!150387))) lt!150853)))

(assert (=> b!103302 (= lt!150890 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4476 lt!150387) (buf!2564 (_2!4476 lt!150881)) lt!150853))))

(assert (=> b!103302 e!67581))

(declare-fun res!84970 () Bool)

(assert (=> b!103302 (=> (not res!84970) (not e!67581))))

(assert (=> b!103302 (= res!84970 (and (= (size!2201 (buf!2564 (_2!4476 lt!150387))) (size!2201 (buf!2564 (_2!4476 lt!150881)))) (bvsge lt!150853 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103302 (= lt!150853 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!103302 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!103302 (= lt!150876 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!103302 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!103302 (= lt!150862 (reader!0 (_2!4476 lt!150387) (_2!4476 lt!150881)))))

(assert (= (and d!32096 c!6400) b!103291))

(assert (= (and d!32096 (not c!6400)) b!103300))

(assert (= (and b!103291 res!84974) b!103297))

(assert (= (and b!103297 res!84972) b!103298))

(assert (= (and b!103298 res!84975) b!103293))

(assert (= (and b!103293 res!84978) b!103299))

(assert (= (and b!103291 res!84971) b!103295))

(assert (= (and b!103291 c!6399) b!103296))

(assert (= (and b!103291 (not c!6399)) b!103290))

(assert (= (or b!103298 b!103300) bm!1282))

(assert (= (and d!32096 res!84973) b!103294))

(assert (= (and b!103294 res!84976) b!103292))

(assert (= (and b!103292 res!84977) b!103302))

(assert (= (and b!103302 res!84970) b!103301))

(declare-fun m!150713 () Bool)

(assert (=> b!103302 m!150713))

(declare-fun m!150715 () Bool)

(assert (=> b!103302 m!150715))

(declare-fun m!150717 () Bool)

(assert (=> b!103302 m!150717))

(declare-fun m!150719 () Bool)

(assert (=> b!103302 m!150719))

(declare-fun m!150721 () Bool)

(assert (=> b!103302 m!150721))

(declare-fun m!150723 () Bool)

(assert (=> b!103294 m!150723))

(assert (=> b!103294 m!150343))

(declare-fun m!150725 () Bool)

(assert (=> b!103300 m!150725))

(declare-fun m!150727 () Bool)

(assert (=> b!103291 m!150727))

(declare-fun m!150729 () Bool)

(assert (=> b!103291 m!150729))

(declare-fun m!150731 () Bool)

(assert (=> b!103291 m!150731))

(declare-fun m!150733 () Bool)

(assert (=> b!103291 m!150733))

(declare-fun m!150735 () Bool)

(assert (=> b!103291 m!150735))

(declare-fun m!150737 () Bool)

(assert (=> b!103291 m!150737))

(declare-fun m!150739 () Bool)

(assert (=> b!103291 m!150739))

(declare-fun m!150741 () Bool)

(assert (=> b!103291 m!150741))

(declare-fun m!150743 () Bool)

(assert (=> b!103291 m!150743))

(declare-fun m!150745 () Bool)

(assert (=> b!103291 m!150745))

(declare-fun m!150747 () Bool)

(assert (=> b!103291 m!150747))

(declare-fun m!150749 () Bool)

(assert (=> b!103291 m!150749))

(declare-fun m!150751 () Bool)

(assert (=> b!103291 m!150751))

(assert (=> b!103291 m!150721))

(declare-fun m!150753 () Bool)

(assert (=> b!103291 m!150753))

(declare-fun m!150755 () Bool)

(assert (=> b!103291 m!150755))

(declare-fun m!150757 () Bool)

(assert (=> b!103291 m!150757))

(declare-fun m!150759 () Bool)

(assert (=> b!103291 m!150759))

(declare-fun m!150761 () Bool)

(assert (=> b!103291 m!150761))

(declare-fun m!150763 () Bool)

(assert (=> b!103291 m!150763))

(assert (=> b!103291 m!150739))

(declare-fun m!150765 () Bool)

(assert (=> b!103291 m!150765))

(declare-fun m!150767 () Bool)

(assert (=> b!103291 m!150767))

(declare-fun m!150769 () Bool)

(assert (=> b!103291 m!150769))

(declare-fun m!150771 () Bool)

(assert (=> b!103291 m!150771))

(assert (=> b!103291 m!150343))

(declare-fun m!150773 () Bool)

(assert (=> b!103291 m!150773))

(declare-fun m!150775 () Bool)

(assert (=> b!103291 m!150775))

(declare-fun m!150777 () Bool)

(assert (=> b!103291 m!150777))

(declare-fun m!150779 () Bool)

(assert (=> b!103291 m!150779))

(declare-fun m!150781 () Bool)

(assert (=> b!103299 m!150781))

(declare-fun m!150783 () Bool)

(assert (=> b!103299 m!150783))

(declare-fun m!150785 () Bool)

(assert (=> b!103293 m!150785))

(assert (=> b!103293 m!150785))

(declare-fun m!150787 () Bool)

(assert (=> b!103293 m!150787))

(declare-fun m!150789 () Bool)

(assert (=> b!103292 m!150789))

(declare-fun m!150791 () Bool)

(assert (=> b!103301 m!150791))

(assert (=> b!103297 m!150783))

(assert (=> b!103297 m!150343))

(declare-fun m!150793 () Bool)

(assert (=> bm!1282 m!150793))

(assert (=> b!103093 d!32096))

(declare-datatypes ((tuple2!8460 0))(
  ( (tuple2!8461 (_1!4485 (_ BitVec 64)) (_2!4485 BitStream!3876)) )
))
(declare-fun lt!150900 () tuple2!8460)

(declare-fun d!32162 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3876 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8460)

(assert (=> d!32162 (= lt!150900 (readNLeastSignificantBitsLoop!0 (_1!4478 lt!150373) nBits!396 i!615 lt!150377))))

(assert (=> d!32162 (= (readNLeastSignificantBitsLoopPure!0 (_1!4478 lt!150373) nBits!396 i!615 lt!150377) (tuple2!8449 (_2!4485 lt!150900) (_1!4485 lt!150900)))))

(declare-fun bs!7881 () Bool)

(assert (= bs!7881 d!32162))

(declare-fun m!150795 () Bool)

(assert (=> bs!7881 m!150795))

(assert (=> b!103093 d!32162))

(declare-fun d!32164 () Bool)

(declare-fun e!67584 () Bool)

(assert (=> d!32164 e!67584))

(declare-fun res!84979 () Bool)

(assert (=> d!32164 (=> (not res!84979) (not e!67584))))

(declare-fun lt!150906 () (_ BitVec 64))

(declare-fun lt!150903 () (_ BitVec 64))

(declare-fun lt!150901 () (_ BitVec 64))

(assert (=> d!32164 (= res!84979 (= lt!150906 (bvsub lt!150903 lt!150901)))))

(assert (=> d!32164 (or (= (bvand lt!150903 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!150901 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!150903 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!150903 lt!150901) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32164 (= lt!150901 (remainingBits!0 ((_ sign_extend 32) (size!2201 (buf!2564 (_2!4476 lt!150387)))) ((_ sign_extend 32) (currentByte!5043 (_2!4476 lt!150387))) ((_ sign_extend 32) (currentBit!5038 (_2!4476 lt!150387)))))))

(declare-fun lt!150902 () (_ BitVec 64))

(declare-fun lt!150905 () (_ BitVec 64))

(assert (=> d!32164 (= lt!150903 (bvmul lt!150902 lt!150905))))

(assert (=> d!32164 (or (= lt!150902 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!150905 (bvsdiv (bvmul lt!150902 lt!150905) lt!150902)))))

(assert (=> d!32164 (= lt!150905 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32164 (= lt!150902 ((_ sign_extend 32) (size!2201 (buf!2564 (_2!4476 lt!150387)))))))

(assert (=> d!32164 (= lt!150906 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5043 (_2!4476 lt!150387))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5038 (_2!4476 lt!150387)))))))

(assert (=> d!32164 (invariant!0 (currentBit!5038 (_2!4476 lt!150387)) (currentByte!5043 (_2!4476 lt!150387)) (size!2201 (buf!2564 (_2!4476 lt!150387))))))

(assert (=> d!32164 (= (bitIndex!0 (size!2201 (buf!2564 (_2!4476 lt!150387))) (currentByte!5043 (_2!4476 lt!150387)) (currentBit!5038 (_2!4476 lt!150387))) lt!150906)))

(declare-fun b!103303 () Bool)

(declare-fun res!84980 () Bool)

(assert (=> b!103303 (=> (not res!84980) (not e!67584))))

(assert (=> b!103303 (= res!84980 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!150906))))

(declare-fun b!103304 () Bool)

(declare-fun lt!150904 () (_ BitVec 64))

(assert (=> b!103304 (= e!67584 (bvsle lt!150906 (bvmul lt!150904 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!103304 (or (= lt!150904 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!150904 #b0000000000000000000000000000000000000000000000000000000000001000) lt!150904)))))

(assert (=> b!103304 (= lt!150904 ((_ sign_extend 32) (size!2201 (buf!2564 (_2!4476 lt!150387)))))))

(assert (= (and d!32164 res!84979) b!103303))

(assert (= (and b!103303 res!84980) b!103304))

(declare-fun m!150797 () Bool)

(assert (=> d!32164 m!150797))

(assert (=> d!32164 m!150483))

(assert (=> b!103090 d!32164))

(declare-fun d!32166 () Bool)

(declare-fun e!67585 () Bool)

(assert (=> d!32166 e!67585))

(declare-fun res!84981 () Bool)

(assert (=> d!32166 (=> (not res!84981) (not e!67585))))

(declare-fun lt!150912 () (_ BitVec 64))

(declare-fun lt!150909 () (_ BitVec 64))

(declare-fun lt!150907 () (_ BitVec 64))

(assert (=> d!32166 (= res!84981 (= lt!150912 (bvsub lt!150909 lt!150907)))))

(assert (=> d!32166 (or (= (bvand lt!150909 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!150907 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!150909 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!150909 lt!150907) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32166 (= lt!150907 (remainingBits!0 ((_ sign_extend 32) (size!2201 (buf!2564 thiss!1305))) ((_ sign_extend 32) (currentByte!5043 thiss!1305)) ((_ sign_extend 32) (currentBit!5038 thiss!1305))))))

(declare-fun lt!150908 () (_ BitVec 64))

(declare-fun lt!150911 () (_ BitVec 64))

(assert (=> d!32166 (= lt!150909 (bvmul lt!150908 lt!150911))))

(assert (=> d!32166 (or (= lt!150908 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!150911 (bvsdiv (bvmul lt!150908 lt!150911) lt!150908)))))

(assert (=> d!32166 (= lt!150911 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32166 (= lt!150908 ((_ sign_extend 32) (size!2201 (buf!2564 thiss!1305))))))

(assert (=> d!32166 (= lt!150912 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5043 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5038 thiss!1305))))))

(assert (=> d!32166 (invariant!0 (currentBit!5038 thiss!1305) (currentByte!5043 thiss!1305) (size!2201 (buf!2564 thiss!1305)))))

(assert (=> d!32166 (= (bitIndex!0 (size!2201 (buf!2564 thiss!1305)) (currentByte!5043 thiss!1305) (currentBit!5038 thiss!1305)) lt!150912)))

(declare-fun b!103305 () Bool)

(declare-fun res!84982 () Bool)

(assert (=> b!103305 (=> (not res!84982) (not e!67585))))

(assert (=> b!103305 (= res!84982 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!150912))))

(declare-fun b!103306 () Bool)

(declare-fun lt!150910 () (_ BitVec 64))

(assert (=> b!103306 (= e!67585 (bvsle lt!150912 (bvmul lt!150910 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!103306 (or (= lt!150910 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!150910 #b0000000000000000000000000000000000000000000000000000000000001000) lt!150910)))))

(assert (=> b!103306 (= lt!150910 ((_ sign_extend 32) (size!2201 (buf!2564 thiss!1305))))))

(assert (= (and d!32166 res!84981) b!103305))

(assert (= (and b!103305 res!84982) b!103306))

(assert (=> d!32166 m!150475))

(assert (=> d!32166 m!150477))

(assert (=> b!103090 d!32166))

(check-sat (not d!32040) (not b!103299) (not b!103301) (not d!32078) (not b!103291) (not b!103195) (not b!103171) (not bm!1282) (not b!103302) (not d!32086) (not b!103154) (not b!103297) (not d!32050) (not d!32080) (not b!103294) (not b!103293) (not b!103173) (not b!103187) (not d!32092) (not b!103185) (not d!32164) (not b!103149) (not b!103191) (not d!32048) (not b!103170) (not d!32068) (not b!103292) (not d!32076) (not d!32082) (not d!32074) (not b!103300) (not b!103151) (not b!103190) (not d!32088) (not d!32162) (not b!103197) (not b!103193) (not d!32058) (not b!103184) (not b!103194) (not d!32066) (not d!32056) (not b!103174) (not d!32090) (not d!32084) (not d!32042) (not d!32072) (not d!32166) (not d!32070) (not b!103186))
(check-sat)
