; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22866 () Bool)

(assert start!22866)

(declare-fun b!115526 () Bool)

(declare-fun e!75716 () Bool)

(declare-fun e!75722 () Bool)

(assert (=> b!115526 (= e!75716 e!75722)))

(declare-fun res!95477 () Bool)

(assert (=> b!115526 (=> (not res!95477) (not e!75722))))

(declare-datatypes ((array!5211 0))(
  ( (array!5212 (arr!2957 (Array (_ BitVec 32) (_ BitVec 8))) (size!2364 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4202 0))(
  ( (BitStream!4203 (buf!2774 array!5211) (currentByte!5402 (_ BitVec 32)) (currentBit!5397 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!7109 0))(
  ( (Unit!7110) )
))
(declare-datatypes ((tuple2!9520 0))(
  ( (tuple2!9521 (_1!5025 Unit!7109) (_2!5025 BitStream!4202)) )
))
(declare-fun lt!176311 () tuple2!9520)

(declare-fun lt!176317 () Bool)

(declare-datatypes ((tuple2!9522 0))(
  ( (tuple2!9523 (_1!5026 BitStream!4202) (_2!5026 Bool)) )
))
(declare-fun lt!176322 () tuple2!9522)

(assert (=> b!115526 (= res!95477 (and (= (_2!5026 lt!176322) lt!176317) (= (_1!5026 lt!176322) (_2!5025 lt!176311))))))

(declare-fun thiss!1305 () BitStream!4202)

(declare-fun readBitPure!0 (BitStream!4202) tuple2!9522)

(declare-fun readerFrom!0 (BitStream!4202 (_ BitVec 32) (_ BitVec 32)) BitStream!4202)

(assert (=> b!115526 (= lt!176322 (readBitPure!0 (readerFrom!0 (_2!5025 lt!176311) (currentBit!5397 thiss!1305) (currentByte!5402 thiss!1305))))))

(declare-fun b!115527 () Bool)

(declare-fun res!95472 () Bool)

(declare-fun e!75720 () Bool)

(assert (=> b!115527 (=> (not res!95472) (not e!75720))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!115527 (= res!95472 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!115528 () Bool)

(declare-fun e!75723 () Bool)

(declare-fun array_inv!2166 (array!5211) Bool)

(assert (=> b!115528 (= e!75723 (array_inv!2166 (buf!2774 thiss!1305)))))

(declare-fun b!115529 () Bool)

(declare-fun e!75717 () Bool)

(assert (=> b!115529 (= e!75717 e!75716)))

(declare-fun res!95478 () Bool)

(assert (=> b!115529 (=> (not res!95478) (not e!75716))))

(declare-fun lt!176310 () (_ BitVec 64))

(declare-fun lt!176314 () (_ BitVec 64))

(assert (=> b!115529 (= res!95478 (= lt!176310 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!176314)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!115529 (= lt!176310 (bitIndex!0 (size!2364 (buf!2774 (_2!5025 lt!176311))) (currentByte!5402 (_2!5025 lt!176311)) (currentBit!5397 (_2!5025 lt!176311))))))

(assert (=> b!115529 (= lt!176314 (bitIndex!0 (size!2364 (buf!2774 thiss!1305)) (currentByte!5402 thiss!1305) (currentBit!5397 thiss!1305)))))

(declare-fun res!95470 () Bool)

(assert (=> start!22866 (=> (not res!95470) (not e!75720))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> start!22866 (= res!95470 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22866 e!75720))

(assert (=> start!22866 true))

(declare-fun inv!12 (BitStream!4202) Bool)

(assert (=> start!22866 (and (inv!12 thiss!1305) e!75723)))

(declare-fun b!115530 () Bool)

(declare-fun e!75718 () Bool)

(declare-fun lt!176319 () tuple2!9520)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!115530 (= e!75718 (invariant!0 (currentBit!5397 thiss!1305) (currentByte!5402 thiss!1305) (size!2364 (buf!2774 (_2!5025 lt!176319)))))))

(declare-fun b!115531 () Bool)

(declare-fun res!95471 () Bool)

(assert (=> b!115531 (=> (not res!95471) (not e!75718))))

(assert (=> b!115531 (= res!95471 (invariant!0 (currentBit!5397 thiss!1305) (currentByte!5402 thiss!1305) (size!2364 (buf!2774 (_2!5025 lt!176311)))))))

(declare-fun b!115532 () Bool)

(assert (=> b!115532 (= e!75720 (not (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!9524 0))(
  ( (tuple2!9525 (_1!5027 BitStream!4202) (_2!5027 BitStream!4202)) )
))
(declare-fun lt!176321 () tuple2!9524)

(assert (=> b!115532 (= (_2!5026 (readBitPure!0 (_1!5027 lt!176321))) lt!176317)))

(declare-fun lt!176316 () tuple2!9524)

(declare-fun reader!0 (BitStream!4202 BitStream!4202) tuple2!9524)

(assert (=> b!115532 (= lt!176316 (reader!0 (_2!5025 lt!176311) (_2!5025 lt!176319)))))

(assert (=> b!115532 (= lt!176321 (reader!0 thiss!1305 (_2!5025 lt!176319)))))

(declare-fun e!75719 () Bool)

(assert (=> b!115532 e!75719))

(declare-fun res!95475 () Bool)

(assert (=> b!115532 (=> (not res!95475) (not e!75719))))

(declare-fun lt!176320 () tuple2!9522)

(declare-fun lt!176318 () tuple2!9522)

(assert (=> b!115532 (= res!95475 (= (bitIndex!0 (size!2364 (buf!2774 (_1!5026 lt!176320))) (currentByte!5402 (_1!5026 lt!176320)) (currentBit!5397 (_1!5026 lt!176320))) (bitIndex!0 (size!2364 (buf!2774 (_1!5026 lt!176318))) (currentByte!5402 (_1!5026 lt!176318)) (currentBit!5397 (_1!5026 lt!176318)))))))

(declare-fun lt!176315 () Unit!7109)

(declare-fun lt!176312 () BitStream!4202)

(declare-fun readBitPrefixLemma!0 (BitStream!4202 BitStream!4202) Unit!7109)

(assert (=> b!115532 (= lt!176315 (readBitPrefixLemma!0 lt!176312 (_2!5025 lt!176319)))))

(assert (=> b!115532 (= lt!176318 (readBitPure!0 (BitStream!4203 (buf!2774 (_2!5025 lt!176319)) (currentByte!5402 thiss!1305) (currentBit!5397 thiss!1305))))))

(assert (=> b!115532 (= lt!176320 (readBitPure!0 lt!176312))))

(assert (=> b!115532 (= lt!176312 (BitStream!4203 (buf!2774 (_2!5025 lt!176311)) (currentByte!5402 thiss!1305) (currentBit!5397 thiss!1305)))))

(assert (=> b!115532 e!75718))

(declare-fun res!95468 () Bool)

(assert (=> b!115532 (=> (not res!95468) (not e!75718))))

(declare-fun isPrefixOf!0 (BitStream!4202 BitStream!4202) Bool)

(assert (=> b!115532 (= res!95468 (isPrefixOf!0 thiss!1305 (_2!5025 lt!176319)))))

(declare-fun lt!176313 () Unit!7109)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4202 BitStream!4202 BitStream!4202) Unit!7109)

(assert (=> b!115532 (= lt!176313 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5025 lt!176311) (_2!5025 lt!176319)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4202 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9520)

(assert (=> b!115532 (= lt!176319 (appendNLeastSignificantBitsLoop!0 (_2!5025 lt!176311) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!115532 e!75717))

(declare-fun res!95469 () Bool)

(assert (=> b!115532 (=> (not res!95469) (not e!75717))))

(assert (=> b!115532 (= res!95469 (= (size!2364 (buf!2774 thiss!1305)) (size!2364 (buf!2774 (_2!5025 lt!176311)))))))

(declare-fun appendBit!0 (BitStream!4202 Bool) tuple2!9520)

(assert (=> b!115532 (= lt!176311 (appendBit!0 thiss!1305 lt!176317))))

(assert (=> b!115532 (= lt!176317 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!115533 () Bool)

(declare-fun res!95473 () Bool)

(assert (=> b!115533 (=> (not res!95473) (not e!75720))))

(assert (=> b!115533 (= res!95473 (bvslt i!615 nBits!396))))

(declare-fun b!115534 () Bool)

(assert (=> b!115534 (= e!75719 (= (_2!5026 lt!176320) (_2!5026 lt!176318)))))

(declare-fun b!115535 () Bool)

(declare-fun res!95476 () Bool)

(assert (=> b!115535 (=> (not res!95476) (not e!75716))))

(assert (=> b!115535 (= res!95476 (isPrefixOf!0 thiss!1305 (_2!5025 lt!176311)))))

(declare-fun b!115536 () Bool)

(assert (=> b!115536 (= e!75722 (= (bitIndex!0 (size!2364 (buf!2774 (_1!5026 lt!176322))) (currentByte!5402 (_1!5026 lt!176322)) (currentBit!5397 (_1!5026 lt!176322))) lt!176310))))

(declare-fun b!115537 () Bool)

(declare-fun res!95474 () Bool)

(assert (=> b!115537 (=> (not res!95474) (not e!75720))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!115537 (= res!95474 (validate_offset_bits!1 ((_ sign_extend 32) (size!2364 (buf!2774 thiss!1305))) ((_ sign_extend 32) (currentByte!5402 thiss!1305)) ((_ sign_extend 32) (currentBit!5397 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(assert (= (and start!22866 res!95470) b!115537))

(assert (= (and b!115537 res!95474) b!115527))

(assert (= (and b!115527 res!95472) b!115533))

(assert (= (and b!115533 res!95473) b!115532))

(assert (= (and b!115532 res!95469) b!115529))

(assert (= (and b!115529 res!95478) b!115535))

(assert (= (and b!115535 res!95476) b!115526))

(assert (= (and b!115526 res!95477) b!115536))

(assert (= (and b!115532 res!95468) b!115531))

(assert (= (and b!115531 res!95471) b!115530))

(assert (= (and b!115532 res!95475) b!115534))

(assert (= start!22866 b!115528))

(declare-fun m!172907 () Bool)

(assert (=> b!115526 m!172907))

(assert (=> b!115526 m!172907))

(declare-fun m!172909 () Bool)

(assert (=> b!115526 m!172909))

(declare-fun m!172911 () Bool)

(assert (=> b!115529 m!172911))

(declare-fun m!172913 () Bool)

(assert (=> b!115529 m!172913))

(declare-fun m!172915 () Bool)

(assert (=> b!115531 m!172915))

(declare-fun m!172917 () Bool)

(assert (=> b!115530 m!172917))

(declare-fun m!172919 () Bool)

(assert (=> b!115535 m!172919))

(declare-fun m!172921 () Bool)

(assert (=> b!115528 m!172921))

(declare-fun m!172923 () Bool)

(assert (=> b!115532 m!172923))

(declare-fun m!172925 () Bool)

(assert (=> b!115532 m!172925))

(declare-fun m!172927 () Bool)

(assert (=> b!115532 m!172927))

(declare-fun m!172929 () Bool)

(assert (=> b!115532 m!172929))

(declare-fun m!172931 () Bool)

(assert (=> b!115532 m!172931))

(declare-fun m!172933 () Bool)

(assert (=> b!115532 m!172933))

(declare-fun m!172935 () Bool)

(assert (=> b!115532 m!172935))

(declare-fun m!172937 () Bool)

(assert (=> b!115532 m!172937))

(declare-fun m!172939 () Bool)

(assert (=> b!115532 m!172939))

(declare-fun m!172941 () Bool)

(assert (=> b!115532 m!172941))

(declare-fun m!172943 () Bool)

(assert (=> b!115532 m!172943))

(declare-fun m!172945 () Bool)

(assert (=> b!115532 m!172945))

(declare-fun m!172947 () Bool)

(assert (=> start!22866 m!172947))

(declare-fun m!172949 () Bool)

(assert (=> b!115536 m!172949))

(declare-fun m!172951 () Bool)

(assert (=> b!115527 m!172951))

(declare-fun m!172953 () Bool)

(assert (=> b!115537 m!172953))

(push 1)

(assert (not b!115536))

(assert (not b!115532))

(assert (not b!115530))

(assert (not b!115531))

(assert (not start!22866))

(assert (not b!115528))

(assert (not b!115527))

(assert (not b!115526))

(assert (not b!115535))

(assert (not b!115529))

(assert (not b!115537))

(check-sat)

(pop 1)

(push 1)

(check-sat)

