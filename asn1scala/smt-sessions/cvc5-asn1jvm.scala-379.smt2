; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9158 () Bool)

(assert start!9158)

(declare-fun b!45366 () Bool)

(declare-fun e!30200 () Bool)

(declare-fun e!30199 () Bool)

(assert (=> b!45366 (= e!30200 e!30199)))

(declare-fun res!38361 () Bool)

(assert (=> b!45366 (=> res!38361 e!30199)))

(declare-datatypes ((array!2263 0))(
  ( (array!2264 (arr!1535 (Array (_ BitVec 32) (_ BitVec 8))) (size!1018 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1780 0))(
  ( (BitStream!1781 (buf!1367 array!2263) (currentByte!2860 (_ BitVec 32)) (currentBit!2855 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3226 0))(
  ( (Unit!3227) )
))
(declare-datatypes ((tuple2!4428 0))(
  ( (tuple2!4429 (_1!2307 Unit!3226) (_2!2307 BitStream!1780)) )
))
(declare-fun lt!69673 () tuple2!4428)

(declare-fun lt!69672 () tuple2!4428)

(assert (=> b!45366 (= res!38361 (not (= (size!1018 (buf!1367 (_2!2307 lt!69673))) (size!1018 (buf!1367 (_2!2307 lt!69672))))))))

(declare-fun e!30195 () Bool)

(assert (=> b!45366 e!30195))

(declare-fun res!38370 () Bool)

(assert (=> b!45366 (=> (not res!38370) (not e!30195))))

(declare-fun thiss!1379 () BitStream!1780)

(assert (=> b!45366 (= res!38370 (= (size!1018 (buf!1367 (_2!2307 lt!69672))) (size!1018 (buf!1367 thiss!1379))))))

(declare-fun b!45367 () Bool)

(declare-fun e!30196 () Bool)

(declare-fun array_inv!943 (array!2263) Bool)

(assert (=> b!45367 (= e!30196 (array_inv!943 (buf!1367 thiss!1379)))))

(declare-fun b!45368 () Bool)

(declare-fun res!38369 () Bool)

(assert (=> b!45368 (=> res!38369 e!30199)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!45368 (= res!38369 (not (invariant!0 (currentBit!2855 (_2!2307 lt!69673)) (currentByte!2860 (_2!2307 lt!69673)) (size!1018 (buf!1367 (_2!2307 lt!69672))))))))

(declare-fun srcBuffer!2 () array!2263)

(declare-fun e!30198 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun b!45369 () Bool)

(declare-datatypes ((tuple2!4430 0))(
  ( (tuple2!4431 (_1!2308 BitStream!1780) (_2!2308 BitStream!1780)) )
))
(declare-fun lt!69681 () tuple2!4430)

(declare-datatypes ((List!531 0))(
  ( (Nil!528) (Cons!527 (h!646 Bool) (t!1281 List!531)) )
))
(declare-fun head!350 (List!531) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1780 array!2263 (_ BitVec 64) (_ BitVec 64)) List!531)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1780 BitStream!1780 (_ BitVec 64)) List!531)

(assert (=> b!45369 (= e!30198 (= (head!350 (byteArrayBitContentToList!0 (_2!2307 lt!69673) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!350 (bitStreamReadBitsIntoList!0 (_2!2307 lt!69673) (_1!2308 lt!69681) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!38368 () Bool)

(declare-fun e!30194 () Bool)

(assert (=> start!9158 (=> (not res!38368) (not e!30194))))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!9158 (= res!38368 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1018 srcBuffer!2))))))))

(assert (=> start!9158 e!30194))

(assert (=> start!9158 true))

(assert (=> start!9158 (array_inv!943 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1780) Bool)

(assert (=> start!9158 (and (inv!12 thiss!1379) e!30196)))

(declare-fun b!45370 () Bool)

(declare-fun e!30190 () Bool)

(declare-fun e!30197 () Bool)

(assert (=> b!45370 (= e!30190 e!30197)))

(declare-fun res!38366 () Bool)

(assert (=> b!45370 (=> res!38366 e!30197)))

(declare-fun isPrefixOf!0 (BitStream!1780 BitStream!1780) Bool)

(assert (=> b!45370 (= res!38366 (not (isPrefixOf!0 (_2!2307 lt!69673) (_2!2307 lt!69672))))))

(assert (=> b!45370 (isPrefixOf!0 thiss!1379 (_2!2307 lt!69672))))

(declare-fun lt!69682 () Unit!3226)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1780 BitStream!1780 BitStream!1780) Unit!3226)

(assert (=> b!45370 (= lt!69682 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2307 lt!69673) (_2!2307 lt!69672)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1780 array!2263 (_ BitVec 64) (_ BitVec 64)) tuple2!4428)

(assert (=> b!45370 (= lt!69672 (appendBitsMSBFirstLoop!0 (_2!2307 lt!69673) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!45370 e!30198))

(declare-fun res!38367 () Bool)

(assert (=> b!45370 (=> (not res!38367) (not e!30198))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!45370 (= res!38367 (validate_offset_bits!1 ((_ sign_extend 32) (size!1018 (buf!1367 (_2!2307 lt!69673)))) ((_ sign_extend 32) (currentByte!2860 thiss!1379)) ((_ sign_extend 32) (currentBit!2855 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!69668 () Unit!3226)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1780 array!2263 (_ BitVec 64)) Unit!3226)

(assert (=> b!45370 (= lt!69668 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1367 (_2!2307 lt!69673)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1780 BitStream!1780) tuple2!4430)

(assert (=> b!45370 (= lt!69681 (reader!0 thiss!1379 (_2!2307 lt!69673)))))

(declare-fun b!45371 () Bool)

(declare-fun res!38363 () Bool)

(assert (=> b!45371 (=> (not res!38363) (not e!30194))))

(assert (=> b!45371 (= res!38363 (validate_offset_bits!1 ((_ sign_extend 32) (size!1018 (buf!1367 thiss!1379))) ((_ sign_extend 32) (currentByte!2860 thiss!1379)) ((_ sign_extend 32) (currentBit!2855 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!45372 () Bool)

(declare-fun e!30192 () Bool)

(assert (=> b!45372 (= e!30194 (not e!30192))))

(declare-fun res!38365 () Bool)

(assert (=> b!45372 (=> res!38365 e!30192)))

(assert (=> b!45372 (= res!38365 (bvsge i!635 to!314))))

(assert (=> b!45372 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!69680 () Unit!3226)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1780) Unit!3226)

(assert (=> b!45372 (= lt!69680 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!69671 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!45372 (= lt!69671 (bitIndex!0 (size!1018 (buf!1367 thiss!1379)) (currentByte!2860 thiss!1379) (currentBit!2855 thiss!1379)))))

(declare-fun b!45373 () Bool)

(assert (=> b!45373 (= e!30199 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!69667 () tuple2!4430)

(declare-fun lt!69674 () (_ BitVec 64))

(declare-fun lt!69677 () List!531)

(assert (=> b!45373 (= lt!69677 (bitStreamReadBitsIntoList!0 (_2!2307 lt!69672) (_1!2308 lt!69667) lt!69674))))

(declare-fun lt!69670 () List!531)

(declare-fun lt!69675 () tuple2!4430)

(assert (=> b!45373 (= lt!69670 (bitStreamReadBitsIntoList!0 (_2!2307 lt!69672) (_1!2308 lt!69675) (bvsub to!314 i!635)))))

(assert (=> b!45373 (validate_offset_bits!1 ((_ sign_extend 32) (size!1018 (buf!1367 (_2!2307 lt!69672)))) ((_ sign_extend 32) (currentByte!2860 (_2!2307 lt!69673))) ((_ sign_extend 32) (currentBit!2855 (_2!2307 lt!69673))) lt!69674)))

(declare-fun lt!69669 () Unit!3226)

(assert (=> b!45373 (= lt!69669 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2307 lt!69673) (buf!1367 (_2!2307 lt!69672)) lt!69674))))

(assert (=> b!45373 (= lt!69667 (reader!0 (_2!2307 lt!69673) (_2!2307 lt!69672)))))

(assert (=> b!45373 (validate_offset_bits!1 ((_ sign_extend 32) (size!1018 (buf!1367 (_2!2307 lt!69672)))) ((_ sign_extend 32) (currentByte!2860 thiss!1379)) ((_ sign_extend 32) (currentBit!2855 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!69678 () Unit!3226)

(assert (=> b!45373 (= lt!69678 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1367 (_2!2307 lt!69672)) (bvsub to!314 i!635)))))

(assert (=> b!45373 (= lt!69675 (reader!0 thiss!1379 (_2!2307 lt!69672)))))

(declare-fun b!45374 () Bool)

(declare-fun res!38364 () Bool)

(assert (=> b!45374 (=> res!38364 e!30199)))

(assert (=> b!45374 (= res!38364 (not (invariant!0 (currentBit!2855 (_2!2307 lt!69673)) (currentByte!2860 (_2!2307 lt!69673)) (size!1018 (buf!1367 (_2!2307 lt!69673))))))))

(declare-fun b!45375 () Bool)

(assert (=> b!45375 (= e!30197 e!30200)))

(declare-fun res!38373 () Bool)

(assert (=> b!45375 (=> res!38373 e!30200)))

(declare-fun lt!69679 () (_ BitVec 64))

(assert (=> b!45375 (= res!38373 (not (= lt!69679 (bvsub (bvadd lt!69671 to!314) i!635))))))

(assert (=> b!45375 (= lt!69679 (bitIndex!0 (size!1018 (buf!1367 (_2!2307 lt!69672))) (currentByte!2860 (_2!2307 lt!69672)) (currentBit!2855 (_2!2307 lt!69672))))))

(declare-fun b!45376 () Bool)

(declare-fun res!38362 () Bool)

(assert (=> b!45376 (=> res!38362 e!30200)))

(assert (=> b!45376 (= res!38362 (not (= (size!1018 (buf!1367 thiss!1379)) (size!1018 (buf!1367 (_2!2307 lt!69672))))))))

(declare-fun b!45377 () Bool)

(declare-fun res!38371 () Bool)

(assert (=> b!45377 (=> res!38371 e!30200)))

(assert (=> b!45377 (= res!38371 (not (invariant!0 (currentBit!2855 (_2!2307 lt!69672)) (currentByte!2860 (_2!2307 lt!69672)) (size!1018 (buf!1367 (_2!2307 lt!69672))))))))

(declare-fun b!45378 () Bool)

(assert (=> b!45378 (= e!30192 e!30190)))

(declare-fun res!38372 () Bool)

(assert (=> b!45378 (=> res!38372 e!30190)))

(assert (=> b!45378 (= res!38372 (not (isPrefixOf!0 thiss!1379 (_2!2307 lt!69673))))))

(assert (=> b!45378 (validate_offset_bits!1 ((_ sign_extend 32) (size!1018 (buf!1367 (_2!2307 lt!69673)))) ((_ sign_extend 32) (currentByte!2860 (_2!2307 lt!69673))) ((_ sign_extend 32) (currentBit!2855 (_2!2307 lt!69673))) lt!69674)))

(assert (=> b!45378 (= lt!69674 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!69676 () Unit!3226)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1780 BitStream!1780 (_ BitVec 64) (_ BitVec 64)) Unit!3226)

(assert (=> b!45378 (= lt!69676 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2307 lt!69673) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1780 (_ BitVec 8) (_ BitVec 32)) tuple2!4428)

(assert (=> b!45378 (= lt!69673 (appendBitFromByte!0 thiss!1379 (select (arr!1535 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!45379 () Bool)

(assert (=> b!45379 (= e!30195 (= lt!69679 (bvsub (bvsub (bvadd (bitIndex!0 (size!1018 (buf!1367 (_2!2307 lt!69673))) (currentByte!2860 (_2!2307 lt!69673)) (currentBit!2855 (_2!2307 lt!69673))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!9158 res!38368) b!45371))

(assert (= (and b!45371 res!38363) b!45372))

(assert (= (and b!45372 (not res!38365)) b!45378))

(assert (= (and b!45378 (not res!38372)) b!45370))

(assert (= (and b!45370 res!38367) b!45369))

(assert (= (and b!45370 (not res!38366)) b!45375))

(assert (= (and b!45375 (not res!38373)) b!45377))

(assert (= (and b!45377 (not res!38371)) b!45376))

(assert (= (and b!45376 (not res!38362)) b!45366))

(assert (= (and b!45366 res!38370) b!45379))

(assert (= (and b!45366 (not res!38361)) b!45374))

(assert (= (and b!45374 (not res!38364)) b!45368))

(assert (= (and b!45368 (not res!38369)) b!45373))

(assert (= start!9158 b!45367))

(declare-fun m!69199 () Bool)

(assert (=> b!45367 m!69199))

(declare-fun m!69201 () Bool)

(assert (=> b!45369 m!69201))

(assert (=> b!45369 m!69201))

(declare-fun m!69203 () Bool)

(assert (=> b!45369 m!69203))

(declare-fun m!69205 () Bool)

(assert (=> b!45369 m!69205))

(assert (=> b!45369 m!69205))

(declare-fun m!69207 () Bool)

(assert (=> b!45369 m!69207))

(declare-fun m!69209 () Bool)

(assert (=> b!45377 m!69209))

(declare-fun m!69211 () Bool)

(assert (=> b!45378 m!69211))

(declare-fun m!69213 () Bool)

(assert (=> b!45378 m!69213))

(declare-fun m!69215 () Bool)

(assert (=> b!45378 m!69215))

(declare-fun m!69217 () Bool)

(assert (=> b!45378 m!69217))

(assert (=> b!45378 m!69213))

(declare-fun m!69219 () Bool)

(assert (=> b!45378 m!69219))

(declare-fun m!69221 () Bool)

(assert (=> b!45368 m!69221))

(declare-fun m!69223 () Bool)

(assert (=> b!45373 m!69223))

(declare-fun m!69225 () Bool)

(assert (=> b!45373 m!69225))

(declare-fun m!69227 () Bool)

(assert (=> b!45373 m!69227))

(declare-fun m!69229 () Bool)

(assert (=> b!45373 m!69229))

(declare-fun m!69231 () Bool)

(assert (=> b!45373 m!69231))

(declare-fun m!69233 () Bool)

(assert (=> b!45373 m!69233))

(declare-fun m!69235 () Bool)

(assert (=> b!45373 m!69235))

(declare-fun m!69237 () Bool)

(assert (=> b!45373 m!69237))

(declare-fun m!69239 () Bool)

(assert (=> b!45371 m!69239))

(declare-fun m!69241 () Bool)

(assert (=> b!45374 m!69241))

(declare-fun m!69243 () Bool)

(assert (=> b!45379 m!69243))

(declare-fun m!69245 () Bool)

(assert (=> b!45372 m!69245))

(declare-fun m!69247 () Bool)

(assert (=> b!45372 m!69247))

(declare-fun m!69249 () Bool)

(assert (=> b!45372 m!69249))

(declare-fun m!69251 () Bool)

(assert (=> start!9158 m!69251))

(declare-fun m!69253 () Bool)

(assert (=> start!9158 m!69253))

(declare-fun m!69255 () Bool)

(assert (=> b!45375 m!69255))

(declare-fun m!69257 () Bool)

(assert (=> b!45370 m!69257))

(declare-fun m!69259 () Bool)

(assert (=> b!45370 m!69259))

(declare-fun m!69261 () Bool)

(assert (=> b!45370 m!69261))

(declare-fun m!69263 () Bool)

(assert (=> b!45370 m!69263))

(declare-fun m!69265 () Bool)

(assert (=> b!45370 m!69265))

(declare-fun m!69267 () Bool)

(assert (=> b!45370 m!69267))

(declare-fun m!69269 () Bool)

(assert (=> b!45370 m!69269))

(push 1)

(assert (not b!45379))

(assert (not b!45367))

(assert (not b!45370))

(assert (not b!45372))

(assert (not b!45373))

(assert (not b!45368))

(assert (not start!9158))

(assert (not b!45378))

(assert (not b!45371))

(assert (not b!45377))

(assert (not b!45374))

(assert (not b!45375))

(assert (not b!45369))

(check-sat)

(pop 1)

(push 1)

(check-sat)

