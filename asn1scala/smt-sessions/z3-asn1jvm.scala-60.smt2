; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1192 () Bool)

(assert start!1192)

(declare-fun b!5104 () Bool)

(declare-fun res!6316 () Bool)

(declare-fun e!3291 () Bool)

(assert (=> b!5104 (=> (not res!6316) (not e!3291))))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((array!386 0))(
  ( (array!387 (arr!557 (Array (_ BitVec 32) (_ BitVec 8))) (size!164 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!306 0))(
  ( (BitStream!307 (buf!488 array!386) (currentByte!1473 (_ BitVec 32)) (currentBit!1468 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!306)

(declare-datatypes ((Unit!402 0))(
  ( (Unit!403) )
))
(declare-datatypes ((tuple2!640 0))(
  ( (tuple2!641 (_1!339 Unit!402) (_2!339 BitStream!306)) )
))
(declare-fun lt!6477 () tuple2!640)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!5104 (= res!6316 (= (bitIndex!0 (size!164 (buf!488 (_2!339 lt!6477))) (currentByte!1473 (_2!339 lt!6477)) (currentBit!1468 (_2!339 lt!6477))) (bvadd (bitIndex!0 (size!164 (buf!488 thiss!1486)) (currentByte!1473 thiss!1486) (currentBit!1468 thiss!1486)) nBits!460)))))

(declare-fun b!5105 () Bool)

(declare-fun e!3292 () Bool)

(assert (=> b!5105 (= e!3292 true)))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun lt!6475 () Unit!402)

(declare-datatypes ((tuple2!642 0))(
  ( (tuple2!643 (_1!340 array!386) (_2!340 BitStream!306)) )
))
(declare-fun lt!6479 () tuple2!642)

(declare-fun srcBuffer!6 () array!386)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!306 array!386 array!386 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!402)

(assert (=> b!5105 (= lt!6475 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!339 lt!6477) srcBuffer!6 (_1!340 lt!6479) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!5106 () Bool)

(declare-fun res!6315 () Bool)

(declare-fun e!3288 () Bool)

(assert (=> b!5106 (=> (not res!6315) (not e!3288))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!5106 (= res!6315 (validate_offset_bits!1 ((_ sign_extend 32) (size!164 (buf!488 thiss!1486))) ((_ sign_extend 32) (currentByte!1473 thiss!1486)) ((_ sign_extend 32) (currentBit!1468 thiss!1486)) nBits!460))))

(declare-fun b!5107 () Bool)

(declare-fun e!3290 () Bool)

(declare-fun array_inv!159 (array!386) Bool)

(assert (=> b!5107 (= e!3290 (array_inv!159 (buf!488 thiss!1486)))))

(declare-fun b!5109 () Bool)

(declare-fun res!6319 () Bool)

(assert (=> b!5109 (=> (not res!6319) (not e!3291))))

(declare-fun isPrefixOf!0 (BitStream!306 BitStream!306) Bool)

(assert (=> b!5109 (= res!6319 (isPrefixOf!0 thiss!1486 (_2!339 lt!6477)))))

(declare-fun b!5110 () Bool)

(declare-fun res!6321 () Bool)

(assert (=> b!5110 (=> res!6321 e!3292)))

(declare-datatypes ((List!64 0))(
  ( (Nil!61) (Cons!60 (h!179 Bool) (t!814 List!64)) )
))
(declare-fun lt!6476 () List!64)

(declare-fun byteArrayBitContentToList!0 (BitStream!306 array!386 (_ BitVec 64) (_ BitVec 64)) List!64)

(assert (=> b!5110 (= res!6321 (not (= lt!6476 (byteArrayBitContentToList!0 (_2!339 lt!6477) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!5111 () Bool)

(assert (=> b!5111 (= e!3291 (not e!3292))))

(declare-fun res!6318 () Bool)

(assert (=> b!5111 (=> res!6318 e!3292)))

(assert (=> b!5111 (= res!6318 (not (= (byteArrayBitContentToList!0 (_2!339 lt!6477) (_1!340 lt!6479) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!6476)))))

(declare-datatypes ((tuple2!644 0))(
  ( (tuple2!645 (_1!341 BitStream!306) (_2!341 BitStream!306)) )
))
(declare-fun lt!6474 () tuple2!644)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!306 BitStream!306 (_ BitVec 64)) List!64)

(assert (=> b!5111 (= lt!6476 (bitStreamReadBitsIntoList!0 (_2!339 lt!6477) (_1!341 lt!6474) nBits!460))))

(declare-fun readBits!0 (BitStream!306 (_ BitVec 64)) tuple2!642)

(assert (=> b!5111 (= lt!6479 (readBits!0 (_1!341 lt!6474) nBits!460))))

(assert (=> b!5111 (validate_offset_bits!1 ((_ sign_extend 32) (size!164 (buf!488 (_2!339 lt!6477)))) ((_ sign_extend 32) (currentByte!1473 thiss!1486)) ((_ sign_extend 32) (currentBit!1468 thiss!1486)) nBits!460)))

(declare-fun lt!6478 () Unit!402)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!306 array!386 (_ BitVec 64)) Unit!402)

(assert (=> b!5111 (= lt!6478 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!488 (_2!339 lt!6477)) nBits!460))))

(declare-fun reader!0 (BitStream!306 BitStream!306) tuple2!644)

(assert (=> b!5111 (= lt!6474 (reader!0 thiss!1486 (_2!339 lt!6477)))))

(declare-fun b!5112 () Bool)

(declare-fun res!6322 () Bool)

(assert (=> b!5112 (=> (not res!6322) (not e!3291))))

(assert (=> b!5112 (= res!6322 (= (size!164 (buf!488 thiss!1486)) (size!164 (buf!488 (_2!339 lt!6477)))))))

(declare-fun b!5108 () Bool)

(assert (=> b!5108 (= e!3288 e!3291)))

(declare-fun res!6320 () Bool)

(assert (=> b!5108 (=> (not res!6320) (not e!3291))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!5108 (= res!6320 (invariant!0 (currentBit!1468 (_2!339 lt!6477)) (currentByte!1473 (_2!339 lt!6477)) (size!164 (buf!488 (_2!339 lt!6477)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!306 array!386 (_ BitVec 64) (_ BitVec 64)) tuple2!640)

(assert (=> b!5108 (= lt!6477 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun res!6317 () Bool)

(assert (=> start!1192 (=> (not res!6317) (not e!3288))))

(assert (=> start!1192 (= res!6317 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!164 srcBuffer!6))))))))

(assert (=> start!1192 e!3288))

(assert (=> start!1192 true))

(assert (=> start!1192 (array_inv!159 srcBuffer!6)))

(declare-fun inv!12 (BitStream!306) Bool)

(assert (=> start!1192 (and (inv!12 thiss!1486) e!3290)))

(assert (= (and start!1192 res!6317) b!5106))

(assert (= (and b!5106 res!6315) b!5108))

(assert (= (and b!5108 res!6320) b!5112))

(assert (= (and b!5112 res!6322) b!5104))

(assert (= (and b!5104 res!6316) b!5109))

(assert (= (and b!5109 res!6319) b!5111))

(assert (= (and b!5111 (not res!6318)) b!5110))

(assert (= (and b!5110 (not res!6321)) b!5105))

(assert (= start!1192 b!5107))

(declare-fun m!6217 () Bool)

(assert (=> b!5108 m!6217))

(declare-fun m!6219 () Bool)

(assert (=> b!5108 m!6219))

(declare-fun m!6221 () Bool)

(assert (=> b!5107 m!6221))

(declare-fun m!6223 () Bool)

(assert (=> b!5110 m!6223))

(declare-fun m!6225 () Bool)

(assert (=> b!5105 m!6225))

(declare-fun m!6227 () Bool)

(assert (=> b!5104 m!6227))

(declare-fun m!6229 () Bool)

(assert (=> b!5104 m!6229))

(declare-fun m!6231 () Bool)

(assert (=> b!5109 m!6231))

(declare-fun m!6233 () Bool)

(assert (=> b!5111 m!6233))

(declare-fun m!6235 () Bool)

(assert (=> b!5111 m!6235))

(declare-fun m!6237 () Bool)

(assert (=> b!5111 m!6237))

(declare-fun m!6239 () Bool)

(assert (=> b!5111 m!6239))

(declare-fun m!6241 () Bool)

(assert (=> b!5111 m!6241))

(declare-fun m!6243 () Bool)

(assert (=> b!5111 m!6243))

(declare-fun m!6245 () Bool)

(assert (=> b!5106 m!6245))

(declare-fun m!6247 () Bool)

(assert (=> start!1192 m!6247))

(declare-fun m!6249 () Bool)

(assert (=> start!1192 m!6249))

(check-sat (not b!5108) (not b!5104) (not b!5111) (not start!1192) (not b!5106) (not b!5107) (not b!5110) (not b!5109) (not b!5105))
