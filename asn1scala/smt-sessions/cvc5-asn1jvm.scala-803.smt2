; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23324 () Bool)

(assert start!23324)

(declare-fun b!118344 () Bool)

(declare-fun e!77555 () Bool)

(declare-fun e!77554 () Bool)

(assert (=> b!118344 (= e!77555 e!77554)))

(declare-fun res!97919 () Bool)

(assert (=> b!118344 (=> (not res!97919) (not e!77554))))

(declare-fun lt!182036 () (_ BitVec 64))

(declare-fun lt!182051 () (_ BitVec 64))

(assert (=> b!118344 (= res!97919 (= lt!182036 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!182051)))))

(declare-datatypes ((array!5309 0))(
  ( (array!5310 (arr!3000 (Array (_ BitVec 32) (_ BitVec 8))) (size!2407 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4288 0))(
  ( (BitStream!4289 (buf!2826 array!5309) (currentByte!5481 (_ BitVec 32)) (currentBit!5476 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!7285 0))(
  ( (Unit!7286) )
))
(declare-datatypes ((tuple2!9892 0))(
  ( (tuple2!9893 (_1!5211 Unit!7285) (_2!5211 BitStream!4288)) )
))
(declare-fun lt!182035 () tuple2!9892)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!118344 (= lt!182036 (bitIndex!0 (size!2407 (buf!2826 (_2!5211 lt!182035))) (currentByte!5481 (_2!5211 lt!182035)) (currentBit!5476 (_2!5211 lt!182035))))))

(declare-fun thiss!1305 () BitStream!4288)

(assert (=> b!118344 (= lt!182051 (bitIndex!0 (size!2407 (buf!2826 thiss!1305)) (currentByte!5481 thiss!1305) (currentBit!5476 thiss!1305)))))

(declare-fun b!118345 () Bool)

(declare-fun e!77552 () Bool)

(declare-fun lt!182050 () (_ BitVec 64))

(declare-fun lt!182039 () (_ BitVec 64))

(assert (=> b!118345 (= e!77552 (= (bvand lt!182050 lt!182039) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!118346 () Bool)

(declare-fun e!77556 () Bool)

(declare-datatypes ((tuple2!9894 0))(
  ( (tuple2!9895 (_1!5212 BitStream!4288) (_2!5212 Bool)) )
))
(declare-fun lt!182046 () tuple2!9894)

(assert (=> b!118346 (= e!77556 (= (bitIndex!0 (size!2407 (buf!2826 (_1!5212 lt!182046))) (currentByte!5481 (_1!5212 lt!182046)) (currentBit!5476 (_1!5212 lt!182046))) lt!182036))))

(declare-fun b!118347 () Bool)

(declare-fun res!97929 () Bool)

(assert (=> b!118347 (=> (not res!97929) (not e!77554))))

(declare-fun isPrefixOf!0 (BitStream!4288 BitStream!4288) Bool)

(assert (=> b!118347 (= res!97929 (isPrefixOf!0 thiss!1305 (_2!5211 lt!182035)))))

(declare-fun b!118348 () Bool)

(declare-fun res!97928 () Bool)

(declare-fun e!77553 () Bool)

(assert (=> b!118348 (=> (not res!97928) (not e!77553))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!118348 (= res!97928 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!118349 () Bool)

(declare-fun res!97926 () Bool)

(assert (=> b!118349 (=> res!97926 e!77552)))

(declare-datatypes ((tuple2!9896 0))(
  ( (tuple2!9897 (_1!5213 BitStream!4288) (_2!5213 BitStream!4288)) )
))
(declare-fun lt!182034 () tuple2!9896)

(declare-fun lt!182040 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!118349 (= res!97926 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2407 (buf!2826 (_1!5213 lt!182034)))) ((_ sign_extend 32) (currentByte!5481 (_1!5213 lt!182034))) ((_ sign_extend 32) (currentBit!5476 (_1!5213 lt!182034))) lt!182040)))))

(declare-fun b!118350 () Bool)

(declare-fun e!77551 () Bool)

(declare-fun lt!182043 () tuple2!9892)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!118350 (= e!77551 (invariant!0 (currentBit!5476 thiss!1305) (currentByte!5481 thiss!1305) (size!2407 (buf!2826 (_2!5211 lt!182043)))))))

(declare-fun b!118351 () Bool)

(declare-fun e!77558 () Bool)

(assert (=> b!118351 (= e!77558 e!77553)))

(declare-fun res!97925 () Bool)

(assert (=> b!118351 (=> (not res!97925) (not e!77553))))

(assert (=> b!118351 (= res!97925 (validate_offset_bits!1 ((_ sign_extend 32) (size!2407 (buf!2826 thiss!1305))) ((_ sign_extend 32) (currentByte!5481 thiss!1305)) ((_ sign_extend 32) (currentBit!5476 thiss!1305)) lt!182040))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!118351 (= lt!182040 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!118352 () Bool)

(declare-fun res!97924 () Bool)

(assert (=> b!118352 (=> (not res!97924) (not e!77553))))

(assert (=> b!118352 (= res!97924 (bvslt i!615 nBits!396))))

(declare-fun b!118353 () Bool)

(declare-fun res!97917 () Bool)

(assert (=> b!118353 (=> (not res!97917) (not e!77551))))

(assert (=> b!118353 (= res!97917 (invariant!0 (currentBit!5476 thiss!1305) (currentByte!5481 thiss!1305) (size!2407 (buf!2826 (_2!5211 lt!182035)))))))

(declare-fun res!97921 () Bool)

(assert (=> start!23324 (=> (not res!97921) (not e!77558))))

(assert (=> start!23324 (= res!97921 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23324 e!77558))

(assert (=> start!23324 true))

(declare-fun e!77559 () Bool)

(declare-fun inv!12 (BitStream!4288) Bool)

(assert (=> start!23324 (and (inv!12 thiss!1305) e!77559)))

(declare-fun b!118354 () Bool)

(assert (=> b!118354 (= e!77553 (not e!77552))))

(declare-fun res!97923 () Bool)

(assert (=> b!118354 (=> res!97923 e!77552)))

(declare-fun lt!182047 () tuple2!9896)

(declare-fun lt!182042 () (_ BitVec 64))

(declare-fun lt!182031 () tuple2!9894)

(declare-datatypes ((tuple2!9898 0))(
  ( (tuple2!9899 (_1!5214 BitStream!4288) (_2!5214 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4288 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9898)

(assert (=> b!118354 (= res!97923 (not (= (_1!5214 (readNLeastSignificantBitsLoopPure!0 (_1!5213 lt!182047) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) (bvor lt!182050 (ite (_2!5212 lt!182031) lt!182042 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5213 lt!182047))))))

(declare-fun lt!182032 () (_ BitVec 64))

(assert (=> b!118354 (validate_offset_bits!1 ((_ sign_extend 32) (size!2407 (buf!2826 (_2!5211 lt!182043)))) ((_ sign_extend 32) (currentByte!5481 (_2!5211 lt!182035))) ((_ sign_extend 32) (currentBit!5476 (_2!5211 lt!182035))) lt!182032)))

(declare-fun lt!182041 () Unit!7285)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4288 array!5309 (_ BitVec 64)) Unit!7285)

(assert (=> b!118354 (= lt!182041 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5211 lt!182035) (buf!2826 (_2!5211 lt!182043)) lt!182032))))

(assert (=> b!118354 (= lt!182032 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!182048 () tuple2!9898)

(assert (=> b!118354 (= lt!182048 (readNLeastSignificantBitsLoopPure!0 (_1!5213 lt!182034) nBits!396 i!615 lt!182050))))

(assert (=> b!118354 (validate_offset_bits!1 ((_ sign_extend 32) (size!2407 (buf!2826 (_2!5211 lt!182043)))) ((_ sign_extend 32) (currentByte!5481 thiss!1305)) ((_ sign_extend 32) (currentBit!5476 thiss!1305)) lt!182040)))

(declare-fun lt!182049 () Unit!7285)

(assert (=> b!118354 (= lt!182049 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2826 (_2!5211 lt!182043)) lt!182040))))

(assert (=> b!118354 (= lt!182050 (bvand v!199 (bvnot lt!182039)))))

(assert (=> b!118354 (= lt!182039 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(declare-fun lt!182038 () Bool)

(assert (=> b!118354 (= (_2!5212 lt!182031) lt!182038)))

(declare-fun readBitPure!0 (BitStream!4288) tuple2!9894)

(assert (=> b!118354 (= lt!182031 (readBitPure!0 (_1!5213 lt!182034)))))

(declare-fun reader!0 (BitStream!4288 BitStream!4288) tuple2!9896)

(assert (=> b!118354 (= lt!182047 (reader!0 (_2!5211 lt!182035) (_2!5211 lt!182043)))))

(assert (=> b!118354 (= lt!182034 (reader!0 thiss!1305 (_2!5211 lt!182043)))))

(declare-fun e!77550 () Bool)

(assert (=> b!118354 e!77550))

(declare-fun res!97920 () Bool)

(assert (=> b!118354 (=> (not res!97920) (not e!77550))))

(declare-fun lt!182033 () tuple2!9894)

(declare-fun lt!182044 () tuple2!9894)

(assert (=> b!118354 (= res!97920 (= (bitIndex!0 (size!2407 (buf!2826 (_1!5212 lt!182033))) (currentByte!5481 (_1!5212 lt!182033)) (currentBit!5476 (_1!5212 lt!182033))) (bitIndex!0 (size!2407 (buf!2826 (_1!5212 lt!182044))) (currentByte!5481 (_1!5212 lt!182044)) (currentBit!5476 (_1!5212 lt!182044)))))))

(declare-fun lt!182052 () Unit!7285)

(declare-fun lt!182037 () BitStream!4288)

(declare-fun readBitPrefixLemma!0 (BitStream!4288 BitStream!4288) Unit!7285)

(assert (=> b!118354 (= lt!182052 (readBitPrefixLemma!0 lt!182037 (_2!5211 lt!182043)))))

(assert (=> b!118354 (= lt!182044 (readBitPure!0 (BitStream!4289 (buf!2826 (_2!5211 lt!182043)) (currentByte!5481 thiss!1305) (currentBit!5476 thiss!1305))))))

(assert (=> b!118354 (= lt!182033 (readBitPure!0 lt!182037))))

(assert (=> b!118354 (= lt!182037 (BitStream!4289 (buf!2826 (_2!5211 lt!182035)) (currentByte!5481 thiss!1305) (currentBit!5476 thiss!1305)))))

(assert (=> b!118354 e!77551))

(declare-fun res!97922 () Bool)

(assert (=> b!118354 (=> (not res!97922) (not e!77551))))

(assert (=> b!118354 (= res!97922 (isPrefixOf!0 thiss!1305 (_2!5211 lt!182043)))))

(declare-fun lt!182045 () Unit!7285)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4288 BitStream!4288 BitStream!4288) Unit!7285)

(assert (=> b!118354 (= lt!182045 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5211 lt!182035) (_2!5211 lt!182043)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4288 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9892)

(assert (=> b!118354 (= lt!182043 (appendNLeastSignificantBitsLoop!0 (_2!5211 lt!182035) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!118354 e!77555))

(declare-fun res!97918 () Bool)

(assert (=> b!118354 (=> (not res!97918) (not e!77555))))

(assert (=> b!118354 (= res!97918 (= (size!2407 (buf!2826 thiss!1305)) (size!2407 (buf!2826 (_2!5211 lt!182035)))))))

(declare-fun appendBit!0 (BitStream!4288 Bool) tuple2!9892)

(assert (=> b!118354 (= lt!182035 (appendBit!0 thiss!1305 lt!182038))))

(assert (=> b!118354 (= lt!182038 (not (= (bvand v!199 lt!182042) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118354 (= lt!182042 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!118355 () Bool)

(assert (=> b!118355 (= e!77550 (= (_2!5212 lt!182033) (_2!5212 lt!182044)))))

(declare-fun b!118356 () Bool)

(declare-fun array_inv!2209 (array!5309) Bool)

(assert (=> b!118356 (= e!77559 (array_inv!2209 (buf!2826 thiss!1305)))))

(declare-fun b!118357 () Bool)

(assert (=> b!118357 (= e!77554 e!77556)))

(declare-fun res!97927 () Bool)

(assert (=> b!118357 (=> (not res!97927) (not e!77556))))

(assert (=> b!118357 (= res!97927 (and (= (_2!5212 lt!182046) lt!182038) (= (_1!5212 lt!182046) (_2!5211 lt!182035))))))

(declare-fun readerFrom!0 (BitStream!4288 (_ BitVec 32) (_ BitVec 32)) BitStream!4288)

(assert (=> b!118357 (= lt!182046 (readBitPure!0 (readerFrom!0 (_2!5211 lt!182035) (currentBit!5476 thiss!1305) (currentByte!5481 thiss!1305))))))

(assert (= (and start!23324 res!97921) b!118351))

(assert (= (and b!118351 res!97925) b!118348))

(assert (= (and b!118348 res!97928) b!118352))

(assert (= (and b!118352 res!97924) b!118354))

(assert (= (and b!118354 res!97918) b!118344))

(assert (= (and b!118344 res!97919) b!118347))

(assert (= (and b!118347 res!97929) b!118357))

(assert (= (and b!118357 res!97927) b!118346))

(assert (= (and b!118354 res!97922) b!118353))

(assert (= (and b!118353 res!97917) b!118350))

(assert (= (and b!118354 res!97920) b!118355))

(assert (= (and b!118354 (not res!97923)) b!118349))

(assert (= (and b!118349 (not res!97926)) b!118345))

(assert (= start!23324 b!118356))

(declare-fun m!177773 () Bool)

(assert (=> b!118348 m!177773))

(declare-fun m!177775 () Bool)

(assert (=> b!118346 m!177775))

(declare-fun m!177777 () Bool)

(assert (=> b!118354 m!177777))

(declare-fun m!177779 () Bool)

(assert (=> b!118354 m!177779))

(declare-fun m!177781 () Bool)

(assert (=> b!118354 m!177781))

(declare-fun m!177783 () Bool)

(assert (=> b!118354 m!177783))

(declare-fun m!177785 () Bool)

(assert (=> b!118354 m!177785))

(declare-fun m!177787 () Bool)

(assert (=> b!118354 m!177787))

(declare-fun m!177789 () Bool)

(assert (=> b!118354 m!177789))

(declare-fun m!177791 () Bool)

(assert (=> b!118354 m!177791))

(declare-fun m!177793 () Bool)

(assert (=> b!118354 m!177793))

(declare-fun m!177795 () Bool)

(assert (=> b!118354 m!177795))

(declare-fun m!177797 () Bool)

(assert (=> b!118354 m!177797))

(declare-fun m!177799 () Bool)

(assert (=> b!118354 m!177799))

(declare-fun m!177801 () Bool)

(assert (=> b!118354 m!177801))

(declare-fun m!177803 () Bool)

(assert (=> b!118354 m!177803))

(declare-fun m!177805 () Bool)

(assert (=> b!118354 m!177805))

(declare-fun m!177807 () Bool)

(assert (=> b!118354 m!177807))

(declare-fun m!177809 () Bool)

(assert (=> b!118354 m!177809))

(declare-fun m!177811 () Bool)

(assert (=> b!118354 m!177811))

(declare-fun m!177813 () Bool)

(assert (=> b!118354 m!177813))

(declare-fun m!177815 () Bool)

(assert (=> b!118353 m!177815))

(declare-fun m!177817 () Bool)

(assert (=> b!118347 m!177817))

(declare-fun m!177819 () Bool)

(assert (=> b!118356 m!177819))

(declare-fun m!177821 () Bool)

(assert (=> b!118344 m!177821))

(declare-fun m!177823 () Bool)

(assert (=> b!118344 m!177823))

(declare-fun m!177825 () Bool)

(assert (=> b!118350 m!177825))

(declare-fun m!177827 () Bool)

(assert (=> b!118349 m!177827))

(declare-fun m!177829 () Bool)

(assert (=> start!23324 m!177829))

(declare-fun m!177831 () Bool)

(assert (=> b!118351 m!177831))

(declare-fun m!177833 () Bool)

(assert (=> b!118357 m!177833))

(assert (=> b!118357 m!177833))

(declare-fun m!177835 () Bool)

(assert (=> b!118357 m!177835))

(push 1)

(assert (not b!118354))

(assert (not b!118356))

(assert (not b!118351))

(assert (not b!118346))

(assert (not b!118357))

(assert (not b!118344))

(assert (not b!118349))

(assert (not b!118353))

(assert (not b!118348))

(assert (not start!23324))

(assert (not b!118350))

(assert (not b!118347))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

