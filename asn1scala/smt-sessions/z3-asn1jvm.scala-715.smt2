; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20004 () Bool)

(assert start!20004)

(declare-fun b!99854 () Bool)

(declare-fun e!65352 () Bool)

(assert (=> b!99854 (= e!65352 true)))

(declare-datatypes ((array!4703 0))(
  ( (array!4704 (arr!2740 (Array (_ BitVec 32) (_ BitVec 8))) (size!2147 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3768 0))(
  ( (BitStream!3769 (buf!2504 array!4703) (currentByte!4950 (_ BitVec 32)) (currentBit!4945 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8054 0))(
  ( (tuple2!8055 (_1!4282 BitStream!3768) (_2!4282 Bool)) )
))
(declare-fun lt!144578 () tuple2!8054)

(declare-datatypes ((Unit!6121 0))(
  ( (Unit!6122) )
))
(declare-datatypes ((tuple2!8056 0))(
  ( (tuple2!8057 (_1!4283 Unit!6121) (_2!4283 BitStream!3768)) )
))
(declare-fun lt!144576 () tuple2!8056)

(declare-fun thiss!1305 () BitStream!3768)

(declare-fun readBitPure!0 (BitStream!3768) tuple2!8054)

(assert (=> b!99854 (= lt!144578 (readBitPure!0 (BitStream!3769 (buf!2504 (_2!4283 lt!144576)) (currentByte!4950 thiss!1305) (currentBit!4945 thiss!1305))))))

(declare-fun lt!144580 () tuple2!8054)

(declare-fun lt!144575 () tuple2!8056)

(assert (=> b!99854 (= lt!144580 (readBitPure!0 (BitStream!3769 (buf!2504 (_2!4283 lt!144575)) (currentByte!4950 thiss!1305) (currentBit!4945 thiss!1305))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!99854 (invariant!0 (currentBit!4945 thiss!1305) (currentByte!4950 thiss!1305) (size!2147 (buf!2504 (_2!4283 lt!144576))))))

(declare-fun b!99856 () Bool)

(declare-fun res!81961 () Bool)

(assert (=> b!99856 (=> res!81961 e!65352)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99856 (= res!81961 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!2147 (buf!2504 (_2!4283 lt!144575)))) ((_ sign_extend 32) (currentByte!4950 thiss!1305)) ((_ sign_extend 32) (currentBit!4945 thiss!1305)))))))

(declare-fun b!99857 () Bool)

(declare-fun res!81959 () Bool)

(declare-fun e!65355 () Bool)

(assert (=> b!99857 (=> (not res!81959) (not e!65355))))

(declare-fun isPrefixOf!0 (BitStream!3768 BitStream!3768) Bool)

(assert (=> b!99857 (= res!81959 (isPrefixOf!0 thiss!1305 (_2!4283 lt!144575)))))

(declare-fun b!99858 () Bool)

(declare-fun res!81965 () Bool)

(assert (=> b!99858 (=> res!81965 e!65352)))

(declare-fun arrayBitRangesEq!0 (array!4703 array!4703 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99858 (= res!81965 (not (arrayBitRangesEq!0 (buf!2504 (_2!4283 lt!144575)) (buf!2504 (_2!4283 lt!144576)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2147 (buf!2504 (_2!4283 lt!144575))) (currentByte!4950 thiss!1305) (currentBit!4945 thiss!1305))))))))

(declare-fun b!99859 () Bool)

(declare-fun e!65351 () Bool)

(assert (=> b!99859 (= e!65351 (not e!65352))))

(declare-fun res!81967 () Bool)

(assert (=> b!99859 (=> res!81967 e!65352)))

(assert (=> b!99859 (= res!81967 (not (= (size!2147 (buf!2504 (_2!4283 lt!144575))) (size!2147 (buf!2504 (_2!4283 lt!144576))))))))

(declare-fun e!65358 () Bool)

(assert (=> b!99859 e!65358))

(declare-fun res!81958 () Bool)

(assert (=> b!99859 (=> (not res!81958) (not e!65358))))

(assert (=> b!99859 (= res!81958 (isPrefixOf!0 thiss!1305 (_2!4283 lt!144576)))))

(declare-fun lt!144579 () Unit!6121)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3768 BitStream!3768 BitStream!3768) Unit!6121)

(assert (=> b!99859 (= lt!144579 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4283 lt!144575) (_2!4283 lt!144576)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3768 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8056)

(assert (=> b!99859 (= lt!144576 (appendNLeastSignificantBitsLoop!0 (_2!4283 lt!144575) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!65357 () Bool)

(assert (=> b!99859 e!65357))

(declare-fun res!81964 () Bool)

(assert (=> b!99859 (=> (not res!81964) (not e!65357))))

(assert (=> b!99859 (= res!81964 (= (size!2147 (buf!2504 thiss!1305)) (size!2147 (buf!2504 (_2!4283 lt!144575)))))))

(declare-fun lt!144583 () Bool)

(declare-fun appendBit!0 (BitStream!3768 Bool) tuple2!8056)

(assert (=> b!99859 (= lt!144575 (appendBit!0 thiss!1305 lt!144583))))

(assert (=> b!99859 (= lt!144583 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!99860 () Bool)

(declare-fun e!65353 () Bool)

(declare-fun array_inv!1949 (array!4703) Bool)

(assert (=> b!99860 (= e!65353 (array_inv!1949 (buf!2504 thiss!1305)))))

(declare-fun b!99861 () Bool)

(declare-fun res!81962 () Bool)

(assert (=> b!99861 (=> (not res!81962) (not e!65351))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99861 (= res!81962 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!99862 () Bool)

(assert (=> b!99862 (= e!65358 (invariant!0 (currentBit!4945 thiss!1305) (currentByte!4950 thiss!1305) (size!2147 (buf!2504 (_2!4283 lt!144575)))))))

(declare-fun b!99863 () Bool)

(declare-fun e!65356 () Bool)

(assert (=> b!99863 (= e!65355 e!65356)))

(declare-fun res!81960 () Bool)

(assert (=> b!99863 (=> (not res!81960) (not e!65356))))

(declare-fun lt!144582 () tuple2!8054)

(assert (=> b!99863 (= res!81960 (and (= (_2!4282 lt!144582) lt!144583) (= (_1!4282 lt!144582) (_2!4283 lt!144575))))))

(declare-fun readerFrom!0 (BitStream!3768 (_ BitVec 32) (_ BitVec 32)) BitStream!3768)

(assert (=> b!99863 (= lt!144582 (readBitPure!0 (readerFrom!0 (_2!4283 lt!144575) (currentBit!4945 thiss!1305) (currentByte!4950 thiss!1305))))))

(declare-fun b!99864 () Bool)

(declare-fun lt!144577 () (_ BitVec 64))

(assert (=> b!99864 (= e!65356 (= (bitIndex!0 (size!2147 (buf!2504 (_1!4282 lt!144582))) (currentByte!4950 (_1!4282 lt!144582)) (currentBit!4945 (_1!4282 lt!144582))) lt!144577))))

(declare-fun res!81957 () Bool)

(assert (=> start!20004 (=> (not res!81957) (not e!65351))))

(assert (=> start!20004 (= res!81957 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20004 e!65351))

(assert (=> start!20004 true))

(declare-fun inv!12 (BitStream!3768) Bool)

(assert (=> start!20004 (and (inv!12 thiss!1305) e!65353)))

(declare-fun b!99855 () Bool)

(assert (=> b!99855 (= e!65357 e!65355)))

(declare-fun res!81963 () Bool)

(assert (=> b!99855 (=> (not res!81963) (not e!65355))))

(declare-fun lt!144581 () (_ BitVec 64))

(assert (=> b!99855 (= res!81963 (= lt!144577 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!144581)))))

(assert (=> b!99855 (= lt!144577 (bitIndex!0 (size!2147 (buf!2504 (_2!4283 lt!144575))) (currentByte!4950 (_2!4283 lt!144575)) (currentBit!4945 (_2!4283 lt!144575))))))

(assert (=> b!99855 (= lt!144581 (bitIndex!0 (size!2147 (buf!2504 thiss!1305)) (currentByte!4950 thiss!1305) (currentBit!4945 thiss!1305)))))

(declare-fun b!99865 () Bool)

(declare-fun res!81968 () Bool)

(assert (=> b!99865 (=> (not res!81968) (not e!65351))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99865 (= res!81968 (validate_offset_bits!1 ((_ sign_extend 32) (size!2147 (buf!2504 thiss!1305))) ((_ sign_extend 32) (currentByte!4950 thiss!1305)) ((_ sign_extend 32) (currentBit!4945 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!99866 () Bool)

(declare-fun res!81966 () Bool)

(assert (=> b!99866 (=> (not res!81966) (not e!65351))))

(assert (=> b!99866 (= res!81966 (bvslt i!615 nBits!396))))

(assert (= (and start!20004 res!81957) b!99865))

(assert (= (and b!99865 res!81968) b!99861))

(assert (= (and b!99861 res!81962) b!99866))

(assert (= (and b!99866 res!81966) b!99859))

(assert (= (and b!99859 res!81964) b!99855))

(assert (= (and b!99855 res!81963) b!99857))

(assert (= (and b!99857 res!81959) b!99863))

(assert (= (and b!99863 res!81960) b!99864))

(assert (= (and b!99859 res!81958) b!99862))

(assert (= (and b!99859 (not res!81967)) b!99856))

(assert (= (and b!99856 (not res!81961)) b!99858))

(assert (= (and b!99858 (not res!81965)) b!99854))

(assert (= start!20004 b!99860))

(declare-fun m!145189 () Bool)

(assert (=> b!99859 m!145189))

(declare-fun m!145191 () Bool)

(assert (=> b!99859 m!145191))

(declare-fun m!145193 () Bool)

(assert (=> b!99859 m!145193))

(declare-fun m!145195 () Bool)

(assert (=> b!99859 m!145195))

(declare-fun m!145197 () Bool)

(assert (=> b!99854 m!145197))

(declare-fun m!145199 () Bool)

(assert (=> b!99854 m!145199))

(declare-fun m!145201 () Bool)

(assert (=> b!99854 m!145201))

(declare-fun m!145203 () Bool)

(assert (=> b!99857 m!145203))

(declare-fun m!145205 () Bool)

(assert (=> start!20004 m!145205))

(declare-fun m!145207 () Bool)

(assert (=> b!99863 m!145207))

(assert (=> b!99863 m!145207))

(declare-fun m!145209 () Bool)

(assert (=> b!99863 m!145209))

(declare-fun m!145211 () Bool)

(assert (=> b!99865 m!145211))

(declare-fun m!145213 () Bool)

(assert (=> b!99864 m!145213))

(declare-fun m!145215 () Bool)

(assert (=> b!99862 m!145215))

(declare-fun m!145217 () Bool)

(assert (=> b!99861 m!145217))

(declare-fun m!145219 () Bool)

(assert (=> b!99856 m!145219))

(declare-fun m!145221 () Bool)

(assert (=> b!99858 m!145221))

(declare-fun m!145223 () Bool)

(assert (=> b!99858 m!145223))

(declare-fun m!145225 () Bool)

(assert (=> b!99860 m!145225))

(declare-fun m!145227 () Bool)

(assert (=> b!99855 m!145227))

(declare-fun m!145229 () Bool)

(assert (=> b!99855 m!145229))

(check-sat (not b!99861) (not b!99862) (not b!99863) (not b!99856) (not b!99855) (not b!99857) (not b!99859) (not b!99865) (not start!20004) (not b!99858) (not b!99854) (not b!99864) (not b!99860))
