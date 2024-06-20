; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1660 () Bool)

(assert start!1660)

(declare-fun res!8704 () Bool)

(declare-fun e!5057 () Bool)

(assert (=> start!1660 (=> (not res!8704) (not e!5057))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!536 0))(
  ( (array!537 (arr!638 (Array (_ BitVec 32) (_ BitVec 8))) (size!233 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!536)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!1660 (= res!8704 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!233 srcBuffer!6))))))))

(assert (=> start!1660 e!5057))

(assert (=> start!1660 true))

(declare-fun array_inv!228 (array!536) Bool)

(assert (=> start!1660 (array_inv!228 srcBuffer!6)))

(declare-datatypes ((BitStream!444 0))(
  ( (BitStream!445 (buf!569 array!536) (currentByte!1578 (_ BitVec 32)) (currentBit!1573 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!444)

(declare-fun e!5059 () Bool)

(declare-fun inv!12 (BitStream!444) Bool)

(assert (=> start!1660 (and (inv!12 thiss!1486) e!5059)))

(declare-fun b!8083 () Bool)

(declare-fun res!8703 () Bool)

(assert (=> b!8083 (=> (not res!8703) (not e!5057))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!8083 (= res!8703 (validate_offset_bits!1 ((_ sign_extend 32) (size!233 (buf!569 thiss!1486))) ((_ sign_extend 32) (currentByte!1578 thiss!1486)) ((_ sign_extend 32) (currentBit!1573 thiss!1486)) nBits!460))))

(declare-fun b!8084 () Bool)

(declare-datatypes ((Unit!636 0))(
  ( (Unit!637) )
))
(declare-datatypes ((tuple2!1086 0))(
  ( (tuple2!1087 (_1!574 Unit!636) (_2!574 BitStream!444)) )
))
(declare-fun lt!10742 () tuple2!1086)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!8084 (= e!5057 (not (invariant!0 (currentBit!1573 (_2!574 lt!10742)) (currentByte!1578 (_2!574 lt!10742)) (size!233 (buf!569 (_2!574 lt!10742))))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!444 array!536 (_ BitVec 64) (_ BitVec 64)) tuple2!1086)

(assert (=> b!8084 (= lt!10742 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!8085 () Bool)

(assert (=> b!8085 (= e!5059 (array_inv!228 (buf!569 thiss!1486)))))

(assert (= (and start!1660 res!8704) b!8083))

(assert (= (and b!8083 res!8703) b!8084))

(assert (= start!1660 b!8085))

(declare-fun m!10455 () Bool)

(assert (=> start!1660 m!10455))

(declare-fun m!10457 () Bool)

(assert (=> start!1660 m!10457))

(declare-fun m!10459 () Bool)

(assert (=> b!8083 m!10459))

(declare-fun m!10461 () Bool)

(assert (=> b!8084 m!10461))

(declare-fun m!10463 () Bool)

(assert (=> b!8084 m!10463))

(declare-fun m!10465 () Bool)

(assert (=> b!8085 m!10465))

(check-sat (not b!8084) (not b!8083) (not start!1660) (not b!8085))
(check-sat)
(get-model)

(declare-fun d!2362 () Bool)

(assert (=> d!2362 (= (invariant!0 (currentBit!1573 (_2!574 lt!10742)) (currentByte!1578 (_2!574 lt!10742)) (size!233 (buf!569 (_2!574 lt!10742)))) (and (bvsge (currentBit!1573 (_2!574 lt!10742)) #b00000000000000000000000000000000) (bvslt (currentBit!1573 (_2!574 lt!10742)) #b00000000000000000000000000001000) (bvsge (currentByte!1578 (_2!574 lt!10742)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1578 (_2!574 lt!10742)) (size!233 (buf!569 (_2!574 lt!10742)))) (and (= (currentBit!1573 (_2!574 lt!10742)) #b00000000000000000000000000000000) (= (currentByte!1578 (_2!574 lt!10742)) (size!233 (buf!569 (_2!574 lt!10742))))))))))

(assert (=> b!8084 d!2362))

(declare-fun b!8143 () Bool)

(declare-fun res!8750 () Bool)

(declare-fun e!5092 () Bool)

(assert (=> b!8143 (=> (not res!8750) (not e!5092))))

(declare-fun lt!11022 () tuple2!1086)

(assert (=> b!8143 (= res!8750 (invariant!0 (currentBit!1573 (_2!574 lt!11022)) (currentByte!1578 (_2!574 lt!11022)) (size!233 (buf!569 (_2!574 lt!11022)))))))

(declare-fun b!8144 () Bool)

(declare-fun res!8749 () Bool)

(assert (=> b!8144 (=> (not res!8749) (not e!5092))))

(assert (=> b!8144 (= res!8749 (= (size!233 (buf!569 (_2!574 lt!11022))) (size!233 (buf!569 thiss!1486))))))

(declare-fun b!8145 () Bool)

(declare-fun e!5091 () tuple2!1086)

(declare-fun lt!11027 () tuple2!1086)

(declare-fun Unit!640 () Unit!636)

(assert (=> b!8145 (= e!5091 (tuple2!1087 Unit!640 (_2!574 lt!11027)))))

(declare-fun lt!11029 () tuple2!1086)

(declare-fun appendBitFromByte!0 (BitStream!444 (_ BitVec 8) (_ BitVec 32)) tuple2!1086)

(assert (=> b!8145 (= lt!11029 (appendBitFromByte!0 thiss!1486 (select (arr!638 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!11037 () (_ BitVec 64))

(assert (=> b!8145 (= lt!11037 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!11034 () (_ BitVec 64))

(assert (=> b!8145 (= lt!11034 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!11050 () Unit!636)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!444 BitStream!444 (_ BitVec 64) (_ BitVec 64)) Unit!636)

(assert (=> b!8145 (= lt!11050 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!574 lt!11029) lt!11037 lt!11034))))

(assert (=> b!8145 (validate_offset_bits!1 ((_ sign_extend 32) (size!233 (buf!569 (_2!574 lt!11029)))) ((_ sign_extend 32) (currentByte!1578 (_2!574 lt!11029))) ((_ sign_extend 32) (currentBit!1573 (_2!574 lt!11029))) (bvsub lt!11037 lt!11034))))

(declare-fun lt!11025 () Unit!636)

(assert (=> b!8145 (= lt!11025 lt!11050)))

(declare-datatypes ((tuple2!1092 0))(
  ( (tuple2!1093 (_1!577 BitStream!444) (_2!577 BitStream!444)) )
))
(declare-fun lt!11011 () tuple2!1092)

(declare-fun reader!0 (BitStream!444 BitStream!444) tuple2!1092)

(assert (=> b!8145 (= lt!11011 (reader!0 thiss!1486 (_2!574 lt!11029)))))

(declare-fun lt!11028 () (_ BitVec 64))

(assert (=> b!8145 (= lt!11028 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!11020 () Unit!636)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!444 array!536 (_ BitVec 64)) Unit!636)

(assert (=> b!8145 (= lt!11020 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!569 (_2!574 lt!11029)) lt!11028))))

(assert (=> b!8145 (validate_offset_bits!1 ((_ sign_extend 32) (size!233 (buf!569 (_2!574 lt!11029)))) ((_ sign_extend 32) (currentByte!1578 thiss!1486)) ((_ sign_extend 32) (currentBit!1573 thiss!1486)) lt!11028)))

(declare-fun lt!11026 () Unit!636)

(assert (=> b!8145 (= lt!11026 lt!11020)))

(declare-datatypes ((List!129 0))(
  ( (Nil!126) (Cons!125 (h!244 Bool) (t!879 List!129)) )
))
(declare-fun head!35 (List!129) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!444 array!536 (_ BitVec 64) (_ BitVec 64)) List!129)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!444 BitStream!444 (_ BitVec 64)) List!129)

(assert (=> b!8145 (= (head!35 (byteArrayBitContentToList!0 (_2!574 lt!11029) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!35 (bitStreamReadBitsIntoList!0 (_2!574 lt!11029) (_1!577 lt!11011) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!11045 () Unit!636)

(declare-fun Unit!643 () Unit!636)

(assert (=> b!8145 (= lt!11045 Unit!643)))

(assert (=> b!8145 (= lt!11027 (appendBitsMSBFirstLoop!0 (_2!574 lt!11029) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!11044 () Unit!636)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!444 BitStream!444 BitStream!444) Unit!636)

(assert (=> b!8145 (= lt!11044 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!574 lt!11029) (_2!574 lt!11027)))))

(declare-fun isPrefixOf!0 (BitStream!444 BitStream!444) Bool)

(assert (=> b!8145 (isPrefixOf!0 thiss!1486 (_2!574 lt!11027))))

(declare-fun lt!11047 () Unit!636)

(assert (=> b!8145 (= lt!11047 lt!11044)))

(assert (=> b!8145 (= (size!233 (buf!569 (_2!574 lt!11027))) (size!233 (buf!569 thiss!1486)))))

(declare-fun lt!11024 () Unit!636)

(declare-fun Unit!644 () Unit!636)

(assert (=> b!8145 (= lt!11024 Unit!644)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!8145 (= (bitIndex!0 (size!233 (buf!569 (_2!574 lt!11027))) (currentByte!1578 (_2!574 lt!11027)) (currentBit!1573 (_2!574 lt!11027))) (bvsub (bvadd (bitIndex!0 (size!233 (buf!569 thiss!1486)) (currentByte!1578 thiss!1486) (currentBit!1573 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!11033 () Unit!636)

(declare-fun Unit!645 () Unit!636)

(assert (=> b!8145 (= lt!11033 Unit!645)))

(assert (=> b!8145 (= (bitIndex!0 (size!233 (buf!569 (_2!574 lt!11027))) (currentByte!1578 (_2!574 lt!11027)) (currentBit!1573 (_2!574 lt!11027))) (bvsub (bvsub (bvadd (bitIndex!0 (size!233 (buf!569 (_2!574 lt!11029))) (currentByte!1578 (_2!574 lt!11029)) (currentBit!1573 (_2!574 lt!11029))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!11013 () Unit!636)

(declare-fun Unit!646 () Unit!636)

(assert (=> b!8145 (= lt!11013 Unit!646)))

(declare-fun lt!11016 () tuple2!1092)

(assert (=> b!8145 (= lt!11016 (reader!0 thiss!1486 (_2!574 lt!11027)))))

(declare-fun lt!11038 () (_ BitVec 64))

(assert (=> b!8145 (= lt!11038 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!11018 () Unit!636)

(assert (=> b!8145 (= lt!11018 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!569 (_2!574 lt!11027)) lt!11038))))

(assert (=> b!8145 (validate_offset_bits!1 ((_ sign_extend 32) (size!233 (buf!569 (_2!574 lt!11027)))) ((_ sign_extend 32) (currentByte!1578 thiss!1486)) ((_ sign_extend 32) (currentBit!1573 thiss!1486)) lt!11038)))

(declare-fun lt!11048 () Unit!636)

(assert (=> b!8145 (= lt!11048 lt!11018)))

(declare-fun lt!11041 () tuple2!1092)

(declare-fun call!99 () tuple2!1092)

(assert (=> b!8145 (= lt!11041 call!99)))

(declare-fun lt!11043 () (_ BitVec 64))

(assert (=> b!8145 (= lt!11043 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!11051 () Unit!636)

(assert (=> b!8145 (= lt!11051 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!574 lt!11029) (buf!569 (_2!574 lt!11027)) lt!11043))))

(assert (=> b!8145 (validate_offset_bits!1 ((_ sign_extend 32) (size!233 (buf!569 (_2!574 lt!11027)))) ((_ sign_extend 32) (currentByte!1578 (_2!574 lt!11029))) ((_ sign_extend 32) (currentBit!1573 (_2!574 lt!11029))) lt!11043)))

(declare-fun lt!11021 () Unit!636)

(assert (=> b!8145 (= lt!11021 lt!11051)))

(declare-fun lt!11042 () List!129)

(assert (=> b!8145 (= lt!11042 (byteArrayBitContentToList!0 (_2!574 lt!11027) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!11015 () List!129)

(assert (=> b!8145 (= lt!11015 (byteArrayBitContentToList!0 (_2!574 lt!11027) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!11036 () List!129)

(assert (=> b!8145 (= lt!11036 (bitStreamReadBitsIntoList!0 (_2!574 lt!11027) (_1!577 lt!11016) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!11049 () List!129)

(assert (=> b!8145 (= lt!11049 (bitStreamReadBitsIntoList!0 (_2!574 lt!11027) (_1!577 lt!11041) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!11052 () (_ BitVec 64))

(assert (=> b!8145 (= lt!11052 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!11010 () Unit!636)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!444 BitStream!444 BitStream!444 BitStream!444 (_ BitVec 64) List!129) Unit!636)

(assert (=> b!8145 (= lt!11010 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!574 lt!11027) (_2!574 lt!11027) (_1!577 lt!11016) (_1!577 lt!11041) lt!11052 lt!11036))))

(declare-fun tail!43 (List!129) List!129)

(assert (=> b!8145 (= (bitStreamReadBitsIntoList!0 (_2!574 lt!11027) (_1!577 lt!11041) (bvsub lt!11052 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!43 lt!11036))))

(declare-fun lt!11017 () Unit!636)

(assert (=> b!8145 (= lt!11017 lt!11010)))

(declare-fun lt!11035 () Unit!636)

(declare-fun lt!11039 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!536 array!536 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!636)

(assert (=> b!8145 (= lt!11035 (arrayBitRangesEqImpliesEq!0 (buf!569 (_2!574 lt!11029)) (buf!569 (_2!574 lt!11027)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!11039 (bitIndex!0 (size!233 (buf!569 (_2!574 lt!11029))) (currentByte!1578 (_2!574 lt!11029)) (currentBit!1573 (_2!574 lt!11029)))))))

(declare-fun bitAt!0 (array!536 (_ BitVec 64)) Bool)

(assert (=> b!8145 (= (bitAt!0 (buf!569 (_2!574 lt!11029)) lt!11039) (bitAt!0 (buf!569 (_2!574 lt!11027)) lt!11039))))

(declare-fun lt!11046 () Unit!636)

(assert (=> b!8145 (= lt!11046 lt!11035)))

(declare-fun b!8146 () Bool)

(declare-fun e!5093 () Bool)

(declare-fun lt!11023 () (_ BitVec 64))

(assert (=> b!8146 (= e!5093 (validate_offset_bits!1 ((_ sign_extend 32) (size!233 (buf!569 thiss!1486))) ((_ sign_extend 32) (currentByte!1578 thiss!1486)) ((_ sign_extend 32) (currentBit!1573 thiss!1486)) lt!11023))))

(declare-fun d!2368 () Bool)

(assert (=> d!2368 e!5092))

(declare-fun res!8751 () Bool)

(assert (=> d!2368 (=> (not res!8751) (not e!5092))))

(declare-fun lt!11031 () (_ BitVec 64))

(assert (=> d!2368 (= res!8751 (= (bitIndex!0 (size!233 (buf!569 (_2!574 lt!11022))) (currentByte!1578 (_2!574 lt!11022)) (currentBit!1573 (_2!574 lt!11022))) (bvsub lt!11031 from!367)))))

(assert (=> d!2368 (or (= (bvand lt!11031 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!11031 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!11031 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!11012 () (_ BitVec 64))

(assert (=> d!2368 (= lt!11031 (bvadd lt!11012 from!367 nBits!460))))

(assert (=> d!2368 (or (not (= (bvand lt!11012 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!11012 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!11012 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2368 (= lt!11012 (bitIndex!0 (size!233 (buf!569 thiss!1486)) (currentByte!1578 thiss!1486) (currentBit!1573 thiss!1486)))))

(assert (=> d!2368 (= lt!11022 e!5091)))

(declare-fun c!444 () Bool)

(assert (=> d!2368 (= c!444 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!11014 () Unit!636)

(declare-fun lt!11040 () Unit!636)

(assert (=> d!2368 (= lt!11014 lt!11040)))

(assert (=> d!2368 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!444) Unit!636)

(assert (=> d!2368 (= lt!11040 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2368 (= lt!11039 (bitIndex!0 (size!233 (buf!569 thiss!1486)) (currentByte!1578 thiss!1486) (currentBit!1573 thiss!1486)))))

(assert (=> d!2368 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2368 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!11022)))

(declare-fun b!8147 () Bool)

(declare-fun Unit!649 () Unit!636)

(assert (=> b!8147 (= e!5091 (tuple2!1087 Unit!649 thiss!1486))))

(assert (=> b!8147 (= (size!233 (buf!569 thiss!1486)) (size!233 (buf!569 thiss!1486)))))

(declare-fun lt!11032 () Unit!636)

(declare-fun Unit!650 () Unit!636)

(assert (=> b!8147 (= lt!11032 Unit!650)))

(declare-fun checkByteArrayBitContent!0 (BitStream!444 array!536 array!536 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!1100 0))(
  ( (tuple2!1101 (_1!581 array!536) (_2!581 BitStream!444)) )
))
(declare-fun readBits!0 (BitStream!444 (_ BitVec 64)) tuple2!1100)

(assert (=> b!8147 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!581 (readBits!0 (_1!577 call!99) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!8148 () Bool)

(declare-fun res!8752 () Bool)

(assert (=> b!8148 (=> (not res!8752) (not e!5092))))

(assert (=> b!8148 (= res!8752 (= (size!233 (buf!569 thiss!1486)) (size!233 (buf!569 (_2!574 lt!11022)))))))

(declare-fun b!8149 () Bool)

(declare-fun res!8748 () Bool)

(assert (=> b!8149 (=> (not res!8748) (not e!5092))))

(assert (=> b!8149 (= res!8748 (isPrefixOf!0 thiss!1486 (_2!574 lt!11022)))))

(declare-fun bm!96 () Bool)

(assert (=> bm!96 (= call!99 (reader!0 (ite c!444 (_2!574 lt!11029) thiss!1486) (ite c!444 (_2!574 lt!11027) thiss!1486)))))

(declare-fun b!8150 () Bool)

(declare-fun lt!11053 () tuple2!1092)

(assert (=> b!8150 (= e!5092 (= (bitStreamReadBitsIntoList!0 (_2!574 lt!11022) (_1!577 lt!11053) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!574 lt!11022) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!8150 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8150 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!11030 () Unit!636)

(declare-fun lt!11019 () Unit!636)

(assert (=> b!8150 (= lt!11030 lt!11019)))

(assert (=> b!8150 (validate_offset_bits!1 ((_ sign_extend 32) (size!233 (buf!569 (_2!574 lt!11022)))) ((_ sign_extend 32) (currentByte!1578 thiss!1486)) ((_ sign_extend 32) (currentBit!1573 thiss!1486)) lt!11023)))

(assert (=> b!8150 (= lt!11019 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!569 (_2!574 lt!11022)) lt!11023))))

(assert (=> b!8150 e!5093))

(declare-fun res!8747 () Bool)

(assert (=> b!8150 (=> (not res!8747) (not e!5093))))

(assert (=> b!8150 (= res!8747 (and (= (size!233 (buf!569 thiss!1486)) (size!233 (buf!569 (_2!574 lt!11022)))) (bvsge lt!11023 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8150 (= lt!11023 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!8150 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8150 (= lt!11053 (reader!0 thiss!1486 (_2!574 lt!11022)))))

(assert (= (and d!2368 c!444) b!8145))

(assert (= (and d!2368 (not c!444)) b!8147))

(assert (= (or b!8145 b!8147) bm!96))

(assert (= (and d!2368 res!8751) b!8143))

(assert (= (and b!8143 res!8750) b!8148))

(assert (= (and b!8148 res!8752) b!8149))

(assert (= (and b!8149 res!8748) b!8144))

(assert (= (and b!8144 res!8749) b!8150))

(assert (= (and b!8150 res!8747) b!8146))

(declare-fun m!10483 () Bool)

(assert (=> b!8145 m!10483))

(declare-fun m!10489 () Bool)

(assert (=> b!8145 m!10489))

(declare-fun m!10493 () Bool)

(assert (=> b!8145 m!10493))

(declare-fun m!10497 () Bool)

(assert (=> b!8145 m!10497))

(declare-fun m!10501 () Bool)

(assert (=> b!8145 m!10501))

(declare-fun m!10505 () Bool)

(assert (=> b!8145 m!10505))

(declare-fun m!10509 () Bool)

(assert (=> b!8145 m!10509))

(assert (=> b!8145 m!10505))

(declare-fun m!10513 () Bool)

(assert (=> b!8145 m!10513))

(declare-fun m!10519 () Bool)

(assert (=> b!8145 m!10519))

(declare-fun m!10522 () Bool)

(assert (=> b!8145 m!10522))

(declare-fun m!10527 () Bool)

(assert (=> b!8145 m!10527))

(declare-fun m!10529 () Bool)

(assert (=> b!8145 m!10529))

(declare-fun m!10533 () Bool)

(assert (=> b!8145 m!10533))

(declare-fun m!10535 () Bool)

(assert (=> b!8145 m!10535))

(declare-fun m!10541 () Bool)

(assert (=> b!8145 m!10541))

(declare-fun m!10547 () Bool)

(assert (=> b!8145 m!10547))

(assert (=> b!8145 m!10483))

(declare-fun m!10553 () Bool)

(assert (=> b!8145 m!10553))

(declare-fun m!10557 () Bool)

(assert (=> b!8145 m!10557))

(declare-fun m!10559 () Bool)

(assert (=> b!8145 m!10559))

(declare-fun m!10563 () Bool)

(assert (=> b!8145 m!10563))

(declare-fun m!10567 () Bool)

(assert (=> b!8145 m!10567))

(declare-fun m!10573 () Bool)

(assert (=> b!8145 m!10573))

(declare-fun m!10577 () Bool)

(assert (=> b!8145 m!10577))

(assert (=> b!8145 m!10489))

(declare-fun m!10583 () Bool)

(assert (=> b!8145 m!10583))

(declare-fun m!10587 () Bool)

(assert (=> b!8145 m!10587))

(declare-fun m!10591 () Bool)

(assert (=> b!8145 m!10591))

(declare-fun m!10595 () Bool)

(assert (=> b!8145 m!10595))

(declare-fun m!10597 () Bool)

(assert (=> b!8145 m!10597))

(declare-fun m!10603 () Bool)

(assert (=> b!8145 m!10603))

(declare-fun m!10607 () Bool)

(assert (=> b!8145 m!10607))

(assert (=> b!8145 m!10607))

(declare-fun m!10611 () Bool)

(assert (=> b!8145 m!10611))

(declare-fun m!10613 () Bool)

(assert (=> b!8145 m!10613))

(declare-fun m!10617 () Bool)

(assert (=> b!8143 m!10617))

(declare-fun m!10620 () Bool)

(assert (=> b!8147 m!10620))

(declare-fun m!10625 () Bool)

(assert (=> b!8147 m!10625))

(declare-fun m!10629 () Bool)

(assert (=> b!8146 m!10629))

(declare-fun m!10633 () Bool)

(assert (=> b!8149 m!10633))

(declare-fun m!10635 () Bool)

(assert (=> bm!96 m!10635))

(declare-fun m!10641 () Bool)

(assert (=> d!2368 m!10641))

(assert (=> d!2368 m!10501))

(declare-fun m!10643 () Bool)

(assert (=> d!2368 m!10643))

(declare-fun m!10647 () Bool)

(assert (=> d!2368 m!10647))

(declare-fun m!10649 () Bool)

(assert (=> b!8150 m!10649))

(declare-fun m!10653 () Bool)

(assert (=> b!8150 m!10653))

(declare-fun m!10655 () Bool)

(assert (=> b!8150 m!10655))

(declare-fun m!10659 () Bool)

(assert (=> b!8150 m!10659))

(declare-fun m!10663 () Bool)

(assert (=> b!8150 m!10663))

(assert (=> b!8084 d!2368))

(declare-fun d!2382 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!2382 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!233 (buf!569 thiss!1486))) ((_ sign_extend 32) (currentByte!1578 thiss!1486)) ((_ sign_extend 32) (currentBit!1573 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!233 (buf!569 thiss!1486))) ((_ sign_extend 32) (currentByte!1578 thiss!1486)) ((_ sign_extend 32) (currentBit!1573 thiss!1486))) nBits!460))))

(declare-fun bs!814 () Bool)

(assert (= bs!814 d!2382))

(declare-fun m!10667 () Bool)

(assert (=> bs!814 m!10667))

(assert (=> b!8083 d!2382))

(declare-fun d!2384 () Bool)

(assert (=> d!2384 (= (array_inv!228 srcBuffer!6) (bvsge (size!233 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!1660 d!2384))

(declare-fun d!2386 () Bool)

(assert (=> d!2386 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1573 thiss!1486) (currentByte!1578 thiss!1486) (size!233 (buf!569 thiss!1486))))))

(declare-fun bs!815 () Bool)

(assert (= bs!815 d!2386))

(declare-fun m!10669 () Bool)

(assert (=> bs!815 m!10669))

(assert (=> start!1660 d!2386))

(declare-fun d!2388 () Bool)

(assert (=> d!2388 (= (array_inv!228 (buf!569 thiss!1486)) (bvsge (size!233 (buf!569 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!8085 d!2388))

(check-sat (not b!8146) (not b!8147) (not d!2368) (not b!8143) (not d!2386) (not bm!96) (not b!8150) (not d!2382) (not b!8149) (not b!8145))
