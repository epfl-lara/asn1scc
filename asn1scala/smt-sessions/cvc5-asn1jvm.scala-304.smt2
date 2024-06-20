; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5996 () Bool)

(assert start!5996)

(declare-fun b!27768 () Bool)

(declare-fun e!18746 () Bool)

(declare-fun e!18743 () Bool)

(assert (=> b!27768 (= e!18746 e!18743)))

(declare-fun res!24065 () Bool)

(assert (=> b!27768 (=> res!24065 e!18743)))

(declare-datatypes ((array!1733 0))(
  ( (array!1734 (arr!1211 (Array (_ BitVec 32) (_ BitVec 8))) (size!749 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1330 0))(
  ( (BitStream!1331 (buf!1076 array!1733) (currentByte!2401 (_ BitVec 32)) (currentBit!2396 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2201 0))(
  ( (Unit!2202) )
))
(declare-datatypes ((tuple2!3026 0))(
  ( (tuple2!3027 (_1!1600 Unit!2201) (_2!1600 BitStream!1330)) )
))
(declare-fun lt!39294 () tuple2!3026)

(declare-fun lt!39283 () tuple2!3026)

(assert (=> b!27768 (= res!24065 (not (= (size!749 (buf!1076 (_2!1600 lt!39294))) (size!749 (buf!1076 (_2!1600 lt!39283))))))))

(declare-fun e!18748 () Bool)

(assert (=> b!27768 e!18748))

(declare-fun res!24056 () Bool)

(assert (=> b!27768 (=> (not res!24056) (not e!18748))))

(declare-fun thiss!1379 () BitStream!1330)

(assert (=> b!27768 (= res!24056 (= (size!749 (buf!1076 (_2!1600 lt!39283))) (size!749 (buf!1076 thiss!1379))))))

(declare-fun b!27769 () Bool)

(declare-fun e!18737 () Bool)

(declare-fun e!18738 () Bool)

(assert (=> b!27769 (= e!18737 e!18738)))

(declare-fun res!24051 () Bool)

(assert (=> b!27769 (=> res!24051 e!18738)))

(declare-fun isPrefixOf!0 (BitStream!1330 BitStream!1330) Bool)

(assert (=> b!27769 (= res!24051 (not (isPrefixOf!0 (_2!1600 lt!39294) (_2!1600 lt!39283))))))

(assert (=> b!27769 (isPrefixOf!0 thiss!1379 (_2!1600 lt!39283))))

(declare-fun lt!39292 () Unit!2201)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1330 BitStream!1330 BitStream!1330) Unit!2201)

(assert (=> b!27769 (= lt!39292 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1600 lt!39294) (_2!1600 lt!39283)))))

(declare-fun srcBuffer!2 () array!1733)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1330 array!1733 (_ BitVec 64) (_ BitVec 64)) tuple2!3026)

(assert (=> b!27769 (= lt!39283 (appendBitsMSBFirstLoop!0 (_2!1600 lt!39294) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!18740 () Bool)

(assert (=> b!27769 e!18740))

(declare-fun res!24060 () Bool)

(assert (=> b!27769 (=> (not res!24060) (not e!18740))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!27769 (= res!24060 (validate_offset_bits!1 ((_ sign_extend 32) (size!749 (buf!1076 (_2!1600 lt!39294)))) ((_ sign_extend 32) (currentByte!2401 thiss!1379)) ((_ sign_extend 32) (currentBit!2396 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39287 () Unit!2201)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1330 array!1733 (_ BitVec 64)) Unit!2201)

(assert (=> b!27769 (= lt!39287 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1076 (_2!1600 lt!39294)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!3028 0))(
  ( (tuple2!3029 (_1!1601 BitStream!1330) (_2!1601 BitStream!1330)) )
))
(declare-fun lt!39284 () tuple2!3028)

(declare-fun reader!0 (BitStream!1330 BitStream!1330) tuple2!3028)

(assert (=> b!27769 (= lt!39284 (reader!0 thiss!1379 (_2!1600 lt!39294)))))

(declare-fun b!27770 () Bool)

(declare-fun e!18744 () Bool)

(assert (=> b!27770 (= e!18744 e!18737)))

(declare-fun res!24049 () Bool)

(assert (=> b!27770 (=> res!24049 e!18737)))

(assert (=> b!27770 (= res!24049 (not (isPrefixOf!0 thiss!1379 (_2!1600 lt!39294))))))

(declare-fun lt!39281 () (_ BitVec 64))

(assert (=> b!27770 (validate_offset_bits!1 ((_ sign_extend 32) (size!749 (buf!1076 (_2!1600 lt!39294)))) ((_ sign_extend 32) (currentByte!2401 (_2!1600 lt!39294))) ((_ sign_extend 32) (currentBit!2396 (_2!1600 lt!39294))) lt!39281)))

(assert (=> b!27770 (= lt!39281 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39298 () Unit!2201)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1330 BitStream!1330 (_ BitVec 64) (_ BitVec 64)) Unit!2201)

(assert (=> b!27770 (= lt!39298 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1600 lt!39294) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1330 (_ BitVec 8) (_ BitVec 32)) tuple2!3026)

(assert (=> b!27770 (= lt!39294 (appendBitFromByte!0 thiss!1379 (select (arr!1211 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!27771 () Bool)

(declare-fun e!18742 () Bool)

(declare-fun array_inv!718 (array!1733) Bool)

(assert (=> b!27771 (= e!18742 (array_inv!718 (buf!1076 thiss!1379)))))

(declare-fun b!27772 () Bool)

(declare-fun res!24050 () Bool)

(assert (=> b!27772 (=> res!24050 e!18746)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!27772 (= res!24050 (not (invariant!0 (currentBit!2396 (_2!1600 lt!39283)) (currentByte!2401 (_2!1600 lt!39283)) (size!749 (buf!1076 (_2!1600 lt!39283))))))))

(declare-fun b!27773 () Bool)

(declare-fun res!24063 () Bool)

(assert (=> b!27773 (=> res!24063 e!18746)))

(assert (=> b!27773 (= res!24063 (not (= (size!749 (buf!1076 thiss!1379)) (size!749 (buf!1076 (_2!1600 lt!39283))))))))

(declare-fun b!27774 () Bool)

(declare-fun lt!39282 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!27774 (= e!18748 (= lt!39282 (bvsub (bvsub (bvadd (bitIndex!0 (size!749 (buf!1076 (_2!1600 lt!39294))) (currentByte!2401 (_2!1600 lt!39294)) (currentBit!2396 (_2!1600 lt!39294))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!27775 () Bool)

(declare-fun res!24048 () Bool)

(declare-fun e!18739 () Bool)

(assert (=> b!27775 (=> res!24048 e!18739)))

(declare-fun lt!39290 () tuple2!3028)

(assert (=> b!27775 (= res!24048 (not (isPrefixOf!0 (_1!1601 lt!39290) (_2!1600 lt!39283))))))

(declare-fun b!27776 () Bool)

(assert (=> b!27776 (= e!18743 e!18739)))

(declare-fun res!24062 () Bool)

(assert (=> b!27776 (=> res!24062 e!18739)))

(assert (=> b!27776 (= res!24062 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((List!366 0))(
  ( (Nil!363) (Cons!362 (h!481 Bool) (t!1116 List!366)) )
))
(declare-fun lt!39285 () List!366)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1330 BitStream!1330 (_ BitVec 64)) List!366)

(assert (=> b!27776 (= lt!39285 (bitStreamReadBitsIntoList!0 (_2!1600 lt!39283) (_1!1601 lt!39290) lt!39281))))

(declare-fun lt!39291 () List!366)

(declare-fun lt!39288 () tuple2!3028)

(assert (=> b!27776 (= lt!39291 (bitStreamReadBitsIntoList!0 (_2!1600 lt!39283) (_1!1601 lt!39288) (bvsub to!314 i!635)))))

(assert (=> b!27776 (validate_offset_bits!1 ((_ sign_extend 32) (size!749 (buf!1076 (_2!1600 lt!39283)))) ((_ sign_extend 32) (currentByte!2401 (_2!1600 lt!39294))) ((_ sign_extend 32) (currentBit!2396 (_2!1600 lt!39294))) lt!39281)))

(declare-fun lt!39297 () Unit!2201)

(assert (=> b!27776 (= lt!39297 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1600 lt!39294) (buf!1076 (_2!1600 lt!39283)) lt!39281))))

(assert (=> b!27776 (= lt!39290 (reader!0 (_2!1600 lt!39294) (_2!1600 lt!39283)))))

(assert (=> b!27776 (validate_offset_bits!1 ((_ sign_extend 32) (size!749 (buf!1076 (_2!1600 lt!39283)))) ((_ sign_extend 32) (currentByte!2401 thiss!1379)) ((_ sign_extend 32) (currentBit!2396 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!39296 () Unit!2201)

(assert (=> b!27776 (= lt!39296 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1076 (_2!1600 lt!39283)) (bvsub to!314 i!635)))))

(assert (=> b!27776 (= lt!39288 (reader!0 thiss!1379 (_2!1600 lt!39283)))))

(declare-fun b!27777 () Bool)

(assert (=> b!27777 (= e!18739 true)))

(declare-fun lt!39293 () (_ BitVec 64))

(assert (=> b!27777 (= lt!39293 (bitIndex!0 (size!749 (buf!1076 (_1!1601 lt!39290))) (currentByte!2401 (_1!1601 lt!39290)) (currentBit!2396 (_1!1601 lt!39290))))))

(declare-fun lt!39286 () (_ BitVec 64))

(assert (=> b!27777 (= lt!39286 (bitIndex!0 (size!749 (buf!1076 (_1!1601 lt!39288))) (currentByte!2401 (_1!1601 lt!39288)) (currentBit!2396 (_1!1601 lt!39288))))))

(declare-fun res!24057 () Bool)

(declare-fun e!18741 () Bool)

(assert (=> start!5996 (=> (not res!24057) (not e!18741))))

(assert (=> start!5996 (= res!24057 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!749 srcBuffer!2))))))))

(assert (=> start!5996 e!18741))

(assert (=> start!5996 true))

(assert (=> start!5996 (array_inv!718 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1330) Bool)

(assert (=> start!5996 (and (inv!12 thiss!1379) e!18742)))

(declare-fun b!27778 () Bool)

(assert (=> b!27778 (= e!18738 e!18746)))

(declare-fun res!24052 () Bool)

(assert (=> b!27778 (=> res!24052 e!18746)))

(declare-fun lt!39295 () (_ BitVec 64))

(assert (=> b!27778 (= res!24052 (not (= lt!39282 (bvsub (bvadd lt!39295 to!314) i!635))))))

(assert (=> b!27778 (= lt!39282 (bitIndex!0 (size!749 (buf!1076 (_2!1600 lt!39283))) (currentByte!2401 (_2!1600 lt!39283)) (currentBit!2396 (_2!1600 lt!39283))))))

(declare-fun b!27779 () Bool)

(declare-fun res!24058 () Bool)

(assert (=> b!27779 (=> res!24058 e!18743)))

(assert (=> b!27779 (= res!24058 (not (invariant!0 (currentBit!2396 (_2!1600 lt!39294)) (currentByte!2401 (_2!1600 lt!39294)) (size!749 (buf!1076 (_2!1600 lt!39283))))))))

(declare-fun b!27780 () Bool)

(declare-fun res!24055 () Bool)

(assert (=> b!27780 (=> (not res!24055) (not e!18741))))

(assert (=> b!27780 (= res!24055 (validate_offset_bits!1 ((_ sign_extend 32) (size!749 (buf!1076 thiss!1379))) ((_ sign_extend 32) (currentByte!2401 thiss!1379)) ((_ sign_extend 32) (currentBit!2396 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!27781 () Bool)

(declare-fun res!24059 () Bool)

(assert (=> b!27781 (=> res!24059 e!18739)))

(assert (=> b!27781 (= res!24059 (not (isPrefixOf!0 (_1!1601 lt!39288) (_2!1600 lt!39283))))))

(declare-fun b!27782 () Bool)

(declare-fun res!24066 () Bool)

(assert (=> b!27782 (=> res!24066 e!18739)))

(assert (=> b!27782 (= res!24066 (or (not (= (buf!1076 (_1!1601 lt!39288)) (buf!1076 (_1!1601 lt!39290)))) (not (= (buf!1076 (_1!1601 lt!39288)) (buf!1076 (_2!1600 lt!39283)))) (bvsge lt!39282 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!27783 () Bool)

(declare-fun res!24054 () Bool)

(assert (=> b!27783 (=> res!24054 e!18743)))

(assert (=> b!27783 (= res!24054 (not (invariant!0 (currentBit!2396 (_2!1600 lt!39294)) (currentByte!2401 (_2!1600 lt!39294)) (size!749 (buf!1076 (_2!1600 lt!39294))))))))

(declare-fun b!27784 () Bool)

(assert (=> b!27784 (= e!18741 (not e!18744))))

(declare-fun res!24064 () Bool)

(assert (=> b!27784 (=> res!24064 e!18744)))

(assert (=> b!27784 (= res!24064 (bvsge i!635 to!314))))

(assert (=> b!27784 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!39289 () Unit!2201)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1330) Unit!2201)

(assert (=> b!27784 (= lt!39289 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!27784 (= lt!39295 (bitIndex!0 (size!749 (buf!1076 thiss!1379)) (currentByte!2401 thiss!1379) (currentBit!2396 thiss!1379)))))

(declare-fun b!27785 () Bool)

(declare-fun res!24061 () Bool)

(assert (=> b!27785 (=> res!24061 e!18739)))

(declare-fun length!92 (List!366) Int)

(assert (=> b!27785 (= res!24061 (<= (length!92 lt!39291) 0))))

(declare-fun b!27786 () Bool)

(declare-fun res!24053 () Bool)

(assert (=> b!27786 (=> res!24053 e!18739)))

(assert (=> b!27786 (= res!24053 (not (isPrefixOf!0 (_1!1601 lt!39288) (_1!1601 lt!39290))))))

(declare-fun b!27787 () Bool)

(declare-fun head!203 (List!366) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1330 array!1733 (_ BitVec 64) (_ BitVec 64)) List!366)

(assert (=> b!27787 (= e!18740 (= (head!203 (byteArrayBitContentToList!0 (_2!1600 lt!39294) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!203 (bitStreamReadBitsIntoList!0 (_2!1600 lt!39294) (_1!1601 lt!39284) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!5996 res!24057) b!27780))

(assert (= (and b!27780 res!24055) b!27784))

(assert (= (and b!27784 (not res!24064)) b!27770))

(assert (= (and b!27770 (not res!24049)) b!27769))

(assert (= (and b!27769 res!24060) b!27787))

(assert (= (and b!27769 (not res!24051)) b!27778))

(assert (= (and b!27778 (not res!24052)) b!27772))

(assert (= (and b!27772 (not res!24050)) b!27773))

(assert (= (and b!27773 (not res!24063)) b!27768))

(assert (= (and b!27768 res!24056) b!27774))

(assert (= (and b!27768 (not res!24065)) b!27783))

(assert (= (and b!27783 (not res!24054)) b!27779))

(assert (= (and b!27779 (not res!24058)) b!27776))

(assert (= (and b!27776 (not res!24062)) b!27785))

(assert (= (and b!27785 (not res!24061)) b!27781))

(assert (= (and b!27781 (not res!24059)) b!27775))

(assert (= (and b!27775 (not res!24048)) b!27786))

(assert (= (and b!27786 (not res!24053)) b!27782))

(assert (= (and b!27782 (not res!24066)) b!27777))

(assert (= start!5996 b!27771))

(declare-fun m!39777 () Bool)

(assert (=> b!27772 m!39777))

(declare-fun m!39779 () Bool)

(assert (=> b!27776 m!39779))

(declare-fun m!39781 () Bool)

(assert (=> b!27776 m!39781))

(declare-fun m!39783 () Bool)

(assert (=> b!27776 m!39783))

(declare-fun m!39785 () Bool)

(assert (=> b!27776 m!39785))

(declare-fun m!39787 () Bool)

(assert (=> b!27776 m!39787))

(declare-fun m!39789 () Bool)

(assert (=> b!27776 m!39789))

(declare-fun m!39791 () Bool)

(assert (=> b!27776 m!39791))

(declare-fun m!39793 () Bool)

(assert (=> b!27776 m!39793))

(declare-fun m!39795 () Bool)

(assert (=> b!27775 m!39795))

(declare-fun m!39797 () Bool)

(assert (=> b!27785 m!39797))

(declare-fun m!39799 () Bool)

(assert (=> b!27778 m!39799))

(declare-fun m!39801 () Bool)

(assert (=> start!5996 m!39801))

(declare-fun m!39803 () Bool)

(assert (=> start!5996 m!39803))

(declare-fun m!39805 () Bool)

(assert (=> b!27769 m!39805))

(declare-fun m!39807 () Bool)

(assert (=> b!27769 m!39807))

(declare-fun m!39809 () Bool)

(assert (=> b!27769 m!39809))

(declare-fun m!39811 () Bool)

(assert (=> b!27769 m!39811))

(declare-fun m!39813 () Bool)

(assert (=> b!27769 m!39813))

(declare-fun m!39815 () Bool)

(assert (=> b!27769 m!39815))

(declare-fun m!39817 () Bool)

(assert (=> b!27769 m!39817))

(declare-fun m!39819 () Bool)

(assert (=> b!27779 m!39819))

(declare-fun m!39821 () Bool)

(assert (=> b!27784 m!39821))

(declare-fun m!39823 () Bool)

(assert (=> b!27784 m!39823))

(declare-fun m!39825 () Bool)

(assert (=> b!27784 m!39825))

(declare-fun m!39827 () Bool)

(assert (=> b!27771 m!39827))

(declare-fun m!39829 () Bool)

(assert (=> b!27774 m!39829))

(declare-fun m!39831 () Bool)

(assert (=> b!27786 m!39831))

(declare-fun m!39833 () Bool)

(assert (=> b!27780 m!39833))

(declare-fun m!39835 () Bool)

(assert (=> b!27777 m!39835))

(declare-fun m!39837 () Bool)

(assert (=> b!27777 m!39837))

(declare-fun m!39839 () Bool)

(assert (=> b!27770 m!39839))

(declare-fun m!39841 () Bool)

(assert (=> b!27770 m!39841))

(declare-fun m!39843 () Bool)

(assert (=> b!27770 m!39843))

(declare-fun m!39845 () Bool)

(assert (=> b!27770 m!39845))

(assert (=> b!27770 m!39839))

(declare-fun m!39847 () Bool)

(assert (=> b!27770 m!39847))

(declare-fun m!39849 () Bool)

(assert (=> b!27787 m!39849))

(assert (=> b!27787 m!39849))

(declare-fun m!39851 () Bool)

(assert (=> b!27787 m!39851))

(declare-fun m!39853 () Bool)

(assert (=> b!27787 m!39853))

(assert (=> b!27787 m!39853))

(declare-fun m!39855 () Bool)

(assert (=> b!27787 m!39855))

(declare-fun m!39857 () Bool)

(assert (=> b!27783 m!39857))

(declare-fun m!39859 () Bool)

(assert (=> b!27781 m!39859))

(push 1)

(assert (not b!27777))

(assert (not b!27774))

(assert (not b!27780))

(assert (not b!27772))

(assert (not start!5996))

(assert (not b!27783))

(assert (not b!27769))

(assert (not b!27785))

(assert (not b!27786))

(assert (not b!27775))

(assert (not b!27781))

(assert (not b!27784))

(assert (not b!27771))

(assert (not b!27787))

(assert (not b!27778))

(assert (not b!27776))

(assert (not b!27770))

(assert (not b!27779))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

