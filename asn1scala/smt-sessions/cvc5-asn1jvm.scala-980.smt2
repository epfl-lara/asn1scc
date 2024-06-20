; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27468 () Bool)

(assert start!27468)

(declare-fun b!141348 () Bool)

(declare-fun res!117902 () Bool)

(declare-fun e!94168 () Bool)

(assert (=> b!141348 (=> (not res!117902) (not e!94168))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!141348 (= res!117902 (bvslt from!447 to!404))))

(declare-fun b!141349 () Bool)

(declare-datatypes ((array!6483 0))(
  ( (array!6484 (arr!3642 (Array (_ BitVec 32) (_ BitVec 8))) (size!2935 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5128 0))(
  ( (BitStream!5129 (buf!3356 array!6483) (currentByte!6216 (_ BitVec 32)) (currentBit!6211 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8852 0))(
  ( (Unit!8853) )
))
(declare-datatypes ((tuple2!12496 0))(
  ( (tuple2!12497 (_1!6578 Unit!8852) (_2!6578 BitStream!5128)) )
))
(declare-fun lt!219452 () tuple2!12496)

(declare-fun lt!219454 () tuple2!12496)

(declare-fun isPrefixOf!0 (BitStream!5128 BitStream!5128) Bool)

(assert (=> b!141349 (= e!94168 (not (isPrefixOf!0 (_2!6578 lt!219452) (_2!6578 lt!219454))))))

(declare-fun lt!219449 () Bool)

(declare-fun thiss!1634 () BitStream!5128)

(assert (=> b!141349 (= lt!219449 (isPrefixOf!0 thiss!1634 (_2!6578 lt!219452)))))

(declare-fun e!94173 () Bool)

(assert (=> b!141349 e!94173))

(declare-fun res!117899 () Bool)

(assert (=> b!141349 (=> (not res!117899) (not e!94173))))

(assert (=> b!141349 (= res!117899 (= (size!2935 (buf!3356 (_2!6578 lt!219452))) (size!2935 (buf!3356 (_2!6578 lt!219454)))))))

(declare-fun arr!237 () array!6483)

(declare-fun appendByteArrayLoop!0 (BitStream!5128 array!6483 (_ BitVec 32) (_ BitVec 32)) tuple2!12496)

(assert (=> b!141349 (= lt!219454 (appendByteArrayLoop!0 (_2!6578 lt!219452) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!141349 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2935 (buf!3356 (_2!6578 lt!219452)))) ((_ sign_extend 32) (currentByte!6216 (_2!6578 lt!219452))) ((_ sign_extend 32) (currentBit!6211 (_2!6578 lt!219452))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!219457 () Unit!8852)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5128 BitStream!5128 (_ BitVec 64) (_ BitVec 32)) Unit!8852)

(assert (=> b!141349 (= lt!219457 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6578 lt!219452) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!94167 () Bool)

(assert (=> b!141349 e!94167))

(declare-fun res!117904 () Bool)

(assert (=> b!141349 (=> (not res!117904) (not e!94167))))

(assert (=> b!141349 (= res!117904 (= (size!2935 (buf!3356 thiss!1634)) (size!2935 (buf!3356 (_2!6578 lt!219452)))))))

(declare-fun appendByte!0 (BitStream!5128 (_ BitVec 8)) tuple2!12496)

(assert (=> b!141349 (= lt!219452 (appendByte!0 thiss!1634 (select (arr!3642 arr!237) from!447)))))

(declare-fun b!141350 () Bool)

(declare-fun res!117897 () Bool)

(assert (=> b!141350 (=> (not res!117897) (not e!94167))))

(assert (=> b!141350 (= res!117897 (isPrefixOf!0 thiss!1634 (_2!6578 lt!219452)))))

(declare-fun b!141351 () Bool)

(declare-fun e!94171 () Bool)

(assert (=> b!141351 (= e!94173 e!94171)))

(declare-fun res!117903 () Bool)

(assert (=> b!141351 (=> (not res!117903) (not e!94171))))

(declare-fun lt!219456 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!141351 (= res!117903 (= (bitIndex!0 (size!2935 (buf!3356 (_2!6578 lt!219454))) (currentByte!6216 (_2!6578 lt!219454)) (currentBit!6211 (_2!6578 lt!219454))) (bvadd (bitIndex!0 (size!2935 (buf!3356 (_2!6578 lt!219452))) (currentByte!6216 (_2!6578 lt!219452)) (currentBit!6211 (_2!6578 lt!219452))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!219456))))))

(assert (=> b!141351 (= lt!219456 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!141352 () Bool)

(declare-fun e!94166 () Bool)

(assert (=> b!141352 (= e!94171 (not e!94166))))

(declare-fun res!117901 () Bool)

(assert (=> b!141352 (=> res!117901 e!94166)))

(declare-datatypes ((tuple2!12498 0))(
  ( (tuple2!12499 (_1!6579 BitStream!5128) (_2!6579 BitStream!5128)) )
))
(declare-fun lt!219458 () tuple2!12498)

(declare-datatypes ((tuple2!12500 0))(
  ( (tuple2!12501 (_1!6580 BitStream!5128) (_2!6580 array!6483)) )
))
(declare-fun lt!219453 () tuple2!12500)

(assert (=> b!141352 (= res!117901 (or (not (= (size!2935 (_2!6580 lt!219453)) (size!2935 arr!237))) (not (= (_1!6580 lt!219453) (_2!6579 lt!219458)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5128 array!6483 (_ BitVec 32) (_ BitVec 32)) tuple2!12500)

(assert (=> b!141352 (= lt!219453 (readByteArrayLoopPure!0 (_1!6579 lt!219458) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!141352 (validate_offset_bits!1 ((_ sign_extend 32) (size!2935 (buf!3356 (_2!6578 lt!219454)))) ((_ sign_extend 32) (currentByte!6216 (_2!6578 lt!219452))) ((_ sign_extend 32) (currentBit!6211 (_2!6578 lt!219452))) lt!219456)))

(declare-fun lt!219450 () Unit!8852)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5128 array!6483 (_ BitVec 64)) Unit!8852)

(assert (=> b!141352 (= lt!219450 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6578 lt!219452) (buf!3356 (_2!6578 lt!219454)) lt!219456))))

(declare-fun reader!0 (BitStream!5128 BitStream!5128) tuple2!12498)

(assert (=> b!141352 (= lt!219458 (reader!0 (_2!6578 lt!219452) (_2!6578 lt!219454)))))

(declare-fun res!117900 () Bool)

(assert (=> start!27468 (=> (not res!117900) (not e!94168))))

(assert (=> start!27468 (= res!117900 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2935 arr!237))))))

(assert (=> start!27468 e!94168))

(assert (=> start!27468 true))

(declare-fun array_inv!2724 (array!6483) Bool)

(assert (=> start!27468 (array_inv!2724 arr!237)))

(declare-fun e!94169 () Bool)

(declare-fun inv!12 (BitStream!5128) Bool)

(assert (=> start!27468 (and (inv!12 thiss!1634) e!94169)))

(declare-fun b!141353 () Bool)

(declare-fun arrayRangesEq!251 (array!6483 array!6483 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141353 (= e!94166 (not (arrayRangesEq!251 arr!237 (_2!6580 lt!219453) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!141354 () Bool)

(declare-fun res!117896 () Bool)

(assert (=> b!141354 (=> (not res!117896) (not e!94168))))

(assert (=> b!141354 (= res!117896 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2935 (buf!3356 thiss!1634))) ((_ sign_extend 32) (currentByte!6216 thiss!1634)) ((_ sign_extend 32) (currentBit!6211 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!141355 () Bool)

(assert (=> b!141355 (= e!94169 (array_inv!2724 (buf!3356 thiss!1634)))))

(declare-fun b!141356 () Bool)

(declare-fun res!117898 () Bool)

(assert (=> b!141356 (=> (not res!117898) (not e!94168))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141356 (= res!117898 (invariant!0 (currentBit!6211 thiss!1634) (currentByte!6216 thiss!1634) (size!2935 (buf!3356 thiss!1634))))))

(declare-datatypes ((tuple2!12502 0))(
  ( (tuple2!12503 (_1!6581 BitStream!5128) (_2!6581 (_ BitVec 8))) )
))
(declare-fun lt!219451 () tuple2!12502)

(declare-fun b!141357 () Bool)

(declare-fun lt!219455 () tuple2!12498)

(assert (=> b!141357 (= e!94167 (and (= (_2!6581 lt!219451) (select (arr!3642 arr!237) from!447)) (= (_1!6581 lt!219451) (_2!6579 lt!219455))))))

(declare-fun readBytePure!0 (BitStream!5128) tuple2!12502)

(assert (=> b!141357 (= lt!219451 (readBytePure!0 (_1!6579 lt!219455)))))

(assert (=> b!141357 (= lt!219455 (reader!0 thiss!1634 (_2!6578 lt!219452)))))

(declare-fun b!141358 () Bool)

(declare-fun res!117894 () Bool)

(assert (=> b!141358 (=> (not res!117894) (not e!94171))))

(assert (=> b!141358 (= res!117894 (isPrefixOf!0 (_2!6578 lt!219452) (_2!6578 lt!219454)))))

(declare-fun b!141359 () Bool)

(declare-fun res!117895 () Bool)

(assert (=> b!141359 (=> (not res!117895) (not e!94167))))

(assert (=> b!141359 (= res!117895 (= (bitIndex!0 (size!2935 (buf!3356 (_2!6578 lt!219452))) (currentByte!6216 (_2!6578 lt!219452)) (currentBit!6211 (_2!6578 lt!219452))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2935 (buf!3356 thiss!1634)) (currentByte!6216 thiss!1634) (currentBit!6211 thiss!1634)))))))

(assert (= (and start!27468 res!117900) b!141354))

(assert (= (and b!141354 res!117896) b!141348))

(assert (= (and b!141348 res!117902) b!141356))

(assert (= (and b!141356 res!117898) b!141349))

(assert (= (and b!141349 res!117904) b!141359))

(assert (= (and b!141359 res!117895) b!141350))

(assert (= (and b!141350 res!117897) b!141357))

(assert (= (and b!141349 res!117899) b!141351))

(assert (= (and b!141351 res!117903) b!141358))

(assert (= (and b!141358 res!117894) b!141352))

(assert (= (and b!141352 (not res!117901)) b!141353))

(assert (= start!27468 b!141355))

(declare-fun m!217205 () Bool)

(assert (=> b!141357 m!217205))

(declare-fun m!217207 () Bool)

(assert (=> b!141357 m!217207))

(declare-fun m!217209 () Bool)

(assert (=> b!141357 m!217209))

(declare-fun m!217211 () Bool)

(assert (=> b!141358 m!217211))

(declare-fun m!217213 () Bool)

(assert (=> b!141355 m!217213))

(declare-fun m!217215 () Bool)

(assert (=> b!141352 m!217215))

(declare-fun m!217217 () Bool)

(assert (=> b!141352 m!217217))

(declare-fun m!217219 () Bool)

(assert (=> b!141352 m!217219))

(declare-fun m!217221 () Bool)

(assert (=> b!141352 m!217221))

(declare-fun m!217223 () Bool)

(assert (=> b!141353 m!217223))

(declare-fun m!217225 () Bool)

(assert (=> b!141350 m!217225))

(declare-fun m!217227 () Bool)

(assert (=> start!27468 m!217227))

(declare-fun m!217229 () Bool)

(assert (=> start!27468 m!217229))

(declare-fun m!217231 () Bool)

(assert (=> b!141356 m!217231))

(declare-fun m!217233 () Bool)

(assert (=> b!141351 m!217233))

(declare-fun m!217235 () Bool)

(assert (=> b!141351 m!217235))

(declare-fun m!217237 () Bool)

(assert (=> b!141354 m!217237))

(assert (=> b!141359 m!217235))

(declare-fun m!217239 () Bool)

(assert (=> b!141359 m!217239))

(declare-fun m!217241 () Bool)

(assert (=> b!141349 m!217241))

(assert (=> b!141349 m!217225))

(assert (=> b!141349 m!217205))

(declare-fun m!217243 () Bool)

(assert (=> b!141349 m!217243))

(assert (=> b!141349 m!217205))

(declare-fun m!217245 () Bool)

(assert (=> b!141349 m!217245))

(declare-fun m!217247 () Bool)

(assert (=> b!141349 m!217247))

(assert (=> b!141349 m!217211))

(push 1)

(assert (not b!141356))

(assert (not b!141352))

(assert (not b!141351))

(assert (not b!141350))

(assert (not b!141355))

(assert (not b!141349))

(assert (not start!27468))

(assert (not b!141359))

(assert (not b!141357))

(assert (not b!141358))

