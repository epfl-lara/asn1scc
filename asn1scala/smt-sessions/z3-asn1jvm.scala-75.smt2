; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1528 () Bool)

(assert start!1528)

(declare-fun b!7210 () Bool)

(declare-fun res!7998 () Bool)

(declare-fun e!4504 () Bool)

(assert (=> b!7210 (=> (not res!7998) (not e!4504))))

(declare-datatypes ((array!485 0))(
  ( (array!486 (arr!611 (Array (_ BitVec 32) (_ BitVec 8))) (size!209 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!396 0))(
  ( (BitStream!397 (buf!542 array!485) (currentByte!1545 (_ BitVec 32)) (currentBit!1540 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!396)

(declare-datatypes ((Unit!564 0))(
  ( (Unit!565) )
))
(declare-datatypes ((tuple2!946 0))(
  ( (tuple2!947 (_1!501 Unit!564) (_2!501 BitStream!396)) )
))
(declare-fun lt!9611 () tuple2!946)

(declare-fun isPrefixOf!0 (BitStream!396 BitStream!396) Bool)

(assert (=> b!7210 (= res!7998 (isPrefixOf!0 thiss!1486 (_2!501 lt!9611)))))

(declare-fun b!7211 () Bool)

(declare-fun e!4505 () Bool)

(assert (=> b!7211 (= e!4505 true)))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((tuple2!948 0))(
  ( (tuple2!949 (_1!502 array!485) (_2!502 BitStream!396)) )
))
(declare-fun lt!9608 () tuple2!948)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun lt!9609 () Unit!564)

(declare-fun srcBuffer!6 () array!485)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!396 array!485 array!485 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!564)

(assert (=> b!7211 (= lt!9609 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!501 lt!9611) srcBuffer!6 (_1!502 lt!9608) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!7212 () Bool)

(assert (=> b!7212 (= e!4504 (not e!4505))))

(declare-fun res!8003 () Bool)

(assert (=> b!7212 (=> res!8003 e!4505)))

(declare-datatypes ((List!109 0))(
  ( (Nil!106) (Cons!105 (h!224 Bool) (t!859 List!109)) )
))
(declare-fun lt!9610 () List!109)

(declare-fun byteArrayBitContentToList!0 (BitStream!396 array!485 (_ BitVec 64) (_ BitVec 64)) List!109)

(assert (=> b!7212 (= res!8003 (not (= (byteArrayBitContentToList!0 (_2!501 lt!9611) (_1!502 lt!9608) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!9610)))))

(declare-datatypes ((tuple2!950 0))(
  ( (tuple2!951 (_1!503 BitStream!396) (_2!503 BitStream!396)) )
))
(declare-fun lt!9606 () tuple2!950)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!396 BitStream!396 (_ BitVec 64)) List!109)

(assert (=> b!7212 (= lt!9610 (bitStreamReadBitsIntoList!0 (_2!501 lt!9611) (_1!503 lt!9606) nBits!460))))

(declare-fun readBits!0 (BitStream!396 (_ BitVec 64)) tuple2!948)

(assert (=> b!7212 (= lt!9608 (readBits!0 (_1!503 lt!9606) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!7212 (validate_offset_bits!1 ((_ sign_extend 32) (size!209 (buf!542 (_2!501 lt!9611)))) ((_ sign_extend 32) (currentByte!1545 thiss!1486)) ((_ sign_extend 32) (currentBit!1540 thiss!1486)) nBits!460)))

(declare-fun lt!9607 () Unit!564)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!396 array!485 (_ BitVec 64)) Unit!564)

(assert (=> b!7212 (= lt!9607 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!542 (_2!501 lt!9611)) nBits!460))))

(declare-fun reader!0 (BitStream!396 BitStream!396) tuple2!950)

(assert (=> b!7212 (= lt!9606 (reader!0 thiss!1486 (_2!501 lt!9611)))))

(declare-fun b!7213 () Bool)

(declare-fun e!4508 () Bool)

(assert (=> b!7213 (= e!4508 e!4504)))

(declare-fun res!7999 () Bool)

(assert (=> b!7213 (=> (not res!7999) (not e!4504))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!7213 (= res!7999 (invariant!0 (currentBit!1540 (_2!501 lt!9611)) (currentByte!1545 (_2!501 lt!9611)) (size!209 (buf!542 (_2!501 lt!9611)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!396 array!485 (_ BitVec 64) (_ BitVec 64)) tuple2!946)

(assert (=> b!7213 (= lt!9611 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!7214 () Bool)

(declare-fun res!8000 () Bool)

(assert (=> b!7214 (=> res!8000 e!4505)))

(assert (=> b!7214 (= res!8000 (not (= lt!9610 (byteArrayBitContentToList!0 (_2!501 lt!9611) srcBuffer!6 from!367 nBits!460))))))

(declare-fun res!8004 () Bool)

(assert (=> start!1528 (=> (not res!8004) (not e!4508))))

(assert (=> start!1528 (= res!8004 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!209 srcBuffer!6))))))))

(assert (=> start!1528 e!4508))

(assert (=> start!1528 true))

(declare-fun array_inv!204 (array!485) Bool)

(assert (=> start!1528 (array_inv!204 srcBuffer!6)))

(declare-fun e!4506 () Bool)

(declare-fun inv!12 (BitStream!396) Bool)

(assert (=> start!1528 (and (inv!12 thiss!1486) e!4506)))

(declare-fun b!7215 () Bool)

(declare-fun res!8001 () Bool)

(assert (=> b!7215 (=> (not res!8001) (not e!4508))))

(assert (=> b!7215 (= res!8001 (validate_offset_bits!1 ((_ sign_extend 32) (size!209 (buf!542 thiss!1486))) ((_ sign_extend 32) (currentByte!1545 thiss!1486)) ((_ sign_extend 32) (currentBit!1540 thiss!1486)) nBits!460))))

(declare-fun b!7216 () Bool)

(declare-fun res!8002 () Bool)

(assert (=> b!7216 (=> (not res!8002) (not e!4504))))

(assert (=> b!7216 (= res!8002 (= (size!209 (buf!542 thiss!1486)) (size!209 (buf!542 (_2!501 lt!9611)))))))

(declare-fun b!7217 () Bool)

(declare-fun res!8005 () Bool)

(assert (=> b!7217 (=> (not res!8005) (not e!4504))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!7217 (= res!8005 (= (bitIndex!0 (size!209 (buf!542 (_2!501 lt!9611))) (currentByte!1545 (_2!501 lt!9611)) (currentBit!1540 (_2!501 lt!9611))) (bvadd (bitIndex!0 (size!209 (buf!542 thiss!1486)) (currentByte!1545 thiss!1486) (currentBit!1540 thiss!1486)) nBits!460)))))

(declare-fun b!7218 () Bool)

(assert (=> b!7218 (= e!4506 (array_inv!204 (buf!542 thiss!1486)))))

(assert (= (and start!1528 res!8004) b!7215))

(assert (= (and b!7215 res!8001) b!7213))

(assert (= (and b!7213 res!7999) b!7216))

(assert (= (and b!7216 res!8002) b!7217))

(assert (= (and b!7217 res!8005) b!7210))

(assert (= (and b!7210 res!7998) b!7212))

(assert (= (and b!7212 (not res!8003)) b!7214))

(assert (= (and b!7214 (not res!8000)) b!7211))

(assert (= start!1528 b!7218))

(declare-fun m!9235 () Bool)

(assert (=> b!7213 m!9235))

(declare-fun m!9237 () Bool)

(assert (=> b!7213 m!9237))

(declare-fun m!9239 () Bool)

(assert (=> b!7212 m!9239))

(declare-fun m!9241 () Bool)

(assert (=> b!7212 m!9241))

(declare-fun m!9243 () Bool)

(assert (=> b!7212 m!9243))

(declare-fun m!9245 () Bool)

(assert (=> b!7212 m!9245))

(declare-fun m!9247 () Bool)

(assert (=> b!7212 m!9247))

(declare-fun m!9249 () Bool)

(assert (=> b!7212 m!9249))

(declare-fun m!9251 () Bool)

(assert (=> start!1528 m!9251))

(declare-fun m!9253 () Bool)

(assert (=> start!1528 m!9253))

(declare-fun m!9255 () Bool)

(assert (=> b!7218 m!9255))

(declare-fun m!9257 () Bool)

(assert (=> b!7215 m!9257))

(declare-fun m!9259 () Bool)

(assert (=> b!7214 m!9259))

(declare-fun m!9261 () Bool)

(assert (=> b!7211 m!9261))

(declare-fun m!9263 () Bool)

(assert (=> b!7217 m!9263))

(declare-fun m!9265 () Bool)

(assert (=> b!7217 m!9265))

(declare-fun m!9267 () Bool)

(assert (=> b!7210 m!9267))

(check-sat (not start!1528) (not b!7212) (not b!7210) (not b!7218) (not b!7215) (not b!7213) (not b!7214) (not b!7211) (not b!7217))
