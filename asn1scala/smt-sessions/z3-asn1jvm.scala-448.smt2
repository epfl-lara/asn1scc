; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11882 () Bool)

(assert start!11882)

(declare-fun b!60126 () Bool)

(declare-fun e!40088 () Bool)

(declare-fun e!40086 () Bool)

(assert (=> b!60126 (= e!40088 e!40086)))

(declare-fun res!50107 () Bool)

(assert (=> b!60126 (=> res!50107 e!40086)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!93968 () (_ BitVec 64))

(declare-fun lt!93980 () (_ BitVec 64))

(assert (=> b!60126 (= res!50107 (not (= lt!93968 (bvsub (bvadd lt!93980 to!314) i!635))))))

(declare-datatypes ((array!2739 0))(
  ( (array!2740 (arr!1809 (Array (_ BitVec 32) (_ BitVec 8))) (size!1245 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2178 0))(
  ( (BitStream!2179 (buf!1626 array!2739) (currentByte!3244 (_ BitVec 32)) (currentBit!3239 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4113 0))(
  ( (Unit!4114) )
))
(declare-datatypes ((tuple2!5478 0))(
  ( (tuple2!5479 (_1!2850 Unit!4113) (_2!2850 BitStream!2178)) )
))
(declare-fun lt!93973 () tuple2!5478)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!60126 (= lt!93968 (bitIndex!0 (size!1245 (buf!1626 (_2!2850 lt!93973))) (currentByte!3244 (_2!2850 lt!93973)) (currentBit!3239 (_2!2850 lt!93973))))))

(declare-fun b!60127 () Bool)

(declare-fun e!40090 () Bool)

(assert (=> b!60127 (= e!40090 e!40088)))

(declare-fun res!50114 () Bool)

(assert (=> b!60127 (=> res!50114 e!40088)))

(declare-fun lt!93974 () tuple2!5478)

(declare-fun isPrefixOf!0 (BitStream!2178 BitStream!2178) Bool)

(assert (=> b!60127 (= res!50114 (not (isPrefixOf!0 (_2!2850 lt!93974) (_2!2850 lt!93973))))))

(declare-fun thiss!1379 () BitStream!2178)

(assert (=> b!60127 (isPrefixOf!0 thiss!1379 (_2!2850 lt!93973))))

(declare-fun lt!93970 () Unit!4113)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2178 BitStream!2178 BitStream!2178) Unit!4113)

(assert (=> b!60127 (= lt!93970 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2850 lt!93974) (_2!2850 lt!93973)))))

(declare-fun srcBuffer!2 () array!2739)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2178 array!2739 (_ BitVec 64) (_ BitVec 64)) tuple2!5478)

(assert (=> b!60127 (= lt!93973 (appendBitsMSBFirstLoop!0 (_2!2850 lt!93974) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!40089 () Bool)

(assert (=> b!60127 e!40089))

(declare-fun res!50108 () Bool)

(assert (=> b!60127 (=> (not res!50108) (not e!40089))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!60127 (= res!50108 (validate_offset_bits!1 ((_ sign_extend 32) (size!1245 (buf!1626 (_2!2850 lt!93974)))) ((_ sign_extend 32) (currentByte!3244 thiss!1379)) ((_ sign_extend 32) (currentBit!3239 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93979 () Unit!4113)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2178 array!2739 (_ BitVec 64)) Unit!4113)

(assert (=> b!60127 (= lt!93979 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1626 (_2!2850 lt!93974)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5480 0))(
  ( (tuple2!5481 (_1!2851 BitStream!2178) (_2!2851 BitStream!2178)) )
))
(declare-fun lt!93976 () tuple2!5480)

(declare-fun reader!0 (BitStream!2178 BitStream!2178) tuple2!5480)

(assert (=> b!60127 (= lt!93976 (reader!0 thiss!1379 (_2!2850 lt!93974)))))

(declare-fun b!60128 () Bool)

(declare-fun e!40085 () Bool)

(assert (=> b!60128 (= e!40085 e!40090)))

(declare-fun res!50110 () Bool)

(assert (=> b!60128 (=> res!50110 e!40090)))

(assert (=> b!60128 (= res!50110 (not (isPrefixOf!0 thiss!1379 (_2!2850 lt!93974))))))

(declare-fun lt!93972 () (_ BitVec 64))

(assert (=> b!60128 (validate_offset_bits!1 ((_ sign_extend 32) (size!1245 (buf!1626 (_2!2850 lt!93974)))) ((_ sign_extend 32) (currentByte!3244 (_2!2850 lt!93974))) ((_ sign_extend 32) (currentBit!3239 (_2!2850 lt!93974))) lt!93972)))

(assert (=> b!60128 (= lt!93972 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93967 () Unit!4113)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2178 BitStream!2178 (_ BitVec 64) (_ BitVec 64)) Unit!4113)

(assert (=> b!60128 (= lt!93967 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2850 lt!93974) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2178 (_ BitVec 8) (_ BitVec 32)) tuple2!5478)

(assert (=> b!60128 (= lt!93974 (appendBitFromByte!0 thiss!1379 (select (arr!1809 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!60129 () Bool)

(declare-fun res!50103 () Bool)

(declare-fun e!40092 () Bool)

(assert (=> b!60129 (=> res!50103 e!40092)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!60129 (= res!50103 (not (invariant!0 (currentBit!3239 (_2!2850 lt!93974)) (currentByte!3244 (_2!2850 lt!93974)) (size!1245 (buf!1626 (_2!2850 lt!93973))))))))

(declare-fun b!60131 () Bool)

(declare-fun e!40093 () Bool)

(assert (=> b!60131 (= e!40093 (not e!40085))))

(declare-fun res!50113 () Bool)

(assert (=> b!60131 (=> res!50113 e!40085)))

(assert (=> b!60131 (= res!50113 (bvsge i!635 to!314))))

(assert (=> b!60131 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!93977 () Unit!4113)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2178) Unit!4113)

(assert (=> b!60131 (= lt!93977 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!60131 (= lt!93980 (bitIndex!0 (size!1245 (buf!1626 thiss!1379)) (currentByte!3244 thiss!1379) (currentBit!3239 thiss!1379)))))

(declare-fun b!60132 () Bool)

(declare-fun res!50105 () Bool)

(assert (=> b!60132 (=> res!50105 e!40092)))

(assert (=> b!60132 (= res!50105 (not (invariant!0 (currentBit!3239 (_2!2850 lt!93974)) (currentByte!3244 (_2!2850 lt!93974)) (size!1245 (buf!1626 (_2!2850 lt!93974))))))))

(declare-fun b!60133 () Bool)

(declare-fun e!40087 () Bool)

(declare-fun array_inv!1148 (array!2739) Bool)

(assert (=> b!60133 (= e!40087 (array_inv!1148 (buf!1626 thiss!1379)))))

(declare-fun e!40094 () Bool)

(declare-fun b!60134 () Bool)

(assert (=> b!60134 (= e!40094 (= lt!93968 (bvsub (bvsub (bvadd (bitIndex!0 (size!1245 (buf!1626 (_2!2850 lt!93974))) (currentByte!3244 (_2!2850 lt!93974)) (currentBit!3239 (_2!2850 lt!93974))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!60135 () Bool)

(declare-fun res!50115 () Bool)

(assert (=> b!60135 (=> res!50115 e!40086)))

(assert (=> b!60135 (= res!50115 (not (= (size!1245 (buf!1626 thiss!1379)) (size!1245 (buf!1626 (_2!2850 lt!93973))))))))

(declare-fun b!60136 () Bool)

(declare-datatypes ((List!664 0))(
  ( (Nil!661) (Cons!660 (h!779 Bool) (t!1414 List!664)) )
))
(declare-fun head!483 (List!664) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2178 array!2739 (_ BitVec 64) (_ BitVec 64)) List!664)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2178 BitStream!2178 (_ BitVec 64)) List!664)

(assert (=> b!60136 (= e!40089 (= (head!483 (byteArrayBitContentToList!0 (_2!2850 lt!93974) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!483 (bitStreamReadBitsIntoList!0 (_2!2850 lt!93974) (_1!2851 lt!93976) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!60137 () Bool)

(assert (=> b!60137 (= e!40086 e!40092)))

(declare-fun res!50104 () Bool)

(assert (=> b!60137 (=> res!50104 e!40092)))

(assert (=> b!60137 (= res!50104 (not (= (size!1245 (buf!1626 (_2!2850 lt!93974))) (size!1245 (buf!1626 (_2!2850 lt!93973))))))))

(assert (=> b!60137 e!40094))

(declare-fun res!50109 () Bool)

(assert (=> b!60137 (=> (not res!50109) (not e!40094))))

(assert (=> b!60137 (= res!50109 (= (size!1245 (buf!1626 (_2!2850 lt!93973))) (size!1245 (buf!1626 thiss!1379))))))

(declare-fun b!60130 () Bool)

(declare-fun res!50106 () Bool)

(assert (=> b!60130 (=> (not res!50106) (not e!40093))))

(assert (=> b!60130 (= res!50106 (validate_offset_bits!1 ((_ sign_extend 32) (size!1245 (buf!1626 thiss!1379))) ((_ sign_extend 32) (currentByte!3244 thiss!1379)) ((_ sign_extend 32) (currentBit!3239 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!50112 () Bool)

(assert (=> start!11882 (=> (not res!50112) (not e!40093))))

(assert (=> start!11882 (= res!50112 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1245 srcBuffer!2))))))))

(assert (=> start!11882 e!40093))

(assert (=> start!11882 true))

(assert (=> start!11882 (array_inv!1148 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2178) Bool)

(assert (=> start!11882 (and (inv!12 thiss!1379) e!40087)))

(declare-fun b!60138 () Bool)

(declare-fun res!50111 () Bool)

(assert (=> b!60138 (=> res!50111 e!40086)))

(assert (=> b!60138 (= res!50111 (not (invariant!0 (currentBit!3239 (_2!2850 lt!93973)) (currentByte!3244 (_2!2850 lt!93973)) (size!1245 (buf!1626 (_2!2850 lt!93973))))))))

(declare-fun b!60139 () Bool)

(assert (=> b!60139 (= e!40092 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!93975 () tuple2!5480)

(declare-fun lt!93981 () List!664)

(assert (=> b!60139 (= lt!93981 (bitStreamReadBitsIntoList!0 (_2!2850 lt!93973) (_1!2851 lt!93975) lt!93972))))

(declare-fun lt!93982 () tuple2!5480)

(declare-fun lt!93969 () List!664)

(assert (=> b!60139 (= lt!93969 (bitStreamReadBitsIntoList!0 (_2!2850 lt!93973) (_1!2851 lt!93982) (bvsub to!314 i!635)))))

(assert (=> b!60139 (validate_offset_bits!1 ((_ sign_extend 32) (size!1245 (buf!1626 (_2!2850 lt!93973)))) ((_ sign_extend 32) (currentByte!3244 (_2!2850 lt!93974))) ((_ sign_extend 32) (currentBit!3239 (_2!2850 lt!93974))) lt!93972)))

(declare-fun lt!93978 () Unit!4113)

(assert (=> b!60139 (= lt!93978 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2850 lt!93974) (buf!1626 (_2!2850 lt!93973)) lt!93972))))

(assert (=> b!60139 (= lt!93975 (reader!0 (_2!2850 lt!93974) (_2!2850 lt!93973)))))

(assert (=> b!60139 (validate_offset_bits!1 ((_ sign_extend 32) (size!1245 (buf!1626 (_2!2850 lt!93973)))) ((_ sign_extend 32) (currentByte!3244 thiss!1379)) ((_ sign_extend 32) (currentBit!3239 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!93971 () Unit!4113)

(assert (=> b!60139 (= lt!93971 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1626 (_2!2850 lt!93973)) (bvsub to!314 i!635)))))

(assert (=> b!60139 (= lt!93982 (reader!0 thiss!1379 (_2!2850 lt!93973)))))

(assert (= (and start!11882 res!50112) b!60130))

(assert (= (and b!60130 res!50106) b!60131))

(assert (= (and b!60131 (not res!50113)) b!60128))

(assert (= (and b!60128 (not res!50110)) b!60127))

(assert (= (and b!60127 res!50108) b!60136))

(assert (= (and b!60127 (not res!50114)) b!60126))

(assert (= (and b!60126 (not res!50107)) b!60138))

(assert (= (and b!60138 (not res!50111)) b!60135))

(assert (= (and b!60135 (not res!50115)) b!60137))

(assert (= (and b!60137 res!50109) b!60134))

(assert (= (and b!60137 (not res!50104)) b!60132))

(assert (= (and b!60132 (not res!50105)) b!60129))

(assert (= (and b!60129 (not res!50103)) b!60139))

(assert (= start!11882 b!60133))

(declare-fun m!94729 () Bool)

(assert (=> b!60126 m!94729))

(declare-fun m!94731 () Bool)

(assert (=> b!60131 m!94731))

(declare-fun m!94733 () Bool)

(assert (=> b!60131 m!94733))

(declare-fun m!94735 () Bool)

(assert (=> b!60131 m!94735))

(declare-fun m!94737 () Bool)

(assert (=> b!60129 m!94737))

(declare-fun m!94739 () Bool)

(assert (=> b!60133 m!94739))

(declare-fun m!94741 () Bool)

(assert (=> start!11882 m!94741))

(declare-fun m!94743 () Bool)

(assert (=> start!11882 m!94743))

(declare-fun m!94745 () Bool)

(assert (=> b!60134 m!94745))

(declare-fun m!94747 () Bool)

(assert (=> b!60130 m!94747))

(declare-fun m!94749 () Bool)

(assert (=> b!60139 m!94749))

(declare-fun m!94751 () Bool)

(assert (=> b!60139 m!94751))

(declare-fun m!94753 () Bool)

(assert (=> b!60139 m!94753))

(declare-fun m!94755 () Bool)

(assert (=> b!60139 m!94755))

(declare-fun m!94757 () Bool)

(assert (=> b!60139 m!94757))

(declare-fun m!94759 () Bool)

(assert (=> b!60139 m!94759))

(declare-fun m!94761 () Bool)

(assert (=> b!60139 m!94761))

(declare-fun m!94763 () Bool)

(assert (=> b!60139 m!94763))

(declare-fun m!94765 () Bool)

(assert (=> b!60138 m!94765))

(declare-fun m!94767 () Bool)

(assert (=> b!60132 m!94767))

(declare-fun m!94769 () Bool)

(assert (=> b!60127 m!94769))

(declare-fun m!94771 () Bool)

(assert (=> b!60127 m!94771))

(declare-fun m!94773 () Bool)

(assert (=> b!60127 m!94773))

(declare-fun m!94775 () Bool)

(assert (=> b!60127 m!94775))

(declare-fun m!94777 () Bool)

(assert (=> b!60127 m!94777))

(declare-fun m!94779 () Bool)

(assert (=> b!60127 m!94779))

(declare-fun m!94781 () Bool)

(assert (=> b!60127 m!94781))

(declare-fun m!94783 () Bool)

(assert (=> b!60136 m!94783))

(assert (=> b!60136 m!94783))

(declare-fun m!94785 () Bool)

(assert (=> b!60136 m!94785))

(declare-fun m!94787 () Bool)

(assert (=> b!60136 m!94787))

(assert (=> b!60136 m!94787))

(declare-fun m!94789 () Bool)

(assert (=> b!60136 m!94789))

(declare-fun m!94791 () Bool)

(assert (=> b!60128 m!94791))

(declare-fun m!94793 () Bool)

(assert (=> b!60128 m!94793))

(declare-fun m!94795 () Bool)

(assert (=> b!60128 m!94795))

(declare-fun m!94797 () Bool)

(assert (=> b!60128 m!94797))

(assert (=> b!60128 m!94791))

(declare-fun m!94799 () Bool)

(assert (=> b!60128 m!94799))

(check-sat (not b!60127) (not b!60131) (not b!60138) (not b!60134) (not b!60130) (not b!60128) (not b!60126) (not b!60139) (not b!60129) (not b!60136) (not start!11882) (not b!60133) (not b!60132))
(check-sat)
