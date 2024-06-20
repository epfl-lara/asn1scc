; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11268 () Bool)

(assert start!11268)

(declare-datatypes ((array!2590 0))(
  ( (array!2591 (arr!1727 (Array (_ BitVec 32) (_ BitVec 8))) (size!1178 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2590)

(declare-fun b!55831 () Bool)

(declare-datatypes ((BitStream!2044 0))(
  ( (BitStream!2045 (buf!1544 array!2590) (currentByte!3132 (_ BitVec 32)) (currentBit!3127 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3859 0))(
  ( (Unit!3860) )
))
(declare-datatypes ((tuple2!5090 0))(
  ( (tuple2!5091 (_1!2656 Unit!3859) (_2!2656 BitStream!2044)) )
))
(declare-fun lt!87387 () tuple2!5090)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((tuple2!5092 0))(
  ( (tuple2!5093 (_1!2657 BitStream!2044) (_2!2657 BitStream!2044)) )
))
(declare-fun lt!87386 () tuple2!5092)

(declare-fun e!37184 () Bool)

(declare-datatypes ((List!597 0))(
  ( (Nil!594) (Cons!593 (h!712 Bool) (t!1347 List!597)) )
))
(declare-fun head!416 (List!597) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2044 array!2590 (_ BitVec 64) (_ BitVec 64)) List!597)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2044 BitStream!2044 (_ BitVec 64)) List!597)

(assert (=> b!55831 (= e!37184 (= (head!416 (byteArrayBitContentToList!0 (_2!2656 lt!87387) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!416 (bitStreamReadBitsIntoList!0 (_2!2656 lt!87387) (_1!2657 lt!87386) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!55832 () Bool)

(declare-fun e!37183 () Bool)

(declare-fun e!37182 () Bool)

(assert (=> b!55832 (= e!37183 (not e!37182))))

(declare-fun res!46475 () Bool)

(assert (=> b!55832 (=> res!46475 e!37182)))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!55832 (= res!46475 (bvsge i!635 to!314))))

(declare-fun thiss!1379 () BitStream!2044)

(declare-fun isPrefixOf!0 (BitStream!2044 BitStream!2044) Bool)

(assert (=> b!55832 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!87385 () Unit!3859)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2044) Unit!3859)

(assert (=> b!55832 (= lt!87385 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!87388 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!55832 (= lt!87388 (bitIndex!0 (size!1178 (buf!1544 thiss!1379)) (currentByte!3132 thiss!1379) (currentBit!3127 thiss!1379)))))

(declare-fun b!55833 () Bool)

(declare-fun res!46474 () Bool)

(declare-fun e!37176 () Bool)

(assert (=> b!55833 (=> res!46474 e!37176)))

(declare-fun lt!87394 () tuple2!5090)

(assert (=> b!55833 (= res!46474 (not (= (size!1178 (buf!1544 thiss!1379)) (size!1178 (buf!1544 (_2!2656 lt!87394))))))))

(declare-fun b!55834 () Bool)

(declare-fun e!37178 () Bool)

(assert (=> b!55834 (= e!37182 e!37178)))

(declare-fun res!46477 () Bool)

(assert (=> b!55834 (=> res!46477 e!37178)))

(assert (=> b!55834 (= res!46477 (not (isPrefixOf!0 thiss!1379 (_2!2656 lt!87387))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!55834 (validate_offset_bits!1 ((_ sign_extend 32) (size!1178 (buf!1544 (_2!2656 lt!87387)))) ((_ sign_extend 32) (currentByte!3132 (_2!2656 lt!87387))) ((_ sign_extend 32) (currentBit!3127 (_2!2656 lt!87387))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!87393 () Unit!3859)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2044 BitStream!2044 (_ BitVec 64) (_ BitVec 64)) Unit!3859)

(assert (=> b!55834 (= lt!87393 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2656 lt!87387) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2044 (_ BitVec 8) (_ BitVec 32)) tuple2!5090)

(assert (=> b!55834 (= lt!87387 (appendBitFromByte!0 thiss!1379 (select (arr!1727 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!87390 () (_ BitVec 64))

(declare-fun lt!87384 () (_ BitVec 64))

(declare-fun b!55835 () Bool)

(assert (=> b!55835 (= e!37176 (or (= lt!87390 (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!87390 (bvand lt!87384 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!87391 () (_ BitVec 64))

(assert (=> b!55835 (= lt!87390 (bvand lt!87391 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!55835 (= (size!1178 (buf!1544 (_2!2656 lt!87394))) (size!1178 (buf!1544 thiss!1379)))))

(declare-fun b!55836 () Bool)

(declare-fun res!46476 () Bool)

(assert (=> b!55836 (=> (not res!46476) (not e!37183))))

(assert (=> b!55836 (= res!46476 (validate_offset_bits!1 ((_ sign_extend 32) (size!1178 (buf!1544 thiss!1379))) ((_ sign_extend 32) (currentByte!3132 thiss!1379)) ((_ sign_extend 32) (currentBit!3127 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!55837 () Bool)

(declare-fun e!37181 () Bool)

(assert (=> b!55837 (= e!37181 e!37176)))

(declare-fun res!46480 () Bool)

(assert (=> b!55837 (=> res!46480 e!37176)))

(assert (=> b!55837 (= res!46480 (not (= (bitIndex!0 (size!1178 (buf!1544 (_2!2656 lt!87394))) (currentByte!3132 (_2!2656 lt!87394)) (currentBit!3127 (_2!2656 lt!87394))) lt!87384)))))

(assert (=> b!55837 (= lt!87384 (bvsub lt!87391 i!635))))

(assert (=> b!55837 (= lt!87391 (bvadd lt!87388 to!314))))

(declare-fun b!55838 () Bool)

(assert (=> b!55838 (= e!37178 e!37181)))

(declare-fun res!46481 () Bool)

(assert (=> b!55838 (=> res!46481 e!37181)))

(assert (=> b!55838 (= res!46481 (not (isPrefixOf!0 (_2!2656 lt!87387) (_2!2656 lt!87394))))))

(assert (=> b!55838 (isPrefixOf!0 thiss!1379 (_2!2656 lt!87394))))

(declare-fun lt!87392 () Unit!3859)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2044 BitStream!2044 BitStream!2044) Unit!3859)

(assert (=> b!55838 (= lt!87392 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2656 lt!87387) (_2!2656 lt!87394)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2044 array!2590 (_ BitVec 64) (_ BitVec 64)) tuple2!5090)

(assert (=> b!55838 (= lt!87394 (appendBitsMSBFirstLoop!0 (_2!2656 lt!87387) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!55838 e!37184))

(declare-fun res!46478 () Bool)

(assert (=> b!55838 (=> (not res!46478) (not e!37184))))

(assert (=> b!55838 (= res!46478 (validate_offset_bits!1 ((_ sign_extend 32) (size!1178 (buf!1544 (_2!2656 lt!87387)))) ((_ sign_extend 32) (currentByte!3132 thiss!1379)) ((_ sign_extend 32) (currentBit!3127 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!87389 () Unit!3859)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2044 array!2590 (_ BitVec 64)) Unit!3859)

(assert (=> b!55838 (= lt!87389 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1544 (_2!2656 lt!87387)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2044 BitStream!2044) tuple2!5092)

(assert (=> b!55838 (= lt!87386 (reader!0 thiss!1379 (_2!2656 lt!87387)))))

(declare-fun res!46482 () Bool)

(assert (=> start!11268 (=> (not res!46482) (not e!37183))))

(assert (=> start!11268 (= res!46482 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1178 srcBuffer!2))))))))

(assert (=> start!11268 e!37183))

(assert (=> start!11268 true))

(declare-fun array_inv!1081 (array!2590) Bool)

(assert (=> start!11268 (array_inv!1081 srcBuffer!2)))

(declare-fun e!37179 () Bool)

(declare-fun inv!12 (BitStream!2044) Bool)

(assert (=> start!11268 (and (inv!12 thiss!1379) e!37179)))

(declare-fun b!55839 () Bool)

(declare-fun res!46479 () Bool)

(assert (=> b!55839 (=> res!46479 e!37176)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!55839 (= res!46479 (not (invariant!0 (currentBit!3127 (_2!2656 lt!87394)) (currentByte!3132 (_2!2656 lt!87394)) (size!1178 (buf!1544 (_2!2656 lt!87394))))))))

(declare-fun b!55840 () Bool)

(assert (=> b!55840 (= e!37179 (array_inv!1081 (buf!1544 thiss!1379)))))

(assert (= (and start!11268 res!46482) b!55836))

(assert (= (and b!55836 res!46476) b!55832))

(assert (= (and b!55832 (not res!46475)) b!55834))

(assert (= (and b!55834 (not res!46477)) b!55838))

(assert (= (and b!55838 res!46478) b!55831))

(assert (= (and b!55838 (not res!46481)) b!55837))

(assert (= (and b!55837 (not res!46480)) b!55839))

(assert (= (and b!55839 (not res!46479)) b!55833))

(assert (= (and b!55833 (not res!46474)) b!55835))

(assert (= start!11268 b!55840))

(declare-fun m!87967 () Bool)

(assert (=> start!11268 m!87967))

(declare-fun m!87969 () Bool)

(assert (=> start!11268 m!87969))

(declare-fun m!87971 () Bool)

(assert (=> b!55831 m!87971))

(assert (=> b!55831 m!87971))

(declare-fun m!87973 () Bool)

(assert (=> b!55831 m!87973))

(declare-fun m!87975 () Bool)

(assert (=> b!55831 m!87975))

(assert (=> b!55831 m!87975))

(declare-fun m!87977 () Bool)

(assert (=> b!55831 m!87977))

(declare-fun m!87979 () Bool)

(assert (=> b!55837 m!87979))

(declare-fun m!87981 () Bool)

(assert (=> b!55832 m!87981))

(declare-fun m!87983 () Bool)

(assert (=> b!55832 m!87983))

(declare-fun m!87985 () Bool)

(assert (=> b!55832 m!87985))

(declare-fun m!87987 () Bool)

(assert (=> b!55838 m!87987))

(declare-fun m!87989 () Bool)

(assert (=> b!55838 m!87989))

(declare-fun m!87991 () Bool)

(assert (=> b!55838 m!87991))

(declare-fun m!87993 () Bool)

(assert (=> b!55838 m!87993))

(declare-fun m!87995 () Bool)

(assert (=> b!55838 m!87995))

(declare-fun m!87997 () Bool)

(assert (=> b!55838 m!87997))

(declare-fun m!87999 () Bool)

(assert (=> b!55838 m!87999))

(declare-fun m!88001 () Bool)

(assert (=> b!55836 m!88001))

(declare-fun m!88003 () Bool)

(assert (=> b!55834 m!88003))

(declare-fun m!88005 () Bool)

(assert (=> b!55834 m!88005))

(assert (=> b!55834 m!88003))

(declare-fun m!88007 () Bool)

(assert (=> b!55834 m!88007))

(declare-fun m!88009 () Bool)

(assert (=> b!55834 m!88009))

(declare-fun m!88011 () Bool)

(assert (=> b!55834 m!88011))

(declare-fun m!88013 () Bool)

(assert (=> b!55839 m!88013))

(declare-fun m!88015 () Bool)

(assert (=> b!55840 m!88015))

(push 1)

(assert (not b!55838))

(assert (not b!55839))

(assert (not b!55831))

(assert (not b!55837))

(assert (not b!55832))

(assert (not b!55834))

(assert (not b!55840))

(assert (not start!11268))

(assert (not b!55836))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!17856 () Bool)

(declare-fun res!46619 () Bool)

(declare-fun e!37298 () Bool)

(assert (=> d!17856 (=> (not res!46619) (not e!37298))))

(assert (=> d!17856 (= res!46619 (= (size!1178 (buf!1544 (_2!2656 lt!87387))) (size!1178 (buf!1544 (_2!2656 lt!87394)))))))

(assert (=> d!17856 (= (isPrefixOf!0 (_2!2656 lt!87387) (_2!2656 lt!87394)) e!37298)))

(declare-fun b!56000 () Bool)

(declare-fun res!46617 () Bool)

(assert (=> b!56000 (=> (not res!46617) (not e!37298))))

(assert (=> b!56000 (= res!46617 (bvsle (bitIndex!0 (size!1178 (buf!1544 (_2!2656 lt!87387))) (currentByte!3132 (_2!2656 lt!87387)) (currentBit!3127 (_2!2656 lt!87387))) (bitIndex!0 (size!1178 (buf!1544 (_2!2656 lt!87394))) (currentByte!3132 (_2!2656 lt!87394)) (currentBit!3127 (_2!2656 lt!87394)))))))

(declare-fun b!56001 () Bool)

(declare-fun e!37297 () Bool)

(assert (=> b!56001 (= e!37298 e!37297)))

(declare-fun res!46618 () Bool)

(assert (=> b!56001 (=> res!46618 e!37297)))

(assert (=> b!56001 (= res!46618 (= (size!1178 (buf!1544 (_2!2656 lt!87387))) #b00000000000000000000000000000000))))

(declare-fun b!56002 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2590 array!2590 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!56002 (= e!37297 (arrayBitRangesEq!0 (buf!1544 (_2!2656 lt!87387)) (buf!1544 (_2!2656 lt!87394)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1178 (buf!1544 (_2!2656 lt!87387))) (currentByte!3132 (_2!2656 lt!87387)) (currentBit!3127 (_2!2656 lt!87387)))))))

(assert (= (and d!17856 res!46619) b!56000))

(assert (= (and b!56000 res!46617) b!56001))

(assert (= (and b!56001 (not res!46618)) b!56002))

(declare-fun m!88199 () Bool)

(assert (=> b!56000 m!88199))

(assert (=> b!56000 m!87979))

(assert (=> b!56002 m!88199))

(assert (=> b!56002 m!88199))

(declare-fun m!88201 () Bool)

(assert (=> b!56002 m!88201))

(assert (=> b!55838 d!17856))

(declare-fun b!56045 () Bool)

(declare-fun e!37317 () Unit!3859)

(declare-fun lt!87691 () Unit!3859)

(assert (=> b!56045 (= e!37317 lt!87691)))

(declare-fun lt!87694 () (_ BitVec 64))

(assert (=> b!56045 (= lt!87694 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87699 () (_ BitVec 64))

(assert (=> b!56045 (= lt!87699 (bitIndex!0 (size!1178 (buf!1544 thiss!1379)) (currentByte!3132 thiss!1379) (currentBit!3127 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2590 array!2590 (_ BitVec 64) (_ BitVec 64)) Unit!3859)

(assert (=> b!56045 (= lt!87691 (arrayBitRangesEqSymmetric!0 (buf!1544 thiss!1379) (buf!1544 (_2!2656 lt!87387)) lt!87694 lt!87699))))

(assert (=> b!56045 (arrayBitRangesEq!0 (buf!1544 (_2!2656 lt!87387)) (buf!1544 thiss!1379) lt!87694 lt!87699)))

(declare-fun b!56046 () Bool)

(declare-fun res!46652 () Bool)

(declare-fun e!37318 () Bool)

(assert (=> b!56046 (=> (not res!46652) (not e!37318))))

(declare-fun lt!87702 () tuple2!5092)

(assert (=> b!56046 (= res!46652 (isPrefixOf!0 (_2!2657 lt!87702) (_2!2656 lt!87387)))))

(declare-fun b!56047 () Bool)

(declare-fun Unit!3873 () Unit!3859)

(assert (=> b!56047 (= e!37317 Unit!3873)))

(declare-fun b!56048 () Bool)

(declare-fun lt!87695 () (_ BitVec 64))

(declare-fun lt!87700 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2044 (_ BitVec 64)) BitStream!2044)

(assert (=> b!56048 (= e!37318 (= (_1!2657 lt!87702) (withMovedBitIndex!0 (_2!2657 lt!87702) (bvsub lt!87700 lt!87695))))))

(assert (=> b!56048 (or (= (bvand lt!87700 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!87695 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!87700 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!87700 lt!87695) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56048 (= lt!87695 (bitIndex!0 (size!1178 (buf!1544 (_2!2656 lt!87387))) (currentByte!3132 (_2!2656 lt!87387)) (currentBit!3127 (_2!2656 lt!87387))))))

(assert (=> b!56048 (= lt!87700 (bitIndex!0 (size!1178 (buf!1544 thiss!1379)) (currentByte!3132 thiss!1379) (currentBit!3127 thiss!1379)))))

(declare-fun d!17858 () Bool)

(assert (=> d!17858 e!37318))

(declare-fun res!46651 () Bool)

(assert (=> d!17858 (=> (not res!46651) (not e!37318))))

(assert (=> d!17858 (= res!46651 (isPrefixOf!0 (_1!2657 lt!87702) (_2!2657 lt!87702)))))

(declare-fun lt!87709 () BitStream!2044)

(assert (=> d!17858 (= lt!87702 (tuple2!5093 lt!87709 (_2!2656 lt!87387)))))

(declare-fun lt!87697 () Unit!3859)

(declare-fun lt!87708 () Unit!3859)

(assert (=> d!17858 (= lt!87697 lt!87708)))

(assert (=> d!17858 (isPrefixOf!0 lt!87709 (_2!2656 lt!87387))))

(assert (=> d!17858 (= lt!87708 (lemmaIsPrefixTransitive!0 lt!87709 (_2!2656 lt!87387) (_2!2656 lt!87387)))))

(declare-fun lt!87698 () Unit!3859)

(declare-fun lt!87696 () Unit!3859)

(assert (=> d!17858 (= lt!87698 lt!87696)))

(assert (=> d!17858 (isPrefixOf!0 lt!87709 (_2!2656 lt!87387))))

(assert (=> d!17858 (= lt!87696 (lemmaIsPrefixTransitive!0 lt!87709 thiss!1379 (_2!2656 lt!87387)))))

(declare-fun lt!87692 () Unit!3859)

(assert (=> d!17858 (= lt!87692 e!37317)))

(declare-fun c!4017 () Bool)

(assert (=> d!17858 (= c!4017 (not (= (size!1178 (buf!1544 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!87704 () Unit!3859)

(declare-fun lt!87690 () Unit!3859)

(assert (=> d!17858 (= lt!87704 lt!87690)))

(assert (=> d!17858 (isPrefixOf!0 (_2!2656 lt!87387) (_2!2656 lt!87387))))

(assert (=> d!17858 (= lt!87690 (lemmaIsPrefixRefl!0 (_2!2656 lt!87387)))))

(declare-fun lt!87703 () Unit!3859)

(declare-fun lt!87701 () Unit!3859)

(assert (=> d!17858 (= lt!87703 lt!87701)))

(assert (=> d!17858 (= lt!87701 (lemmaIsPrefixRefl!0 (_2!2656 lt!87387)))))

(declare-fun lt!87707 () Unit!3859)

(declare-fun lt!87706 () Unit!3859)

(assert (=> d!17858 (= lt!87707 lt!87706)))

(assert (=> d!17858 (isPrefixOf!0 lt!87709 lt!87709)))

(assert (=> d!17858 (= lt!87706 (lemmaIsPrefixRefl!0 lt!87709))))

(declare-fun lt!87693 () Unit!3859)

(declare-fun lt!87705 () Unit!3859)

(assert (=> d!17858 (= lt!87693 lt!87705)))

(assert (=> d!17858 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!17858 (= lt!87705 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!17858 (= lt!87709 (BitStream!2045 (buf!1544 (_2!2656 lt!87387)) (currentByte!3132 thiss!1379) (currentBit!3127 thiss!1379)))))

(assert (=> d!17858 (isPrefixOf!0 thiss!1379 (_2!2656 lt!87387))))

(assert (=> d!17858 (= (reader!0 thiss!1379 (_2!2656 lt!87387)) lt!87702)))

(declare-fun b!56049 () Bool)

(declare-fun res!46653 () Bool)

(assert (=> b!56049 (=> (not res!46653) (not e!37318))))

(assert (=> b!56049 (= res!46653 (isPrefixOf!0 (_1!2657 lt!87702) thiss!1379))))

(assert (= (and d!17858 c!4017) b!56045))

(assert (= (and d!17858 (not c!4017)) b!56047))

(assert (= (and d!17858 res!46651) b!56049))

(assert (= (and b!56049 res!46653) b!56046))

(assert (= (and b!56046 res!46652) b!56048))

(declare-fun m!88229 () Bool)

(assert (=> b!56049 m!88229))

(declare-fun m!88231 () Bool)

(assert (=> b!56046 m!88231))

(declare-fun m!88233 () Bool)

(assert (=> d!17858 m!88233))

(declare-fun m!88235 () Bool)

(assert (=> d!17858 m!88235))

(assert (=> d!17858 m!87981))

(declare-fun m!88237 () Bool)

(assert (=> d!17858 m!88237))

(declare-fun m!88239 () Bool)

(assert (=> d!17858 m!88239))

(declare-fun m!88241 () Bool)

(assert (=> d!17858 m!88241))

(assert (=> d!17858 m!88005))

(assert (=> d!17858 m!87983))

(declare-fun m!88243 () Bool)

(assert (=> d!17858 m!88243))

(declare-fun m!88245 () Bool)

(assert (=> d!17858 m!88245))

(declare-fun m!88247 () Bool)

(assert (=> d!17858 m!88247))

(assert (=> b!56045 m!87985))

(declare-fun m!88249 () Bool)

(assert (=> b!56045 m!88249))

(declare-fun m!88251 () Bool)

(assert (=> b!56045 m!88251))

(declare-fun m!88253 () Bool)

(assert (=> b!56048 m!88253))

(assert (=> b!56048 m!88199))

(assert (=> b!56048 m!87985))

(assert (=> b!55838 d!17858))

(declare-fun d!17862 () Bool)

(assert (=> d!17862 (isPrefixOf!0 thiss!1379 (_2!2656 lt!87394))))

(declare-fun lt!87724 () Unit!3859)

(declare-fun choose!30 (BitStream!2044 BitStream!2044 BitStream!2044) Unit!3859)

(assert (=> d!17862 (= lt!87724 (choose!30 thiss!1379 (_2!2656 lt!87387) (_2!2656 lt!87394)))))

(assert (=> d!17862 (isPrefixOf!0 thiss!1379 (_2!2656 lt!87387))))

(assert (=> d!17862 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2656 lt!87387) (_2!2656 lt!87394)) lt!87724)))

(declare-fun bs!4478 () Bool)

(assert (= bs!4478 d!17862))

(assert (=> bs!4478 m!87991))

(declare-fun m!88283 () Bool)

(assert (=> bs!4478 m!88283))

(assert (=> bs!4478 m!88005))

(assert (=> b!55838 d!17862))

(declare-fun b!56087 () Bool)

(declare-fun res!46682 () Bool)

(declare-fun e!37337 () Bool)

(assert (=> b!56087 (=> (not res!46682) (not e!37337))))

(declare-fun lt!87949 () tuple2!5090)

(assert (=> b!56087 (= res!46682 (= (size!1178 (buf!1544 (_2!2656 lt!87949))) (size!1178 (buf!1544 (_2!2656 lt!87387)))))))

(declare-fun b!56088 () Bool)

(declare-fun e!37336 () tuple2!5090)

(declare-fun lt!87945 () tuple2!5090)

(declare-fun Unit!3874 () Unit!3859)

(assert (=> b!56088 (= e!37336 (tuple2!5091 Unit!3874 (_2!2656 lt!87945)))))

(declare-fun lt!87975 () tuple2!5090)

(assert (=> b!56088 (= lt!87975 (appendBitFromByte!0 (_2!2656 lt!87387) (select (arr!1727 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!87981 () (_ BitVec 64))

(assert (=> b!56088 (= lt!87981 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!87971 () (_ BitVec 64))

(assert (=> b!56088 (= lt!87971 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!87959 () Unit!3859)

(assert (=> b!56088 (= lt!87959 (validateOffsetBitsIneqLemma!0 (_2!2656 lt!87387) (_2!2656 lt!87975) lt!87981 lt!87971))))

(assert (=> b!56088 (validate_offset_bits!1 ((_ sign_extend 32) (size!1178 (buf!1544 (_2!2656 lt!87975)))) ((_ sign_extend 32) (currentByte!3132 (_2!2656 lt!87975))) ((_ sign_extend 32) (currentBit!3127 (_2!2656 lt!87975))) (bvsub lt!87981 lt!87971))))

(declare-fun lt!87977 () Unit!3859)

(assert (=> b!56088 (= lt!87977 lt!87959)))

(declare-fun lt!87964 () tuple2!5092)

(assert (=> b!56088 (= lt!87964 (reader!0 (_2!2656 lt!87387) (_2!2656 lt!87975)))))

(declare-fun lt!87953 () (_ BitVec 64))

(assert (=> b!56088 (= lt!87953 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!87962 () Unit!3859)

(assert (=> b!56088 (= lt!87962 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2656 lt!87387) (buf!1544 (_2!2656 lt!87975)) lt!87953))))

(assert (=> b!56088 (validate_offset_bits!1 ((_ sign_extend 32) (size!1178 (buf!1544 (_2!2656 lt!87975)))) ((_ sign_extend 32) (currentByte!3132 (_2!2656 lt!87387))) ((_ sign_extend 32) (currentBit!3127 (_2!2656 lt!87387))) lt!87953)))

(declare-fun lt!87965 () Unit!3859)

(assert (=> b!56088 (= lt!87965 lt!87962)))

(assert (=> b!56088 (= (head!416 (byteArrayBitContentToList!0 (_2!2656 lt!87975) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!416 (bitStreamReadBitsIntoList!0 (_2!2656 lt!87975) (_1!2657 lt!87964) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!87957 () Unit!3859)

(declare-fun Unit!3877 () Unit!3859)

(assert (=> b!56088 (= lt!87957 Unit!3877)))

(assert (=> b!56088 (= lt!87945 (appendBitsMSBFirstLoop!0 (_2!2656 lt!87975) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!87943 () Unit!3859)

(assert (=> b!56088 (= lt!87943 (lemmaIsPrefixTransitive!0 (_2!2656 lt!87387) (_2!2656 lt!87975) (_2!2656 lt!87945)))))

(assert (=> b!56088 (isPrefixOf!0 (_2!2656 lt!87387) (_2!2656 lt!87945))))

(declare-fun lt!87980 () Unit!3859)

(assert (=> b!56088 (= lt!87980 lt!87943)))

(assert (=> b!56088 (= (size!1178 (buf!1544 (_2!2656 lt!87945))) (size!1178 (buf!1544 (_2!2656 lt!87387))))))

(declare-fun lt!87970 () Unit!3859)

(declare-fun Unit!3878 () Unit!3859)

(assert (=> b!56088 (= lt!87970 Unit!3878)))

(assert (=> b!56088 (= (bitIndex!0 (size!1178 (buf!1544 (_2!2656 lt!87945))) (currentByte!3132 (_2!2656 lt!87945)) (currentBit!3127 (_2!2656 lt!87945))) (bvsub (bvadd (bitIndex!0 (size!1178 (buf!1544 (_2!2656 lt!87387))) (currentByte!3132 (_2!2656 lt!87387)) (currentBit!3127 (_2!2656 lt!87387))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!87967 () Unit!3859)

(declare-fun Unit!3879 () Unit!3859)

(assert (=> b!56088 (= lt!87967 Unit!3879)))

(assert (=> b!56088 (= (bitIndex!0 (size!1178 (buf!1544 (_2!2656 lt!87945))) (currentByte!3132 (_2!2656 lt!87945)) (currentBit!3127 (_2!2656 lt!87945))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1178 (buf!1544 (_2!2656 lt!87975))) (currentByte!3132 (_2!2656 lt!87975)) (currentBit!3127 (_2!2656 lt!87975))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!87968 () Unit!3859)

(declare-fun Unit!3880 () Unit!3859)

(assert (=> b!56088 (= lt!87968 Unit!3880)))

(declare-fun lt!87946 () tuple2!5092)

(assert (=> b!56088 (= lt!87946 (reader!0 (_2!2656 lt!87387) (_2!2656 lt!87945)))))

(declare-fun lt!87950 () (_ BitVec 64))

(assert (=> b!56088 (= lt!87950 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!87973 () Unit!3859)

(assert (=> b!56088 (= lt!87973 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2656 lt!87387) (buf!1544 (_2!2656 lt!87945)) lt!87950))))

(assert (=> b!56088 (validate_offset_bits!1 ((_ sign_extend 32) (size!1178 (buf!1544 (_2!2656 lt!87945)))) ((_ sign_extend 32) (currentByte!3132 (_2!2656 lt!87387))) ((_ sign_extend 32) (currentBit!3127 (_2!2656 lt!87387))) lt!87950)))

(declare-fun lt!87986 () Unit!3859)

(assert (=> b!56088 (= lt!87986 lt!87973)))

(declare-fun lt!87976 () tuple2!5092)

(declare-fun call!723 () tuple2!5092)

(assert (=> b!56088 (= lt!87976 call!723)))

(declare-fun lt!87944 () (_ BitVec 64))

(assert (=> b!56088 (= lt!87944 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!87951 () Unit!3859)

(assert (=> b!56088 (= lt!87951 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2656 lt!87975) (buf!1544 (_2!2656 lt!87945)) lt!87944))))

(assert (=> b!56088 (validate_offset_bits!1 ((_ sign_extend 32) (size!1178 (buf!1544 (_2!2656 lt!87945)))) ((_ sign_extend 32) (currentByte!3132 (_2!2656 lt!87975))) ((_ sign_extend 32) (currentBit!3127 (_2!2656 lt!87975))) lt!87944)))

(declare-fun lt!87956 () Unit!3859)

(assert (=> b!56088 (= lt!87956 lt!87951)))

(declare-fun lt!87963 () List!597)

(assert (=> b!56088 (= lt!87963 (byteArrayBitContentToList!0 (_2!2656 lt!87945) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!87960 () List!597)

(assert (=> b!56088 (= lt!87960 (byteArrayBitContentToList!0 (_2!2656 lt!87945) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!87982 () List!597)

(assert (=> b!56088 (= lt!87982 (bitStreamReadBitsIntoList!0 (_2!2656 lt!87945) (_1!2657 lt!87946) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!87984 () List!597)

(assert (=> b!56088 (= lt!87984 (bitStreamReadBitsIntoList!0 (_2!2656 lt!87945) (_1!2657 lt!87976) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!87954 () (_ BitVec 64))

(assert (=> b!56088 (= lt!87954 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!87985 () Unit!3859)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2044 BitStream!2044 BitStream!2044 BitStream!2044 (_ BitVec 64) List!597) Unit!3859)

(assert (=> b!56088 (= lt!87985 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2656 lt!87945) (_2!2656 lt!87945) (_1!2657 lt!87946) (_1!2657 lt!87976) lt!87954 lt!87982))))

(declare-fun tail!268 (List!597) List!597)

(assert (=> b!56088 (= (bitStreamReadBitsIntoList!0 (_2!2656 lt!87945) (_1!2657 lt!87976) (bvsub lt!87954 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!268 lt!87982))))

(declare-fun lt!87966 () Unit!3859)

(assert (=> b!56088 (= lt!87966 lt!87985)))

(declare-fun lt!87972 () (_ BitVec 64))

(declare-fun lt!87969 () Unit!3859)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2590 array!2590 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3859)

(assert (=> b!56088 (= lt!87969 (arrayBitRangesEqImpliesEq!0 (buf!1544 (_2!2656 lt!87975)) (buf!1544 (_2!2656 lt!87945)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!87972 (bitIndex!0 (size!1178 (buf!1544 (_2!2656 lt!87975))) (currentByte!3132 (_2!2656 lt!87975)) (currentBit!3127 (_2!2656 lt!87975)))))))

(declare-fun bitAt!0 (array!2590 (_ BitVec 64)) Bool)

(assert (=> b!56088 (= (bitAt!0 (buf!1544 (_2!2656 lt!87975)) lt!87972) (bitAt!0 (buf!1544 (_2!2656 lt!87945)) lt!87972))))

(declare-fun lt!87978 () Unit!3859)

(assert (=> b!56088 (= lt!87978 lt!87969)))

(declare-fun b!56089 () Bool)

(declare-fun res!46679 () Bool)

(assert (=> b!56089 (=> (not res!46679) (not e!37337))))

(assert (=> b!56089 (= res!46679 (invariant!0 (currentBit!3127 (_2!2656 lt!87949)) (currentByte!3132 (_2!2656 lt!87949)) (size!1178 (buf!1544 (_2!2656 lt!87949)))))))

(declare-fun b!56090 () Bool)

(declare-fun e!37338 () Bool)

(declare-fun lt!87974 () (_ BitVec 64))

(assert (=> b!56090 (= e!37338 (validate_offset_bits!1 ((_ sign_extend 32) (size!1178 (buf!1544 (_2!2656 lt!87387)))) ((_ sign_extend 32) (currentByte!3132 (_2!2656 lt!87387))) ((_ sign_extend 32) (currentBit!3127 (_2!2656 lt!87387))) lt!87974))))

(declare-fun c!4024 () Bool)

(declare-fun bm!720 () Bool)

(assert (=> bm!720 (= call!723 (reader!0 (ite c!4024 (_2!2656 lt!87975) (_2!2656 lt!87387)) (ite c!4024 (_2!2656 lt!87945) (_2!2656 lt!87387))))))

(declare-fun b!56092 () Bool)

(declare-fun res!46683 () Bool)

(assert (=> b!56092 (=> (not res!46683) (not e!37337))))

(assert (=> b!56092 (= res!46683 (= (size!1178 (buf!1544 (_2!2656 lt!87387))) (size!1178 (buf!1544 (_2!2656 lt!87949)))))))

(declare-fun b!56093 () Bool)

(declare-fun res!46681 () Bool)

(assert (=> b!56093 (=> (not res!46681) (not e!37337))))

(assert (=> b!56093 (= res!46681 (isPrefixOf!0 (_2!2656 lt!87387) (_2!2656 lt!87949)))))

(declare-fun b!56094 () Bool)

(declare-fun lt!87983 () tuple2!5092)

(assert (=> b!56094 (= e!37337 (= (bitStreamReadBitsIntoList!0 (_2!2656 lt!87949) (_1!2657 lt!87983) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2656 lt!87949) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!56094 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56094 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!87961 () Unit!3859)

(declare-fun lt!87955 () Unit!3859)

(assert (=> b!56094 (= lt!87961 lt!87955)))

(assert (=> b!56094 (validate_offset_bits!1 ((_ sign_extend 32) (size!1178 (buf!1544 (_2!2656 lt!87949)))) ((_ sign_extend 32) (currentByte!3132 (_2!2656 lt!87387))) ((_ sign_extend 32) (currentBit!3127 (_2!2656 lt!87387))) lt!87974)))

(assert (=> b!56094 (= lt!87955 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2656 lt!87387) (buf!1544 (_2!2656 lt!87949)) lt!87974))))

(assert (=> b!56094 e!37338))

(declare-fun res!46680 () Bool)

(assert (=> b!56094 (=> (not res!46680) (not e!37338))))

(assert (=> b!56094 (= res!46680 (and (= (size!1178 (buf!1544 (_2!2656 lt!87387))) (size!1178 (buf!1544 (_2!2656 lt!87949)))) (bvsge lt!87974 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56094 (= lt!87974 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!56094 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56094 (= lt!87983 (reader!0 (_2!2656 lt!87387) (_2!2656 lt!87949)))))

(declare-fun d!17866 () Bool)

(assert (=> d!17866 e!37337))

(declare-fun res!46684 () Bool)

(assert (=> d!17866 (=> (not res!46684) (not e!37337))))

(declare-fun lt!87952 () (_ BitVec 64))

(assert (=> d!17866 (= res!46684 (= (bitIndex!0 (size!1178 (buf!1544 (_2!2656 lt!87949))) (currentByte!3132 (_2!2656 lt!87949)) (currentBit!3127 (_2!2656 lt!87949))) (bvsub lt!87952 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!17866 (or (= (bvand lt!87952 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!87952 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!87952 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!87948 () (_ BitVec 64))

(assert (=> d!17866 (= lt!87952 (bvadd lt!87948 to!314))))

(assert (=> d!17866 (or (not (= (bvand lt!87948 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!87948 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!87948 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17866 (= lt!87948 (bitIndex!0 (size!1178 (buf!1544 (_2!2656 lt!87387))) (currentByte!3132 (_2!2656 lt!87387)) (currentBit!3127 (_2!2656 lt!87387))))))

(assert (=> d!17866 (= lt!87949 e!37336)))

(assert (=> d!17866 (= c!4024 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!87958 () Unit!3859)

(declare-fun lt!87979 () Unit!3859)

(assert (=> d!17866 (= lt!87958 lt!87979)))

(assert (=> d!17866 (isPrefixOf!0 (_2!2656 lt!87387) (_2!2656 lt!87387))))

(assert (=> d!17866 (= lt!87979 (lemmaIsPrefixRefl!0 (_2!2656 lt!87387)))))

(assert (=> d!17866 (= lt!87972 (bitIndex!0 (size!1178 (buf!1544 (_2!2656 lt!87387))) (currentByte!3132 (_2!2656 lt!87387)) (currentBit!3127 (_2!2656 lt!87387))))))

(assert (=> d!17866 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17866 (= (appendBitsMSBFirstLoop!0 (_2!2656 lt!87387) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!87949)))

(declare-fun b!56091 () Bool)

(declare-fun Unit!3886 () Unit!3859)

(assert (=> b!56091 (= e!37336 (tuple2!5091 Unit!3886 (_2!2656 lt!87387)))))

(assert (=> b!56091 (= (size!1178 (buf!1544 (_2!2656 lt!87387))) (size!1178 (buf!1544 (_2!2656 lt!87387))))))

(declare-fun lt!87947 () Unit!3859)

(declare-fun Unit!3887 () Unit!3859)

(assert (=> b!56091 (= lt!87947 Unit!3887)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2044 array!2590 array!2590 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5114 0))(
  ( (tuple2!5115 (_1!2668 array!2590) (_2!2668 BitStream!2044)) )
))
(declare-fun readBits!0 (BitStream!2044 (_ BitVec 64)) tuple2!5114)

(assert (=> b!56091 (checkByteArrayBitContent!0 (_2!2656 lt!87387) srcBuffer!2 (_1!2668 (readBits!0 (_1!2657 call!723) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (= (and d!17866 c!4024) b!56088))

(assert (= (and d!17866 (not c!4024)) b!56091))

(assert (= (or b!56088 b!56091) bm!720))

(assert (= (and d!17866 res!46684) b!56089))

(assert (= (and b!56089 res!46679) b!56092))

(assert (= (and b!56092 res!46683) b!56093))

(assert (= (and b!56093 res!46681) b!56087))

(assert (= (and b!56087 res!46682) b!56094))

(assert (= (and b!56094 res!46680) b!56090))

(declare-fun m!88293 () Bool)

(assert (=> b!56088 m!88293))

(declare-fun m!88295 () Bool)

(assert (=> b!56088 m!88295))

(declare-fun m!88297 () Bool)

(assert (=> b!56088 m!88297))

(assert (=> b!56088 m!88199))

(declare-fun m!88299 () Bool)

(assert (=> b!56088 m!88299))

(declare-fun m!88301 () Bool)

(assert (=> b!56088 m!88301))

(declare-fun m!88303 () Bool)

(assert (=> b!56088 m!88303))

(declare-fun m!88305 () Bool)

(assert (=> b!56088 m!88305))

(declare-fun m!88307 () Bool)

(assert (=> b!56088 m!88307))

(declare-fun m!88309 () Bool)

(assert (=> b!56088 m!88309))

(assert (=> b!56088 m!88299))

(declare-fun m!88311 () Bool)

(assert (=> b!56088 m!88311))

(declare-fun m!88313 () Bool)

(assert (=> b!56088 m!88313))

(declare-fun m!88315 () Bool)

(assert (=> b!56088 m!88315))

(declare-fun m!88317 () Bool)

(assert (=> b!56088 m!88317))

(declare-fun m!88319 () Bool)

(assert (=> b!56088 m!88319))

(declare-fun m!88321 () Bool)

(assert (=> b!56088 m!88321))

(declare-fun m!88323 () Bool)

(assert (=> b!56088 m!88323))

(declare-fun m!88325 () Bool)

(assert (=> b!56088 m!88325))

(declare-fun m!88327 () Bool)

(assert (=> b!56088 m!88327))

(declare-fun m!88329 () Bool)

(assert (=> b!56088 m!88329))

(declare-fun m!88331 () Bool)

(assert (=> b!56088 m!88331))

(declare-fun m!88333 () Bool)

(assert (=> b!56088 m!88333))

(assert (=> b!56088 m!88305))

(declare-fun m!88335 () Bool)

(assert (=> b!56088 m!88335))

(declare-fun m!88337 () Bool)

(assert (=> b!56088 m!88337))

(declare-fun m!88339 () Bool)

(assert (=> b!56088 m!88339))

(declare-fun m!88341 () Bool)

(assert (=> b!56088 m!88341))

(declare-fun m!88343 () Bool)

(assert (=> b!56088 m!88343))

(assert (=> b!56088 m!88335))

(declare-fun m!88345 () Bool)

(assert (=> b!56088 m!88345))

(declare-fun m!88347 () Bool)

(assert (=> b!56088 m!88347))

(declare-fun m!88349 () Bool)

(assert (=> b!56088 m!88349))

(declare-fun m!88351 () Bool)

(assert (=> b!56088 m!88351))

(assert (=> b!56088 m!88315))

(declare-fun m!88353 () Bool)

(assert (=> b!56088 m!88353))

(declare-fun m!88355 () Bool)

(assert (=> b!56091 m!88355))

(declare-fun m!88357 () Bool)

(assert (=> b!56091 m!88357))

(declare-fun m!88359 () Bool)

(assert (=> b!56093 m!88359))

(declare-fun m!88361 () Bool)

(assert (=> b!56089 m!88361))

(declare-fun m!88363 () Bool)

(assert (=> b!56094 m!88363))

(declare-fun m!88365 () Bool)

(assert (=> b!56094 m!88365))

(declare-fun m!88367 () Bool)

(assert (=> b!56094 m!88367))

(declare-fun m!88369 () Bool)

(assert (=> b!56094 m!88369))

(declare-fun m!88371 () Bool)

(assert (=> b!56094 m!88371))

(declare-fun m!88373 () Bool)

(assert (=> d!17866 m!88373))

(assert (=> d!17866 m!88199))

(assert (=> d!17866 m!88243))

(assert (=> d!17866 m!88241))

(declare-fun m!88375 () Bool)

(assert (=> bm!720 m!88375))

(declare-fun m!88377 () Bool)

(assert (=> b!56090 m!88377))

(assert (=> b!55838 d!17866))

(declare-fun d!17884 () Bool)

(assert (=> d!17884 (validate_offset_bits!1 ((_ sign_extend 32) (size!1178 (buf!1544 (_2!2656 lt!87387)))) ((_ sign_extend 32) (currentByte!3132 thiss!1379)) ((_ sign_extend 32) (currentBit!3127 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!88047 () Unit!3859)

(declare-fun choose!9 (BitStream!2044 array!2590 (_ BitVec 64) BitStream!2044) Unit!3859)

(assert (=> d!17884 (= lt!88047 (choose!9 thiss!1379 (buf!1544 (_2!2656 lt!87387)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2045 (buf!1544 (_2!2656 lt!87387)) (currentByte!3132 thiss!1379) (currentBit!3127 thiss!1379))))))

(assert (=> d!17884 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1544 (_2!2656 lt!87387)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!88047)))

(declare-fun bs!4483 () Bool)

(assert (= bs!4483 d!17884))

(assert (=> bs!4483 m!87989))

(declare-fun m!88379 () Bool)

(assert (=> bs!4483 m!88379))

(assert (=> b!55838 d!17884))

(declare-fun d!17886 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!17886 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1178 (buf!1544 (_2!2656 lt!87387)))) ((_ sign_extend 32) (currentByte!3132 thiss!1379)) ((_ sign_extend 32) (currentBit!3127 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1178 (buf!1544 (_2!2656 lt!87387)))) ((_ sign_extend 32) (currentByte!3132 thiss!1379)) ((_ sign_extend 32) (currentBit!3127 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4484 () Bool)

(assert (= bs!4484 d!17886))

(declare-fun m!88381 () Bool)

(assert (=> bs!4484 m!88381))

(assert (=> b!55838 d!17886))

(declare-fun d!17888 () Bool)

(declare-fun res!46711 () Bool)

(declare-fun e!37348 () Bool)

(assert (=> d!17888 (=> (not res!46711) (not e!37348))))

(assert (=> d!17888 (= res!46711 (= (size!1178 (buf!1544 thiss!1379)) (size!1178 (buf!1544 (_2!2656 lt!87394)))))))

(assert (=> d!17888 (= (isPrefixOf!0 thiss!1379 (_2!2656 lt!87394)) e!37348)))

(declare-fun b!56119 () Bool)

(declare-fun res!46709 () Bool)

(assert (=> b!56119 (=> (not res!46709) (not e!37348))))

(assert (=> b!56119 (= res!46709 (bvsle (bitIndex!0 (size!1178 (buf!1544 thiss!1379)) (currentByte!3132 thiss!1379) (currentBit!3127 thiss!1379)) (bitIndex!0 (size!1178 (buf!1544 (_2!2656 lt!87394))) (currentByte!3132 (_2!2656 lt!87394)) (currentBit!3127 (_2!2656 lt!87394)))))))

(declare-fun b!56120 () Bool)

(declare-fun e!37347 () Bool)

(assert (=> b!56120 (= e!37348 e!37347)))

(declare-fun res!46710 () Bool)

(assert (=> b!56120 (=> res!46710 e!37347)))

(assert (=> b!56120 (= res!46710 (= (size!1178 (buf!1544 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!56121 () Bool)

(assert (=> b!56121 (= e!37347 (arrayBitRangesEq!0 (buf!1544 thiss!1379) (buf!1544 (_2!2656 lt!87394)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1178 (buf!1544 thiss!1379)) (currentByte!3132 thiss!1379) (currentBit!3127 thiss!1379))))))

(assert (= (and d!17888 res!46711) b!56119))

(assert (= (and b!56119 res!46709) b!56120))

(assert (= (and b!56120 (not res!46710)) b!56121))

(assert (=> b!56119 m!87985))

(assert (=> b!56119 m!87979))

(assert (=> b!56121 m!87985))

(assert (=> b!56121 m!87985))

(declare-fun m!88383 () Bool)

(assert (=> b!56121 m!88383))

(assert (=> b!55838 d!17888))

(declare-fun d!17890 () Bool)

(assert (=> d!17890 (= (invariant!0 (currentBit!3127 (_2!2656 lt!87394)) (currentByte!3132 (_2!2656 lt!87394)) (size!1178 (buf!1544 (_2!2656 lt!87394)))) (and (bvsge (currentBit!3127 (_2!2656 lt!87394)) #b00000000000000000000000000000000) (bvslt (currentBit!3127 (_2!2656 lt!87394)) #b00000000000000000000000000001000) (bvsge (currentByte!3132 (_2!2656 lt!87394)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3132 (_2!2656 lt!87394)) (size!1178 (buf!1544 (_2!2656 lt!87394)))) (and (= (currentBit!3127 (_2!2656 lt!87394)) #b00000000000000000000000000000000) (= (currentByte!3132 (_2!2656 lt!87394)) (size!1178 (buf!1544 (_2!2656 lt!87394))))))))))

(assert (=> b!55839 d!17890))

(declare-fun d!17892 () Bool)

(declare-fun res!46714 () Bool)

(declare-fun e!37350 () Bool)

(assert (=> d!17892 (=> (not res!46714) (not e!37350))))

(assert (=> d!17892 (= res!46714 (= (size!1178 (buf!1544 thiss!1379)) (size!1178 (buf!1544 (_2!2656 lt!87387)))))))

(assert (=> d!17892 (= (isPrefixOf!0 thiss!1379 (_2!2656 lt!87387)) e!37350)))

(declare-fun b!56122 () Bool)

(declare-fun res!46712 () Bool)

(assert (=> b!56122 (=> (not res!46712) (not e!37350))))

(assert (=> b!56122 (= res!46712 (bvsle (bitIndex!0 (size!1178 (buf!1544 thiss!1379)) (currentByte!3132 thiss!1379) (currentBit!3127 thiss!1379)) (bitIndex!0 (size!1178 (buf!1544 (_2!2656 lt!87387))) (currentByte!3132 (_2!2656 lt!87387)) (currentBit!3127 (_2!2656 lt!87387)))))))

(declare-fun b!56123 () Bool)

(declare-fun e!37349 () Bool)

(assert (=> b!56123 (= e!37350 e!37349)))

(declare-fun res!46713 () Bool)

(assert (=> b!56123 (=> res!46713 e!37349)))

(assert (=> b!56123 (= res!46713 (= (size!1178 (buf!1544 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!56124 () Bool)

(assert (=> b!56124 (= e!37349 (arrayBitRangesEq!0 (buf!1544 thiss!1379) (buf!1544 (_2!2656 lt!87387)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1178 (buf!1544 thiss!1379)) (currentByte!3132 thiss!1379) (currentBit!3127 thiss!1379))))))

(assert (= (and d!17892 res!46714) b!56122))

(assert (= (and b!56122 res!46712) b!56123))

(assert (= (and b!56123 (not res!46713)) b!56124))

(assert (=> b!56122 m!87985))

(assert (=> b!56122 m!88199))

(assert (=> b!56124 m!87985))

(assert (=> b!56124 m!87985))

(declare-fun m!88385 () Bool)

(assert (=> b!56124 m!88385))

(assert (=> b!55834 d!17892))

(declare-fun d!17894 () Bool)

(assert (=> d!17894 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1178 (buf!1544 (_2!2656 lt!87387)))) ((_ sign_extend 32) (currentByte!3132 (_2!2656 lt!87387))) ((_ sign_extend 32) (currentBit!3127 (_2!2656 lt!87387))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1178 (buf!1544 (_2!2656 lt!87387)))) ((_ sign_extend 32) (currentByte!3132 (_2!2656 lt!87387))) ((_ sign_extend 32) (currentBit!3127 (_2!2656 lt!87387)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4485 () Bool)

(assert (= bs!4485 d!17894))

(declare-fun m!88387 () Bool)

(assert (=> bs!4485 m!88387))

(assert (=> b!55834 d!17894))

(declare-fun d!17896 () Bool)

(declare-fun e!37356 () Bool)

(assert (=> d!17896 e!37356))

(declare-fun res!46723 () Bool)

(assert (=> d!17896 (=> (not res!46723) (not e!37356))))

(assert (=> d!17896 (= res!46723 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!88094 () Unit!3859)

(declare-fun choose!27 (BitStream!2044 BitStream!2044 (_ BitVec 64) (_ BitVec 64)) Unit!3859)

(assert (=> d!17896 (= lt!88094 (choose!27 thiss!1379 (_2!2656 lt!87387) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!17896 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!17896 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2656 lt!87387) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!88094)))

(declare-fun b!56135 () Bool)

(assert (=> b!56135 (= e!37356 (validate_offset_bits!1 ((_ sign_extend 32) (size!1178 (buf!1544 (_2!2656 lt!87387)))) ((_ sign_extend 32) (currentByte!3132 (_2!2656 lt!87387))) ((_ sign_extend 32) (currentBit!3127 (_2!2656 lt!87387))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!17896 res!46723) b!56135))

(declare-fun m!88389 () Bool)

(assert (=> d!17896 m!88389))

(assert (=> b!56135 m!88009))

(assert (=> b!55834 d!17896))

(declare-fun b!56197 () Bool)

(declare-fun e!37385 () Bool)

(declare-datatypes ((tuple2!5116 0))(
  ( (tuple2!5117 (_1!2669 BitStream!2044) (_2!2669 Bool)) )
))
(declare-fun lt!88234 () tuple2!5116)

(declare-fun lt!88232 () tuple2!5090)

(assert (=> b!56197 (= e!37385 (= (bitIndex!0 (size!1178 (buf!1544 (_1!2669 lt!88234))) (currentByte!3132 (_1!2669 lt!88234)) (currentBit!3127 (_1!2669 lt!88234))) (bitIndex!0 (size!1178 (buf!1544 (_2!2656 lt!88232))) (currentByte!3132 (_2!2656 lt!88232)) (currentBit!3127 (_2!2656 lt!88232)))))))

(declare-fun b!56198 () Bool)

(declare-fun res!46764 () Bool)

(declare-fun e!37386 () Bool)

(assert (=> b!56198 (=> (not res!46764) (not e!37386))))

(assert (=> b!56198 (= res!46764 (isPrefixOf!0 thiss!1379 (_2!2656 lt!88232)))))

(declare-fun b!56199 () Bool)

(declare-fun res!46763 () Bool)

(declare-fun e!37387 () Bool)

(assert (=> b!56199 (=> (not res!46763) (not e!37387))))

(declare-fun lt!88238 () tuple2!5090)

(declare-fun lt!88243 () (_ BitVec 64))

(declare-fun lt!88236 () (_ BitVec 64))

(assert (=> b!56199 (= res!46763 (= (bitIndex!0 (size!1178 (buf!1544 (_2!2656 lt!88238))) (currentByte!3132 (_2!2656 lt!88238)) (currentBit!3127 (_2!2656 lt!88238))) (bvadd lt!88243 lt!88236)))))

(assert (=> b!56199 (or (not (= (bvand lt!88243 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!88236 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!88243 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!88243 lt!88236) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56199 (= lt!88236 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!56199 (= lt!88243 (bitIndex!0 (size!1178 (buf!1544 thiss!1379)) (currentByte!3132 thiss!1379) (currentBit!3127 thiss!1379)))))

(declare-fun b!56200 () Bool)

(declare-fun res!46765 () Bool)

(assert (=> b!56200 (=> (not res!46765) (not e!37386))))

(assert (=> b!56200 (= res!46765 (= (bitIndex!0 (size!1178 (buf!1544 (_2!2656 lt!88232))) (currentByte!3132 (_2!2656 lt!88232)) (currentBit!3127 (_2!2656 lt!88232))) (bvadd (bitIndex!0 (size!1178 (buf!1544 thiss!1379)) (currentByte!3132 thiss!1379) (currentBit!3127 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!56201 () Bool)

(declare-fun e!37388 () Bool)

(declare-fun lt!88233 () tuple2!5116)

(assert (=> b!56201 (= e!37388 (= (bitIndex!0 (size!1178 (buf!1544 (_1!2669 lt!88233))) (currentByte!3132 (_1!2669 lt!88233)) (currentBit!3127 (_1!2669 lt!88233))) (bitIndex!0 (size!1178 (buf!1544 (_2!2656 lt!88238))) (currentByte!3132 (_2!2656 lt!88238)) (currentBit!3127 (_2!2656 lt!88238)))))))

(declare-fun b!56202 () Bool)

(assert (=> b!56202 (= e!37387 e!37388)))

(declare-fun res!46761 () Bool)

(assert (=> b!56202 (=> (not res!46761) (not e!37388))))

(declare-fun lt!88242 () (_ BitVec 8))

(assert (=> b!56202 (= res!46761 (and (= (_2!2669 lt!88233) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1727 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!88242)) #b00000000000000000000000000000000))) (= (_1!2669 lt!88233) (_2!2656 lt!88238))))))

(declare-fun lt!88241 () tuple2!5114)

(declare-fun lt!88237 () BitStream!2044)

(assert (=> b!56202 (= lt!88241 (readBits!0 lt!88237 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2044) tuple2!5116)

(assert (=> b!56202 (= lt!88233 (readBitPure!0 lt!88237))))

(declare-fun readerFrom!0 (BitStream!2044 (_ BitVec 32) (_ BitVec 32)) BitStream!2044)

(assert (=> b!56202 (= lt!88237 (readerFrom!0 (_2!2656 lt!88238) (currentBit!3127 thiss!1379) (currentByte!3132 thiss!1379)))))

(declare-fun d!17898 () Bool)

(assert (=> d!17898 e!37387))

(declare-fun res!46758 () Bool)

(assert (=> d!17898 (=> (not res!46758) (not e!37387))))

(assert (=> d!17898 (= res!46758 (= (size!1178 (buf!1544 (_2!2656 lt!88238))) (size!1178 (buf!1544 thiss!1379))))))

(declare-fun lt!88235 () array!2590)

(assert (=> d!17898 (= lt!88242 (select (arr!1727 lt!88235) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!17898 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1178 lt!88235)))))

(assert (=> d!17898 (= lt!88235 (array!2591 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!88240 () tuple2!5090)

(assert (=> d!17898 (= lt!88238 (tuple2!5091 (_1!2656 lt!88240) (_2!2656 lt!88240)))))

(assert (=> d!17898 (= lt!88240 lt!88232)))

(assert (=> d!17898 e!37386))

(declare-fun res!46762 () Bool)

(assert (=> d!17898 (=> (not res!46762) (not e!37386))))

(assert (=> d!17898 (= res!46762 (= (size!1178 (buf!1544 thiss!1379)) (size!1178 (buf!1544 (_2!2656 lt!88232)))))))

(declare-fun lt!88239 () Bool)

(declare-fun appendBit!0 (BitStream!2044 Bool) tuple2!5090)

(assert (=> d!17898 (= lt!88232 (appendBit!0 thiss!1379 lt!88239))))

(assert (=> d!17898 (= lt!88239 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1727 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!17898 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!17898 (= (appendBitFromByte!0 thiss!1379 (select (arr!1727 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!88238)))

(declare-fun b!56203 () Bool)

(declare-fun res!46759 () Bool)

(assert (=> b!56203 (=> (not res!46759) (not e!37387))))

(assert (=> b!56203 (= res!46759 (isPrefixOf!0 thiss!1379 (_2!2656 lt!88238)))))

(declare-fun b!56204 () Bool)

(assert (=> b!56204 (= e!37386 e!37385)))

(declare-fun res!46760 () Bool)

(assert (=> b!56204 (=> (not res!46760) (not e!37385))))

(assert (=> b!56204 (= res!46760 (and (= (_2!2669 lt!88234) lt!88239) (= (_1!2669 lt!88234) (_2!2656 lt!88232))))))

(assert (=> b!56204 (= lt!88234 (readBitPure!0 (readerFrom!0 (_2!2656 lt!88232) (currentBit!3127 thiss!1379) (currentByte!3132 thiss!1379))))))

(assert (= (and d!17898 res!46762) b!56200))

(assert (= (and b!56200 res!46765) b!56198))

(assert (= (and b!56198 res!46764) b!56204))

(assert (= (and b!56204 res!46760) b!56197))

(assert (= (and d!17898 res!46758) b!56199))

(assert (= (and b!56199 res!46763) b!56203))

(assert (= (and b!56203 res!46759) b!56202))

(assert (= (and b!56202 res!46761) b!56201))

(declare-fun m!88603 () Bool)

(assert (=> b!56199 m!88603))

(assert (=> b!56199 m!87985))

(declare-fun m!88605 () Bool)

(assert (=> b!56201 m!88605))

(assert (=> b!56201 m!88603))

(declare-fun m!88607 () Bool)

(assert (=> d!17898 m!88607))

(declare-fun m!88609 () Bool)

(assert (=> d!17898 m!88609))

(declare-fun m!88611 () Bool)

(assert (=> d!17898 m!88611))

(declare-fun m!88613 () Bool)

(assert (=> b!56198 m!88613))

(declare-fun m!88615 () Bool)

(assert (=> b!56200 m!88615))

(assert (=> b!56200 m!87985))

(declare-fun m!88617 () Bool)

(assert (=> b!56202 m!88617))

(declare-fun m!88619 () Bool)

(assert (=> b!56202 m!88619))

(declare-fun m!88621 () Bool)

(assert (=> b!56202 m!88621))

(declare-fun m!88623 () Bool)

(assert (=> b!56203 m!88623))

(declare-fun m!88625 () Bool)

(assert (=> b!56204 m!88625))

(assert (=> b!56204 m!88625))

(declare-fun m!88627 () Bool)

(assert (=> b!56204 m!88627))

(declare-fun m!88629 () Bool)

(assert (=> b!56197 m!88629))

(assert (=> b!56197 m!88615))

(assert (=> b!55834 d!17898))

(declare-fun d!17916 () Bool)

(assert (=> d!17916 (= (array_inv!1081 srcBuffer!2) (bvsge (size!1178 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!11268 d!17916))

(declare-fun d!17918 () Bool)

(assert (=> d!17918 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3127 thiss!1379) (currentByte!3132 thiss!1379) (size!1178 (buf!1544 thiss!1379))))))

(declare-fun bs!4487 () Bool)

(assert (= bs!4487 d!17918))

(declare-fun m!88631 () Bool)

(assert (=> bs!4487 m!88631))

(assert (=> start!11268 d!17918))

(declare-fun d!17920 () Bool)

(assert (=> d!17920 (= (array_inv!1081 (buf!1544 thiss!1379)) (bvsge (size!1178 (buf!1544 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!55840 d!17920))

(declare-fun d!17922 () Bool)

(assert (=> d!17922 (= (head!416 (byteArrayBitContentToList!0 (_2!2656 lt!87387) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!712 (byteArrayBitContentToList!0 (_2!2656 lt!87387) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!55831 d!17922))

(declare-fun d!17924 () Bool)

(declare-fun c!4041 () Bool)

(assert (=> d!17924 (= c!4041 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!37391 () List!597)

(assert (=> d!17924 (= (byteArrayBitContentToList!0 (_2!2656 lt!87387) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!37391)))

(declare-fun b!56209 () Bool)

(assert (=> b!56209 (= e!37391 Nil!594)))

(declare-fun b!56210 () Bool)

(assert (=> b!56210 (= e!37391 (Cons!593 (not (= (bvand ((_ sign_extend 24) (select (arr!1727 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2656 lt!87387) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!17924 c!4041) b!56209))

(assert (= (and d!17924 (not c!4041)) b!56210))

(assert (=> b!56210 m!88003))

(assert (=> b!56210 m!88611))

(declare-fun m!88633 () Bool)

(assert (=> b!56210 m!88633))

(assert (=> b!55831 d!17924))

(declare-fun d!17926 () Bool)

(assert (=> d!17926 (= (head!416 (bitStreamReadBitsIntoList!0 (_2!2656 lt!87387) (_1!2657 lt!87386) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!712 (bitStreamReadBitsIntoList!0 (_2!2656 lt!87387) (_1!2657 lt!87386) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!55831 d!17926))

(declare-fun b!56220 () Bool)

(declare-datatypes ((tuple2!5118 0))(
  ( (tuple2!5119 (_1!2670 Bool) (_2!2670 BitStream!2044)) )
))
(declare-fun lt!88251 () tuple2!5118)

(declare-fun lt!88250 () (_ BitVec 64))

(declare-datatypes ((tuple2!5120 0))(
  ( (tuple2!5121 (_1!2671 List!597) (_2!2671 BitStream!2044)) )
))
(declare-fun e!37396 () tuple2!5120)

(assert (=> b!56220 (= e!37396 (tuple2!5121 (Cons!593 (_1!2670 lt!88251) (bitStreamReadBitsIntoList!0 (_2!2656 lt!87387) (_2!2670 lt!88251) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!88250))) (_2!2670 lt!88251)))))

(declare-fun readBit!0 (BitStream!2044) tuple2!5118)

(assert (=> b!56220 (= lt!88251 (readBit!0 (_1!2657 lt!87386)))))

(assert (=> b!56220 (= lt!88250 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!17928 () Bool)

(declare-fun e!37397 () Bool)

(assert (=> d!17928 e!37397))

(declare-fun c!4047 () Bool)

(assert (=> d!17928 (= c!4047 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!88252 () List!597)

(assert (=> d!17928 (= lt!88252 (_1!2671 e!37396))))

(declare-fun c!4046 () Bool)

(assert (=> d!17928 (= c!4046 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17928 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17928 (= (bitStreamReadBitsIntoList!0 (_2!2656 lt!87387) (_1!2657 lt!87386) #b0000000000000000000000000000000000000000000000000000000000000001) lt!88252)))

(declare-fun b!56222 () Bool)

(declare-fun length!280 (List!597) Int)

(assert (=> b!56222 (= e!37397 (> (length!280 lt!88252) 0))))

(declare-fun b!56219 () Bool)

(assert (=> b!56219 (= e!37396 (tuple2!5121 Nil!594 (_1!2657 lt!87386)))))

(declare-fun b!56221 () Bool)

(declare-fun isEmpty!166 (List!597) Bool)

(assert (=> b!56221 (= e!37397 (isEmpty!166 lt!88252))))

(assert (= (and d!17928 c!4046) b!56219))

(assert (= (and d!17928 (not c!4046)) b!56220))

(assert (= (and d!17928 c!4047) b!56221))

(assert (= (and d!17928 (not c!4047)) b!56222))

(declare-fun m!88635 () Bool)

(assert (=> b!56220 m!88635))

(declare-fun m!88637 () Bool)

(assert (=> b!56220 m!88637))

(declare-fun m!88639 () Bool)

(assert (=> b!56222 m!88639))

(declare-fun m!88641 () Bool)

(assert (=> b!56221 m!88641))

(assert (=> b!55831 d!17928))

(declare-fun d!17930 () Bool)

(assert (=> d!17930 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1178 (buf!1544 thiss!1379))) ((_ sign_extend 32) (currentByte!3132 thiss!1379)) ((_ sign_extend 32) (currentBit!3127 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1178 (buf!1544 thiss!1379))) ((_ sign_extend 32) (currentByte!3132 thiss!1379)) ((_ sign_extend 32) (currentBit!3127 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4488 () Bool)

(assert (= bs!4488 d!17930))

(declare-fun m!88643 () Bool)

(assert (=> bs!4488 m!88643))

(assert (=> b!55836 d!17930))

(declare-fun d!17932 () Bool)

(declare-fun e!37400 () Bool)

(assert (=> d!17932 e!37400))

(declare-fun res!46771 () Bool)

(assert (=> d!17932 (=> (not res!46771) (not e!37400))))

(declare-fun lt!88266 () (_ BitVec 64))

(declare-fun lt!88270 () (_ BitVec 64))

(declare-fun lt!88267 () (_ BitVec 64))

(assert (=> d!17932 (= res!46771 (= lt!88267 (bvsub lt!88270 lt!88266)))))

(assert (=> d!17932 (or (= (bvand lt!88270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!88266 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!88270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!88270 lt!88266) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17932 (= lt!88266 (remainingBits!0 ((_ sign_extend 32) (size!1178 (buf!1544 (_2!2656 lt!87394)))) ((_ sign_extend 32) (currentByte!3132 (_2!2656 lt!87394))) ((_ sign_extend 32) (currentBit!3127 (_2!2656 lt!87394)))))))

(declare-fun lt!88269 () (_ BitVec 64))

(declare-fun lt!88265 () (_ BitVec 64))

(assert (=> d!17932 (= lt!88270 (bvmul lt!88269 lt!88265))))

(assert (=> d!17932 (or (= lt!88269 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!88265 (bvsdiv (bvmul lt!88269 lt!88265) lt!88269)))))

(assert (=> d!17932 (= lt!88265 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17932 (= lt!88269 ((_ sign_extend 32) (size!1178 (buf!1544 (_2!2656 lt!87394)))))))

(assert (=> d!17932 (= lt!88267 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3132 (_2!2656 lt!87394))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3127 (_2!2656 lt!87394)))))))

(assert (=> d!17932 (invariant!0 (currentBit!3127 (_2!2656 lt!87394)) (currentByte!3132 (_2!2656 lt!87394)) (size!1178 (buf!1544 (_2!2656 lt!87394))))))

(assert (=> d!17932 (= (bitIndex!0 (size!1178 (buf!1544 (_2!2656 lt!87394))) (currentByte!3132 (_2!2656 lt!87394)) (currentBit!3127 (_2!2656 lt!87394))) lt!88267)))

(declare-fun b!56227 () Bool)

(declare-fun res!46770 () Bool)

(assert (=> b!56227 (=> (not res!46770) (not e!37400))))

(assert (=> b!56227 (= res!46770 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!88267))))

(declare-fun b!56228 () Bool)

(declare-fun lt!88268 () (_ BitVec 64))

(assert (=> b!56228 (= e!37400 (bvsle lt!88267 (bvmul lt!88268 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!56228 (or (= lt!88268 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!88268 #b0000000000000000000000000000000000000000000000000000000000001000) lt!88268)))))

(assert (=> b!56228 (= lt!88268 ((_ sign_extend 32) (size!1178 (buf!1544 (_2!2656 lt!87394)))))))

(assert (= (and d!17932 res!46771) b!56227))

(assert (= (and b!56227 res!46770) b!56228))

(declare-fun m!88645 () Bool)

(assert (=> d!17932 m!88645))

(assert (=> d!17932 m!88013))

(assert (=> b!55837 d!17932))

(declare-fun d!17934 () Bool)

(declare-fun res!46774 () Bool)

(declare-fun e!37402 () Bool)

(assert (=> d!17934 (=> (not res!46774) (not e!37402))))

(assert (=> d!17934 (= res!46774 (= (size!1178 (buf!1544 thiss!1379)) (size!1178 (buf!1544 thiss!1379))))))

(assert (=> d!17934 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!37402)))

(declare-fun b!56229 () Bool)

(declare-fun res!46772 () Bool)

(assert (=> b!56229 (=> (not res!46772) (not e!37402))))

(assert (=> b!56229 (= res!46772 (bvsle (bitIndex!0 (size!1178 (buf!1544 thiss!1379)) (currentByte!3132 thiss!1379) (currentBit!3127 thiss!1379)) (bitIndex!0 (size!1178 (buf!1544 thiss!1379)) (currentByte!3132 thiss!1379) (currentBit!3127 thiss!1379))))))

(declare-fun b!56230 () Bool)

(declare-fun e!37401 () Bool)

(assert (=> b!56230 (= e!37402 e!37401)))

(declare-fun res!46773 () Bool)

(assert (=> b!56230 (=> res!46773 e!37401)))

(assert (=> b!56230 (= res!46773 (= (size!1178 (buf!1544 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!56231 () Bool)

(assert (=> b!56231 (= e!37401 (arrayBitRangesEq!0 (buf!1544 thiss!1379) (buf!1544 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1178 (buf!1544 thiss!1379)) (currentByte!3132 thiss!1379) (currentBit!3127 thiss!1379))))))

(assert (= (and d!17934 res!46774) b!56229))

(assert (= (and b!56229 res!46772) b!56230))

(assert (= (and b!56230 (not res!46773)) b!56231))

(assert (=> b!56229 m!87985))

(assert (=> b!56229 m!87985))

(assert (=> b!56231 m!87985))

(assert (=> b!56231 m!87985))

(declare-fun m!88647 () Bool)

(assert (=> b!56231 m!88647))

(assert (=> b!55832 d!17934))

(declare-fun d!17936 () Bool)

(assert (=> d!17936 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!88273 () Unit!3859)

(declare-fun choose!11 (BitStream!2044) Unit!3859)

(assert (=> d!17936 (= lt!88273 (choose!11 thiss!1379))))

(assert (=> d!17936 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!88273)))

(declare-fun bs!4490 () Bool)

(assert (= bs!4490 d!17936))

(assert (=> bs!4490 m!87981))

(declare-fun m!88649 () Bool)

(assert (=> bs!4490 m!88649))

(assert (=> b!55832 d!17936))

(declare-fun d!17938 () Bool)

(declare-fun e!37403 () Bool)

(assert (=> d!17938 e!37403))

(declare-fun res!46776 () Bool)

(assert (=> d!17938 (=> (not res!46776) (not e!37403))))

(declare-fun lt!88275 () (_ BitVec 64))

(declare-fun lt!88279 () (_ BitVec 64))

(declare-fun lt!88276 () (_ BitVec 64))

(assert (=> d!17938 (= res!46776 (= lt!88276 (bvsub lt!88279 lt!88275)))))

(assert (=> d!17938 (or (= (bvand lt!88279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!88275 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!88279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!88279 lt!88275) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17938 (= lt!88275 (remainingBits!0 ((_ sign_extend 32) (size!1178 (buf!1544 thiss!1379))) ((_ sign_extend 32) (currentByte!3132 thiss!1379)) ((_ sign_extend 32) (currentBit!3127 thiss!1379))))))

(declare-fun lt!88278 () (_ BitVec 64))

(declare-fun lt!88274 () (_ BitVec 64))

(assert (=> d!17938 (= lt!88279 (bvmul lt!88278 lt!88274))))

(assert (=> d!17938 (or (= lt!88278 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!88274 (bvsdiv (bvmul lt!88278 lt!88274) lt!88278)))))

(assert (=> d!17938 (= lt!88274 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17938 (= lt!88278 ((_ sign_extend 32) (size!1178 (buf!1544 thiss!1379))))))

(assert (=> d!17938 (= lt!88276 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3132 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3127 thiss!1379))))))

(assert (=> d!17938 (invariant!0 (currentBit!3127 thiss!1379) (currentByte!3132 thiss!1379) (size!1178 (buf!1544 thiss!1379)))))

(assert (=> d!17938 (= (bitIndex!0 (size!1178 (buf!1544 thiss!1379)) (currentByte!3132 thiss!1379) (currentBit!3127 thiss!1379)) lt!88276)))

(declare-fun b!56232 () Bool)

(declare-fun res!46775 () Bool)

(assert (=> b!56232 (=> (not res!46775) (not e!37403))))

(assert (=> b!56232 (= res!46775 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!88276))))

(declare-fun b!56233 () Bool)

(declare-fun lt!88277 () (_ BitVec 64))

(assert (=> b!56233 (= e!37403 (bvsle lt!88276 (bvmul lt!88277 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!56233 (or (= lt!88277 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!88277 #b0000000000000000000000000000000000000000000000000000000000001000) lt!88277)))))

(assert (=> b!56233 (= lt!88277 ((_ sign_extend 32) (size!1178 (buf!1544 thiss!1379))))))

(assert (= (and d!17938 res!46776) b!56232))

(assert (= (and b!56232 res!46775) b!56233))

(assert (=> d!17938 m!88643))

(assert (=> d!17938 m!88631))

(assert (=> b!55832 d!17938))

(push 1)

(assert (not d!17858))

(assert (not b!56000))

(assert (not b!56210))

(assert (not d!17918))

(assert (not b!56231))

(assert (not b!56229))

(assert (not b!56201))

(assert (not d!17898))

(assert (not b!56199))

(assert (not b!56049))

(assert (not b!56121))

(assert (not d!17936))

(assert (not b!56202))

(assert (not d!17896))

(assert (not b!56119))

(assert (not b!56200))

(assert (not b!56204))

(assert (not b!56093))

(assert (not b!56002))

(assert (not b!56089))

(assert (not b!56198))

(assert (not b!56124))

(assert (not d!17932))

(assert (not b!56135))

(assert (not d!17930))

(assert (not b!56197))

(assert (not b!56091))

(assert (not d!17886))

(assert (not d!17866))

(assert (not d!17938))

(assert (not b!56222))

(assert (not b!56122))

(assert (not bm!720))

(assert (not d!17862))

(assert (not b!56220))

(assert (not b!56048))

(assert (not b!56045))

(assert (not d!17884))

(assert (not b!56090))

(assert (not b!56094))

(assert (not b!56203))

(assert (not b!56046))

(assert (not b!56088))

(assert (not b!56221))

(assert (not d!17894))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

