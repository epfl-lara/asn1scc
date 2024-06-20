; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2094 () Bool)

(assert start!2094)

(declare-fun b!9965 () Bool)

(declare-fun res!10074 () Bool)

(declare-fun e!6109 () Bool)

(assert (=> b!9965 (=> (not res!10074) (not e!6109))))

(declare-datatypes ((array!592 0))(
  ( (array!593 (arr!669 (Array (_ BitVec 32) (_ BitVec 8))) (size!255 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!482 0))(
  ( (BitStream!483 (buf!597 array!592) (currentByte!1648 (_ BitVec 32)) (currentBit!1643 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!482)

(declare-datatypes ((Unit!849 0))(
  ( (Unit!850) )
))
(declare-datatypes ((tuple2!1234 0))(
  ( (tuple2!1235 (_1!657 Unit!849) (_2!657 BitStream!482)) )
))
(declare-fun lt!15344 () tuple2!1234)

(declare-fun isPrefixOf!0 (BitStream!482 BitStream!482) Bool)

(assert (=> b!9965 (= res!10074 (isPrefixOf!0 thiss!1486 (_2!657 lt!15344)))))

(declare-fun b!9966 () Bool)

(declare-fun e!6110 () Bool)

(assert (=> b!9966 (= e!6110 e!6109)))

(declare-fun res!10081 () Bool)

(assert (=> b!9966 (=> (not res!10081) (not e!6109))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!9966 (= res!10081 (invariant!0 (currentBit!1643 (_2!657 lt!15344)) (currentByte!1648 (_2!657 lt!15344)) (size!255 (buf!597 (_2!657 lt!15344)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!592)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!482 array!592 (_ BitVec 64) (_ BitVec 64)) tuple2!1234)

(assert (=> b!9966 (= lt!15344 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!9967 () Bool)

(declare-fun res!10080 () Bool)

(assert (=> b!9967 (=> (not res!10080) (not e!6110))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!9967 (= res!10080 (validate_offset_bits!1 ((_ sign_extend 32) (size!255 (buf!597 thiss!1486))) ((_ sign_extend 32) (currentByte!1648 thiss!1486)) ((_ sign_extend 32) (currentBit!1643 thiss!1486)) nBits!460))))

(declare-fun b!9968 () Bool)

(declare-fun res!10077 () Bool)

(assert (=> b!9968 (=> (not res!10077) (not e!6109))))

(assert (=> b!9968 (= res!10077 (= (size!255 (buf!597 thiss!1486)) (size!255 (buf!597 (_2!657 lt!15344)))))))

(declare-fun b!9969 () Bool)

(declare-fun res!10075 () Bool)

(assert (=> b!9969 (=> (not res!10075) (not e!6109))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!9969 (= res!10075 (= (bitIndex!0 (size!255 (buf!597 (_2!657 lt!15344))) (currentByte!1648 (_2!657 lt!15344)) (currentBit!1643 (_2!657 lt!15344))) (bvadd (bitIndex!0 (size!255 (buf!597 thiss!1486)) (currentByte!1648 thiss!1486) (currentBit!1643 thiss!1486)) nBits!460)))))

(declare-fun b!9970 () Bool)

(declare-fun res!10079 () Bool)

(declare-fun e!6106 () Bool)

(assert (=> b!9970 (=> res!10079 e!6106)))

(declare-datatypes ((List!149 0))(
  ( (Nil!146) (Cons!145 (h!264 Bool) (t!899 List!149)) )
))
(declare-fun lt!15340 () List!149)

(declare-fun byteArrayBitContentToList!0 (BitStream!482 array!592 (_ BitVec 64) (_ BitVec 64)) List!149)

(assert (=> b!9970 (= res!10079 (not (= lt!15340 (byteArrayBitContentToList!0 (_2!657 lt!15344) srcBuffer!6 from!367 nBits!460))))))

(declare-fun res!10076 () Bool)

(assert (=> start!2094 (=> (not res!10076) (not e!6110))))

(assert (=> start!2094 (= res!10076 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!255 srcBuffer!6))))))))

(assert (=> start!2094 e!6110))

(assert (=> start!2094 true))

(declare-fun array_inv!247 (array!592) Bool)

(assert (=> start!2094 (array_inv!247 srcBuffer!6)))

(declare-fun e!6108 () Bool)

(declare-fun inv!12 (BitStream!482) Bool)

(assert (=> start!2094 (and (inv!12 thiss!1486) e!6108)))

(declare-fun b!9964 () Bool)

(assert (=> b!9964 (= e!6108 (array_inv!247 (buf!597 thiss!1486)))))

(declare-fun b!9971 () Bool)

(assert (=> b!9971 (= e!6109 (not e!6106))))

(declare-fun res!10078 () Bool)

(assert (=> b!9971 (=> res!10078 e!6106)))

(declare-datatypes ((tuple2!1236 0))(
  ( (tuple2!1237 (_1!658 array!592) (_2!658 BitStream!482)) )
))
(declare-fun lt!15343 () tuple2!1236)

(assert (=> b!9971 (= res!10078 (not (= (byteArrayBitContentToList!0 (_2!657 lt!15344) (_1!658 lt!15343) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!15340)))))

(declare-datatypes ((tuple2!1238 0))(
  ( (tuple2!1239 (_1!659 BitStream!482) (_2!659 BitStream!482)) )
))
(declare-fun lt!15341 () tuple2!1238)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!482 BitStream!482 (_ BitVec 64)) List!149)

(assert (=> b!9971 (= lt!15340 (bitStreamReadBitsIntoList!0 (_2!657 lt!15344) (_1!659 lt!15341) nBits!460))))

(declare-fun readBits!0 (BitStream!482 (_ BitVec 64)) tuple2!1236)

(assert (=> b!9971 (= lt!15343 (readBits!0 (_1!659 lt!15341) nBits!460))))

(assert (=> b!9971 (validate_offset_bits!1 ((_ sign_extend 32) (size!255 (buf!597 (_2!657 lt!15344)))) ((_ sign_extend 32) (currentByte!1648 thiss!1486)) ((_ sign_extend 32) (currentBit!1643 thiss!1486)) nBits!460)))

(declare-fun lt!15339 () Unit!849)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!482 array!592 (_ BitVec 64)) Unit!849)

(assert (=> b!9971 (= lt!15339 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!597 (_2!657 lt!15344)) nBits!460))))

(declare-fun reader!0 (BitStream!482 BitStream!482) tuple2!1238)

(assert (=> b!9971 (= lt!15341 (reader!0 thiss!1486 (_2!657 lt!15344)))))

(declare-fun b!9972 () Bool)

(declare-fun checkByteArrayBitContent!0 (BitStream!482 array!592 array!592 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!9972 (= e!6106 (checkByteArrayBitContent!0 (_2!657 lt!15344) srcBuffer!6 (_1!658 lt!15343) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun lt!15342 () Unit!849)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!482 array!592 array!592 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!849)

(assert (=> b!9972 (= lt!15342 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!657 lt!15344) srcBuffer!6 (_1!658 lt!15343) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (= (and start!2094 res!10076) b!9967))

(assert (= (and b!9967 res!10080) b!9966))

(assert (= (and b!9966 res!10081) b!9968))

(assert (= (and b!9968 res!10077) b!9969))

(assert (= (and b!9969 res!10075) b!9965))

(assert (= (and b!9965 res!10074) b!9971))

(assert (= (and b!9971 (not res!10078)) b!9970))

(assert (= (and b!9970 (not res!10079)) b!9972))

(assert (= start!2094 b!9964))

(declare-fun m!14477 () Bool)

(assert (=> b!9965 m!14477))

(declare-fun m!14479 () Bool)

(assert (=> start!2094 m!14479))

(declare-fun m!14481 () Bool)

(assert (=> start!2094 m!14481))

(declare-fun m!14483 () Bool)

(assert (=> b!9967 m!14483))

(declare-fun m!14485 () Bool)

(assert (=> b!9966 m!14485))

(declare-fun m!14487 () Bool)

(assert (=> b!9966 m!14487))

(declare-fun m!14489 () Bool)

(assert (=> b!9971 m!14489))

(declare-fun m!14491 () Bool)

(assert (=> b!9971 m!14491))

(declare-fun m!14493 () Bool)

(assert (=> b!9971 m!14493))

(declare-fun m!14495 () Bool)

(assert (=> b!9971 m!14495))

(declare-fun m!14497 () Bool)

(assert (=> b!9971 m!14497))

(declare-fun m!14499 () Bool)

(assert (=> b!9971 m!14499))

(declare-fun m!14501 () Bool)

(assert (=> b!9972 m!14501))

(declare-fun m!14503 () Bool)

(assert (=> b!9972 m!14503))

(declare-fun m!14505 () Bool)

(assert (=> b!9970 m!14505))

(declare-fun m!14507 () Bool)

(assert (=> b!9969 m!14507))

(declare-fun m!14509 () Bool)

(assert (=> b!9969 m!14509))

(declare-fun m!14511 () Bool)

(assert (=> b!9964 m!14511))

(push 1)

(assert (not b!9966))

(assert (not b!9969))

(assert (not b!9964))

(assert (not b!9967))

(assert (not b!9971))

(assert (not b!9965))

(assert (not b!9972))

(assert (not b!9970))

(assert (not start!2094))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!3182 () Bool)

(declare-fun res!10099 () Bool)

(declare-fun e!6125 () Bool)

(assert (=> d!3182 (=> (not res!10099) (not e!6125))))

(assert (=> d!3182 (= res!10099 (= (size!255 (buf!597 thiss!1486)) (size!255 (buf!597 (_2!657 lt!15344)))))))

(assert (=> d!3182 (= (isPrefixOf!0 thiss!1486 (_2!657 lt!15344)) e!6125)))

(declare-fun b!9994 () Bool)

(declare-fun res!10098 () Bool)

(assert (=> b!9994 (=> (not res!10098) (not e!6125))))

(assert (=> b!9994 (= res!10098 (bvsle (bitIndex!0 (size!255 (buf!597 thiss!1486)) (currentByte!1648 thiss!1486) (currentBit!1643 thiss!1486)) (bitIndex!0 (size!255 (buf!597 (_2!657 lt!15344))) (currentByte!1648 (_2!657 lt!15344)) (currentBit!1643 (_2!657 lt!15344)))))))

(declare-fun b!9995 () Bool)

(declare-fun e!6124 () Bool)

(assert (=> b!9995 (= e!6125 e!6124)))

(declare-fun res!10097 () Bool)

(assert (=> b!9995 (=> res!10097 e!6124)))

(assert (=> b!9995 (= res!10097 (= (size!255 (buf!597 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!9996 () Bool)

(declare-fun arrayBitRangesEq!0 (array!592 array!592 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!9996 (= e!6124 (arrayBitRangesEq!0 (buf!597 thiss!1486) (buf!597 (_2!657 lt!15344)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!255 (buf!597 thiss!1486)) (currentByte!1648 thiss!1486) (currentBit!1643 thiss!1486))))))

(assert (= (and d!3182 res!10099) b!9994))

(assert (= (and b!9994 res!10098) b!9995))

(assert (= (and b!9995 (not res!10097)) b!9996))

(assert (=> b!9994 m!14509))

(assert (=> b!9994 m!14507))

(assert (=> b!9996 m!14509))

(assert (=> b!9996 m!14509))

(declare-fun m!14521 () Bool)

(assert (=> b!9996 m!14521))

(assert (=> b!9965 d!3182))

(declare-fun d!3188 () Bool)

(assert (=> d!3188 (= (array_inv!247 srcBuffer!6) (bvsge (size!255 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!2094 d!3188))

(declare-fun d!3190 () Bool)

(assert (=> d!3190 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1643 thiss!1486) (currentByte!1648 thiss!1486) (size!255 (buf!597 thiss!1486))))))

(declare-fun bs!947 () Bool)

(assert (= bs!947 d!3190))

(declare-fun m!14523 () Bool)

(assert (=> bs!947 m!14523))

(assert (=> start!2094 d!3190))

(declare-fun b!10041 () Bool)

(declare-fun e!6153 () Unit!849)

(declare-fun Unit!851 () Unit!849)

(assert (=> b!10041 (= e!6153 Unit!851)))

(declare-fun d!3192 () Bool)

(declare-fun e!6154 () Bool)

(assert (=> d!3192 e!6154))

(declare-fun res!10136 () Bool)

(assert (=> d!3192 (=> (not res!10136) (not e!6154))))

(declare-fun lt!15444 () tuple2!1238)

(assert (=> d!3192 (= res!10136 (isPrefixOf!0 (_1!659 lt!15444) (_2!659 lt!15444)))))

(declare-fun lt!15450 () BitStream!482)

(assert (=> d!3192 (= lt!15444 (tuple2!1239 lt!15450 (_2!657 lt!15344)))))

(declare-fun lt!15445 () Unit!849)

(declare-fun lt!15458 () Unit!849)

(assert (=> d!3192 (= lt!15445 lt!15458)))

(assert (=> d!3192 (isPrefixOf!0 lt!15450 (_2!657 lt!15344))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!482 BitStream!482 BitStream!482) Unit!849)

(assert (=> d!3192 (= lt!15458 (lemmaIsPrefixTransitive!0 lt!15450 (_2!657 lt!15344) (_2!657 lt!15344)))))

(declare-fun lt!15455 () Unit!849)

(declare-fun lt!15452 () Unit!849)

(assert (=> d!3192 (= lt!15455 lt!15452)))

(assert (=> d!3192 (isPrefixOf!0 lt!15450 (_2!657 lt!15344))))

(assert (=> d!3192 (= lt!15452 (lemmaIsPrefixTransitive!0 lt!15450 thiss!1486 (_2!657 lt!15344)))))

(declare-fun lt!15441 () Unit!849)

(assert (=> d!3192 (= lt!15441 e!6153)))

(declare-fun c!671 () Bool)

(assert (=> d!3192 (= c!671 (not (= (size!255 (buf!597 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!15454 () Unit!849)

(declare-fun lt!15443 () Unit!849)

(assert (=> d!3192 (= lt!15454 lt!15443)))

(assert (=> d!3192 (isPrefixOf!0 (_2!657 lt!15344) (_2!657 lt!15344))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!482) Unit!849)

(assert (=> d!3192 (= lt!15443 (lemmaIsPrefixRefl!0 (_2!657 lt!15344)))))

(declare-fun lt!15451 () Unit!849)

(declare-fun lt!15456 () Unit!849)

(assert (=> d!3192 (= lt!15451 lt!15456)))

(assert (=> d!3192 (= lt!15456 (lemmaIsPrefixRefl!0 (_2!657 lt!15344)))))

(declare-fun lt!15446 () Unit!849)

(declare-fun lt!15440 () Unit!849)

(assert (=> d!3192 (= lt!15446 lt!15440)))

(assert (=> d!3192 (isPrefixOf!0 lt!15450 lt!15450)))

(assert (=> d!3192 (= lt!15440 (lemmaIsPrefixRefl!0 lt!15450))))

(declare-fun lt!15453 () Unit!849)

(declare-fun lt!15442 () Unit!849)

(assert (=> d!3192 (= lt!15453 lt!15442)))

(assert (=> d!3192 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!3192 (= lt!15442 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!3192 (= lt!15450 (BitStream!483 (buf!597 (_2!657 lt!15344)) (currentByte!1648 thiss!1486) (currentBit!1643 thiss!1486)))))

(assert (=> d!3192 (isPrefixOf!0 thiss!1486 (_2!657 lt!15344))))

(assert (=> d!3192 (= (reader!0 thiss!1486 (_2!657 lt!15344)) lt!15444)))

(declare-fun b!10042 () Bool)

(declare-fun lt!15457 () (_ BitVec 64))

(declare-fun lt!15447 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!482 (_ BitVec 64)) BitStream!482)

(assert (=> b!10042 (= e!6154 (= (_1!659 lt!15444) (withMovedBitIndex!0 (_2!659 lt!15444) (bvsub lt!15457 lt!15447))))))

(assert (=> b!10042 (or (= (bvand lt!15457 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!15447 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!15457 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!15457 lt!15447) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10042 (= lt!15447 (bitIndex!0 (size!255 (buf!597 (_2!657 lt!15344))) (currentByte!1648 (_2!657 lt!15344)) (currentBit!1643 (_2!657 lt!15344))))))

(assert (=> b!10042 (= lt!15457 (bitIndex!0 (size!255 (buf!597 thiss!1486)) (currentByte!1648 thiss!1486) (currentBit!1643 thiss!1486)))))

(declare-fun b!10043 () Bool)

(declare-fun res!10134 () Bool)

(assert (=> b!10043 (=> (not res!10134) (not e!6154))))

(assert (=> b!10043 (= res!10134 (isPrefixOf!0 (_2!659 lt!15444) (_2!657 lt!15344)))))

(declare-fun b!10044 () Bool)

(declare-fun lt!15448 () Unit!849)

(assert (=> b!10044 (= e!6153 lt!15448)))

(declare-fun lt!15439 () (_ BitVec 64))

(assert (=> b!10044 (= lt!15439 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!15449 () (_ BitVec 64))

(assert (=> b!10044 (= lt!15449 (bitIndex!0 (size!255 (buf!597 thiss!1486)) (currentByte!1648 thiss!1486) (currentBit!1643 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!592 array!592 (_ BitVec 64) (_ BitVec 64)) Unit!849)

(assert (=> b!10044 (= lt!15448 (arrayBitRangesEqSymmetric!0 (buf!597 thiss!1486) (buf!597 (_2!657 lt!15344)) lt!15439 lt!15449))))

(assert (=> b!10044 (arrayBitRangesEq!0 (buf!597 (_2!657 lt!15344)) (buf!597 thiss!1486) lt!15439 lt!15449)))

(declare-fun b!10045 () Bool)

(declare-fun res!10135 () Bool)

(assert (=> b!10045 (=> (not res!10135) (not e!6154))))

(assert (=> b!10045 (= res!10135 (isPrefixOf!0 (_1!659 lt!15444) thiss!1486))))

(assert (= (and d!3192 c!671) b!10044))

(assert (= (and d!3192 (not c!671)) b!10041))

(assert (= (and d!3192 res!10136) b!10045))

(assert (= (and b!10045 res!10135) b!10043))

(assert (= (and b!10043 res!10134) b!10042))

(declare-fun m!14559 () Bool)

(assert (=> b!10042 m!14559))

(assert (=> b!10042 m!14507))

(assert (=> b!10042 m!14509))

(declare-fun m!14561 () Bool)

(assert (=> b!10045 m!14561))

(assert (=> b!10044 m!14509))

(declare-fun m!14563 () Bool)

(assert (=> b!10044 m!14563))

(declare-fun m!14565 () Bool)

(assert (=> b!10044 m!14565))

(declare-fun m!14567 () Bool)

(assert (=> d!3192 m!14567))

(declare-fun m!14569 () Bool)

(assert (=> d!3192 m!14569))

(declare-fun m!14571 () Bool)

(assert (=> d!3192 m!14571))

(assert (=> d!3192 m!14477))

(declare-fun m!14573 () Bool)

(assert (=> d!3192 m!14573))

(declare-fun m!14575 () Bool)

(assert (=> d!3192 m!14575))

(declare-fun m!14577 () Bool)

(assert (=> d!3192 m!14577))

(declare-fun m!14579 () Bool)

(assert (=> d!3192 m!14579))

(declare-fun m!14581 () Bool)

(assert (=> d!3192 m!14581))

(declare-fun m!14583 () Bool)

(assert (=> d!3192 m!14583))

(declare-fun m!14585 () Bool)

(assert (=> d!3192 m!14585))

(declare-fun m!14587 () Bool)

(assert (=> b!10043 m!14587))

(assert (=> b!9971 d!3192))

(declare-fun b!10057 () Bool)

(declare-fun e!6160 () Bool)

(declare-fun lt!15467 () List!149)

(declare-fun length!26 (List!149) Int)

(assert (=> b!10057 (= e!6160 (> (length!26 lt!15467) 0))))

(declare-fun b!10054 () Bool)

(declare-datatypes ((tuple2!1240 0))(
  ( (tuple2!1241 (_1!660 List!149) (_2!660 BitStream!482)) )
))
(declare-fun e!6159 () tuple2!1240)

(assert (=> b!10054 (= e!6159 (tuple2!1241 Nil!146 (_1!659 lt!15341)))))

(declare-fun lt!15465 () (_ BitVec 64))

(declare-fun b!10055 () Bool)

(declare-datatypes ((tuple2!1242 0))(
  ( (tuple2!1243 (_1!661 Bool) (_2!661 BitStream!482)) )
))
(declare-fun lt!15466 () tuple2!1242)

(assert (=> b!10055 (= e!6159 (tuple2!1241 (Cons!145 (_1!661 lt!15466) (bitStreamReadBitsIntoList!0 (_2!657 lt!15344) (_2!661 lt!15466) (bvsub nBits!460 lt!15465))) (_2!661 lt!15466)))))

(declare-fun readBit!0 (BitStream!482) tuple2!1242)

(assert (=> b!10055 (= lt!15466 (readBit!0 (_1!659 lt!15341)))))

(assert (=> b!10055 (= lt!15465 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!10056 () Bool)

(declare-fun isEmpty!31 (List!149) Bool)

(assert (=> b!10056 (= e!6160 (isEmpty!31 lt!15467))))

(declare-fun d!3228 () Bool)

(assert (=> d!3228 e!6160))

(declare-fun c!677 () Bool)

(assert (=> d!3228 (= c!677 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3228 (= lt!15467 (_1!660 e!6159))))

(declare-fun c!676 () Bool)

(assert (=> d!3228 (= c!676 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3228 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3228 (= (bitStreamReadBitsIntoList!0 (_2!657 lt!15344) (_1!659 lt!15341) nBits!460) lt!15467)))

(assert (= (and d!3228 c!676) b!10054))

(assert (= (and d!3228 (not c!676)) b!10055))

(assert (= (and d!3228 c!677) b!10056))

(assert (= (and d!3228 (not c!677)) b!10057))

(declare-fun m!14589 () Bool)

(assert (=> b!10057 m!14589))

(declare-fun m!14591 () Bool)

(assert (=> b!10055 m!14591))

(declare-fun m!14593 () Bool)

(assert (=> b!10055 m!14593))

(declare-fun m!14595 () Bool)

(assert (=> b!10056 m!14595))

(assert (=> b!9971 d!3228))

(declare-fun d!3230 () Bool)

(declare-fun c!680 () Bool)

(assert (=> d!3230 (= c!680 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!6163 () List!149)

(assert (=> d!3230 (= (byteArrayBitContentToList!0 (_2!657 lt!15344) (_1!658 lt!15343) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!6163)))

(declare-fun b!10062 () Bool)

(assert (=> b!10062 (= e!6163 Nil!146)))

(declare-fun b!10063 () Bool)

(assert (=> b!10063 (= e!6163 (Cons!145 (not (= (bvand ((_ sign_extend 24) (select (arr!669 (_1!658 lt!15343)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!657 lt!15344) (_1!658 lt!15343) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3230 c!680) b!10062))

(assert (= (and d!3230 (not c!680)) b!10063))

(declare-fun m!14597 () Bool)

(assert (=> b!10063 m!14597))

(declare-fun m!14599 () Bool)

(assert (=> b!10063 m!14599))

(declare-fun m!14601 () Bool)

(assert (=> b!10063 m!14601))

(assert (=> b!9971 d!3230))

(declare-fun b!10074 () Bool)

(declare-fun res!10150 () Bool)

(declare-fun e!6166 () Bool)

(assert (=> b!10074 (=> (not res!10150) (not e!6166))))

(declare-fun lt!15490 () (_ BitVec 64))

(declare-fun lt!15491 () tuple2!1236)

(assert (=> b!10074 (= res!10150 (= (bvadd lt!15490 nBits!460) (bitIndex!0 (size!255 (buf!597 (_2!658 lt!15491))) (currentByte!1648 (_2!658 lt!15491)) (currentBit!1643 (_2!658 lt!15491)))))))

(assert (=> b!10074 (or (not (= (bvand lt!15490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!15490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!15490 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10074 (= lt!15490 (bitIndex!0 (size!255 (buf!597 (_1!659 lt!15341))) (currentByte!1648 (_1!659 lt!15341)) (currentBit!1643 (_1!659 lt!15341))))))

(declare-fun b!10075 () Bool)

(assert (=> b!10075 (= e!6166 (= (byteArrayBitContentToList!0 (_2!658 lt!15491) (_1!658 lt!15491) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!658 lt!15491) (_1!659 lt!15341) nBits!460)))))

(declare-fun d!3232 () Bool)

(assert (=> d!3232 e!6166))

(declare-fun res!10151 () Bool)

(assert (=> d!3232 (=> (not res!10151) (not e!6166))))

(assert (=> d!3232 (= res!10151 (= (buf!597 (_2!658 lt!15491)) (buf!597 (_1!659 lt!15341))))))

(declare-datatypes ((tuple3!74 0))(
  ( (tuple3!75 (_1!662 Unit!849) (_2!662 BitStream!482) (_3!40 array!592)) )
))
(declare-fun lt!15486 () tuple3!74)

(assert (=> d!3232 (= lt!15491 (tuple2!1237 (_3!40 lt!15486) (_2!662 lt!15486)))))

(declare-fun readBitsLoop!0 (BitStream!482 (_ BitVec 64) array!592 (_ BitVec 64) (_ BitVec 64)) tuple3!74)

(assert (=> d!3232 (= lt!15486 (readBitsLoop!0 (_1!659 lt!15341) nBits!460 (array!593 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!3232 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!3232 (= (readBits!0 (_1!659 lt!15341) nBits!460) lt!15491)))

(declare-fun b!10076 () Bool)

(declare-fun res!10149 () Bool)

(assert (=> b!10076 (=> (not res!10149) (not e!6166))))

(assert (=> b!10076 (= res!10149 (invariant!0 (currentBit!1643 (_2!658 lt!15491)) (currentByte!1648 (_2!658 lt!15491)) (size!255 (buf!597 (_2!658 lt!15491)))))))

(declare-fun b!10077 () Bool)

(declare-fun res!10147 () Bool)

(assert (=> b!10077 (=> (not res!10147) (not e!6166))))

(assert (=> b!10077 (= res!10147 (bvsle (currentByte!1648 (_1!659 lt!15341)) (currentByte!1648 (_2!658 lt!15491))))))

(declare-fun b!10078 () Bool)

(declare-fun res!10148 () Bool)

(assert (=> b!10078 (=> (not res!10148) (not e!6166))))

(declare-fun lt!15488 () (_ BitVec 64))

(assert (=> b!10078 (= res!10148 (= (size!255 (_1!658 lt!15491)) ((_ extract 31 0) lt!15488)))))

(assert (=> b!10078 (and (bvslt lt!15488 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!15488 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!15494 () (_ BitVec 64))

(declare-fun lt!15492 () (_ BitVec 64))

(assert (=> b!10078 (= lt!15488 (bvsdiv lt!15494 lt!15492))))

(assert (=> b!10078 (and (not (= lt!15492 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!15494 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!15492 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!10078 (= lt!15492 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!15493 () (_ BitVec 64))

(declare-fun lt!15489 () (_ BitVec 64))

(assert (=> b!10078 (= lt!15494 (bvsub lt!15493 lt!15489))))

(assert (=> b!10078 (or (= (bvand lt!15493 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!15489 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!15493 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!15493 lt!15489) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10078 (= lt!15489 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!15487 () (_ BitVec 64))

(assert (=> b!10078 (= lt!15493 (bvadd nBits!460 lt!15487))))

(assert (=> b!10078 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!15487 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!15487) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10078 (= lt!15487 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (= (and d!3232 res!10151) b!10074))

(assert (= (and b!10074 res!10150) b!10076))

(assert (= (and b!10076 res!10149) b!10078))

(assert (= (and b!10078 res!10148) b!10077))

(assert (= (and b!10077 res!10147) b!10075))

(declare-fun m!14603 () Bool)

(assert (=> b!10074 m!14603))

(declare-fun m!14605 () Bool)

(assert (=> b!10074 m!14605))

(declare-fun m!14607 () Bool)

(assert (=> b!10075 m!14607))

(declare-fun m!14609 () Bool)

(assert (=> b!10075 m!14609))

(declare-fun m!14611 () Bool)

(assert (=> d!3232 m!14611))

(declare-fun m!14613 () Bool)

(assert (=> b!10076 m!14613))

(assert (=> b!9971 d!3232))

(declare-fun d!3234 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!3234 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!255 (buf!597 (_2!657 lt!15344)))) ((_ sign_extend 32) (currentByte!1648 thiss!1486)) ((_ sign_extend 32) (currentBit!1643 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!255 (buf!597 (_2!657 lt!15344)))) ((_ sign_extend 32) (currentByte!1648 thiss!1486)) ((_ sign_extend 32) (currentBit!1643 thiss!1486))) nBits!460))))

(declare-fun bs!953 () Bool)

(assert (= bs!953 d!3234))

(declare-fun m!14615 () Bool)

(assert (=> bs!953 m!14615))

(assert (=> b!9971 d!3234))

(declare-fun d!3236 () Bool)

(assert (=> d!3236 (validate_offset_bits!1 ((_ sign_extend 32) (size!255 (buf!597 (_2!657 lt!15344)))) ((_ sign_extend 32) (currentByte!1648 thiss!1486)) ((_ sign_extend 32) (currentBit!1643 thiss!1486)) nBits!460)))

(declare-fun lt!15497 () Unit!849)

(declare-fun choose!9 (BitStream!482 array!592 (_ BitVec 64) BitStream!482) Unit!849)

(assert (=> d!3236 (= lt!15497 (choose!9 thiss!1486 (buf!597 (_2!657 lt!15344)) nBits!460 (BitStream!483 (buf!597 (_2!657 lt!15344)) (currentByte!1648 thiss!1486) (currentBit!1643 thiss!1486))))))

(assert (=> d!3236 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!597 (_2!657 lt!15344)) nBits!460) lt!15497)))

(declare-fun bs!954 () Bool)

(assert (= bs!954 d!3236))

(assert (=> bs!954 m!14491))

(declare-fun m!14617 () Bool)

(assert (=> bs!954 m!14617))

(assert (=> b!9971 d!3236))

(declare-fun d!3238 () Bool)

(assert (=> d!3238 (= (invariant!0 (currentBit!1643 (_2!657 lt!15344)) (currentByte!1648 (_2!657 lt!15344)) (size!255 (buf!597 (_2!657 lt!15344)))) (and (bvsge (currentBit!1643 (_2!657 lt!15344)) #b00000000000000000000000000000000) (bvslt (currentBit!1643 (_2!657 lt!15344)) #b00000000000000000000000000001000) (bvsge (currentByte!1648 (_2!657 lt!15344)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1648 (_2!657 lt!15344)) (size!255 (buf!597 (_2!657 lt!15344)))) (and (= (currentBit!1643 (_2!657 lt!15344)) #b00000000000000000000000000000000) (= (currentByte!1648 (_2!657 lt!15344)) (size!255 (buf!597 (_2!657 lt!15344))))))))))

(assert (=> b!9966 d!3238))

(declare-fun b!10184 () Bool)

(declare-fun res!10236 () Bool)

(declare-fun e!6208 () Bool)

(assert (=> b!10184 (=> (not res!10236) (not e!6208))))

(declare-fun lt!15946 () tuple2!1234)

(assert (=> b!10184 (= res!10236 (= (size!255 (buf!597 (_2!657 lt!15946))) (size!255 (buf!597 thiss!1486))))))

(declare-fun b!10185 () Bool)

(declare-fun e!6209 () tuple2!1234)

(declare-fun lt!15937 () tuple2!1234)

(declare-fun Unit!862 () Unit!849)

(assert (=> b!10185 (= e!6209 (tuple2!1235 Unit!862 (_2!657 lt!15937)))))

(declare-fun lt!15964 () tuple2!1234)

(declare-fun appendBitFromByte!0 (BitStream!482 (_ BitVec 8) (_ BitVec 32)) tuple2!1234)

(assert (=> b!10185 (= lt!15964 (appendBitFromByte!0 thiss!1486 (select (arr!669 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!15973 () (_ BitVec 64))

(assert (=> b!10185 (= lt!15973 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!15940 () (_ BitVec 64))

(assert (=> b!10185 (= lt!15940 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!15968 () Unit!849)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!482 BitStream!482 (_ BitVec 64) (_ BitVec 64)) Unit!849)

(assert (=> b!10185 (= lt!15968 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!657 lt!15964) lt!15973 lt!15940))))

(assert (=> b!10185 (validate_offset_bits!1 ((_ sign_extend 32) (size!255 (buf!597 (_2!657 lt!15964)))) ((_ sign_extend 32) (currentByte!1648 (_2!657 lt!15964))) ((_ sign_extend 32) (currentBit!1643 (_2!657 lt!15964))) (bvsub lt!15973 lt!15940))))

(declare-fun lt!15979 () Unit!849)

(assert (=> b!10185 (= lt!15979 lt!15968)))

(declare-fun lt!15944 () tuple2!1238)

(assert (=> b!10185 (= lt!15944 (reader!0 thiss!1486 (_2!657 lt!15964)))))

(declare-fun lt!15971 () (_ BitVec 64))

(assert (=> b!10185 (= lt!15971 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!15955 () Unit!849)

(assert (=> b!10185 (= lt!15955 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!597 (_2!657 lt!15964)) lt!15971))))

(assert (=> b!10185 (validate_offset_bits!1 ((_ sign_extend 32) (size!255 (buf!597 (_2!657 lt!15964)))) ((_ sign_extend 32) (currentByte!1648 thiss!1486)) ((_ sign_extend 32) (currentBit!1643 thiss!1486)) lt!15971)))

(declare-fun lt!15954 () Unit!849)

(assert (=> b!10185 (= lt!15954 lt!15955)))

(declare-fun head!55 (List!149) Bool)

(assert (=> b!10185 (= (head!55 (byteArrayBitContentToList!0 (_2!657 lt!15964) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!55 (bitStreamReadBitsIntoList!0 (_2!657 lt!15964) (_1!659 lt!15944) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!15941 () Unit!849)

(declare-fun Unit!865 () Unit!849)

(assert (=> b!10185 (= lt!15941 Unit!865)))

(assert (=> b!10185 (= lt!15937 (appendBitsMSBFirstLoop!0 (_2!657 lt!15964) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!15948 () Unit!849)

(assert (=> b!10185 (= lt!15948 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!657 lt!15964) (_2!657 lt!15937)))))

(assert (=> b!10185 (isPrefixOf!0 thiss!1486 (_2!657 lt!15937))))

(declare-fun lt!15939 () Unit!849)

(assert (=> b!10185 (= lt!15939 lt!15948)))

(assert (=> b!10185 (= (size!255 (buf!597 (_2!657 lt!15937))) (size!255 (buf!597 thiss!1486)))))

(declare-fun lt!15962 () Unit!849)

(declare-fun Unit!866 () Unit!849)

(assert (=> b!10185 (= lt!15962 Unit!866)))

(assert (=> b!10185 (= (bitIndex!0 (size!255 (buf!597 (_2!657 lt!15937))) (currentByte!1648 (_2!657 lt!15937)) (currentBit!1643 (_2!657 lt!15937))) (bvsub (bvadd (bitIndex!0 (size!255 (buf!597 thiss!1486)) (currentByte!1648 thiss!1486) (currentBit!1643 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!15966 () Unit!849)

(declare-fun Unit!867 () Unit!849)

(assert (=> b!10185 (= lt!15966 Unit!867)))

(assert (=> b!10185 (= (bitIndex!0 (size!255 (buf!597 (_2!657 lt!15937))) (currentByte!1648 (_2!657 lt!15937)) (currentBit!1643 (_2!657 lt!15937))) (bvsub (bvsub (bvadd (bitIndex!0 (size!255 (buf!597 (_2!657 lt!15964))) (currentByte!1648 (_2!657 lt!15964)) (currentBit!1643 (_2!657 lt!15964))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!15975 () Unit!849)

(declare-fun Unit!870 () Unit!849)

(assert (=> b!10185 (= lt!15975 Unit!870)))

(declare-fun lt!15949 () tuple2!1238)

(declare-fun call!188 () tuple2!1238)

(assert (=> b!10185 (= lt!15949 call!188)))

(declare-fun lt!15963 () (_ BitVec 64))

(assert (=> b!10185 (= lt!15963 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!15943 () Unit!849)

(assert (=> b!10185 (= lt!15943 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!597 (_2!657 lt!15937)) lt!15963))))

(assert (=> b!10185 (validate_offset_bits!1 ((_ sign_extend 32) (size!255 (buf!597 (_2!657 lt!15937)))) ((_ sign_extend 32) (currentByte!1648 thiss!1486)) ((_ sign_extend 32) (currentBit!1643 thiss!1486)) lt!15963)))

(declare-fun lt!15942 () Unit!849)

(assert (=> b!10185 (= lt!15942 lt!15943)))

(declare-fun lt!15956 () tuple2!1238)

(assert (=> b!10185 (= lt!15956 (reader!0 (_2!657 lt!15964) (_2!657 lt!15937)))))

(declare-fun lt!15960 () (_ BitVec 64))

(assert (=> b!10185 (= lt!15960 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!15961 () Unit!849)

(assert (=> b!10185 (= lt!15961 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!657 lt!15964) (buf!597 (_2!657 lt!15937)) lt!15960))))

(assert (=> b!10185 (validate_offset_bits!1 ((_ sign_extend 32) (size!255 (buf!597 (_2!657 lt!15937)))) ((_ sign_extend 32) (currentByte!1648 (_2!657 lt!15964))) ((_ sign_extend 32) (currentBit!1643 (_2!657 lt!15964))) lt!15960)))

(declare-fun lt!15978 () Unit!849)

(assert (=> b!10185 (= lt!15978 lt!15961)))

(declare-fun lt!15965 () List!149)

(assert (=> b!10185 (= lt!15965 (byteArrayBitContentToList!0 (_2!657 lt!15937) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!15958 () List!149)

(assert (=> b!10185 (= lt!15958 (byteArrayBitContentToList!0 (_2!657 lt!15937) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!15951 () List!149)

(assert (=> b!10185 (= lt!15951 (bitStreamReadBitsIntoList!0 (_2!657 lt!15937) (_1!659 lt!15949) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!15976 () List!149)

(assert (=> b!10185 (= lt!15976 (bitStreamReadBitsIntoList!0 (_2!657 lt!15937) (_1!659 lt!15956) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!15977 () (_ BitVec 64))

(assert (=> b!10185 (= lt!15977 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!15947 () Unit!849)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!482 BitStream!482 BitStream!482 BitStream!482 (_ BitVec 64) List!149) Unit!849)

(assert (=> b!10185 (= lt!15947 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!657 lt!15937) (_2!657 lt!15937) (_1!659 lt!15949) (_1!659 lt!15956) lt!15977 lt!15951))))

(declare-fun tail!63 (List!149) List!149)

(assert (=> b!10185 (= (bitStreamReadBitsIntoList!0 (_2!657 lt!15937) (_1!659 lt!15956) (bvsub lt!15977 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!63 lt!15951))))

(declare-fun lt!15969 () Unit!849)

(assert (=> b!10185 (= lt!15969 lt!15947)))

(declare-fun lt!15953 () Unit!849)

(declare-fun lt!15938 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!592 array!592 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!849)

(assert (=> b!10185 (= lt!15953 (arrayBitRangesEqImpliesEq!0 (buf!597 (_2!657 lt!15964)) (buf!597 (_2!657 lt!15937)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!15938 (bitIndex!0 (size!255 (buf!597 (_2!657 lt!15964))) (currentByte!1648 (_2!657 lt!15964)) (currentBit!1643 (_2!657 lt!15964)))))))

(declare-fun bitAt!0 (array!592 (_ BitVec 64)) Bool)

(assert (=> b!10185 (= (bitAt!0 (buf!597 (_2!657 lt!15964)) lt!15938) (bitAt!0 (buf!597 (_2!657 lt!15937)) lt!15938))))

(declare-fun lt!15959 () Unit!849)

(assert (=> b!10185 (= lt!15959 lt!15953)))

(declare-fun b!10186 () Bool)

(declare-fun res!10238 () Bool)

(assert (=> b!10186 (=> (not res!10238) (not e!6208))))

(assert (=> b!10186 (= res!10238 (invariant!0 (currentBit!1643 (_2!657 lt!15946)) (currentByte!1648 (_2!657 lt!15946)) (size!255 (buf!597 (_2!657 lt!15946)))))))

(declare-fun b!10187 () Bool)

(declare-fun res!10234 () Bool)

(assert (=> b!10187 (=> (not res!10234) (not e!6208))))

(assert (=> b!10187 (= res!10234 (= (size!255 (buf!597 thiss!1486)) (size!255 (buf!597 (_2!657 lt!15946)))))))

(declare-fun b!10188 () Bool)

(declare-fun Unit!871 () Unit!849)

(assert (=> b!10188 (= e!6209 (tuple2!1235 Unit!871 thiss!1486))))

(assert (=> b!10188 (= (size!255 (buf!597 thiss!1486)) (size!255 (buf!597 thiss!1486)))))

(declare-fun lt!15970 () Unit!849)

(declare-fun Unit!872 () Unit!849)

(assert (=> b!10188 (= lt!15970 Unit!872)))

(assert (=> b!10188 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!658 (readBits!0 (_1!659 call!188) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!10189 () Bool)

(declare-fun res!10237 () Bool)

(assert (=> b!10189 (=> (not res!10237) (not e!6208))))

(assert (=> b!10189 (= res!10237 (isPrefixOf!0 thiss!1486 (_2!657 lt!15946)))))

(declare-fun d!3240 () Bool)

(assert (=> d!3240 e!6208))

(declare-fun res!10235 () Bool)

(assert (=> d!3240 (=> (not res!10235) (not e!6208))))

(declare-fun lt!15980 () (_ BitVec 64))

(assert (=> d!3240 (= res!10235 (= (bitIndex!0 (size!255 (buf!597 (_2!657 lt!15946))) (currentByte!1648 (_2!657 lt!15946)) (currentBit!1643 (_2!657 lt!15946))) (bvsub lt!15980 from!367)))))

(assert (=> d!3240 (or (= (bvand lt!15980 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!15980 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!15980 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!15974 () (_ BitVec 64))

(assert (=> d!3240 (= lt!15980 (bvadd lt!15974 from!367 nBits!460))))

(assert (=> d!3240 (or (not (= (bvand lt!15974 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!15974 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!15974 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3240 (= lt!15974 (bitIndex!0 (size!255 (buf!597 thiss!1486)) (currentByte!1648 thiss!1486) (currentBit!1643 thiss!1486)))))

(assert (=> d!3240 (= lt!15946 e!6209)))

(declare-fun c!693 () Bool)

(assert (=> d!3240 (= c!693 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!15952 () Unit!849)

(declare-fun lt!15957 () Unit!849)

(assert (=> d!3240 (= lt!15952 lt!15957)))

(assert (=> d!3240 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!3240 (= lt!15957 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!3240 (= lt!15938 (bitIndex!0 (size!255 (buf!597 thiss!1486)) (currentByte!1648 thiss!1486) (currentBit!1643 thiss!1486)))))

(assert (=> d!3240 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3240 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!15946)))

(declare-fun b!10190 () Bool)

(declare-fun lt!15967 () tuple2!1238)

(assert (=> b!10190 (= e!6208 (= (bitStreamReadBitsIntoList!0 (_2!657 lt!15946) (_1!659 lt!15967) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!657 lt!15946) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!10190 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10190 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!15950 () Unit!849)

(declare-fun lt!15972 () Unit!849)

(assert (=> b!10190 (= lt!15950 lt!15972)))

(declare-fun lt!15945 () (_ BitVec 64))

(assert (=> b!10190 (validate_offset_bits!1 ((_ sign_extend 32) (size!255 (buf!597 (_2!657 lt!15946)))) ((_ sign_extend 32) (currentByte!1648 thiss!1486)) ((_ sign_extend 32) (currentBit!1643 thiss!1486)) lt!15945)))

(assert (=> b!10190 (= lt!15972 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!597 (_2!657 lt!15946)) lt!15945))))

(declare-fun e!6207 () Bool)

(assert (=> b!10190 e!6207))

(declare-fun res!10233 () Bool)

(assert (=> b!10190 (=> (not res!10233) (not e!6207))))

(assert (=> b!10190 (= res!10233 (and (= (size!255 (buf!597 thiss!1486)) (size!255 (buf!597 (_2!657 lt!15946)))) (bvsge lt!15945 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10190 (= lt!15945 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!10190 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10190 (= lt!15967 (reader!0 thiss!1486 (_2!657 lt!15946)))))

(declare-fun b!10191 () Bool)

(assert (=> b!10191 (= e!6207 (validate_offset_bits!1 ((_ sign_extend 32) (size!255 (buf!597 thiss!1486))) ((_ sign_extend 32) (currentByte!1648 thiss!1486)) ((_ sign_extend 32) (currentBit!1643 thiss!1486)) lt!15945))))

(declare-fun bm!185 () Bool)

(assert (=> bm!185 (= call!188 (reader!0 thiss!1486 (ite c!693 (_2!657 lt!15937) thiss!1486)))))

(assert (= (and d!3240 c!693) b!10185))

(assert (= (and d!3240 (not c!693)) b!10188))

(assert (= (or b!10185 b!10188) bm!185))

(assert (= (and d!3240 res!10235) b!10186))

(assert (= (and b!10186 res!10238) b!10187))

(assert (= (and b!10187 res!10234) b!10189))

(assert (= (and b!10189 res!10237) b!10184))

(assert (= (and b!10184 res!10236) b!10190))

(assert (= (and b!10190 res!10233) b!10191))

(declare-fun m!14841 () Bool)

(assert (=> b!10189 m!14841))

(declare-fun m!14843 () Bool)

(assert (=> b!10186 m!14843))

(declare-fun m!14845 () Bool)

(assert (=> b!10191 m!14845))

(declare-fun m!14847 () Bool)

(assert (=> b!10188 m!14847))

(declare-fun m!14849 () Bool)

(assert (=> b!10188 m!14849))

(declare-fun m!14851 () Bool)

(assert (=> bm!185 m!14851))

(declare-fun m!14853 () Bool)

(assert (=> b!10185 m!14853))

(declare-fun m!14855 () Bool)

(assert (=> b!10185 m!14855))

(declare-fun m!14857 () Bool)

(assert (=> b!10185 m!14857))

(declare-fun m!14859 () Bool)

(assert (=> b!10185 m!14859))

(declare-fun m!14861 () Bool)

(assert (=> b!10185 m!14861))

(declare-fun m!14863 () Bool)

(assert (=> b!10185 m!14863))

(declare-fun m!14865 () Bool)

(assert (=> b!10185 m!14865))

(declare-fun m!14867 () Bool)

(assert (=> b!10185 m!14867))

(declare-fun m!14869 () Bool)

(assert (=> b!10185 m!14869))

(assert (=> b!10185 m!14853))

(declare-fun m!14871 () Bool)

(assert (=> b!10185 m!14871))

(declare-fun m!14873 () Bool)

(assert (=> b!10185 m!14873))

(declare-fun m!14875 () Bool)

(assert (=> b!10185 m!14875))

(declare-fun m!14877 () Bool)

(assert (=> b!10185 m!14877))

(declare-fun m!14881 () Bool)

(assert (=> b!10185 m!14881))

(assert (=> b!10185 m!14509))

(declare-fun m!14883 () Bool)

(assert (=> b!10185 m!14883))

(declare-fun m!14885 () Bool)

(assert (=> b!10185 m!14885))

(declare-fun m!14887 () Bool)

(assert (=> b!10185 m!14887))

(declare-fun m!14889 () Bool)

(assert (=> b!10185 m!14889))

(declare-fun m!14891 () Bool)

(assert (=> b!10185 m!14891))

(assert (=> b!10185 m!14865))

(declare-fun m!14893 () Bool)

(assert (=> b!10185 m!14893))

(assert (=> b!10185 m!14889))

(declare-fun m!14895 () Bool)

(assert (=> b!10185 m!14895))

(declare-fun m!14897 () Bool)

(assert (=> b!10185 m!14897))

(declare-fun m!14899 () Bool)

(assert (=> b!10185 m!14899))

(declare-fun m!14901 () Bool)

(assert (=> b!10185 m!14901))

(assert (=> b!10185 m!14885))

(declare-fun m!14903 () Bool)

(assert (=> b!10185 m!14903))

(declare-fun m!14905 () Bool)

(assert (=> b!10185 m!14905))

(declare-fun m!14907 () Bool)

(assert (=> b!10185 m!14907))

(declare-fun m!14909 () Bool)

(assert (=> b!10185 m!14909))

(declare-fun m!14911 () Bool)

(assert (=> b!10185 m!14911))

(declare-fun m!14913 () Bool)

(assert (=> b!10185 m!14913))

(declare-fun m!14915 () Bool)

(assert (=> b!10185 m!14915))

(declare-fun m!14917 () Bool)

(assert (=> d!3240 m!14917))

(assert (=> d!3240 m!14509))

(assert (=> d!3240 m!14577))

(assert (=> d!3240 m!14583))

(declare-fun m!14919 () Bool)

(assert (=> b!10190 m!14919))

(declare-fun m!14921 () Bool)

(assert (=> b!10190 m!14921))

(declare-fun m!14923 () Bool)

(assert (=> b!10190 m!14923))

(declare-fun m!14925 () Bool)

(assert (=> b!10190 m!14925))

(declare-fun m!14927 () Bool)

(assert (=> b!10190 m!14927))

(assert (=> b!9966 d!3240))

(declare-fun d!3262 () Bool)

(declare-fun e!6213 () Bool)

(assert (=> d!3262 e!6213))

(declare-fun res!10244 () Bool)

(assert (=> d!3262 (=> (not res!10244) (not e!6213))))

(declare-fun lt!15998 () (_ BitVec 64))

(declare-fun lt!15999 () (_ BitVec 64))

(declare-fun lt!16000 () (_ BitVec 64))

(assert (=> d!3262 (= res!10244 (= lt!15998 (bvsub lt!15999 lt!16000)))))

(assert (=> d!3262 (or (= (bvand lt!15999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!16000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!15999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!15999 lt!16000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3262 (= lt!16000 (remainingBits!0 ((_ sign_extend 32) (size!255 (buf!597 (_2!657 lt!15344)))) ((_ sign_extend 32) (currentByte!1648 (_2!657 lt!15344))) ((_ sign_extend 32) (currentBit!1643 (_2!657 lt!15344)))))))

(declare-fun lt!15997 () (_ BitVec 64))

(declare-fun lt!16001 () (_ BitVec 64))

(assert (=> d!3262 (= lt!15999 (bvmul lt!15997 lt!16001))))

(assert (=> d!3262 (or (= lt!15997 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!16001 (bvsdiv (bvmul lt!15997 lt!16001) lt!15997)))))

(assert (=> d!3262 (= lt!16001 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3262 (= lt!15997 ((_ sign_extend 32) (size!255 (buf!597 (_2!657 lt!15344)))))))

(assert (=> d!3262 (= lt!15998 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1648 (_2!657 lt!15344))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1643 (_2!657 lt!15344)))))))

(assert (=> d!3262 (invariant!0 (currentBit!1643 (_2!657 lt!15344)) (currentByte!1648 (_2!657 lt!15344)) (size!255 (buf!597 (_2!657 lt!15344))))))

(assert (=> d!3262 (= (bitIndex!0 (size!255 (buf!597 (_2!657 lt!15344))) (currentByte!1648 (_2!657 lt!15344)) (currentBit!1643 (_2!657 lt!15344))) lt!15998)))

(declare-fun b!10198 () Bool)

(declare-fun res!10243 () Bool)

(assert (=> b!10198 (=> (not res!10243) (not e!6213))))

(assert (=> b!10198 (= res!10243 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!15998))))

(declare-fun b!10199 () Bool)

(declare-fun lt!15996 () (_ BitVec 64))

(assert (=> b!10199 (= e!6213 (bvsle lt!15998 (bvmul lt!15996 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!10199 (or (= lt!15996 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!15996 #b0000000000000000000000000000000000000000000000000000000000001000) lt!15996)))))

(assert (=> b!10199 (= lt!15996 ((_ sign_extend 32) (size!255 (buf!597 (_2!657 lt!15344)))))))

(assert (= (and d!3262 res!10244) b!10198))

(assert (= (and b!10198 res!10243) b!10199))

(declare-fun m!14929 () Bool)

(assert (=> d!3262 m!14929))

(assert (=> d!3262 m!14485))

(assert (=> b!9969 d!3262))

(declare-fun d!3264 () Bool)

(declare-fun e!6214 () Bool)

(assert (=> d!3264 e!6214))

(declare-fun res!10246 () Bool)

(assert (=> d!3264 (=> (not res!10246) (not e!6214))))

(declare-fun lt!16006 () (_ BitVec 64))

(declare-fun lt!16004 () (_ BitVec 64))

(declare-fun lt!16005 () (_ BitVec 64))

(assert (=> d!3264 (= res!10246 (= lt!16004 (bvsub lt!16005 lt!16006)))))

(assert (=> d!3264 (or (= (bvand lt!16005 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!16006 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!16005 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!16005 lt!16006) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3264 (= lt!16006 (remainingBits!0 ((_ sign_extend 32) (size!255 (buf!597 thiss!1486))) ((_ sign_extend 32) (currentByte!1648 thiss!1486)) ((_ sign_extend 32) (currentBit!1643 thiss!1486))))))

(declare-fun lt!16003 () (_ BitVec 64))

(declare-fun lt!16007 () (_ BitVec 64))

(assert (=> d!3264 (= lt!16005 (bvmul lt!16003 lt!16007))))

(assert (=> d!3264 (or (= lt!16003 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!16007 (bvsdiv (bvmul lt!16003 lt!16007) lt!16003)))))

(assert (=> d!3264 (= lt!16007 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3264 (= lt!16003 ((_ sign_extend 32) (size!255 (buf!597 thiss!1486))))))

(assert (=> d!3264 (= lt!16004 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1648 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1643 thiss!1486))))))

(assert (=> d!3264 (invariant!0 (currentBit!1643 thiss!1486) (currentByte!1648 thiss!1486) (size!255 (buf!597 thiss!1486)))))

(assert (=> d!3264 (= (bitIndex!0 (size!255 (buf!597 thiss!1486)) (currentByte!1648 thiss!1486) (currentBit!1643 thiss!1486)) lt!16004)))

(declare-fun b!10200 () Bool)

(declare-fun res!10245 () Bool)

(assert (=> b!10200 (=> (not res!10245) (not e!6214))))

(assert (=> b!10200 (= res!10245 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!16004))))

(declare-fun b!10201 () Bool)

(declare-fun lt!16002 () (_ BitVec 64))

(assert (=> b!10201 (= e!6214 (bvsle lt!16004 (bvmul lt!16002 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!10201 (or (= lt!16002 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!16002 #b0000000000000000000000000000000000000000000000000000000000001000) lt!16002)))))

(assert (=> b!10201 (= lt!16002 ((_ sign_extend 32) (size!255 (buf!597 thiss!1486))))))

(assert (= (and d!3264 res!10246) b!10200))

(assert (= (and b!10200 res!10245) b!10201))

(declare-fun m!14931 () Bool)

(assert (=> d!3264 m!14931))

(assert (=> d!3264 m!14523))

(assert (=> b!9969 d!3264))

(declare-fun d!3266 () Bool)

(assert (=> d!3266 (= (array_inv!247 (buf!597 thiss!1486)) (bvsge (size!255 (buf!597 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!9964 d!3266))

(declare-fun d!3268 () Bool)

(declare-fun c!695 () Bool)

(assert (=> d!3268 (= c!695 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!6215 () List!149)

(assert (=> d!3268 (= (byteArrayBitContentToList!0 (_2!657 lt!15344) srcBuffer!6 from!367 nBits!460) e!6215)))

(declare-fun b!10202 () Bool)

(assert (=> b!10202 (= e!6215 Nil!146)))

(declare-fun b!10203 () Bool)

(assert (=> b!10203 (= e!6215 (Cons!145 (not (= (bvand ((_ sign_extend 24) (select (arr!669 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!657 lt!15344) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3268 c!695) b!10202))

(assert (= (and d!3268 (not c!695)) b!10203))

(assert (=> b!10203 m!14889))

(declare-fun m!14933 () Bool)

(assert (=> b!10203 m!14933))

(declare-fun m!14935 () Bool)

(assert (=> b!10203 m!14935))

(assert (=> b!9970 d!3268))

(declare-fun d!3270 () Bool)

(declare-fun res!10259 () Bool)

(declare-fun e!6222 () Bool)

(assert (=> d!3270 (=> res!10259 e!6222)))

(assert (=> d!3270 (= res!10259 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3270 (= (checkByteArrayBitContent!0 (_2!657 lt!15344) srcBuffer!6 (_1!658 lt!15343) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!6222)))

(declare-fun b!10214 () Bool)

(declare-fun e!6223 () Bool)

(assert (=> b!10214 (= e!6222 e!6223)))

(declare-fun res!10260 () Bool)

(assert (=> b!10214 (=> (not res!10260) (not e!6223))))

(assert (=> b!10214 (= res!10260 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!669 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!669 (_1!658 lt!15343)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!10215 () Bool)

(assert (=> b!10215 (= e!6223 (checkByteArrayBitContent!0 (_2!657 lt!15344) srcBuffer!6 (_1!658 lt!15343) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!3270 (not res!10259)) b!10214))

(assert (= (and b!10214 res!10260) b!10215))

(assert (=> b!10214 m!14889))

(assert (=> b!10214 m!14933))

(assert (=> b!10214 m!14597))

(assert (=> b!10214 m!14599))

(declare-fun m!14937 () Bool)

(assert (=> b!10215 m!14937))

(assert (=> b!9972 d!3270))

(declare-fun d!3272 () Bool)

(assert (=> d!3272 (checkByteArrayBitContent!0 (_2!657 lt!15344) srcBuffer!6 (_1!658 lt!15343) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))

(declare-fun lt!16068 () Unit!849)

(declare-fun choose!65 (BitStream!482 array!592 array!592 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!849)

(assert (=> d!3272 (= lt!16068 (choose!65 (_2!657 lt!15344) srcBuffer!6 (_1!658 lt!15343) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!3272 (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3272 (= (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!657 lt!15344) srcBuffer!6 (_1!658 lt!15343) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!16068)))

(declare-fun bs!958 () Bool)

(assert (= bs!958 d!3272))

(assert (=> bs!958 m!14501))

(declare-fun m!14939 () Bool)

(assert (=> bs!958 m!14939))

(assert (=> b!9972 d!3272))

(declare-fun d!3274 () Bool)

(assert (=> d!3274 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!255 (buf!597 thiss!1486))) ((_ sign_extend 32) (currentByte!1648 thiss!1486)) ((_ sign_extend 32) (currentBit!1643 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!255 (buf!597 thiss!1486))) ((_ sign_extend 32) (currentByte!1648 thiss!1486)) ((_ sign_extend 32) (currentBit!1643 thiss!1486))) nBits!460))))

(declare-fun bs!959 () Bool)

(assert (= bs!959 d!3274))

(assert (=> bs!959 m!14931))

(assert (=> b!9967 d!3274))

(push 1)

