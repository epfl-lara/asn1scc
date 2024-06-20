; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5982 () Bool)

(assert start!5982)

(declare-fun b!27348 () Bool)

(declare-fun e!18494 () Bool)

(declare-fun e!18488 () Bool)

(assert (=> b!27348 (= e!18494 e!18488)))

(declare-fun res!23655 () Bool)

(assert (=> b!27348 (=> res!23655 e!18488)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!27348 (= res!23655 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!38917 () (_ BitVec 64))

(declare-datatypes ((array!1719 0))(
  ( (array!1720 (arr!1204 (Array (_ BitVec 32) (_ BitVec 8))) (size!742 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1316 0))(
  ( (BitStream!1317 (buf!1069 array!1719) (currentByte!2394 (_ BitVec 32)) (currentBit!2389 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2187 0))(
  ( (Unit!2188) )
))
(declare-datatypes ((tuple2!2998 0))(
  ( (tuple2!2999 (_1!1586 Unit!2187) (_2!1586 BitStream!1316)) )
))
(declare-fun lt!38908 () tuple2!2998)

(declare-datatypes ((tuple2!3000 0))(
  ( (tuple2!3001 (_1!1587 BitStream!1316) (_2!1587 BitStream!1316)) )
))
(declare-fun lt!38909 () tuple2!3000)

(declare-datatypes ((List!359 0))(
  ( (Nil!356) (Cons!355 (h!474 Bool) (t!1109 List!359)) )
))
(declare-fun lt!38910 () List!359)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1316 BitStream!1316 (_ BitVec 64)) List!359)

(assert (=> b!27348 (= lt!38910 (bitStreamReadBitsIntoList!0 (_2!1586 lt!38908) (_1!1587 lt!38909) lt!38917))))

(declare-fun lt!38918 () tuple2!3000)

(declare-fun lt!38905 () List!359)

(assert (=> b!27348 (= lt!38905 (bitStreamReadBitsIntoList!0 (_2!1586 lt!38908) (_1!1587 lt!38918) (bvsub to!314 i!635)))))

(declare-fun lt!38911 () tuple2!2998)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!27348 (validate_offset_bits!1 ((_ sign_extend 32) (size!742 (buf!1069 (_2!1586 lt!38908)))) ((_ sign_extend 32) (currentByte!2394 (_2!1586 lt!38911))) ((_ sign_extend 32) (currentBit!2389 (_2!1586 lt!38911))) lt!38917)))

(declare-fun lt!38904 () Unit!2187)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1316 array!1719 (_ BitVec 64)) Unit!2187)

(assert (=> b!27348 (= lt!38904 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1586 lt!38911) (buf!1069 (_2!1586 lt!38908)) lt!38917))))

(declare-fun reader!0 (BitStream!1316 BitStream!1316) tuple2!3000)

(assert (=> b!27348 (= lt!38909 (reader!0 (_2!1586 lt!38911) (_2!1586 lt!38908)))))

(declare-fun thiss!1379 () BitStream!1316)

(assert (=> b!27348 (validate_offset_bits!1 ((_ sign_extend 32) (size!742 (buf!1069 (_2!1586 lt!38908)))) ((_ sign_extend 32) (currentByte!2394 thiss!1379)) ((_ sign_extend 32) (currentBit!2389 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!38919 () Unit!2187)

(assert (=> b!27348 (= lt!38919 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1069 (_2!1586 lt!38908)) (bvsub to!314 i!635)))))

(assert (=> b!27348 (= lt!38918 (reader!0 thiss!1379 (_2!1586 lt!38908)))))

(declare-fun b!27349 () Bool)

(declare-fun e!18491 () Bool)

(declare-fun e!18493 () Bool)

(assert (=> b!27349 (= e!18491 e!18493)))

(declare-fun res!23657 () Bool)

(assert (=> b!27349 (=> res!23657 e!18493)))

(declare-fun isPrefixOf!0 (BitStream!1316 BitStream!1316) Bool)

(assert (=> b!27349 (= res!23657 (not (isPrefixOf!0 thiss!1379 (_2!1586 lt!38911))))))

(assert (=> b!27349 (validate_offset_bits!1 ((_ sign_extend 32) (size!742 (buf!1069 (_2!1586 lt!38911)))) ((_ sign_extend 32) (currentByte!2394 (_2!1586 lt!38911))) ((_ sign_extend 32) (currentBit!2389 (_2!1586 lt!38911))) lt!38917)))

(assert (=> b!27349 (= lt!38917 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38913 () Unit!2187)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1316 BitStream!1316 (_ BitVec 64) (_ BitVec 64)) Unit!2187)

(assert (=> b!27349 (= lt!38913 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1586 lt!38911) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1719)

(declare-fun appendBitFromByte!0 (BitStream!1316 (_ BitVec 8) (_ BitVec 32)) tuple2!2998)

(assert (=> b!27349 (= lt!38911 (appendBitFromByte!0 thiss!1379 (select (arr!1204 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!23651 () Bool)

(declare-fun e!18492 () Bool)

(assert (=> start!5982 (=> (not res!23651) (not e!18492))))

(assert (=> start!5982 (= res!23651 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!742 srcBuffer!2))))))))

(assert (=> start!5982 e!18492))

(assert (=> start!5982 true))

(declare-fun array_inv!711 (array!1719) Bool)

(assert (=> start!5982 (array_inv!711 srcBuffer!2)))

(declare-fun e!18486 () Bool)

(declare-fun inv!12 (BitStream!1316) Bool)

(assert (=> start!5982 (and (inv!12 thiss!1379) e!18486)))

(declare-fun b!27350 () Bool)

(declare-fun e!18487 () Bool)

(assert (=> b!27350 (= e!18487 e!18494)))

(declare-fun res!23649 () Bool)

(assert (=> b!27350 (=> res!23649 e!18494)))

(assert (=> b!27350 (= res!23649 (not (= (size!742 (buf!1069 (_2!1586 lt!38911))) (size!742 (buf!1069 (_2!1586 lt!38908))))))))

(declare-fun e!18489 () Bool)

(assert (=> b!27350 e!18489))

(declare-fun res!23661 () Bool)

(assert (=> b!27350 (=> (not res!23661) (not e!18489))))

(assert (=> b!27350 (= res!23661 (= (size!742 (buf!1069 (_2!1586 lt!38908))) (size!742 (buf!1069 thiss!1379))))))

(declare-fun b!27351 () Bool)

(declare-fun res!23658 () Bool)

(assert (=> b!27351 (=> res!23658 e!18494)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!27351 (= res!23658 (not (invariant!0 (currentBit!2389 (_2!1586 lt!38911)) (currentByte!2394 (_2!1586 lt!38911)) (size!742 (buf!1069 (_2!1586 lt!38908))))))))

(declare-fun b!27352 () Bool)

(assert (=> b!27352 (= e!18488 true)))

(declare-fun lt!38907 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!27352 (= lt!38907 (bitIndex!0 (size!742 (buf!1069 (_1!1587 lt!38909))) (currentByte!2394 (_1!1587 lt!38909)) (currentBit!2389 (_1!1587 lt!38909))))))

(declare-fun lt!38915 () (_ BitVec 64))

(assert (=> b!27352 (= lt!38915 (bitIndex!0 (size!742 (buf!1069 (_1!1587 lt!38918))) (currentByte!2394 (_1!1587 lt!38918)) (currentBit!2389 (_1!1587 lt!38918))))))

(declare-fun b!27353 () Bool)

(declare-fun res!23660 () Bool)

(assert (=> b!27353 (=> res!23660 e!18488)))

(declare-fun length!85 (List!359) Int)

(assert (=> b!27353 (= res!23660 (<= (length!85 lt!38905) 0))))

(declare-fun lt!38903 () (_ BitVec 64))

(declare-fun b!27354 () Bool)

(assert (=> b!27354 (= e!18489 (= lt!38903 (bvsub (bvsub (bvadd (bitIndex!0 (size!742 (buf!1069 (_2!1586 lt!38911))) (currentByte!2394 (_2!1586 lt!38911)) (currentBit!2389 (_2!1586 lt!38911))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!27355 () Bool)

(declare-fun e!18485 () Bool)

(assert (=> b!27355 (= e!18493 e!18485)))

(declare-fun res!23664 () Bool)

(assert (=> b!27355 (=> res!23664 e!18485)))

(assert (=> b!27355 (= res!23664 (not (isPrefixOf!0 (_2!1586 lt!38911) (_2!1586 lt!38908))))))

(assert (=> b!27355 (isPrefixOf!0 thiss!1379 (_2!1586 lt!38908))))

(declare-fun lt!38912 () Unit!2187)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1316 BitStream!1316 BitStream!1316) Unit!2187)

(assert (=> b!27355 (= lt!38912 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1586 lt!38911) (_2!1586 lt!38908)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1316 array!1719 (_ BitVec 64) (_ BitVec 64)) tuple2!2998)

(assert (=> b!27355 (= lt!38908 (appendBitsMSBFirstLoop!0 (_2!1586 lt!38911) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!18495 () Bool)

(assert (=> b!27355 e!18495))

(declare-fun res!23663 () Bool)

(assert (=> b!27355 (=> (not res!23663) (not e!18495))))

(assert (=> b!27355 (= res!23663 (validate_offset_bits!1 ((_ sign_extend 32) (size!742 (buf!1069 (_2!1586 lt!38911)))) ((_ sign_extend 32) (currentByte!2394 thiss!1379)) ((_ sign_extend 32) (currentBit!2389 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38914 () Unit!2187)

(assert (=> b!27355 (= lt!38914 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1069 (_2!1586 lt!38911)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38906 () tuple2!3000)

(assert (=> b!27355 (= lt!38906 (reader!0 thiss!1379 (_2!1586 lt!38911)))))

(declare-fun b!27356 () Bool)

(declare-fun head!196 (List!359) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1316 array!1719 (_ BitVec 64) (_ BitVec 64)) List!359)

(assert (=> b!27356 (= e!18495 (= (head!196 (byteArrayBitContentToList!0 (_2!1586 lt!38911) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!196 (bitStreamReadBitsIntoList!0 (_2!1586 lt!38911) (_1!1587 lt!38906) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!27357 () Bool)

(declare-fun res!23656 () Bool)

(assert (=> b!27357 (=> res!23656 e!18488)))

(assert (=> b!27357 (= res!23656 (or (not (= (buf!1069 (_1!1587 lt!38918)) (buf!1069 (_1!1587 lt!38909)))) (not (= (buf!1069 (_1!1587 lt!38918)) (buf!1069 (_2!1586 lt!38908)))) (bvsge lt!38903 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!27358 () Bool)

(declare-fun res!23650 () Bool)

(assert (=> b!27358 (=> res!23650 e!18487)))

(assert (=> b!27358 (= res!23650 (not (= (size!742 (buf!1069 thiss!1379)) (size!742 (buf!1069 (_2!1586 lt!38908))))))))

(declare-fun b!27359 () Bool)

(assert (=> b!27359 (= e!18486 (array_inv!711 (buf!1069 thiss!1379)))))

(declare-fun b!27360 () Bool)

(declare-fun res!23665 () Bool)

(assert (=> b!27360 (=> res!23665 e!18488)))

(assert (=> b!27360 (= res!23665 (not (isPrefixOf!0 (_1!1587 lt!38918) (_2!1586 lt!38908))))))

(declare-fun b!27361 () Bool)

(declare-fun res!23652 () Bool)

(assert (=> b!27361 (=> (not res!23652) (not e!18492))))

(assert (=> b!27361 (= res!23652 (validate_offset_bits!1 ((_ sign_extend 32) (size!742 (buf!1069 thiss!1379))) ((_ sign_extend 32) (currentByte!2394 thiss!1379)) ((_ sign_extend 32) (currentBit!2389 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!27362 () Bool)

(assert (=> b!27362 (= e!18485 e!18487)))

(declare-fun res!23654 () Bool)

(assert (=> b!27362 (=> res!23654 e!18487)))

(declare-fun lt!38916 () (_ BitVec 64))

(assert (=> b!27362 (= res!23654 (not (= lt!38903 (bvsub (bvadd lt!38916 to!314) i!635))))))

(assert (=> b!27362 (= lt!38903 (bitIndex!0 (size!742 (buf!1069 (_2!1586 lt!38908))) (currentByte!2394 (_2!1586 lt!38908)) (currentBit!2389 (_2!1586 lt!38908))))))

(declare-fun b!27363 () Bool)

(declare-fun res!23653 () Bool)

(assert (=> b!27363 (=> res!23653 e!18488)))

(assert (=> b!27363 (= res!23653 (not (isPrefixOf!0 (_1!1587 lt!38909) (_2!1586 lt!38908))))))

(declare-fun b!27364 () Bool)

(declare-fun res!23667 () Bool)

(assert (=> b!27364 (=> res!23667 e!18488)))

(assert (=> b!27364 (= res!23667 (not (isPrefixOf!0 (_1!1587 lt!38918) (_1!1587 lt!38909))))))

(declare-fun b!27365 () Bool)

(declare-fun res!23659 () Bool)

(assert (=> b!27365 (=> res!23659 e!18487)))

(assert (=> b!27365 (= res!23659 (not (invariant!0 (currentBit!2389 (_2!1586 lt!38908)) (currentByte!2394 (_2!1586 lt!38908)) (size!742 (buf!1069 (_2!1586 lt!38908))))))))

(declare-fun b!27366 () Bool)

(declare-fun res!23662 () Bool)

(assert (=> b!27366 (=> res!23662 e!18494)))

(assert (=> b!27366 (= res!23662 (not (invariant!0 (currentBit!2389 (_2!1586 lt!38911)) (currentByte!2394 (_2!1586 lt!38911)) (size!742 (buf!1069 (_2!1586 lt!38911))))))))

(declare-fun b!27367 () Bool)

(assert (=> b!27367 (= e!18492 (not e!18491))))

(declare-fun res!23666 () Bool)

(assert (=> b!27367 (=> res!23666 e!18491)))

(assert (=> b!27367 (= res!23666 (bvsge i!635 to!314))))

(assert (=> b!27367 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!38920 () Unit!2187)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1316) Unit!2187)

(assert (=> b!27367 (= lt!38920 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!27367 (= lt!38916 (bitIndex!0 (size!742 (buf!1069 thiss!1379)) (currentByte!2394 thiss!1379) (currentBit!2389 thiss!1379)))))

(assert (= (and start!5982 res!23651) b!27361))

(assert (= (and b!27361 res!23652) b!27367))

(assert (= (and b!27367 (not res!23666)) b!27349))

(assert (= (and b!27349 (not res!23657)) b!27355))

(assert (= (and b!27355 res!23663) b!27356))

(assert (= (and b!27355 (not res!23664)) b!27362))

(assert (= (and b!27362 (not res!23654)) b!27365))

(assert (= (and b!27365 (not res!23659)) b!27358))

(assert (= (and b!27358 (not res!23650)) b!27350))

(assert (= (and b!27350 res!23661) b!27354))

(assert (= (and b!27350 (not res!23649)) b!27366))

(assert (= (and b!27366 (not res!23662)) b!27351))

(assert (= (and b!27351 (not res!23658)) b!27348))

(assert (= (and b!27348 (not res!23655)) b!27353))

(assert (= (and b!27353 (not res!23660)) b!27360))

(assert (= (and b!27360 (not res!23665)) b!27363))

(assert (= (and b!27363 (not res!23653)) b!27364))

(assert (= (and b!27364 (not res!23667)) b!27357))

(assert (= (and b!27357 (not res!23656)) b!27352))

(assert (= start!5982 b!27359))

(declare-fun m!39189 () Bool)

(assert (=> b!27355 m!39189))

(declare-fun m!39191 () Bool)

(assert (=> b!27355 m!39191))

(declare-fun m!39193 () Bool)

(assert (=> b!27355 m!39193))

(declare-fun m!39195 () Bool)

(assert (=> b!27355 m!39195))

(declare-fun m!39197 () Bool)

(assert (=> b!27355 m!39197))

(declare-fun m!39199 () Bool)

(assert (=> b!27355 m!39199))

(declare-fun m!39201 () Bool)

(assert (=> b!27355 m!39201))

(declare-fun m!39203 () Bool)

(assert (=> b!27363 m!39203))

(declare-fun m!39205 () Bool)

(assert (=> start!5982 m!39205))

(declare-fun m!39207 () Bool)

(assert (=> start!5982 m!39207))

(declare-fun m!39209 () Bool)

(assert (=> b!27359 m!39209))

(declare-fun m!39211 () Bool)

(assert (=> b!27352 m!39211))

(declare-fun m!39213 () Bool)

(assert (=> b!27352 m!39213))

(declare-fun m!39215 () Bool)

(assert (=> b!27362 m!39215))

(declare-fun m!39217 () Bool)

(assert (=> b!27365 m!39217))

(declare-fun m!39219 () Bool)

(assert (=> b!27367 m!39219))

(declare-fun m!39221 () Bool)

(assert (=> b!27367 m!39221))

(declare-fun m!39223 () Bool)

(assert (=> b!27367 m!39223))

(declare-fun m!39225 () Bool)

(assert (=> b!27356 m!39225))

(assert (=> b!27356 m!39225))

(declare-fun m!39227 () Bool)

(assert (=> b!27356 m!39227))

(declare-fun m!39229 () Bool)

(assert (=> b!27356 m!39229))

(assert (=> b!27356 m!39229))

(declare-fun m!39231 () Bool)

(assert (=> b!27356 m!39231))

(declare-fun m!39233 () Bool)

(assert (=> b!27360 m!39233))

(declare-fun m!39235 () Bool)

(assert (=> b!27353 m!39235))

(declare-fun m!39237 () Bool)

(assert (=> b!27361 m!39237))

(declare-fun m!39239 () Bool)

(assert (=> b!27349 m!39239))

(declare-fun m!39241 () Bool)

(assert (=> b!27349 m!39241))

(declare-fun m!39243 () Bool)

(assert (=> b!27349 m!39243))

(assert (=> b!27349 m!39241))

(declare-fun m!39245 () Bool)

(assert (=> b!27349 m!39245))

(declare-fun m!39247 () Bool)

(assert (=> b!27349 m!39247))

(declare-fun m!39249 () Bool)

(assert (=> b!27351 m!39249))

(declare-fun m!39251 () Bool)

(assert (=> b!27354 m!39251))

(declare-fun m!39253 () Bool)

(assert (=> b!27348 m!39253))

(declare-fun m!39255 () Bool)

(assert (=> b!27348 m!39255))

(declare-fun m!39257 () Bool)

(assert (=> b!27348 m!39257))

(declare-fun m!39259 () Bool)

(assert (=> b!27348 m!39259))

(declare-fun m!39261 () Bool)

(assert (=> b!27348 m!39261))

(declare-fun m!39263 () Bool)

(assert (=> b!27348 m!39263))

(declare-fun m!39265 () Bool)

(assert (=> b!27348 m!39265))

(declare-fun m!39267 () Bool)

(assert (=> b!27348 m!39267))

(declare-fun m!39269 () Bool)

(assert (=> b!27366 m!39269))

(declare-fun m!39271 () Bool)

(assert (=> b!27364 m!39271))

(push 1)

(assert (not b!27352))

(assert (not b!27365))

(assert (not b!27351))

(assert (not start!5982))

(assert (not b!27353))

(assert (not b!27367))

(assert (not b!27361))

(assert (not b!27354))

(assert (not b!27366))

(assert (not b!27356))

(assert (not b!27360))

(assert (not b!27362))

(assert (not b!27364))

(assert (not b!27359))

(assert (not b!27348))

(assert (not b!27363))

(assert (not b!27349))

(assert (not b!27355))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

