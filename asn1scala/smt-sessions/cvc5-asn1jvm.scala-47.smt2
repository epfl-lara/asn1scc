; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!968 () Bool)

(assert start!968)

(declare-fun b!3662 () Bool)

(declare-fun e!2429 () Bool)

(declare-fun e!2428 () Bool)

(assert (=> b!3662 (= e!2429 (not e!2428))))

(declare-fun res!5181 () Bool)

(assert (=> b!3662 (=> res!5181 e!2428)))

(declare-datatypes ((array!300 0))(
  ( (array!301 (arr!511 (Array (_ BitVec 32) (_ BitVec 8))) (size!124 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!226 0))(
  ( (BitStream!227 (buf!442 array!300) (currentByte!1415 (_ BitVec 32)) (currentBit!1410 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!274 0))(
  ( (Unit!275) )
))
(declare-datatypes ((tuple2!376 0))(
  ( (tuple2!377 (_1!201 Unit!274) (_2!201 BitStream!226)) )
))
(declare-fun lt!4336 () tuple2!376)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((tuple2!378 0))(
  ( (tuple2!379 (_1!202 BitStream!226) (_2!202 BitStream!226)) )
))
(declare-fun lt!4335 () tuple2!378)

(declare-datatypes ((List!24 0))(
  ( (Nil!21) (Cons!20 (h!139 Bool) (t!774 List!24)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!226 array!300 (_ BitVec 64) (_ BitVec 64)) List!24)

(declare-datatypes ((tuple2!380 0))(
  ( (tuple2!381 (_1!203 array!300) (_2!203 BitStream!226)) )
))
(declare-fun readBits!0 (BitStream!226 (_ BitVec 64)) tuple2!380)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!226 BitStream!226 (_ BitVec 64)) List!24)

(assert (=> b!3662 (= res!5181 (not (= (byteArrayBitContentToList!0 (_2!201 lt!4336) (_1!203 (readBits!0 (_1!202 lt!4335) nBits!460)) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!201 lt!4336) (_1!202 lt!4335) nBits!460))))))

(declare-fun thiss!1486 () BitStream!226)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3662 (validate_offset_bits!1 ((_ sign_extend 32) (size!124 (buf!442 (_2!201 lt!4336)))) ((_ sign_extend 32) (currentByte!1415 thiss!1486)) ((_ sign_extend 32) (currentBit!1410 thiss!1486)) nBits!460)))

(declare-fun lt!4337 () Unit!274)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!226 array!300 (_ BitVec 64)) Unit!274)

(assert (=> b!3662 (= lt!4337 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!442 (_2!201 lt!4336)) nBits!460))))

(declare-fun reader!0 (BitStream!226 BitStream!226) tuple2!378)

(assert (=> b!3662 (= lt!4335 (reader!0 thiss!1486 (_2!201 lt!4336)))))

(declare-fun b!3664 () Bool)

(declare-fun res!5183 () Bool)

(declare-fun e!2427 () Bool)

(assert (=> b!3664 (=> (not res!5183) (not e!2427))))

(assert (=> b!3664 (= res!5183 (validate_offset_bits!1 ((_ sign_extend 32) (size!124 (buf!442 thiss!1486))) ((_ sign_extend 32) (currentByte!1415 thiss!1486)) ((_ sign_extend 32) (currentBit!1410 thiss!1486)) nBits!460))))

(declare-fun b!3665 () Bool)

(assert (=> b!3665 (= e!2427 e!2429)))

(declare-fun res!5179 () Bool)

(assert (=> b!3665 (=> (not res!5179) (not e!2429))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!3665 (= res!5179 (invariant!0 (currentBit!1410 (_2!201 lt!4336)) (currentByte!1415 (_2!201 lt!4336)) (size!124 (buf!442 (_2!201 lt!4336)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!300)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!226 array!300 (_ BitVec 64) (_ BitVec 64)) tuple2!376)

(assert (=> b!3665 (= lt!4336 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun res!5182 () Bool)

(assert (=> start!968 (=> (not res!5182) (not e!2427))))

(assert (=> start!968 (= res!5182 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!124 srcBuffer!6))))))))

(assert (=> start!968 e!2427))

(assert (=> start!968 true))

(declare-fun array_inv!119 (array!300) Bool)

(assert (=> start!968 (array_inv!119 srcBuffer!6)))

(declare-fun e!2424 () Bool)

(declare-fun inv!12 (BitStream!226) Bool)

(assert (=> start!968 (and (inv!12 thiss!1486) e!2424)))

(declare-fun b!3663 () Bool)

(assert (=> b!3663 (= e!2428 (validate_offset_bits!1 ((_ sign_extend 32) (size!124 (buf!442 (_1!202 lt!4335)))) ((_ sign_extend 32) (currentByte!1415 (_1!202 lt!4335))) ((_ sign_extend 32) (currentBit!1410 (_1!202 lt!4335))) nBits!460))))

(declare-fun b!3666 () Bool)

(assert (=> b!3666 (= e!2424 (array_inv!119 (buf!442 thiss!1486)))))

(declare-fun b!3667 () Bool)

(declare-fun res!5180 () Bool)

(assert (=> b!3667 (=> (not res!5180) (not e!2429))))

(declare-fun isPrefixOf!0 (BitStream!226 BitStream!226) Bool)

(assert (=> b!3667 (= res!5180 (isPrefixOf!0 thiss!1486 (_2!201 lt!4336)))))

(declare-fun b!3668 () Bool)

(declare-fun res!5184 () Bool)

(assert (=> b!3668 (=> (not res!5184) (not e!2429))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!3668 (= res!5184 (= (bitIndex!0 (size!124 (buf!442 (_2!201 lt!4336))) (currentByte!1415 (_2!201 lt!4336)) (currentBit!1410 (_2!201 lt!4336))) (bvadd (bitIndex!0 (size!124 (buf!442 thiss!1486)) (currentByte!1415 thiss!1486) (currentBit!1410 thiss!1486)) nBits!460)))))

(declare-fun b!3669 () Bool)

(declare-fun res!5185 () Bool)

(assert (=> b!3669 (=> (not res!5185) (not e!2429))))

(assert (=> b!3669 (= res!5185 (= (size!124 (buf!442 thiss!1486)) (size!124 (buf!442 (_2!201 lt!4336)))))))

(assert (= (and start!968 res!5182) b!3664))

(assert (= (and b!3664 res!5183) b!3665))

(assert (= (and b!3665 res!5179) b!3669))

(assert (= (and b!3669 res!5185) b!3668))

(assert (= (and b!3668 res!5184) b!3667))

(assert (= (and b!3667 res!5180) b!3662))

(assert (= (and b!3662 (not res!5181)) b!3663))

(assert (= start!968 b!3666))

(declare-fun m!4101 () Bool)

(assert (=> b!3666 m!4101))

(declare-fun m!4103 () Bool)

(assert (=> b!3667 m!4103))

(declare-fun m!4105 () Bool)

(assert (=> b!3662 m!4105))

(declare-fun m!4107 () Bool)

(assert (=> b!3662 m!4107))

(declare-fun m!4109 () Bool)

(assert (=> b!3662 m!4109))

(declare-fun m!4111 () Bool)

(assert (=> b!3662 m!4111))

(declare-fun m!4113 () Bool)

(assert (=> b!3662 m!4113))

(declare-fun m!4115 () Bool)

(assert (=> b!3662 m!4115))

(declare-fun m!4117 () Bool)

(assert (=> b!3665 m!4117))

(declare-fun m!4119 () Bool)

(assert (=> b!3665 m!4119))

(declare-fun m!4121 () Bool)

(assert (=> start!968 m!4121))

(declare-fun m!4123 () Bool)

(assert (=> start!968 m!4123))

(declare-fun m!4125 () Bool)

(assert (=> b!3663 m!4125))

(declare-fun m!4127 () Bool)

(assert (=> b!3668 m!4127))

(declare-fun m!4129 () Bool)

(assert (=> b!3668 m!4129))

(declare-fun m!4131 () Bool)

(assert (=> b!3664 m!4131))

(push 1)

(assert (not b!3665))

(assert (not b!3667))

(assert (not b!3662))

(assert (not b!3666))

(assert (not start!968))

(assert (not b!3668))

(assert (not b!3663))

(assert (not b!3664))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1666 () Bool)

(declare-fun res!5245 () Bool)

(declare-fun e!2477 () Bool)

(assert (=> d!1666 (=> (not res!5245) (not e!2477))))

(assert (=> d!1666 (= res!5245 (= (size!124 (buf!442 thiss!1486)) (size!124 (buf!442 (_2!201 lt!4336)))))))

(assert (=> d!1666 (= (isPrefixOf!0 thiss!1486 (_2!201 lt!4336)) e!2477)))

(declare-fun b!3733 () Bool)

(declare-fun res!5244 () Bool)

(assert (=> b!3733 (=> (not res!5244) (not e!2477))))

(assert (=> b!3733 (= res!5244 (bvsle (bitIndex!0 (size!124 (buf!442 thiss!1486)) (currentByte!1415 thiss!1486) (currentBit!1410 thiss!1486)) (bitIndex!0 (size!124 (buf!442 (_2!201 lt!4336))) (currentByte!1415 (_2!201 lt!4336)) (currentBit!1410 (_2!201 lt!4336)))))))

(declare-fun b!3734 () Bool)

(declare-fun e!2476 () Bool)

(assert (=> b!3734 (= e!2477 e!2476)))

(declare-fun res!5243 () Bool)

(assert (=> b!3734 (=> res!5243 e!2476)))

(assert (=> b!3734 (= res!5243 (= (size!124 (buf!442 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!3735 () Bool)

(declare-fun arrayBitRangesEq!0 (array!300 array!300 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3735 (= e!2476 (arrayBitRangesEq!0 (buf!442 thiss!1486) (buf!442 (_2!201 lt!4336)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!124 (buf!442 thiss!1486)) (currentByte!1415 thiss!1486) (currentBit!1410 thiss!1486))))))

(assert (= (and d!1666 res!5245) b!3733))

(assert (= (and b!3733 res!5244) b!3734))

(assert (= (and b!3734 (not res!5243)) b!3735))

(assert (=> b!3733 m!4129))

(assert (=> b!3733 m!4127))

(assert (=> b!3735 m!4129))

(assert (=> b!3735 m!4129))

(declare-fun m!4203 () Bool)

(assert (=> b!3735 m!4203))

(assert (=> b!3667 d!1666))

(declare-fun d!1668 () Bool)

(declare-fun e!2483 () Bool)

(assert (=> d!1668 e!2483))

(declare-fun c!158 () Bool)

(assert (=> d!1668 (= c!158 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!4367 () List!24)

(declare-datatypes ((tuple2!394 0))(
  ( (tuple2!395 (_1!210 List!24) (_2!210 BitStream!226)) )
))
(declare-fun e!2482 () tuple2!394)

(assert (=> d!1668 (= lt!4367 (_1!210 e!2482))))

(declare-fun c!157 () Bool)

(assert (=> d!1668 (= c!157 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!1668 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1668 (= (bitStreamReadBitsIntoList!0 (_2!201 lt!4336) (_1!202 lt!4335) nBits!460) lt!4367)))

(declare-fun b!3744 () Bool)

(assert (=> b!3744 (= e!2482 (tuple2!395 Nil!21 (_1!202 lt!4335)))))

(declare-fun b!3746 () Bool)

(declare-fun isEmpty!7 (List!24) Bool)

(assert (=> b!3746 (= e!2483 (isEmpty!7 lt!4367))))

(declare-fun b!3747 () Bool)

(declare-fun length!2 (List!24) Int)

(assert (=> b!3747 (= e!2483 (> (length!2 lt!4367) 0))))

(declare-fun lt!4366 () (_ BitVec 64))

(declare-fun b!3745 () Bool)

(declare-datatypes ((tuple2!396 0))(
  ( (tuple2!397 (_1!212 Bool) (_2!212 BitStream!226)) )
))
(declare-fun lt!4365 () tuple2!396)

(assert (=> b!3745 (= e!2482 (tuple2!395 (Cons!20 (_1!212 lt!4365) (bitStreamReadBitsIntoList!0 (_2!201 lt!4336) (_2!212 lt!4365) (bvsub nBits!460 lt!4366))) (_2!212 lt!4365)))))

(declare-fun readBit!0 (BitStream!226) tuple2!396)

(assert (=> b!3745 (= lt!4365 (readBit!0 (_1!202 lt!4335)))))

(assert (=> b!3745 (= lt!4366 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!1668 c!157) b!3744))

(assert (= (and d!1668 (not c!157)) b!3745))

(assert (= (and d!1668 c!158) b!3746))

(assert (= (and d!1668 (not c!158)) b!3747))

(declare-fun m!4205 () Bool)

(assert (=> b!3746 m!4205))

(declare-fun m!4207 () Bool)

(assert (=> b!3747 m!4207))

(declare-fun m!4209 () Bool)

(assert (=> b!3745 m!4209))

(declare-fun m!4211 () Bool)

(assert (=> b!3745 m!4211))

(assert (=> b!3662 d!1668))

(declare-fun d!1670 () Bool)

(assert (=> d!1670 (validate_offset_bits!1 ((_ sign_extend 32) (size!124 (buf!442 (_2!201 lt!4336)))) ((_ sign_extend 32) (currentByte!1415 thiss!1486)) ((_ sign_extend 32) (currentBit!1410 thiss!1486)) nBits!460)))

(declare-fun lt!4370 () Unit!274)

(declare-fun choose!9 (BitStream!226 array!300 (_ BitVec 64) BitStream!226) Unit!274)

(assert (=> d!1670 (= lt!4370 (choose!9 thiss!1486 (buf!442 (_2!201 lt!4336)) nBits!460 (BitStream!227 (buf!442 (_2!201 lt!4336)) (currentByte!1415 thiss!1486) (currentBit!1410 thiss!1486))))))

(assert (=> d!1670 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!442 (_2!201 lt!4336)) nBits!460) lt!4370)))

(declare-fun bs!617 () Bool)

(assert (= bs!617 d!1670))

(assert (=> bs!617 m!4115))

(declare-fun m!4215 () Bool)

(assert (=> bs!617 m!4215))

(assert (=> b!3662 d!1670))

(declare-fun d!1676 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!1676 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!124 (buf!442 (_2!201 lt!4336)))) ((_ sign_extend 32) (currentByte!1415 thiss!1486)) ((_ sign_extend 32) (currentBit!1410 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!124 (buf!442 (_2!201 lt!4336)))) ((_ sign_extend 32) (currentByte!1415 thiss!1486)) ((_ sign_extend 32) (currentBit!1410 thiss!1486))) nBits!460))))

(declare-fun bs!618 () Bool)

(assert (= bs!618 d!1676))

(declare-fun m!4217 () Bool)

(assert (=> bs!618 m!4217))

(assert (=> b!3662 d!1676))

(declare-fun b!3800 () Bool)

(declare-fun res!5274 () Bool)

(declare-fun e!2504 () Bool)

(assert (=> b!3800 (=> (not res!5274) (not e!2504))))

(declare-fun lt!4517 () (_ BitVec 64))

(declare-fun lt!4513 () tuple2!380)

(assert (=> b!3800 (= res!5274 (= (bvadd lt!4517 nBits!460) (bitIndex!0 (size!124 (buf!442 (_2!203 lt!4513))) (currentByte!1415 (_2!203 lt!4513)) (currentBit!1410 (_2!203 lt!4513)))))))

(assert (=> b!3800 (or (not (= (bvand lt!4517 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!4517 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!4517 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3800 (= lt!4517 (bitIndex!0 (size!124 (buf!442 (_1!202 lt!4335))) (currentByte!1415 (_1!202 lt!4335)) (currentBit!1410 (_1!202 lt!4335))))))

(declare-fun b!3801 () Bool)

(assert (=> b!3801 (= e!2504 (= (byteArrayBitContentToList!0 (_2!203 lt!4513) (_1!203 lt!4513) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!203 lt!4513) (_1!202 lt!4335) nBits!460)))))

(declare-fun b!3802 () Bool)

(declare-fun res!5276 () Bool)

(assert (=> b!3802 (=> (not res!5276) (not e!2504))))

(assert (=> b!3802 (= res!5276 (bvsle (currentByte!1415 (_1!202 lt!4335)) (currentByte!1415 (_2!203 lt!4513))))))

(declare-fun d!1678 () Bool)

(assert (=> d!1678 e!2504))

(declare-fun res!5278 () Bool)

(assert (=> d!1678 (=> (not res!5278) (not e!2504))))

(assert (=> d!1678 (= res!5278 (= (buf!442 (_2!203 lt!4513)) (buf!442 (_1!202 lt!4335))))))

(declare-datatypes ((tuple3!28 0))(
  ( (tuple3!29 (_1!214 Unit!274) (_2!214 BitStream!226) (_3!14 array!300)) )
))
(declare-fun lt!4520 () tuple3!28)

(assert (=> d!1678 (= lt!4513 (tuple2!381 (_3!14 lt!4520) (_2!214 lt!4520)))))

(declare-fun readBitsLoop!0 (BitStream!226 (_ BitVec 64) array!300 (_ BitVec 64) (_ BitVec 64)) tuple3!28)

(assert (=> d!1678 (= lt!4520 (readBitsLoop!0 (_1!202 lt!4335) nBits!460 (array!301 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!1678 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!1678 (= (readBits!0 (_1!202 lt!4335) nBits!460) lt!4513)))

(declare-fun b!3803 () Bool)

(declare-fun res!5277 () Bool)

(assert (=> b!3803 (=> (not res!5277) (not e!2504))))

(declare-fun lt!4516 () (_ BitVec 64))

(assert (=> b!3803 (= res!5277 (= (size!124 (_1!203 lt!4513)) ((_ extract 31 0) lt!4516)))))

(assert (=> b!3803 (and (bvslt lt!4516 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!4516 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!4515 () (_ BitVec 64))

(declare-fun lt!4518 () (_ BitVec 64))

(assert (=> b!3803 (= lt!4516 (bvsdiv lt!4515 lt!4518))))

(assert (=> b!3803 (and (not (= lt!4518 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!4515 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!4518 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!3803 (= lt!4518 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!4512 () (_ BitVec 64))

(declare-fun lt!4514 () (_ BitVec 64))

(assert (=> b!3803 (= lt!4515 (bvsub lt!4512 lt!4514))))

(assert (=> b!3803 (or (= (bvand lt!4512 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!4514 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!4512 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!4512 lt!4514) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3803 (= lt!4514 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!4519 () (_ BitVec 64))

(assert (=> b!3803 (= lt!4512 (bvadd nBits!460 lt!4519))))

(assert (=> b!3803 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!4519 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!4519) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3803 (= lt!4519 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!3804 () Bool)

(declare-fun res!5275 () Bool)

(assert (=> b!3804 (=> (not res!5275) (not e!2504))))

(assert (=> b!3804 (= res!5275 (invariant!0 (currentBit!1410 (_2!203 lt!4513)) (currentByte!1415 (_2!203 lt!4513)) (size!124 (buf!442 (_2!203 lt!4513)))))))

(assert (= (and d!1678 res!5278) b!3800))

(assert (= (and b!3800 res!5274) b!3804))

(assert (= (and b!3804 res!5275) b!3803))

(assert (= (and b!3803 res!5277) b!3802))

(assert (= (and b!3802 res!5276) b!3801))

(declare-fun m!4267 () Bool)

(assert (=> b!3800 m!4267))

(declare-fun m!4271 () Bool)

(assert (=> b!3800 m!4271))

(declare-fun m!4275 () Bool)

(assert (=> b!3801 m!4275))

(declare-fun m!4277 () Bool)

(assert (=> b!3801 m!4277))

(declare-fun m!4279 () Bool)

(assert (=> d!1678 m!4279))

(declare-fun m!4285 () Bool)

(assert (=> b!3804 m!4285))

(assert (=> b!3662 d!1678))

(declare-fun d!1690 () Bool)

(declare-fun c!173 () Bool)

(assert (=> d!1690 (= c!173 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!2509 () List!24)

(assert (=> d!1690 (= (byteArrayBitContentToList!0 (_2!201 lt!4336) (_1!203 (readBits!0 (_1!202 lt!4335) nBits!460)) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!2509)))

(declare-fun b!3819 () Bool)

(assert (=> b!3819 (= e!2509 Nil!21)))

(declare-fun b!3820 () Bool)

(assert (=> b!3820 (= e!2509 (Cons!20 (not (= (bvand ((_ sign_extend 24) (select (arr!511 (_1!203 (readBits!0 (_1!202 lt!4335) nBits!460))) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!201 lt!4336) (_1!203 (readBits!0 (_1!202 lt!4335) nBits!460)) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!1690 c!173) b!3819))

(assert (= (and d!1690 (not c!173)) b!3820))

(declare-fun m!4307 () Bool)

(assert (=> b!3820 m!4307))

(declare-fun m!4309 () Bool)

(assert (=> b!3820 m!4309))

(declare-fun m!4311 () Bool)

(assert (=> b!3820 m!4311))

(assert (=> b!3662 d!1690))

(declare-fun e!2527 () Bool)

(declare-fun lt!4610 () tuple2!378)

(declare-fun lt!4617 () (_ BitVec 64))

(declare-fun lt!4616 () (_ BitVec 64))

(declare-fun b!3860 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!226 (_ BitVec 64)) BitStream!226)

(assert (=> b!3860 (= e!2527 (= (_1!202 lt!4610) (withMovedBitIndex!0 (_2!202 lt!4610) (bvsub lt!4616 lt!4617))))))

(assert (=> b!3860 (or (= (bvand lt!4616 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!4617 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!4616 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!4616 lt!4617) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3860 (= lt!4617 (bitIndex!0 (size!124 (buf!442 (_2!201 lt!4336))) (currentByte!1415 (_2!201 lt!4336)) (currentBit!1410 (_2!201 lt!4336))))))

(assert (=> b!3860 (= lt!4616 (bitIndex!0 (size!124 (buf!442 thiss!1486)) (currentByte!1415 thiss!1486) (currentBit!1410 thiss!1486)))))

(declare-fun b!3861 () Bool)

(declare-fun e!2528 () Unit!274)

(declare-fun lt!4609 () Unit!274)

(assert (=> b!3861 (= e!2528 lt!4609)))

(declare-fun lt!4625 () (_ BitVec 64))

(assert (=> b!3861 (= lt!4625 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!4621 () (_ BitVec 64))

(assert (=> b!3861 (= lt!4621 (bitIndex!0 (size!124 (buf!442 thiss!1486)) (currentByte!1415 thiss!1486) (currentBit!1410 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!300 array!300 (_ BitVec 64) (_ BitVec 64)) Unit!274)

(assert (=> b!3861 (= lt!4609 (arrayBitRangesEqSymmetric!0 (buf!442 thiss!1486) (buf!442 (_2!201 lt!4336)) lt!4625 lt!4621))))

(assert (=> b!3861 (arrayBitRangesEq!0 (buf!442 (_2!201 lt!4336)) (buf!442 thiss!1486) lt!4625 lt!4621)))

(declare-fun b!3862 () Bool)

(declare-fun res!5302 () Bool)

(assert (=> b!3862 (=> (not res!5302) (not e!2527))))

(assert (=> b!3862 (= res!5302 (isPrefixOf!0 (_2!202 lt!4610) (_2!201 lt!4336)))))

(declare-fun b!3863 () Bool)

(declare-fun Unit!285 () Unit!274)

(assert (=> b!3863 (= e!2528 Unit!285)))

(declare-fun d!1694 () Bool)

(assert (=> d!1694 e!2527))

(declare-fun res!5300 () Bool)

(assert (=> d!1694 (=> (not res!5300) (not e!2527))))

(assert (=> d!1694 (= res!5300 (isPrefixOf!0 (_1!202 lt!4610) (_2!202 lt!4610)))))

(declare-fun lt!4620 () BitStream!226)

(assert (=> d!1694 (= lt!4610 (tuple2!379 lt!4620 (_2!201 lt!4336)))))

(declare-fun lt!4608 () Unit!274)

(declare-fun lt!4622 () Unit!274)

(assert (=> d!1694 (= lt!4608 lt!4622)))

(assert (=> d!1694 (isPrefixOf!0 lt!4620 (_2!201 lt!4336))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!226 BitStream!226 BitStream!226) Unit!274)

(assert (=> d!1694 (= lt!4622 (lemmaIsPrefixTransitive!0 lt!4620 (_2!201 lt!4336) (_2!201 lt!4336)))))

(declare-fun lt!4607 () Unit!274)

(declare-fun lt!4618 () Unit!274)

(assert (=> d!1694 (= lt!4607 lt!4618)))

(assert (=> d!1694 (isPrefixOf!0 lt!4620 (_2!201 lt!4336))))

(assert (=> d!1694 (= lt!4618 (lemmaIsPrefixTransitive!0 lt!4620 thiss!1486 (_2!201 lt!4336)))))

(declare-fun lt!4623 () Unit!274)

(assert (=> d!1694 (= lt!4623 e!2528)))

(declare-fun c!188 () Bool)

(assert (=> d!1694 (= c!188 (not (= (size!124 (buf!442 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!4624 () Unit!274)

(declare-fun lt!4606 () Unit!274)

(assert (=> d!1694 (= lt!4624 lt!4606)))

(assert (=> d!1694 (isPrefixOf!0 (_2!201 lt!4336) (_2!201 lt!4336))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!226) Unit!274)

(assert (=> d!1694 (= lt!4606 (lemmaIsPrefixRefl!0 (_2!201 lt!4336)))))

(declare-fun lt!4614 () Unit!274)

(declare-fun lt!4619 () Unit!274)

(assert (=> d!1694 (= lt!4614 lt!4619)))

(assert (=> d!1694 (= lt!4619 (lemmaIsPrefixRefl!0 (_2!201 lt!4336)))))

(declare-fun lt!4613 () Unit!274)

(declare-fun lt!4615 () Unit!274)

(assert (=> d!1694 (= lt!4613 lt!4615)))

(assert (=> d!1694 (isPrefixOf!0 lt!4620 lt!4620)))

(assert (=> d!1694 (= lt!4615 (lemmaIsPrefixRefl!0 lt!4620))))

(declare-fun lt!4611 () Unit!274)

(declare-fun lt!4612 () Unit!274)

(assert (=> d!1694 (= lt!4611 lt!4612)))

(assert (=> d!1694 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!1694 (= lt!4612 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!1694 (= lt!4620 (BitStream!227 (buf!442 (_2!201 lt!4336)) (currentByte!1415 thiss!1486) (currentBit!1410 thiss!1486)))))

(assert (=> d!1694 (isPrefixOf!0 thiss!1486 (_2!201 lt!4336))))

(assert (=> d!1694 (= (reader!0 thiss!1486 (_2!201 lt!4336)) lt!4610)))

(declare-fun b!3864 () Bool)

(declare-fun res!5301 () Bool)

(assert (=> b!3864 (=> (not res!5301) (not e!2527))))

(assert (=> b!3864 (= res!5301 (isPrefixOf!0 (_1!202 lt!4610) thiss!1486))))

(assert (= (and d!1694 c!188) b!3861))

(assert (= (and d!1694 (not c!188)) b!3863))

(assert (= (and d!1694 res!5300) b!3864))

(assert (= (and b!3864 res!5301) b!3862))

(assert (= (and b!3862 res!5302) b!3860))

(declare-fun m!4341 () Bool)

(assert (=> b!3862 m!4341))

(declare-fun m!4343 () Bool)

(assert (=> b!3860 m!4343))

(assert (=> b!3860 m!4127))

(assert (=> b!3860 m!4129))

(declare-fun m!4345 () Bool)

(assert (=> d!1694 m!4345))

(declare-fun m!4347 () Bool)

(assert (=> d!1694 m!4347))

(declare-fun m!4349 () Bool)

(assert (=> d!1694 m!4349))

(declare-fun m!4351 () Bool)

(assert (=> d!1694 m!4351))

(assert (=> d!1694 m!4103))

(declare-fun m!4353 () Bool)

(assert (=> d!1694 m!4353))

(declare-fun m!4355 () Bool)

(assert (=> d!1694 m!4355))

(declare-fun m!4357 () Bool)

(assert (=> d!1694 m!4357))

(declare-fun m!4359 () Bool)

(assert (=> d!1694 m!4359))

(declare-fun m!4361 () Bool)

(assert (=> d!1694 m!4361))

(declare-fun m!4363 () Bool)

(assert (=> d!1694 m!4363))

(assert (=> b!3861 m!4129))

(declare-fun m!4365 () Bool)

(assert (=> b!3861 m!4365))

(declare-fun m!4367 () Bool)

(assert (=> b!3861 m!4367))

(declare-fun m!4369 () Bool)

(assert (=> b!3864 m!4369))

(assert (=> b!3662 d!1694))

(declare-fun d!1704 () Bool)

(assert (=> d!1704 (= (array_inv!119 (buf!442 thiss!1486)) (bvsge (size!124 (buf!442 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!3666 d!1704))

(declare-fun d!1706 () Bool)

(assert (=> d!1706 (= (array_inv!119 srcBuffer!6) (bvsge (size!124 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!968 d!1706))

(declare-fun d!1708 () Bool)

(assert (=> d!1708 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1410 thiss!1486) (currentByte!1415 thiss!1486) (size!124 (buf!442 thiss!1486))))))

(declare-fun bs!621 () Bool)

(assert (= bs!621 d!1708))

(declare-fun m!4371 () Bool)

(assert (=> bs!621 m!4371))

(assert (=> start!968 d!1708))

(declare-fun d!1710 () Bool)

(assert (=> d!1710 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!124 (buf!442 thiss!1486))) ((_ sign_extend 32) (currentByte!1415 thiss!1486)) ((_ sign_extend 32) (currentBit!1410 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!124 (buf!442 thiss!1486))) ((_ sign_extend 32) (currentByte!1415 thiss!1486)) ((_ sign_extend 32) (currentBit!1410 thiss!1486))) nBits!460))))

(declare-fun bs!622 () Bool)

(assert (= bs!622 d!1710))

(declare-fun m!4373 () Bool)

(assert (=> bs!622 m!4373))

(assert (=> b!3664 d!1710))

(declare-fun d!1712 () Bool)

(assert (=> d!1712 (= (invariant!0 (currentBit!1410 (_2!201 lt!4336)) (currentByte!1415 (_2!201 lt!4336)) (size!124 (buf!442 (_2!201 lt!4336)))) (and (bvsge (currentBit!1410 (_2!201 lt!4336)) #b00000000000000000000000000000000) (bvslt (currentBit!1410 (_2!201 lt!4336)) #b00000000000000000000000000001000) (bvsge (currentByte!1415 (_2!201 lt!4336)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1415 (_2!201 lt!4336)) (size!124 (buf!442 (_2!201 lt!4336)))) (and (= (currentBit!1410 (_2!201 lt!4336)) #b00000000000000000000000000000000) (= (currentByte!1415 (_2!201 lt!4336)) (size!124 (buf!442 (_2!201 lt!4336))))))))))

(assert (=> b!3665 d!1712))

(declare-fun d!1714 () Bool)

(declare-fun e!2556 () Bool)

(assert (=> d!1714 e!2556))

(declare-fun res!5369 () Bool)

(assert (=> d!1714 (=> (not res!5369) (not e!2556))))

(declare-fun lt!5006 () tuple2!376)

(declare-fun lt!4992 () (_ BitVec 64))

(assert (=> d!1714 (= res!5369 (= (bitIndex!0 (size!124 (buf!442 (_2!201 lt!5006))) (currentByte!1415 (_2!201 lt!5006)) (currentBit!1410 (_2!201 lt!5006))) (bvsub lt!4992 from!367)))))

(assert (=> d!1714 (or (= (bvand lt!4992 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!4992 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!4992 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!5016 () (_ BitVec 64))

(assert (=> d!1714 (= lt!4992 (bvadd lt!5016 from!367 nBits!460))))

(assert (=> d!1714 (or (not (= (bvand lt!5016 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!5016 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!5016 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1714 (= lt!5016 (bitIndex!0 (size!124 (buf!442 thiss!1486)) (currentByte!1415 thiss!1486) (currentBit!1410 thiss!1486)))))

(declare-fun e!2555 () tuple2!376)

(assert (=> d!1714 (= lt!5006 e!2555)))

(declare-fun c!196 () Bool)

(assert (=> d!1714 (= c!196 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!5011 () Unit!274)

(declare-fun lt!5005 () Unit!274)

(assert (=> d!1714 (= lt!5011 lt!5005)))

(assert (=> d!1714 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!1714 (= lt!5005 (lemmaIsPrefixRefl!0 thiss!1486))))

(declare-fun lt!4997 () (_ BitVec 64))

(assert (=> d!1714 (= lt!4997 (bitIndex!0 (size!124 (buf!442 thiss!1486)) (currentByte!1415 thiss!1486) (currentBit!1410 thiss!1486)))))

(assert (=> d!1714 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1714 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!5006)))

(declare-fun b!3940 () Bool)

(declare-fun res!5367 () Bool)

(assert (=> b!3940 (=> (not res!5367) (not e!2556))))

(assert (=> b!3940 (= res!5367 (= (size!124 (buf!442 (_2!201 lt!5006))) (size!124 (buf!442 thiss!1486))))))

(declare-fun lt!4984 () tuple2!378)

(declare-fun b!3941 () Bool)

(assert (=> b!3941 (= e!2556 (= (bitStreamReadBitsIntoList!0 (_2!201 lt!5006) (_1!202 lt!4984) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!201 lt!5006) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!3941 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3941 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!4983 () Unit!274)

(declare-fun lt!4987 () Unit!274)

(assert (=> b!3941 (= lt!4983 lt!4987)))

(declare-fun lt!4980 () (_ BitVec 64))

(assert (=> b!3941 (validate_offset_bits!1 ((_ sign_extend 32) (size!124 (buf!442 (_2!201 lt!5006)))) ((_ sign_extend 32) (currentByte!1415 thiss!1486)) ((_ sign_extend 32) (currentBit!1410 thiss!1486)) lt!4980)))

(assert (=> b!3941 (= lt!4987 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!442 (_2!201 lt!5006)) lt!4980))))

(declare-fun e!2557 () Bool)

(assert (=> b!3941 e!2557))

(declare-fun res!5365 () Bool)

(assert (=> b!3941 (=> (not res!5365) (not e!2557))))

(assert (=> b!3941 (= res!5365 (and (= (size!124 (buf!442 thiss!1486)) (size!124 (buf!442 (_2!201 lt!5006)))) (bvsge lt!4980 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3941 (= lt!4980 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!3941 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3941 (= lt!4984 (reader!0 thiss!1486 (_2!201 lt!5006)))))

(declare-fun bm!43 () Bool)

(declare-fun lt!5002 () tuple2!376)

(declare-fun call!46 () tuple2!378)

(declare-fun lt!4978 () tuple2!376)

(assert (=> bm!43 (= call!46 (reader!0 (ite c!196 (_2!201 lt!4978) thiss!1486) (ite c!196 (_2!201 lt!5002) thiss!1486)))))

(declare-fun b!3942 () Bool)

(assert (=> b!3942 (= e!2557 (validate_offset_bits!1 ((_ sign_extend 32) (size!124 (buf!442 thiss!1486))) ((_ sign_extend 32) (currentByte!1415 thiss!1486)) ((_ sign_extend 32) (currentBit!1410 thiss!1486)) lt!4980))))

(declare-fun b!3943 () Bool)

(declare-fun res!5368 () Bool)

(assert (=> b!3943 (=> (not res!5368) (not e!2556))))

(assert (=> b!3943 (= res!5368 (isPrefixOf!0 thiss!1486 (_2!201 lt!5006)))))

(declare-fun b!3944 () Bool)

(declare-fun Unit!290 () Unit!274)

(assert (=> b!3944 (= e!2555 (tuple2!377 Unit!290 thiss!1486))))

(assert (=> b!3944 (= (size!124 (buf!442 thiss!1486)) (size!124 (buf!442 thiss!1486)))))

(declare-fun lt!5008 () Unit!274)

(declare-fun Unit!291 () Unit!274)

(assert (=> b!3944 (= lt!5008 Unit!291)))

(declare-fun checkByteArrayBitContent!0 (BitStream!226 array!300 array!300 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3944 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!203 (readBits!0 (_1!202 call!46) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!3945 () Bool)

(declare-fun res!5364 () Bool)

(assert (=> b!3945 (=> (not res!5364) (not e!2556))))

(assert (=> b!3945 (= res!5364 (invariant!0 (currentBit!1410 (_2!201 lt!5006)) (currentByte!1415 (_2!201 lt!5006)) (size!124 (buf!442 (_2!201 lt!5006)))))))

(declare-fun b!3946 () Bool)

(declare-fun Unit!292 () Unit!274)

(assert (=> b!3946 (= e!2555 (tuple2!377 Unit!292 (_2!201 lt!5002)))))

(declare-fun appendBitFromByte!0 (BitStream!226 (_ BitVec 8) (_ BitVec 32)) tuple2!376)

(assert (=> b!3946 (= lt!4978 (appendBitFromByte!0 thiss!1486 (select (arr!511 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!5000 () (_ BitVec 64))

(assert (=> b!3946 (= lt!5000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!4995 () (_ BitVec 64))

(assert (=> b!3946 (= lt!4995 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!4993 () Unit!274)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!226 BitStream!226 (_ BitVec 64) (_ BitVec 64)) Unit!274)

(assert (=> b!3946 (= lt!4993 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!201 lt!4978) lt!5000 lt!4995))))

(assert (=> b!3946 (validate_offset_bits!1 ((_ sign_extend 32) (size!124 (buf!442 (_2!201 lt!4978)))) ((_ sign_extend 32) (currentByte!1415 (_2!201 lt!4978))) ((_ sign_extend 32) (currentBit!1410 (_2!201 lt!4978))) (bvsub lt!5000 lt!4995))))

(declare-fun lt!5015 () Unit!274)

(assert (=> b!3946 (= lt!5015 lt!4993)))

(declare-fun lt!5013 () tuple2!378)

(assert (=> b!3946 (= lt!5013 (reader!0 thiss!1486 (_2!201 lt!4978)))))

(declare-fun lt!4977 () (_ BitVec 64))

(assert (=> b!3946 (= lt!4977 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!5014 () Unit!274)

(assert (=> b!3946 (= lt!5014 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!442 (_2!201 lt!4978)) lt!4977))))

(assert (=> b!3946 (validate_offset_bits!1 ((_ sign_extend 32) (size!124 (buf!442 (_2!201 lt!4978)))) ((_ sign_extend 32) (currentByte!1415 thiss!1486)) ((_ sign_extend 32) (currentBit!1410 thiss!1486)) lt!4977)))

(declare-fun lt!5003 () Unit!274)

(assert (=> b!3946 (= lt!5003 lt!5014)))

(declare-fun head!18 (List!24) Bool)

(assert (=> b!3946 (= (head!18 (byteArrayBitContentToList!0 (_2!201 lt!4978) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!18 (bitStreamReadBitsIntoList!0 (_2!201 lt!4978) (_1!202 lt!5013) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!4989 () Unit!274)

(declare-fun Unit!293 () Unit!274)

(assert (=> b!3946 (= lt!4989 Unit!293)))

(assert (=> b!3946 (= lt!5002 (appendBitsMSBFirstLoop!0 (_2!201 lt!4978) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!4975 () Unit!274)

(assert (=> b!3946 (= lt!4975 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!201 lt!4978) (_2!201 lt!5002)))))

(assert (=> b!3946 (isPrefixOf!0 thiss!1486 (_2!201 lt!5002))))

(declare-fun lt!4973 () Unit!274)

(assert (=> b!3946 (= lt!4973 lt!4975)))

(assert (=> b!3946 (= (size!124 (buf!442 (_2!201 lt!5002))) (size!124 (buf!442 thiss!1486)))))

(declare-fun lt!4979 () Unit!274)

(declare-fun Unit!296 () Unit!274)

(assert (=> b!3946 (= lt!4979 Unit!296)))

(assert (=> b!3946 (= (bitIndex!0 (size!124 (buf!442 (_2!201 lt!5002))) (currentByte!1415 (_2!201 lt!5002)) (currentBit!1410 (_2!201 lt!5002))) (bvsub (bvadd (bitIndex!0 (size!124 (buf!442 thiss!1486)) (currentByte!1415 thiss!1486) (currentBit!1410 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!4999 () Unit!274)

(declare-fun Unit!297 () Unit!274)

(assert (=> b!3946 (= lt!4999 Unit!297)))

(assert (=> b!3946 (= (bitIndex!0 (size!124 (buf!442 (_2!201 lt!5002))) (currentByte!1415 (_2!201 lt!5002)) (currentBit!1410 (_2!201 lt!5002))) (bvsub (bvsub (bvadd (bitIndex!0 (size!124 (buf!442 (_2!201 lt!4978))) (currentByte!1415 (_2!201 lt!4978)) (currentBit!1410 (_2!201 lt!4978))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!4991 () Unit!274)

(declare-fun Unit!298 () Unit!274)

(assert (=> b!3946 (= lt!4991 Unit!298)))

(declare-fun lt!5004 () tuple2!378)

(assert (=> b!3946 (= lt!5004 (reader!0 thiss!1486 (_2!201 lt!5002)))))

(declare-fun lt!4990 () (_ BitVec 64))

(assert (=> b!3946 (= lt!4990 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!5001 () Unit!274)

(assert (=> b!3946 (= lt!5001 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!442 (_2!201 lt!5002)) lt!4990))))

(assert (=> b!3946 (validate_offset_bits!1 ((_ sign_extend 32) (size!124 (buf!442 (_2!201 lt!5002)))) ((_ sign_extend 32) (currentByte!1415 thiss!1486)) ((_ sign_extend 32) (currentBit!1410 thiss!1486)) lt!4990)))

(declare-fun lt!4974 () Unit!274)

(assert (=> b!3946 (= lt!4974 lt!5001)))

(declare-fun lt!4994 () tuple2!378)

(assert (=> b!3946 (= lt!4994 call!46)))

(declare-fun lt!4996 () (_ BitVec 64))

(assert (=> b!3946 (= lt!4996 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!4998 () Unit!274)

(assert (=> b!3946 (= lt!4998 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!201 lt!4978) (buf!442 (_2!201 lt!5002)) lt!4996))))

(assert (=> b!3946 (validate_offset_bits!1 ((_ sign_extend 32) (size!124 (buf!442 (_2!201 lt!5002)))) ((_ sign_extend 32) (currentByte!1415 (_2!201 lt!4978))) ((_ sign_extend 32) (currentBit!1410 (_2!201 lt!4978))) lt!4996)))

(declare-fun lt!4976 () Unit!274)

(assert (=> b!3946 (= lt!4976 lt!4998)))

(declare-fun lt!4988 () List!24)

(assert (=> b!3946 (= lt!4988 (byteArrayBitContentToList!0 (_2!201 lt!5002) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!4985 () List!24)

(assert (=> b!3946 (= lt!4985 (byteArrayBitContentToList!0 (_2!201 lt!5002) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!5007 () List!24)

(assert (=> b!3946 (= lt!5007 (bitStreamReadBitsIntoList!0 (_2!201 lt!5002) (_1!202 lt!5004) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!5010 () List!24)

(assert (=> b!3946 (= lt!5010 (bitStreamReadBitsIntoList!0 (_2!201 lt!5002) (_1!202 lt!4994) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!4981 () (_ BitVec 64))

(assert (=> b!3946 (= lt!4981 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!4982 () Unit!274)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!226 BitStream!226 BitStream!226 BitStream!226 (_ BitVec 64) List!24) Unit!274)

(assert (=> b!3946 (= lt!4982 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!201 lt!5002) (_2!201 lt!5002) (_1!202 lt!5004) (_1!202 lt!4994) lt!4981 lt!5007))))

(declare-fun tail!26 (List!24) List!24)

(assert (=> b!3946 (= (bitStreamReadBitsIntoList!0 (_2!201 lt!5002) (_1!202 lt!4994) (bvsub lt!4981 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!26 lt!5007))))

(declare-fun lt!5012 () Unit!274)

(assert (=> b!3946 (= lt!5012 lt!4982)))

(declare-fun lt!4986 () Unit!274)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!300 array!300 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!274)

(assert (=> b!3946 (= lt!4986 (arrayBitRangesEqImpliesEq!0 (buf!442 (_2!201 lt!4978)) (buf!442 (_2!201 lt!5002)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!4997 (bitIndex!0 (size!124 (buf!442 (_2!201 lt!4978))) (currentByte!1415 (_2!201 lt!4978)) (currentBit!1410 (_2!201 lt!4978)))))))

(declare-fun bitAt!0 (array!300 (_ BitVec 64)) Bool)

(assert (=> b!3946 (= (bitAt!0 (buf!442 (_2!201 lt!4978)) lt!4997) (bitAt!0 (buf!442 (_2!201 lt!5002)) lt!4997))))

(declare-fun lt!5009 () Unit!274)

(assert (=> b!3946 (= lt!5009 lt!4986)))

(declare-fun b!3947 () Bool)

(declare-fun res!5366 () Bool)

(assert (=> b!3947 (=> (not res!5366) (not e!2556))))

(assert (=> b!3947 (= res!5366 (= (size!124 (buf!442 thiss!1486)) (size!124 (buf!442 (_2!201 lt!5006)))))))

(assert (= (and d!1714 c!196) b!3946))

(assert (= (and d!1714 (not c!196)) b!3944))

(assert (= (or b!3946 b!3944) bm!43))

(assert (= (and d!1714 res!5369) b!3945))

(assert (= (and b!3945 res!5364) b!3947))

(assert (= (and b!3947 res!5366) b!3943))

(assert (= (and b!3943 res!5368) b!3940))

(assert (= (and b!3940 res!5367) b!3941))

(assert (= (and b!3941 res!5365) b!3942))

(declare-fun m!4479 () Bool)

(assert (=> b!3945 m!4479))

(declare-fun m!4481 () Bool)

(assert (=> bm!43 m!4481))

(declare-fun m!4483 () Bool)

(assert (=> d!1714 m!4483))

(assert (=> d!1714 m!4129))

(assert (=> d!1714 m!4361))

(assert (=> d!1714 m!4359))

(declare-fun m!4485 () Bool)

(assert (=> b!3941 m!4485))

(declare-fun m!4487 () Bool)

(assert (=> b!3941 m!4487))

(declare-fun m!4489 () Bool)

(assert (=> b!3941 m!4489))

(declare-fun m!4491 () Bool)

(assert (=> b!3941 m!4491))

(declare-fun m!4493 () Bool)

(assert (=> b!3941 m!4493))

(declare-fun m!4495 () Bool)

(assert (=> b!3946 m!4495))

(declare-fun m!4497 () Bool)

(assert (=> b!3946 m!4497))

(declare-fun m!4499 () Bool)

(assert (=> b!3946 m!4499))

(declare-fun m!4501 () Bool)

(assert (=> b!3946 m!4501))

(declare-fun m!4503 () Bool)

(assert (=> b!3946 m!4503))

(declare-fun m!4505 () Bool)

(assert (=> b!3946 m!4505))

(declare-fun m!4507 () Bool)

(assert (=> b!3946 m!4507))

(declare-fun m!4509 () Bool)

(assert (=> b!3946 m!4509))

(declare-fun m!4511 () Bool)

(assert (=> b!3946 m!4511))

(declare-fun m!4513 () Bool)

(assert (=> b!3946 m!4513))

(declare-fun m!4515 () Bool)

(assert (=> b!3946 m!4515))

(declare-fun m!4517 () Bool)

(assert (=> b!3946 m!4517))

(declare-fun m!4519 () Bool)

(assert (=> b!3946 m!4519))

(declare-fun m!4521 () Bool)

(assert (=> b!3946 m!4521))

(declare-fun m!4523 () Bool)

(assert (=> b!3946 m!4523))

(assert (=> b!3946 m!4521))

(declare-fun m!4525 () Bool)

(assert (=> b!3946 m!4525))

(declare-fun m!4527 () Bool)

(assert (=> b!3946 m!4527))

(assert (=> b!3946 m!4507))

(declare-fun m!4529 () Bool)

(assert (=> b!3946 m!4529))

(declare-fun m!4531 () Bool)

(assert (=> b!3946 m!4531))

(declare-fun m!4533 () Bool)

(assert (=> b!3946 m!4533))

(declare-fun m!4535 () Bool)

(assert (=> b!3946 m!4535))

(declare-fun m!4537 () Bool)

(assert (=> b!3946 m!4537))

(declare-fun m!4539 () Bool)

(assert (=> b!3946 m!4539))

(declare-fun m!4541 () Bool)

(assert (=> b!3946 m!4541))

(assert (=> b!3946 m!4499))

(declare-fun m!4543 () Bool)

(assert (=> b!3946 m!4543))

(assert (=> b!3946 m!4535))

(declare-fun m!4545 () Bool)

(assert (=> b!3946 m!4545))

(declare-fun m!4547 () Bool)

(assert (=> b!3946 m!4547))

(declare-fun m!4549 () Bool)

(assert (=> b!3946 m!4549))

(declare-fun m!4551 () Bool)

(assert (=> b!3946 m!4551))

(declare-fun m!4553 () Bool)

(assert (=> b!3946 m!4553))

(declare-fun m!4555 () Bool)

(assert (=> b!3946 m!4555))

(assert (=> b!3946 m!4129))

(declare-fun m!4558 () Bool)

(assert (=> b!3944 m!4558))

(declare-fun m!4563 () Bool)

(assert (=> b!3944 m!4563))

(declare-fun m!4567 () Bool)

(assert (=> b!3942 m!4567))

(declare-fun m!4571 () Bool)

(assert (=> b!3943 m!4571))

(assert (=> b!3665 d!1714))

(declare-fun d!1732 () Bool)

(declare-fun e!2565 () Bool)

(assert (=> d!1732 e!2565))

(declare-fun res!5384 () Bool)

(assert (=> d!1732 (=> (not res!5384) (not e!2565))))

(declare-fun lt!5085 () (_ BitVec 64))

(declare-fun lt!5086 () (_ BitVec 64))

(declare-fun lt!5089 () (_ BitVec 64))

(assert (=> d!1732 (= res!5384 (= lt!5086 (bvsub lt!5085 lt!5089)))))

(assert (=> d!1732 (or (= (bvand lt!5085 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!5089 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!5085 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!5085 lt!5089) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1732 (= lt!5089 (remainingBits!0 ((_ sign_extend 32) (size!124 (buf!442 (_2!201 lt!4336)))) ((_ sign_extend 32) (currentByte!1415 (_2!201 lt!4336))) ((_ sign_extend 32) (currentBit!1410 (_2!201 lt!4336)))))))

(declare-fun lt!5087 () (_ BitVec 64))

(declare-fun lt!5088 () (_ BitVec 64))

(assert (=> d!1732 (= lt!5085 (bvmul lt!5087 lt!5088))))

(assert (=> d!1732 (or (= lt!5087 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!5088 (bvsdiv (bvmul lt!5087 lt!5088) lt!5087)))))

(assert (=> d!1732 (= lt!5088 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1732 (= lt!5087 ((_ sign_extend 32) (size!124 (buf!442 (_2!201 lt!4336)))))))

(assert (=> d!1732 (= lt!5086 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1415 (_2!201 lt!4336))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1410 (_2!201 lt!4336)))))))

(assert (=> d!1732 (invariant!0 (currentBit!1410 (_2!201 lt!4336)) (currentByte!1415 (_2!201 lt!4336)) (size!124 (buf!442 (_2!201 lt!4336))))))

(assert (=> d!1732 (= (bitIndex!0 (size!124 (buf!442 (_2!201 lt!4336))) (currentByte!1415 (_2!201 lt!4336)) (currentBit!1410 (_2!201 lt!4336))) lt!5086)))

(declare-fun b!3964 () Bool)

(declare-fun res!5385 () Bool)

(assert (=> b!3964 (=> (not res!5385) (not e!2565))))

(assert (=> b!3964 (= res!5385 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!5086))))

(declare-fun b!3965 () Bool)

(declare-fun lt!5090 () (_ BitVec 64))

(assert (=> b!3965 (= e!2565 (bvsle lt!5086 (bvmul lt!5090 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!3965 (or (= lt!5090 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!5090 #b0000000000000000000000000000000000000000000000000000000000001000) lt!5090)))))

(assert (=> b!3965 (= lt!5090 ((_ sign_extend 32) (size!124 (buf!442 (_2!201 lt!4336)))))))

(assert (= (and d!1732 res!5384) b!3964))

(assert (= (and b!3964 res!5385) b!3965))

(declare-fun m!4653 () Bool)

(assert (=> d!1732 m!4653))

(assert (=> d!1732 m!4117))

(assert (=> b!3668 d!1732))

(declare-fun d!1740 () Bool)

(declare-fun e!2566 () Bool)

(assert (=> d!1740 e!2566))

(declare-fun res!5386 () Bool)

(assert (=> d!1740 (=> (not res!5386) (not e!2566))))

(declare-fun lt!5092 () (_ BitVec 64))

(declare-fun lt!5095 () (_ BitVec 64))

(declare-fun lt!5091 () (_ BitVec 64))

(assert (=> d!1740 (= res!5386 (= lt!5092 (bvsub lt!5091 lt!5095)))))

(assert (=> d!1740 (or (= (bvand lt!5091 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!5095 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!5091 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!5091 lt!5095) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1740 (= lt!5095 (remainingBits!0 ((_ sign_extend 32) (size!124 (buf!442 thiss!1486))) ((_ sign_extend 32) (currentByte!1415 thiss!1486)) ((_ sign_extend 32) (currentBit!1410 thiss!1486))))))

(declare-fun lt!5093 () (_ BitVec 64))

(declare-fun lt!5094 () (_ BitVec 64))

(assert (=> d!1740 (= lt!5091 (bvmul lt!5093 lt!5094))))

(assert (=> d!1740 (or (= lt!5093 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!5094 (bvsdiv (bvmul lt!5093 lt!5094) lt!5093)))))

(assert (=> d!1740 (= lt!5094 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1740 (= lt!5093 ((_ sign_extend 32) (size!124 (buf!442 thiss!1486))))))

(assert (=> d!1740 (= lt!5092 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1415 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1410 thiss!1486))))))

(assert (=> d!1740 (invariant!0 (currentBit!1410 thiss!1486) (currentByte!1415 thiss!1486) (size!124 (buf!442 thiss!1486)))))

(assert (=> d!1740 (= (bitIndex!0 (size!124 (buf!442 thiss!1486)) (currentByte!1415 thiss!1486) (currentBit!1410 thiss!1486)) lt!5092)))

(declare-fun b!3966 () Bool)

(declare-fun res!5387 () Bool)

(assert (=> b!3966 (=> (not res!5387) (not e!2566))))

(assert (=> b!3966 (= res!5387 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!5092))))

(declare-fun b!3967 () Bool)

(declare-fun lt!5096 () (_ BitVec 64))

(assert (=> b!3967 (= e!2566 (bvsle lt!5092 (bvmul lt!5096 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!3967 (or (= lt!5096 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!5096 #b0000000000000000000000000000000000000000000000000000000000001000) lt!5096)))))

(assert (=> b!3967 (= lt!5096 ((_ sign_extend 32) (size!124 (buf!442 thiss!1486))))))

(assert (= (and d!1740 res!5386) b!3966))

(assert (= (and b!3966 res!5387) b!3967))

(assert (=> d!1740 m!4373))

(assert (=> d!1740 m!4371))

(assert (=> b!3668 d!1740))

(declare-fun d!1742 () Bool)

(assert (=> d!1742 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!124 (buf!442 (_1!202 lt!4335)))) ((_ sign_extend 32) (currentByte!1415 (_1!202 lt!4335))) ((_ sign_extend 32) (currentBit!1410 (_1!202 lt!4335))) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!124 (buf!442 (_1!202 lt!4335)))) ((_ sign_extend 32) (currentByte!1415 (_1!202 lt!4335))) ((_ sign_extend 32) (currentBit!1410 (_1!202 lt!4335)))) nBits!460))))

(declare-fun bs!626 () Bool)

(assert (= bs!626 d!1742))

(declare-fun m!4655 () Bool)

(assert (=> bs!626 m!4655))

(assert (=> b!3663 d!1742))

(push 1)

(assert (not d!1694))

(assert (not b!3860))

(assert (not b!3944))

(assert (not b!3735))

(assert (not d!1740))

(assert (not b!3745))

(assert (not d!1714))

(assert (not bm!43))

(assert (not b!3941))

(assert (not b!3800))

(assert (not b!3864))

(assert (not b!3746))

(assert (not d!1732))

(assert (not b!3801))

(assert (not b!3747))

(assert (not d!1708))

(assert (not b!3804))

(assert (not b!3861))

(assert (not b!3733))

(assert (not d!1670))

(assert (not b!3943))

(assert (not b!3942))

(assert (not b!3945))

(assert (not d!1742))

(assert (not d!1676))

(assert (not d!1678))

(assert (not b!3946))

(assert (not b!3820))

(assert (not b!3862))

(assert (not d!1710))

(check-sat)

(pop 1)

(push 1)

(check-sat)

