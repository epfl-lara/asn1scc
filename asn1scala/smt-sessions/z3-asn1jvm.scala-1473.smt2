; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40552 () Bool)

(assert start!40552)

(declare-fun b!186477 () Bool)

(declare-fun e!129038 () Bool)

(declare-fun e!129042 () Bool)

(assert (=> b!186477 (= e!129038 e!129042)))

(declare-fun res!155268 () Bool)

(assert (=> b!186477 (=> (not res!155268) (not e!129042))))

(declare-fun lt!288034 () (_ BitVec 64))

(declare-fun lt!288050 () (_ BitVec 64))

(assert (=> b!186477 (= res!155268 (= lt!288034 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!288050)))))

(declare-datatypes ((array!9828 0))(
  ( (array!9829 (arr!5264 (Array (_ BitVec 32) (_ BitVec 8))) (size!4334 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7776 0))(
  ( (BitStream!7777 (buf!4797 array!9828) (currentByte!9047 (_ BitVec 32)) (currentBit!9042 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13337 0))(
  ( (Unit!13338) )
))
(declare-datatypes ((tuple2!16140 0))(
  ( (tuple2!16141 (_1!8715 Unit!13337) (_2!8715 BitStream!7776)) )
))
(declare-fun lt!288037 () tuple2!16140)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!186477 (= lt!288034 (bitIndex!0 (size!4334 (buf!4797 (_2!8715 lt!288037))) (currentByte!9047 (_2!8715 lt!288037)) (currentBit!9042 (_2!8715 lt!288037))))))

(declare-fun thiss!1204 () BitStream!7776)

(assert (=> b!186477 (= lt!288050 (bitIndex!0 (size!4334 (buf!4797 thiss!1204)) (currentByte!9047 thiss!1204) (currentBit!9042 thiss!1204)))))

(declare-fun b!186478 () Bool)

(declare-fun e!129031 () Bool)

(declare-datatypes ((tuple2!16142 0))(
  ( (tuple2!16143 (_1!8716 BitStream!7776) (_2!8716 Bool)) )
))
(declare-fun lt!288054 () tuple2!16142)

(assert (=> b!186478 (= e!129031 (= (bitIndex!0 (size!4334 (buf!4797 (_1!8716 lt!288054))) (currentByte!9047 (_1!8716 lt!288054)) (currentBit!9042 (_1!8716 lt!288054))) lt!288034))))

(declare-fun b!186479 () Bool)

(declare-fun res!155281 () Bool)

(declare-fun e!129033 () Bool)

(assert (=> b!186479 (=> res!155281 e!129033)))

(declare-fun isPrefixOf!0 (BitStream!7776 BitStream!7776) Bool)

(assert (=> b!186479 (= res!155281 (not (isPrefixOf!0 thiss!1204 (_2!8715 lt!288037))))))

(declare-fun b!186480 () Bool)

(declare-fun e!129035 () Bool)

(declare-fun lt!288047 () tuple2!16140)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!186480 (= e!129035 (invariant!0 (currentBit!9042 thiss!1204) (currentByte!9047 thiss!1204) (size!4334 (buf!4797 (_2!8715 lt!288047)))))))

(declare-fun b!186481 () Bool)

(declare-fun e!129036 () Bool)

(assert (=> b!186481 (= e!129033 e!129036)))

(declare-fun res!155267 () Bool)

(assert (=> b!186481 (=> res!155267 e!129036)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!288052 () (_ BitVec 64))

(declare-datatypes ((tuple2!16144 0))(
  ( (tuple2!16145 (_1!8717 BitStream!7776) (_2!8717 BitStream!7776)) )
))
(declare-fun lt!288045 () tuple2!16144)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((tuple2!16146 0))(
  ( (tuple2!16147 (_1!8718 BitStream!7776) (_2!8718 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7776 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16146)

(assert (=> b!186481 (= res!155267 (not (= (_1!8718 (readNBitsLSBFirstsLoopPure!0 (_1!8717 lt!288045) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!288052)) (_2!8717 lt!288045))))))

(declare-fun lt!288053 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!186481 (validate_offset_bits!1 ((_ sign_extend 32) (size!4334 (buf!4797 (_2!8715 lt!288047)))) ((_ sign_extend 32) (currentByte!9047 (_2!8715 lt!288037))) ((_ sign_extend 32) (currentBit!9042 (_2!8715 lt!288037))) lt!288053)))

(declare-fun lt!288049 () Unit!13337)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7776 array!9828 (_ BitVec 64)) Unit!13337)

(assert (=> b!186481 (= lt!288049 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8715 lt!288037) (buf!4797 (_2!8715 lt!288047)) lt!288053))))

(assert (=> b!186481 (= lt!288053 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!288051 () (_ BitVec 64))

(declare-fun lt!288033 () tuple2!16142)

(declare-fun lt!288043 () (_ BitVec 64))

(assert (=> b!186481 (= lt!288052 (bvor lt!288051 (ite (_2!8716 lt!288033) lt!288043 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!288042 () tuple2!16146)

(declare-fun lt!288030 () tuple2!16144)

(assert (=> b!186481 (= lt!288042 (readNBitsLSBFirstsLoopPure!0 (_1!8717 lt!288030) nBits!348 i!590 lt!288051))))

(declare-fun lt!288031 () (_ BitVec 64))

(assert (=> b!186481 (validate_offset_bits!1 ((_ sign_extend 32) (size!4334 (buf!4797 (_2!8715 lt!288047)))) ((_ sign_extend 32) (currentByte!9047 thiss!1204)) ((_ sign_extend 32) (currentBit!9042 thiss!1204)) lt!288031)))

(declare-fun lt!288029 () Unit!13337)

(assert (=> b!186481 (= lt!288029 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4797 (_2!8715 lt!288047)) lt!288031))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!186481 (= lt!288051 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!288055 () Bool)

(assert (=> b!186481 (= (_2!8716 lt!288033) lt!288055)))

(declare-fun readBitPure!0 (BitStream!7776) tuple2!16142)

(assert (=> b!186481 (= lt!288033 (readBitPure!0 (_1!8717 lt!288030)))))

(declare-fun reader!0 (BitStream!7776 BitStream!7776) tuple2!16144)

(assert (=> b!186481 (= lt!288045 (reader!0 (_2!8715 lt!288037) (_2!8715 lt!288047)))))

(assert (=> b!186481 (= lt!288030 (reader!0 thiss!1204 (_2!8715 lt!288047)))))

(declare-fun e!129039 () Bool)

(assert (=> b!186481 e!129039))

(declare-fun res!155276 () Bool)

(assert (=> b!186481 (=> (not res!155276) (not e!129039))))

(declare-fun lt!288039 () tuple2!16142)

(declare-fun lt!288032 () tuple2!16142)

(assert (=> b!186481 (= res!155276 (= (bitIndex!0 (size!4334 (buf!4797 (_1!8716 lt!288039))) (currentByte!9047 (_1!8716 lt!288039)) (currentBit!9042 (_1!8716 lt!288039))) (bitIndex!0 (size!4334 (buf!4797 (_1!8716 lt!288032))) (currentByte!9047 (_1!8716 lt!288032)) (currentBit!9042 (_1!8716 lt!288032)))))))

(declare-fun lt!288041 () Unit!13337)

(declare-fun lt!288048 () BitStream!7776)

(declare-fun readBitPrefixLemma!0 (BitStream!7776 BitStream!7776) Unit!13337)

(assert (=> b!186481 (= lt!288041 (readBitPrefixLemma!0 lt!288048 (_2!8715 lt!288047)))))

(assert (=> b!186481 (= lt!288032 (readBitPure!0 (BitStream!7777 (buf!4797 (_2!8715 lt!288047)) (currentByte!9047 thiss!1204) (currentBit!9042 thiss!1204))))))

(assert (=> b!186481 (= lt!288039 (readBitPure!0 lt!288048))))

(assert (=> b!186481 e!129035))

(declare-fun res!155282 () Bool)

(assert (=> b!186481 (=> (not res!155282) (not e!129035))))

(assert (=> b!186481 (= res!155282 (invariant!0 (currentBit!9042 thiss!1204) (currentByte!9047 thiss!1204) (size!4334 (buf!4797 (_2!8715 lt!288037)))))))

(assert (=> b!186481 (= lt!288048 (BitStream!7777 (buf!4797 (_2!8715 lt!288037)) (currentByte!9047 thiss!1204) (currentBit!9042 thiss!1204)))))

(declare-fun b!186482 () Bool)

(declare-fun res!155269 () Bool)

(declare-fun e!129041 () Bool)

(assert (=> b!186482 (=> (not res!155269) (not e!129041))))

(assert (=> b!186482 (= res!155269 (not (= i!590 nBits!348)))))

(declare-fun b!186483 () Bool)

(assert (=> b!186483 (= e!129039 (= (_2!8716 lt!288039) (_2!8716 lt!288032)))))

(declare-fun b!186484 () Bool)

(declare-fun e!129037 () Bool)

(assert (=> b!186484 (= e!129037 e!129033)))

(declare-fun res!155273 () Bool)

(assert (=> b!186484 (=> res!155273 e!129033)))

(declare-fun lt!288036 () (_ BitVec 64))

(declare-fun lt!288038 () (_ BitVec 64))

(assert (=> b!186484 (= res!155273 (not (= lt!288036 (bvsub (bvsub (bvadd lt!288038 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!186484 (= lt!288036 (bitIndex!0 (size!4334 (buf!4797 (_2!8715 lt!288047))) (currentByte!9047 (_2!8715 lt!288047)) (currentBit!9042 (_2!8715 lt!288047))))))

(assert (=> b!186484 (isPrefixOf!0 thiss!1204 (_2!8715 lt!288047))))

(declare-fun lt!288044 () Unit!13337)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7776 BitStream!7776 BitStream!7776) Unit!13337)

(assert (=> b!186484 (= lt!288044 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8715 lt!288037) (_2!8715 lt!288047)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7776 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16140)

(assert (=> b!186484 (= lt!288047 (appendBitsLSBFirstLoopTR!0 (_2!8715 lt!288037) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun res!155279 () Bool)

(declare-fun e!129032 () Bool)

(assert (=> start!40552 (=> (not res!155279) (not e!129032))))

(assert (=> start!40552 (= res!155279 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40552 e!129032))

(assert (=> start!40552 true))

(declare-fun e!129043 () Bool)

(declare-fun inv!12 (BitStream!7776) Bool)

(assert (=> start!40552 (and (inv!12 thiss!1204) e!129043)))

(declare-fun b!186485 () Bool)

(assert (=> b!186485 (= e!129042 e!129031)))

(declare-fun res!155280 () Bool)

(assert (=> b!186485 (=> (not res!155280) (not e!129031))))

(assert (=> b!186485 (= res!155280 (and (= (_2!8716 lt!288054) lt!288055) (= (_1!8716 lt!288054) (_2!8715 lt!288037))))))

(declare-fun readerFrom!0 (BitStream!7776 (_ BitVec 32) (_ BitVec 32)) BitStream!7776)

(assert (=> b!186485 (= lt!288054 (readBitPure!0 (readerFrom!0 (_2!8715 lt!288037) (currentBit!9042 thiss!1204) (currentByte!9047 thiss!1204))))))

(declare-fun b!186486 () Bool)

(declare-fun array_inv!4075 (array!9828) Bool)

(assert (=> b!186486 (= e!129043 (array_inv!4075 (buf!4797 thiss!1204)))))

(declare-fun b!186487 () Bool)

(declare-fun res!155270 () Bool)

(assert (=> b!186487 (=> res!155270 e!129033)))

(assert (=> b!186487 (= res!155270 (not (isPrefixOf!0 (_2!8715 lt!288037) (_2!8715 lt!288047))))))

(declare-fun b!186488 () Bool)

(declare-fun res!155278 () Bool)

(declare-fun e!129040 () Bool)

(assert (=> b!186488 (=> (not res!155278) (not e!129040))))

(declare-fun lt!288040 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7776 (_ BitVec 64)) BitStream!7776)

(assert (=> b!186488 (= res!155278 (= (_1!8717 lt!288030) (withMovedBitIndex!0 (_2!8717 lt!288030) (bvsub lt!288040 lt!288036))))))

(declare-fun b!186489 () Bool)

(assert (=> b!186489 (= e!129032 e!129041)))

(declare-fun res!155265 () Bool)

(assert (=> b!186489 (=> (not res!155265) (not e!129041))))

(assert (=> b!186489 (= res!155265 (validate_offset_bits!1 ((_ sign_extend 32) (size!4334 (buf!4797 thiss!1204))) ((_ sign_extend 32) (currentByte!9047 thiss!1204)) ((_ sign_extend 32) (currentBit!9042 thiss!1204)) lt!288031))))

(assert (=> b!186489 (= lt!288031 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!186490 () Bool)

(assert (=> b!186490 (= e!129041 (not e!129037))))

(declare-fun res!155271 () Bool)

(assert (=> b!186490 (=> res!155271 e!129037)))

(assert (=> b!186490 (= res!155271 (not (= lt!288038 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!288040))))))

(assert (=> b!186490 (= lt!288038 (bitIndex!0 (size!4334 (buf!4797 (_2!8715 lt!288037))) (currentByte!9047 (_2!8715 lt!288037)) (currentBit!9042 (_2!8715 lt!288037))))))

(assert (=> b!186490 (= lt!288040 (bitIndex!0 (size!4334 (buf!4797 thiss!1204)) (currentByte!9047 thiss!1204) (currentBit!9042 thiss!1204)))))

(assert (=> b!186490 e!129038))

(declare-fun res!155266 () Bool)

(assert (=> b!186490 (=> (not res!155266) (not e!129038))))

(assert (=> b!186490 (= res!155266 (= (size!4334 (buf!4797 thiss!1204)) (size!4334 (buf!4797 (_2!8715 lt!288037)))))))

(declare-fun appendBit!0 (BitStream!7776 Bool) tuple2!16140)

(assert (=> b!186490 (= lt!288037 (appendBit!0 thiss!1204 lt!288055))))

(assert (=> b!186490 (= lt!288055 (not (= (bvand v!189 lt!288043) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186490 (= lt!288043 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!186491 () Bool)

(declare-fun res!155272 () Bool)

(assert (=> b!186491 (=> res!155272 e!129033)))

(assert (=> b!186491 (= res!155272 (or (not (= (size!4334 (buf!4797 (_2!8715 lt!288047))) (size!4334 (buf!4797 thiss!1204)))) (not (= lt!288036 (bvsub (bvadd lt!288040 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!186492 () Bool)

(assert (=> b!186492 (= e!129036 (invariant!0 (currentBit!9042 (_2!8715 lt!288037)) (currentByte!9047 (_2!8715 lt!288037)) (size!4334 (buf!4797 (_2!8715 lt!288037)))))))

(assert (=> b!186492 e!129040))

(declare-fun res!155283 () Bool)

(assert (=> b!186492 (=> (not res!155283) (not e!129040))))

(declare-fun lt!288046 () tuple2!16146)

(assert (=> b!186492 (= res!155283 (and (= (_2!8718 lt!288042) (_2!8718 lt!288046)) (= (_1!8718 lt!288042) (_1!8718 lt!288046))))))

(declare-fun lt!288035 () Unit!13337)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7776 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13337)

(assert (=> b!186492 (= lt!288035 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8717 lt!288030) nBits!348 i!590 lt!288051))))

(assert (=> b!186492 (= lt!288046 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8717 lt!288030) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!288052))))

(declare-fun b!186493 () Bool)

(declare-fun res!155274 () Bool)

(assert (=> b!186493 (=> (not res!155274) (not e!129042))))

(assert (=> b!186493 (= res!155274 (isPrefixOf!0 thiss!1204 (_2!8715 lt!288037)))))

(declare-fun b!186494 () Bool)

(assert (=> b!186494 (= e!129040 (= (_1!8717 lt!288045) (withMovedBitIndex!0 (_2!8717 lt!288045) (bvsub lt!288038 lt!288036))))))

(declare-fun b!186495 () Bool)

(declare-fun res!155275 () Bool)

(assert (=> b!186495 (=> (not res!155275) (not e!129041))))

(assert (=> b!186495 (= res!155275 (invariant!0 (currentBit!9042 thiss!1204) (currentByte!9047 thiss!1204) (size!4334 (buf!4797 thiss!1204))))))

(declare-fun b!186496 () Bool)

(declare-fun res!155277 () Bool)

(assert (=> b!186496 (=> res!155277 e!129033)))

(assert (=> b!186496 (= res!155277 (not (invariant!0 (currentBit!9042 (_2!8715 lt!288047)) (currentByte!9047 (_2!8715 lt!288047)) (size!4334 (buf!4797 (_2!8715 lt!288047))))))))

(assert (= (and start!40552 res!155279) b!186489))

(assert (= (and b!186489 res!155265) b!186495))

(assert (= (and b!186495 res!155275) b!186482))

(assert (= (and b!186482 res!155269) b!186490))

(assert (= (and b!186490 res!155266) b!186477))

(assert (= (and b!186477 res!155268) b!186493))

(assert (= (and b!186493 res!155274) b!186485))

(assert (= (and b!186485 res!155280) b!186478))

(assert (= (and b!186490 (not res!155271)) b!186484))

(assert (= (and b!186484 (not res!155273)) b!186496))

(assert (= (and b!186496 (not res!155277)) b!186491))

(assert (= (and b!186491 (not res!155272)) b!186487))

(assert (= (and b!186487 (not res!155270)) b!186479))

(assert (= (and b!186479 (not res!155281)) b!186481))

(assert (= (and b!186481 res!155282) b!186480))

(assert (= (and b!186481 res!155276) b!186483))

(assert (= (and b!186481 (not res!155267)) b!186492))

(assert (= (and b!186492 res!155283) b!186488))

(assert (= (and b!186488 res!155278) b!186494))

(assert (= start!40552 b!186486))

(declare-fun m!289887 () Bool)

(assert (=> b!186478 m!289887))

(declare-fun m!289889 () Bool)

(assert (=> b!186494 m!289889))

(declare-fun m!289891 () Bool)

(assert (=> b!186479 m!289891))

(declare-fun m!289893 () Bool)

(assert (=> start!40552 m!289893))

(declare-fun m!289895 () Bool)

(assert (=> b!186485 m!289895))

(assert (=> b!186485 m!289895))

(declare-fun m!289897 () Bool)

(assert (=> b!186485 m!289897))

(declare-fun m!289899 () Bool)

(assert (=> b!186486 m!289899))

(declare-fun m!289901 () Bool)

(assert (=> b!186484 m!289901))

(declare-fun m!289903 () Bool)

(assert (=> b!186484 m!289903))

(declare-fun m!289905 () Bool)

(assert (=> b!186484 m!289905))

(declare-fun m!289907 () Bool)

(assert (=> b!186484 m!289907))

(declare-fun m!289909 () Bool)

(assert (=> b!186481 m!289909))

(declare-fun m!289911 () Bool)

(assert (=> b!186481 m!289911))

(declare-fun m!289913 () Bool)

(assert (=> b!186481 m!289913))

(declare-fun m!289915 () Bool)

(assert (=> b!186481 m!289915))

(declare-fun m!289917 () Bool)

(assert (=> b!186481 m!289917))

(declare-fun m!289919 () Bool)

(assert (=> b!186481 m!289919))

(declare-fun m!289921 () Bool)

(assert (=> b!186481 m!289921))

(declare-fun m!289923 () Bool)

(assert (=> b!186481 m!289923))

(declare-fun m!289925 () Bool)

(assert (=> b!186481 m!289925))

(declare-fun m!289927 () Bool)

(assert (=> b!186481 m!289927))

(declare-fun m!289929 () Bool)

(assert (=> b!186481 m!289929))

(declare-fun m!289931 () Bool)

(assert (=> b!186481 m!289931))

(declare-fun m!289933 () Bool)

(assert (=> b!186481 m!289933))

(declare-fun m!289935 () Bool)

(assert (=> b!186481 m!289935))

(declare-fun m!289937 () Bool)

(assert (=> b!186481 m!289937))

(declare-fun m!289939 () Bool)

(assert (=> b!186481 m!289939))

(declare-fun m!289941 () Bool)

(assert (=> b!186488 m!289941))

(assert (=> b!186493 m!289891))

(declare-fun m!289943 () Bool)

(assert (=> b!186490 m!289943))

(declare-fun m!289945 () Bool)

(assert (=> b!186490 m!289945))

(declare-fun m!289947 () Bool)

(assert (=> b!186490 m!289947))

(declare-fun m!289949 () Bool)

(assert (=> b!186480 m!289949))

(declare-fun m!289951 () Bool)

(assert (=> b!186495 m!289951))

(declare-fun m!289953 () Bool)

(assert (=> b!186487 m!289953))

(declare-fun m!289955 () Bool)

(assert (=> b!186496 m!289955))

(declare-fun m!289957 () Bool)

(assert (=> b!186492 m!289957))

(declare-fun m!289959 () Bool)

(assert (=> b!186492 m!289959))

(declare-fun m!289961 () Bool)

(assert (=> b!186492 m!289961))

(assert (=> b!186492 m!289961))

(declare-fun m!289963 () Bool)

(assert (=> b!186492 m!289963))

(declare-fun m!289965 () Bool)

(assert (=> b!186489 m!289965))

(assert (=> b!186477 m!289943))

(assert (=> b!186477 m!289945))

(check-sat (not start!40552) (not b!186495) (not b!186485) (not b!186481) (not b!186496) (not b!186488) (not b!186486) (not b!186477) (not b!186489) (not b!186478) (not b!186492) (not b!186479) (not b!186494) (not b!186487) (not b!186484) (not b!186493) (not b!186490) (not b!186480))
(check-sat)
(get-model)

