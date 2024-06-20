; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28018 () Bool)

(assert start!28018)

(declare-fun b!145205 () Bool)

(declare-fun e!96810 () Bool)

(declare-datatypes ((array!6610 0))(
  ( (array!6611 (arr!3726 (Array (_ BitVec 32) (_ BitVec 8))) (size!2993 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5244 0))(
  ( (BitStream!5245 (buf!3432 array!6610) (currentByte!6322 (_ BitVec 32)) (currentBit!6317 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5244)

(declare-datatypes ((Unit!9059 0))(
  ( (Unit!9060) )
))
(declare-datatypes ((tuple2!12986 0))(
  ( (tuple2!12987 (_1!6839 Unit!9059) (_2!6839 BitStream!5244)) )
))
(declare-fun lt!224956 () tuple2!12986)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!145205 (= e!96810 (invariant!0 (currentBit!6317 thiss!1634) (currentByte!6322 thiss!1634) (size!2993 (buf!3432 (_2!6839 lt!224956)))))))

(declare-fun b!145206 () Bool)

(declare-fun e!96800 () Bool)

(declare-datatypes ((tuple2!12988 0))(
  ( (tuple2!12989 (_1!6840 BitStream!5244) (_2!6840 (_ BitVec 8))) )
))
(declare-fun lt!224943 () tuple2!12988)

(declare-fun lt!224950 () tuple2!12988)

(assert (=> b!145206 (= e!96800 (= (_2!6840 lt!224943) (_2!6840 lt!224950)))))

(declare-datatypes ((tuple2!12990 0))(
  ( (tuple2!12991 (_1!6841 BitStream!5244) (_2!6841 BitStream!5244)) )
))
(declare-fun lt!224951 () tuple2!12990)

(declare-fun arr!237 () array!6610)

(declare-fun lt!224961 () tuple2!12988)

(declare-fun b!145207 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun e!96806 () Bool)

(assert (=> b!145207 (= e!96806 (and (= (_2!6840 lt!224961) (select (arr!3726 arr!237) from!447)) (= (_1!6840 lt!224961) (_2!6841 lt!224951))))))

(declare-fun readBytePure!0 (BitStream!5244) tuple2!12988)

(assert (=> b!145207 (= lt!224961 (readBytePure!0 (_1!6841 lt!224951)))))

(declare-fun reader!0 (BitStream!5244 BitStream!5244) tuple2!12990)

(assert (=> b!145207 (= lt!224951 (reader!0 thiss!1634 (_2!6839 lt!224956)))))

(declare-fun b!145208 () Bool)

(declare-fun e!96801 () Bool)

(declare-fun e!96808 () Bool)

(assert (=> b!145208 (= e!96801 (not e!96808))))

(declare-fun res!121400 () Bool)

(assert (=> b!145208 (=> res!121400 e!96808)))

(declare-datatypes ((tuple2!12992 0))(
  ( (tuple2!12993 (_1!6842 BitStream!5244) (_2!6842 array!6610)) )
))
(declare-fun lt!224944 () tuple2!12992)

(declare-fun lt!224957 () tuple2!12990)

(assert (=> b!145208 (= res!121400 (or (not (= (size!2993 (_2!6842 lt!224944)) (size!2993 arr!237))) (not (= (_1!6842 lt!224944) (_2!6841 lt!224957)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!5244 array!6610 (_ BitVec 32) (_ BitVec 32)) tuple2!12992)

(assert (=> b!145208 (= lt!224944 (readByteArrayLoopPure!0 (_1!6841 lt!224957) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!224945 () tuple2!12986)

(declare-fun lt!224954 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!145208 (validate_offset_bits!1 ((_ sign_extend 32) (size!2993 (buf!3432 (_2!6839 lt!224945)))) ((_ sign_extend 32) (currentByte!6322 (_2!6839 lt!224956))) ((_ sign_extend 32) (currentBit!6317 (_2!6839 lt!224956))) lt!224954)))

(declare-fun lt!224959 () Unit!9059)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5244 array!6610 (_ BitVec 64)) Unit!9059)

(assert (=> b!145208 (= lt!224959 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6839 lt!224956) (buf!3432 (_2!6839 lt!224945)) lt!224954))))

(assert (=> b!145208 (= lt!224957 (reader!0 (_2!6839 lt!224956) (_2!6839 lt!224945)))))

(declare-fun b!145209 () Bool)

(declare-fun res!121407 () Bool)

(declare-fun e!96803 () Bool)

(assert (=> b!145209 (=> (not res!121407) (not e!96803))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!145209 (= res!121407 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2993 (buf!3432 thiss!1634))) ((_ sign_extend 32) (currentByte!6322 thiss!1634)) ((_ sign_extend 32) (currentBit!6317 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!145210 () Bool)

(assert (=> b!145210 (= e!96803 (not (or (not (= (bvand from!447 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand from!447 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)))))))

(declare-fun lt!224947 () (_ BitVec 32))

(assert (=> b!145210 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2993 (buf!3432 (_2!6839 lt!224945)))) ((_ sign_extend 32) (currentByte!6322 (_2!6839 lt!224956))) ((_ sign_extend 32) (currentBit!6317 (_2!6839 lt!224956))) lt!224947)))

(declare-fun lt!224952 () Unit!9059)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5244 array!6610 (_ BitVec 32)) Unit!9059)

(assert (=> b!145210 (= lt!224952 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6839 lt!224956) (buf!3432 (_2!6839 lt!224945)) lt!224947))))

(declare-fun e!96804 () Bool)

(assert (=> b!145210 e!96804))

(declare-fun res!121401 () Bool)

(assert (=> b!145210 (=> (not res!121401) (not e!96804))))

(assert (=> b!145210 (= res!121401 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2993 (buf!3432 (_2!6839 lt!224945)))) ((_ sign_extend 32) (currentByte!6322 thiss!1634)) ((_ sign_extend 32) (currentBit!6317 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!224949 () Unit!9059)

(assert (=> b!145210 (= lt!224949 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3432 (_2!6839 lt!224945)) (bvsub to!404 from!447)))))

(declare-fun lt!224953 () tuple2!12990)

(assert (=> b!145210 (= (_2!6840 (readBytePure!0 (_1!6841 lt!224953))) (select (arr!3726 arr!237) from!447))))

(declare-fun lt!224958 () tuple2!12990)

(assert (=> b!145210 (= lt!224958 (reader!0 (_2!6839 lt!224956) (_2!6839 lt!224945)))))

(assert (=> b!145210 (= lt!224953 (reader!0 thiss!1634 (_2!6839 lt!224945)))))

(assert (=> b!145210 e!96800))

(declare-fun res!121399 () Bool)

(assert (=> b!145210 (=> (not res!121399) (not e!96800))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!145210 (= res!121399 (= (bitIndex!0 (size!2993 (buf!3432 (_1!6840 lt!224943))) (currentByte!6322 (_1!6840 lt!224943)) (currentBit!6317 (_1!6840 lt!224943))) (bitIndex!0 (size!2993 (buf!3432 (_1!6840 lt!224950))) (currentByte!6322 (_1!6840 lt!224950)) (currentBit!6317 (_1!6840 lt!224950)))))))

(declare-fun lt!224955 () Unit!9059)

(declare-fun lt!224948 () BitStream!5244)

(declare-fun readBytePrefixLemma!0 (BitStream!5244 BitStream!5244) Unit!9059)

(assert (=> b!145210 (= lt!224955 (readBytePrefixLemma!0 lt!224948 (_2!6839 lt!224945)))))

(assert (=> b!145210 (= lt!224950 (readBytePure!0 (BitStream!5245 (buf!3432 (_2!6839 lt!224945)) (currentByte!6322 thiss!1634) (currentBit!6317 thiss!1634))))))

(assert (=> b!145210 (= lt!224943 (readBytePure!0 lt!224948))))

(assert (=> b!145210 (= lt!224948 (BitStream!5245 (buf!3432 (_2!6839 lt!224956)) (currentByte!6322 thiss!1634) (currentBit!6317 thiss!1634)))))

(assert (=> b!145210 e!96810))

(declare-fun res!121398 () Bool)

(assert (=> b!145210 (=> (not res!121398) (not e!96810))))

(declare-fun isPrefixOf!0 (BitStream!5244 BitStream!5244) Bool)

(assert (=> b!145210 (= res!121398 (isPrefixOf!0 thiss!1634 (_2!6839 lt!224945)))))

(declare-fun lt!224960 () Unit!9059)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5244 BitStream!5244 BitStream!5244) Unit!9059)

(assert (=> b!145210 (= lt!224960 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6839 lt!224956) (_2!6839 lt!224945)))))

(declare-fun e!96805 () Bool)

(assert (=> b!145210 e!96805))

(declare-fun res!121403 () Bool)

(assert (=> b!145210 (=> (not res!121403) (not e!96805))))

(assert (=> b!145210 (= res!121403 (= (size!2993 (buf!3432 (_2!6839 lt!224956))) (size!2993 (buf!3432 (_2!6839 lt!224945)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5244 array!6610 (_ BitVec 32) (_ BitVec 32)) tuple2!12986)

(assert (=> b!145210 (= lt!224945 (appendByteArrayLoop!0 (_2!6839 lt!224956) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!145210 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2993 (buf!3432 (_2!6839 lt!224956)))) ((_ sign_extend 32) (currentByte!6322 (_2!6839 lt!224956))) ((_ sign_extend 32) (currentBit!6317 (_2!6839 lt!224956))) lt!224947)))

(assert (=> b!145210 (= lt!224947 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!224946 () Unit!9059)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5244 BitStream!5244 (_ BitVec 64) (_ BitVec 32)) Unit!9059)

(assert (=> b!145210 (= lt!224946 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6839 lt!224956) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!145210 e!96806))

(declare-fun res!121405 () Bool)

(assert (=> b!145210 (=> (not res!121405) (not e!96806))))

(assert (=> b!145210 (= res!121405 (= (size!2993 (buf!3432 thiss!1634)) (size!2993 (buf!3432 (_2!6839 lt!224956)))))))

(declare-fun appendByte!0 (BitStream!5244 (_ BitVec 8)) tuple2!12986)

(assert (=> b!145210 (= lt!224956 (appendByte!0 thiss!1634 (select (arr!3726 arr!237) from!447)))))

(declare-fun b!145211 () Bool)

(declare-fun res!121397 () Bool)

(assert (=> b!145211 (=> (not res!121397) (not e!96806))))

(assert (=> b!145211 (= res!121397 (= (bitIndex!0 (size!2993 (buf!3432 (_2!6839 lt!224956))) (currentByte!6322 (_2!6839 lt!224956)) (currentBit!6317 (_2!6839 lt!224956))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2993 (buf!3432 thiss!1634)) (currentByte!6322 thiss!1634) (currentBit!6317 thiss!1634)))))))

(declare-fun b!145212 () Bool)

(assert (=> b!145212 (= e!96804 (= (_1!6842 (readByteArrayLoopPure!0 (_1!6841 lt!224953) arr!237 from!447 to!404)) (_2!6841 lt!224953)))))

(declare-fun b!145213 () Bool)

(declare-fun e!96809 () Bool)

(declare-fun array_inv!2782 (array!6610) Bool)

(assert (=> b!145213 (= e!96809 (array_inv!2782 (buf!3432 thiss!1634)))))

(declare-fun b!145214 () Bool)

(declare-fun res!121404 () Bool)

(assert (=> b!145214 (=> (not res!121404) (not e!96803))))

(assert (=> b!145214 (= res!121404 (invariant!0 (currentBit!6317 thiss!1634) (currentByte!6322 thiss!1634) (size!2993 (buf!3432 thiss!1634))))))

(declare-fun b!145215 () Bool)

(declare-fun res!121402 () Bool)

(assert (=> b!145215 (=> (not res!121402) (not e!96806))))

(assert (=> b!145215 (= res!121402 (isPrefixOf!0 thiss!1634 (_2!6839 lt!224956)))))

(declare-fun res!121396 () Bool)

(assert (=> start!28018 (=> (not res!121396) (not e!96803))))

(assert (=> start!28018 (= res!121396 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2993 arr!237))))))

(assert (=> start!28018 e!96803))

(assert (=> start!28018 true))

(assert (=> start!28018 (array_inv!2782 arr!237)))

(declare-fun inv!12 (BitStream!5244) Bool)

(assert (=> start!28018 (and (inv!12 thiss!1634) e!96809)))

(declare-fun b!145216 () Bool)

(declare-fun arrayRangesEq!309 (array!6610 array!6610 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!145216 (= e!96808 (not (arrayRangesEq!309 arr!237 (_2!6842 lt!224944) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!145217 () Bool)

(assert (=> b!145217 (= e!96805 e!96801)))

(declare-fun res!121406 () Bool)

(assert (=> b!145217 (=> (not res!121406) (not e!96801))))

(assert (=> b!145217 (= res!121406 (= (bitIndex!0 (size!2993 (buf!3432 (_2!6839 lt!224945))) (currentByte!6322 (_2!6839 lt!224945)) (currentBit!6317 (_2!6839 lt!224945))) (bvadd (bitIndex!0 (size!2993 (buf!3432 (_2!6839 lt!224956))) (currentByte!6322 (_2!6839 lt!224956)) (currentBit!6317 (_2!6839 lt!224956))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!224954))))))

(assert (=> b!145217 (= lt!224954 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!145218 () Bool)

(declare-fun res!121408 () Bool)

(assert (=> b!145218 (=> (not res!121408) (not e!96803))))

(assert (=> b!145218 (= res!121408 (bvslt from!447 to!404))))

(declare-fun b!145219 () Bool)

(declare-fun res!121395 () Bool)

(assert (=> b!145219 (=> (not res!121395) (not e!96801))))

(assert (=> b!145219 (= res!121395 (isPrefixOf!0 (_2!6839 lt!224956) (_2!6839 lt!224945)))))

(assert (= (and start!28018 res!121396) b!145209))

(assert (= (and b!145209 res!121407) b!145218))

(assert (= (and b!145218 res!121408) b!145214))

(assert (= (and b!145214 res!121404) b!145210))

(assert (= (and b!145210 res!121405) b!145211))

(assert (= (and b!145211 res!121397) b!145215))

(assert (= (and b!145215 res!121402) b!145207))

(assert (= (and b!145210 res!121403) b!145217))

(assert (= (and b!145217 res!121406) b!145219))

(assert (= (and b!145219 res!121395) b!145208))

(assert (= (and b!145208 (not res!121400)) b!145216))

(assert (= (and b!145210 res!121398) b!145205))

(assert (= (and b!145210 res!121399) b!145206))

(assert (= (and b!145210 res!121401) b!145212))

(assert (= start!28018 b!145213))

(declare-fun m!223357 () Bool)

(assert (=> start!28018 m!223357))

(declare-fun m!223359 () Bool)

(assert (=> start!28018 m!223359))

(declare-fun m!223361 () Bool)

(assert (=> b!145209 m!223361))

(declare-fun m!223363 () Bool)

(assert (=> b!145213 m!223363))

(declare-fun m!223365 () Bool)

(assert (=> b!145219 m!223365))

(declare-fun m!223367 () Bool)

(assert (=> b!145215 m!223367))

(declare-fun m!223369 () Bool)

(assert (=> b!145207 m!223369))

(declare-fun m!223371 () Bool)

(assert (=> b!145207 m!223371))

(declare-fun m!223373 () Bool)

(assert (=> b!145207 m!223373))

(declare-fun m!223375 () Bool)

(assert (=> b!145212 m!223375))

(declare-fun m!223377 () Bool)

(assert (=> b!145214 m!223377))

(declare-fun m!223379 () Bool)

(assert (=> b!145216 m!223379))

(declare-fun m!223381 () Bool)

(assert (=> b!145210 m!223381))

(declare-fun m!223383 () Bool)

(assert (=> b!145210 m!223383))

(declare-fun m!223385 () Bool)

(assert (=> b!145210 m!223385))

(declare-fun m!223387 () Bool)

(assert (=> b!145210 m!223387))

(declare-fun m!223389 () Bool)

(assert (=> b!145210 m!223389))

(declare-fun m!223391 () Bool)

(assert (=> b!145210 m!223391))

(assert (=> b!145210 m!223369))

(declare-fun m!223393 () Bool)

(assert (=> b!145210 m!223393))

(declare-fun m!223395 () Bool)

(assert (=> b!145210 m!223395))

(declare-fun m!223397 () Bool)

(assert (=> b!145210 m!223397))

(declare-fun m!223399 () Bool)

(assert (=> b!145210 m!223399))

(declare-fun m!223401 () Bool)

(assert (=> b!145210 m!223401))

(declare-fun m!223403 () Bool)

(assert (=> b!145210 m!223403))

(declare-fun m!223405 () Bool)

(assert (=> b!145210 m!223405))

(declare-fun m!223407 () Bool)

(assert (=> b!145210 m!223407))

(declare-fun m!223409 () Bool)

(assert (=> b!145210 m!223409))

(declare-fun m!223411 () Bool)

(assert (=> b!145210 m!223411))

(assert (=> b!145210 m!223369))

(declare-fun m!223413 () Bool)

(assert (=> b!145210 m!223413))

(declare-fun m!223415 () Bool)

(assert (=> b!145210 m!223415))

(declare-fun m!223417 () Bool)

(assert (=> b!145205 m!223417))

(declare-fun m!223419 () Bool)

(assert (=> b!145211 m!223419))

(declare-fun m!223421 () Bool)

(assert (=> b!145211 m!223421))

(declare-fun m!223423 () Bool)

(assert (=> b!145208 m!223423))

(declare-fun m!223425 () Bool)

(assert (=> b!145208 m!223425))

(declare-fun m!223427 () Bool)

(assert (=> b!145208 m!223427))

(assert (=> b!145208 m!223391))

(declare-fun m!223429 () Bool)

(assert (=> b!145217 m!223429))

(assert (=> b!145217 m!223419))

(check-sat (not b!145207) (not b!145214) (not b!145215) (not b!145211) (not b!145209) (not b!145208) (not b!145205) (not start!28018) (not b!145217) (not b!145210) (not b!145213) (not b!145212) (not b!145216) (not b!145219))
