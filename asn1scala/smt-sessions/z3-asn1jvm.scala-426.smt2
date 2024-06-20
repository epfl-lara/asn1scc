; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11270 () Bool)

(assert start!11270)

(declare-fun b!55861 () Bool)

(declare-fun e!37207 () Bool)

(declare-fun e!37208 () Bool)

(assert (=> b!55861 (= e!37207 e!37208)))

(declare-fun res!46504 () Bool)

(assert (=> b!55861 (=> res!46504 e!37208)))

(declare-datatypes ((array!2592 0))(
  ( (array!2593 (arr!1728 (Array (_ BitVec 32) (_ BitVec 8))) (size!1179 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2046 0))(
  ( (BitStream!2047 (buf!1545 array!2592) (currentByte!3133 (_ BitVec 32)) (currentBit!3128 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3861 0))(
  ( (Unit!3862) )
))
(declare-datatypes ((tuple2!5094 0))(
  ( (tuple2!5095 (_1!2658 Unit!3861) (_2!2658 BitStream!2046)) )
))
(declare-fun lt!87426 () tuple2!5094)

(declare-fun lt!87422 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!55861 (= res!46504 (not (= (bitIndex!0 (size!1179 (buf!1545 (_2!2658 lt!87426))) (currentByte!3133 (_2!2658 lt!87426)) (currentBit!3128 (_2!2658 lt!87426))) lt!87422)))))

(declare-fun lt!87421 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!55861 (= lt!87422 (bvsub lt!87421 i!635))))

(declare-fun lt!87427 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!55861 (= lt!87421 (bvadd lt!87427 to!314))))

(declare-fun b!55862 () Bool)

(declare-fun e!37205 () Bool)

(declare-fun e!37203 () Bool)

(assert (=> b!55862 (= e!37205 (not e!37203))))

(declare-fun res!46509 () Bool)

(assert (=> b!55862 (=> res!46509 e!37203)))

(assert (=> b!55862 (= res!46509 (bvsge i!635 to!314))))

(declare-fun thiss!1379 () BitStream!2046)

(declare-fun isPrefixOf!0 (BitStream!2046 BitStream!2046) Bool)

(assert (=> b!55862 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!87424 () Unit!3861)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2046) Unit!3861)

(assert (=> b!55862 (= lt!87424 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!55862 (= lt!87427 (bitIndex!0 (size!1179 (buf!1545 thiss!1379)) (currentByte!3133 thiss!1379) (currentBit!3128 thiss!1379)))))

(declare-fun lt!87425 () tuple2!5094)

(declare-fun e!37206 () Bool)

(declare-datatypes ((tuple2!5096 0))(
  ( (tuple2!5097 (_1!2659 BitStream!2046) (_2!2659 BitStream!2046)) )
))
(declare-fun lt!87420 () tuple2!5096)

(declare-fun srcBuffer!2 () array!2592)

(declare-fun b!55863 () Bool)

(declare-datatypes ((List!598 0))(
  ( (Nil!595) (Cons!594 (h!713 Bool) (t!1348 List!598)) )
))
(declare-fun head!417 (List!598) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2046 array!2592 (_ BitVec 64) (_ BitVec 64)) List!598)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2046 BitStream!2046 (_ BitVec 64)) List!598)

(assert (=> b!55863 (= e!37206 (= (head!417 (byteArrayBitContentToList!0 (_2!2658 lt!87425) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!417 (bitStreamReadBitsIntoList!0 (_2!2658 lt!87425) (_1!2659 lt!87420) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!55864 () Bool)

(declare-fun res!46507 () Bool)

(assert (=> b!55864 (=> res!46507 e!37208)))

(assert (=> b!55864 (= res!46507 (not (= (size!1179 (buf!1545 thiss!1379)) (size!1179 (buf!1545 (_2!2658 lt!87426))))))))

(declare-fun b!55865 () Bool)

(declare-fun e!37204 () Bool)

(assert (=> b!55865 (= e!37203 e!37204)))

(declare-fun res!46505 () Bool)

(assert (=> b!55865 (=> res!46505 e!37204)))

(assert (=> b!55865 (= res!46505 (not (isPrefixOf!0 thiss!1379 (_2!2658 lt!87425))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!55865 (validate_offset_bits!1 ((_ sign_extend 32) (size!1179 (buf!1545 (_2!2658 lt!87425)))) ((_ sign_extend 32) (currentByte!3133 (_2!2658 lt!87425))) ((_ sign_extend 32) (currentBit!3128 (_2!2658 lt!87425))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!87417 () Unit!3861)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2046 BitStream!2046 (_ BitVec 64) (_ BitVec 64)) Unit!3861)

(assert (=> b!55865 (= lt!87417 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2658 lt!87425) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2046 (_ BitVec 8) (_ BitVec 32)) tuple2!5094)

(assert (=> b!55865 (= lt!87425 (appendBitFromByte!0 thiss!1379 (select (arr!1728 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!55866 () Bool)

(declare-fun e!37210 () Bool)

(declare-fun array_inv!1082 (array!2592) Bool)

(assert (=> b!55866 (= e!37210 (array_inv!1082 (buf!1545 thiss!1379)))))

(declare-fun b!55867 () Bool)

(declare-fun res!46503 () Bool)

(assert (=> b!55867 (=> (not res!46503) (not e!37205))))

(assert (=> b!55867 (= res!46503 (validate_offset_bits!1 ((_ sign_extend 32) (size!1179 (buf!1545 thiss!1379))) ((_ sign_extend 32) (currentByte!3133 thiss!1379)) ((_ sign_extend 32) (currentBit!3128 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!46501 () Bool)

(assert (=> start!11270 (=> (not res!46501) (not e!37205))))

(assert (=> start!11270 (= res!46501 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1179 srcBuffer!2))))))))

(assert (=> start!11270 e!37205))

(assert (=> start!11270 true))

(assert (=> start!11270 (array_inv!1082 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2046) Bool)

(assert (=> start!11270 (and (inv!12 thiss!1379) e!37210)))

(declare-fun b!55868 () Bool)

(declare-fun res!46508 () Bool)

(assert (=> b!55868 (=> res!46508 e!37208)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!55868 (= res!46508 (not (invariant!0 (currentBit!3128 (_2!2658 lt!87426)) (currentByte!3133 (_2!2658 lt!87426)) (size!1179 (buf!1545 (_2!2658 lt!87426))))))))

(declare-fun b!55869 () Bool)

(assert (=> b!55869 (= e!37204 e!37207)))

(declare-fun res!46502 () Bool)

(assert (=> b!55869 (=> res!46502 e!37207)))

(assert (=> b!55869 (= res!46502 (not (isPrefixOf!0 (_2!2658 lt!87425) (_2!2658 lt!87426))))))

(assert (=> b!55869 (isPrefixOf!0 thiss!1379 (_2!2658 lt!87426))))

(declare-fun lt!87423 () Unit!3861)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2046 BitStream!2046 BitStream!2046) Unit!3861)

(assert (=> b!55869 (= lt!87423 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2658 lt!87425) (_2!2658 lt!87426)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2046 array!2592 (_ BitVec 64) (_ BitVec 64)) tuple2!5094)

(assert (=> b!55869 (= lt!87426 (appendBitsMSBFirstLoop!0 (_2!2658 lt!87425) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!55869 e!37206))

(declare-fun res!46506 () Bool)

(assert (=> b!55869 (=> (not res!46506) (not e!37206))))

(assert (=> b!55869 (= res!46506 (validate_offset_bits!1 ((_ sign_extend 32) (size!1179 (buf!1545 (_2!2658 lt!87425)))) ((_ sign_extend 32) (currentByte!3133 thiss!1379)) ((_ sign_extend 32) (currentBit!3128 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!87419 () Unit!3861)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2046 array!2592 (_ BitVec 64)) Unit!3861)

(assert (=> b!55869 (= lt!87419 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1545 (_2!2658 lt!87425)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2046 BitStream!2046) tuple2!5096)

(assert (=> b!55869 (= lt!87420 (reader!0 thiss!1379 (_2!2658 lt!87425)))))

(declare-fun b!55870 () Bool)

(declare-fun lt!87418 () (_ BitVec 64))

(assert (=> b!55870 (= e!37208 (or (= lt!87418 (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!87418 (bvand lt!87422 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!55870 (= lt!87418 (bvand lt!87421 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!55870 (= (size!1179 (buf!1545 (_2!2658 lt!87426))) (size!1179 (buf!1545 thiss!1379)))))

(assert (= (and start!11270 res!46501) b!55867))

(assert (= (and b!55867 res!46503) b!55862))

(assert (= (and b!55862 (not res!46509)) b!55865))

(assert (= (and b!55865 (not res!46505)) b!55869))

(assert (= (and b!55869 res!46506) b!55863))

(assert (= (and b!55869 (not res!46502)) b!55861))

(assert (= (and b!55861 (not res!46504)) b!55868))

(assert (= (and b!55868 (not res!46508)) b!55864))

(assert (= (and b!55864 (not res!46507)) b!55870))

(assert (= start!11270 b!55866))

(declare-fun m!88017 () Bool)

(assert (=> b!55868 m!88017))

(declare-fun m!88019 () Bool)

(assert (=> b!55861 m!88019))

(declare-fun m!88021 () Bool)

(assert (=> b!55863 m!88021))

(assert (=> b!55863 m!88021))

(declare-fun m!88023 () Bool)

(assert (=> b!55863 m!88023))

(declare-fun m!88025 () Bool)

(assert (=> b!55863 m!88025))

(assert (=> b!55863 m!88025))

(declare-fun m!88027 () Bool)

(assert (=> b!55863 m!88027))

(declare-fun m!88029 () Bool)

(assert (=> b!55869 m!88029))

(declare-fun m!88031 () Bool)

(assert (=> b!55869 m!88031))

(declare-fun m!88033 () Bool)

(assert (=> b!55869 m!88033))

(declare-fun m!88035 () Bool)

(assert (=> b!55869 m!88035))

(declare-fun m!88037 () Bool)

(assert (=> b!55869 m!88037))

(declare-fun m!88039 () Bool)

(assert (=> b!55869 m!88039))

(declare-fun m!88041 () Bool)

(assert (=> b!55869 m!88041))

(declare-fun m!88043 () Bool)

(assert (=> b!55862 m!88043))

(declare-fun m!88045 () Bool)

(assert (=> b!55862 m!88045))

(declare-fun m!88047 () Bool)

(assert (=> b!55862 m!88047))

(declare-fun m!88049 () Bool)

(assert (=> start!11270 m!88049))

(declare-fun m!88051 () Bool)

(assert (=> start!11270 m!88051))

(declare-fun m!88053 () Bool)

(assert (=> b!55865 m!88053))

(declare-fun m!88055 () Bool)

(assert (=> b!55865 m!88055))

(declare-fun m!88057 () Bool)

(assert (=> b!55865 m!88057))

(declare-fun m!88059 () Bool)

(assert (=> b!55865 m!88059))

(assert (=> b!55865 m!88053))

(declare-fun m!88061 () Bool)

(assert (=> b!55865 m!88061))

(declare-fun m!88063 () Bool)

(assert (=> b!55867 m!88063))

(declare-fun m!88065 () Bool)

(assert (=> b!55866 m!88065))

(check-sat (not b!55866) (not b!55865) (not b!55862) (not b!55863) (not start!11270) (not b!55861) (not b!55869) (not b!55868) (not b!55867))
(check-sat)
(get-model)

(declare-fun d!17796 () Bool)

(declare-fun res!46545 () Bool)

(declare-fun e!37244 () Bool)

(assert (=> d!17796 (=> (not res!46545) (not e!37244))))

(assert (=> d!17796 (= res!46545 (= (size!1179 (buf!1545 thiss!1379)) (size!1179 (buf!1545 (_2!2658 lt!87425)))))))

(assert (=> d!17796 (= (isPrefixOf!0 thiss!1379 (_2!2658 lt!87425)) e!37244)))

(declare-fun b!55907 () Bool)

(declare-fun res!46543 () Bool)

(assert (=> b!55907 (=> (not res!46543) (not e!37244))))

(assert (=> b!55907 (= res!46543 (bvsle (bitIndex!0 (size!1179 (buf!1545 thiss!1379)) (currentByte!3133 thiss!1379) (currentBit!3128 thiss!1379)) (bitIndex!0 (size!1179 (buf!1545 (_2!2658 lt!87425))) (currentByte!3133 (_2!2658 lt!87425)) (currentBit!3128 (_2!2658 lt!87425)))))))

(declare-fun b!55908 () Bool)

(declare-fun e!37243 () Bool)

(assert (=> b!55908 (= e!37244 e!37243)))

(declare-fun res!46544 () Bool)

(assert (=> b!55908 (=> res!46544 e!37243)))

(assert (=> b!55908 (= res!46544 (= (size!1179 (buf!1545 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!55909 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2592 array!2592 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!55909 (= e!37243 (arrayBitRangesEq!0 (buf!1545 thiss!1379) (buf!1545 (_2!2658 lt!87425)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1179 (buf!1545 thiss!1379)) (currentByte!3133 thiss!1379) (currentBit!3128 thiss!1379))))))

(assert (= (and d!17796 res!46545) b!55907))

(assert (= (and b!55907 res!46543) b!55908))

(assert (= (and b!55908 (not res!46544)) b!55909))

(assert (=> b!55907 m!88047))

(declare-fun m!88117 () Bool)

(assert (=> b!55907 m!88117))

(assert (=> b!55909 m!88047))

(assert (=> b!55909 m!88047))

(declare-fun m!88119 () Bool)

(assert (=> b!55909 m!88119))

(assert (=> b!55865 d!17796))

(declare-fun d!17798 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!17798 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1179 (buf!1545 (_2!2658 lt!87425)))) ((_ sign_extend 32) (currentByte!3133 (_2!2658 lt!87425))) ((_ sign_extend 32) (currentBit!3128 (_2!2658 lt!87425))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1179 (buf!1545 (_2!2658 lt!87425)))) ((_ sign_extend 32) (currentByte!3133 (_2!2658 lt!87425))) ((_ sign_extend 32) (currentBit!3128 (_2!2658 lt!87425)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4467 () Bool)

(assert (= bs!4467 d!17798))

(declare-fun m!88121 () Bool)

(assert (=> bs!4467 m!88121))

(assert (=> b!55865 d!17798))

(declare-fun d!17800 () Bool)

(declare-fun e!37247 () Bool)

(assert (=> d!17800 e!37247))

(declare-fun res!46548 () Bool)

(assert (=> d!17800 (=> (not res!46548) (not e!37247))))

(assert (=> d!17800 (= res!46548 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!87463 () Unit!3861)

(declare-fun choose!27 (BitStream!2046 BitStream!2046 (_ BitVec 64) (_ BitVec 64)) Unit!3861)

(assert (=> d!17800 (= lt!87463 (choose!27 thiss!1379 (_2!2658 lt!87425) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!17800 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!17800 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2658 lt!87425) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!87463)))

(declare-fun b!55912 () Bool)

(assert (=> b!55912 (= e!37247 (validate_offset_bits!1 ((_ sign_extend 32) (size!1179 (buf!1545 (_2!2658 lt!87425)))) ((_ sign_extend 32) (currentByte!3133 (_2!2658 lt!87425))) ((_ sign_extend 32) (currentBit!3128 (_2!2658 lt!87425))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!17800 res!46548) b!55912))

(declare-fun m!88123 () Bool)

(assert (=> d!17800 m!88123))

(assert (=> b!55912 m!88057))

(assert (=> b!55865 d!17800))

(declare-fun b!55936 () Bool)

(declare-fun res!46575 () Bool)

(declare-fun e!37263 () Bool)

(assert (=> b!55936 (=> (not res!46575) (not e!37263))))

(declare-fun lt!87493 () tuple2!5094)

(assert (=> b!55936 (= res!46575 (isPrefixOf!0 thiss!1379 (_2!2658 lt!87493)))))

(declare-fun b!55937 () Bool)

(declare-fun e!37260 () Bool)

(declare-datatypes ((tuple2!5102 0))(
  ( (tuple2!5103 (_1!2662 BitStream!2046) (_2!2662 Bool)) )
))
(declare-fun lt!87490 () tuple2!5102)

(declare-fun lt!87491 () tuple2!5094)

(assert (=> b!55937 (= e!37260 (= (bitIndex!0 (size!1179 (buf!1545 (_1!2662 lt!87490))) (currentByte!3133 (_1!2662 lt!87490)) (currentBit!3128 (_1!2662 lt!87490))) (bitIndex!0 (size!1179 (buf!1545 (_2!2658 lt!87491))) (currentByte!3133 (_2!2658 lt!87491)) (currentBit!3128 (_2!2658 lt!87491)))))))

(declare-fun b!55938 () Bool)

(declare-fun e!37262 () Bool)

(assert (=> b!55938 (= e!37262 e!37260)))

(declare-fun res!46576 () Bool)

(assert (=> b!55938 (=> (not res!46576) (not e!37260))))

(declare-fun lt!87496 () (_ BitVec 8))

(assert (=> b!55938 (= res!46576 (and (= (_2!2662 lt!87490) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1728 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!87496)) #b00000000000000000000000000000000))) (= (_1!2662 lt!87490) (_2!2658 lt!87491))))))

(declare-datatypes ((tuple2!5104 0))(
  ( (tuple2!5105 (_1!2663 array!2592) (_2!2663 BitStream!2046)) )
))
(declare-fun lt!87489 () tuple2!5104)

(declare-fun lt!87488 () BitStream!2046)

(declare-fun readBits!0 (BitStream!2046 (_ BitVec 64)) tuple2!5104)

(assert (=> b!55938 (= lt!87489 (readBits!0 lt!87488 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2046) tuple2!5102)

(assert (=> b!55938 (= lt!87490 (readBitPure!0 lt!87488))))

(declare-fun readerFrom!0 (BitStream!2046 (_ BitVec 32) (_ BitVec 32)) BitStream!2046)

(assert (=> b!55938 (= lt!87488 (readerFrom!0 (_2!2658 lt!87491) (currentBit!3128 thiss!1379) (currentByte!3133 thiss!1379)))))

(declare-fun d!17802 () Bool)

(assert (=> d!17802 e!37262))

(declare-fun res!46577 () Bool)

(assert (=> d!17802 (=> (not res!46577) (not e!37262))))

(assert (=> d!17802 (= res!46577 (= (size!1179 (buf!1545 (_2!2658 lt!87491))) (size!1179 (buf!1545 thiss!1379))))))

(declare-fun lt!87495 () array!2592)

(assert (=> d!17802 (= lt!87496 (select (arr!1728 lt!87495) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!17802 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1179 lt!87495)))))

(assert (=> d!17802 (= lt!87495 (array!2593 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!87492 () tuple2!5094)

(assert (=> d!17802 (= lt!87491 (tuple2!5095 (_1!2658 lt!87492) (_2!2658 lt!87492)))))

(assert (=> d!17802 (= lt!87492 lt!87493)))

(assert (=> d!17802 e!37263))

(declare-fun res!46574 () Bool)

(assert (=> d!17802 (=> (not res!46574) (not e!37263))))

(assert (=> d!17802 (= res!46574 (= (size!1179 (buf!1545 thiss!1379)) (size!1179 (buf!1545 (_2!2658 lt!87493)))))))

(declare-fun lt!87497 () Bool)

(declare-fun appendBit!0 (BitStream!2046 Bool) tuple2!5094)

(assert (=> d!17802 (= lt!87493 (appendBit!0 thiss!1379 lt!87497))))

(assert (=> d!17802 (= lt!87497 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1728 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!17802 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!17802 (= (appendBitFromByte!0 thiss!1379 (select (arr!1728 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!87491)))

(declare-fun b!55939 () Bool)

(declare-fun res!46572 () Bool)

(assert (=> b!55939 (=> (not res!46572) (not e!37262))))

(assert (=> b!55939 (= res!46572 (isPrefixOf!0 thiss!1379 (_2!2658 lt!87491)))))

(declare-fun b!55940 () Bool)

(declare-fun e!37261 () Bool)

(assert (=> b!55940 (= e!37263 e!37261)))

(declare-fun res!46573 () Bool)

(assert (=> b!55940 (=> (not res!46573) (not e!37261))))

(declare-fun lt!87498 () tuple2!5102)

(assert (=> b!55940 (= res!46573 (and (= (_2!2662 lt!87498) lt!87497) (= (_1!2662 lt!87498) (_2!2658 lt!87493))))))

(assert (=> b!55940 (= lt!87498 (readBitPure!0 (readerFrom!0 (_2!2658 lt!87493) (currentBit!3128 thiss!1379) (currentByte!3133 thiss!1379))))))

(declare-fun b!55941 () Bool)

(declare-fun res!46578 () Bool)

(assert (=> b!55941 (=> (not res!46578) (not e!37262))))

(declare-fun lt!87494 () (_ BitVec 64))

(declare-fun lt!87499 () (_ BitVec 64))

(assert (=> b!55941 (= res!46578 (= (bitIndex!0 (size!1179 (buf!1545 (_2!2658 lt!87491))) (currentByte!3133 (_2!2658 lt!87491)) (currentBit!3128 (_2!2658 lt!87491))) (bvadd lt!87499 lt!87494)))))

(assert (=> b!55941 (or (not (= (bvand lt!87499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!87494 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!87499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!87499 lt!87494) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!55941 (= lt!87494 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!55941 (= lt!87499 (bitIndex!0 (size!1179 (buf!1545 thiss!1379)) (currentByte!3133 thiss!1379) (currentBit!3128 thiss!1379)))))

(declare-fun b!55942 () Bool)

(assert (=> b!55942 (= e!37261 (= (bitIndex!0 (size!1179 (buf!1545 (_1!2662 lt!87498))) (currentByte!3133 (_1!2662 lt!87498)) (currentBit!3128 (_1!2662 lt!87498))) (bitIndex!0 (size!1179 (buf!1545 (_2!2658 lt!87493))) (currentByte!3133 (_2!2658 lt!87493)) (currentBit!3128 (_2!2658 lt!87493)))))))

(declare-fun b!55943 () Bool)

(declare-fun res!46571 () Bool)

(assert (=> b!55943 (=> (not res!46571) (not e!37263))))

(assert (=> b!55943 (= res!46571 (= (bitIndex!0 (size!1179 (buf!1545 (_2!2658 lt!87493))) (currentByte!3133 (_2!2658 lt!87493)) (currentBit!3128 (_2!2658 lt!87493))) (bvadd (bitIndex!0 (size!1179 (buf!1545 thiss!1379)) (currentByte!3133 thiss!1379) (currentBit!3128 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!17802 res!46574) b!55943))

(assert (= (and b!55943 res!46571) b!55936))

(assert (= (and b!55936 res!46575) b!55940))

(assert (= (and b!55940 res!46573) b!55942))

(assert (= (and d!17802 res!46577) b!55941))

(assert (= (and b!55941 res!46578) b!55939))

(assert (= (and b!55939 res!46572) b!55938))

(assert (= (and b!55938 res!46576) b!55937))

(declare-fun m!88125 () Bool)

(assert (=> d!17802 m!88125))

(declare-fun m!88127 () Bool)

(assert (=> d!17802 m!88127))

(declare-fun m!88129 () Bool)

(assert (=> d!17802 m!88129))

(declare-fun m!88131 () Bool)

(assert (=> b!55942 m!88131))

(declare-fun m!88133 () Bool)

(assert (=> b!55942 m!88133))

(declare-fun m!88135 () Bool)

(assert (=> b!55940 m!88135))

(assert (=> b!55940 m!88135))

(declare-fun m!88139 () Bool)

(assert (=> b!55940 m!88139))

(assert (=> b!55943 m!88133))

(assert (=> b!55943 m!88047))

(declare-fun m!88141 () Bool)

(assert (=> b!55936 m!88141))

(declare-fun m!88143 () Bool)

(assert (=> b!55937 m!88143))

(declare-fun m!88145 () Bool)

(assert (=> b!55937 m!88145))

(declare-fun m!88147 () Bool)

(assert (=> b!55938 m!88147))

(declare-fun m!88149 () Bool)

(assert (=> b!55938 m!88149))

(declare-fun m!88151 () Bool)

(assert (=> b!55938 m!88151))

(declare-fun m!88153 () Bool)

(assert (=> b!55939 m!88153))

(assert (=> b!55941 m!88145))

(assert (=> b!55941 m!88047))

(assert (=> b!55865 d!17802))

(declare-fun d!17808 () Bool)

(assert (=> d!17808 (= (array_inv!1082 srcBuffer!2) (bvsge (size!1179 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!11270 d!17808))

(declare-fun d!17810 () Bool)

(assert (=> d!17810 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3128 thiss!1379) (currentByte!3133 thiss!1379) (size!1179 (buf!1545 thiss!1379))))))

(declare-fun bs!4469 () Bool)

(assert (= bs!4469 d!17810))

(declare-fun m!88155 () Bool)

(assert (=> bs!4469 m!88155))

(assert (=> start!11270 d!17810))

(declare-fun d!17812 () Bool)

(assert (=> d!17812 (= (array_inv!1082 (buf!1545 thiss!1379)) (bvsge (size!1179 (buf!1545 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!55866 d!17812))

(declare-fun d!17814 () Bool)

(declare-fun e!37270 () Bool)

(assert (=> d!17814 e!37270))

(declare-fun res!46591 () Bool)

(assert (=> d!17814 (=> (not res!46591) (not e!37270))))

(declare-fun lt!87531 () (_ BitVec 64))

(declare-fun lt!87527 () (_ BitVec 64))

(declare-fun lt!87532 () (_ BitVec 64))

(assert (=> d!17814 (= res!46591 (= lt!87527 (bvsub lt!87532 lt!87531)))))

(assert (=> d!17814 (or (= (bvand lt!87532 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!87531 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!87532 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!87532 lt!87531) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17814 (= lt!87531 (remainingBits!0 ((_ sign_extend 32) (size!1179 (buf!1545 (_2!2658 lt!87426)))) ((_ sign_extend 32) (currentByte!3133 (_2!2658 lt!87426))) ((_ sign_extend 32) (currentBit!3128 (_2!2658 lt!87426)))))))

(declare-fun lt!87529 () (_ BitVec 64))

(declare-fun lt!87528 () (_ BitVec 64))

(assert (=> d!17814 (= lt!87532 (bvmul lt!87529 lt!87528))))

(assert (=> d!17814 (or (= lt!87529 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!87528 (bvsdiv (bvmul lt!87529 lt!87528) lt!87529)))))

(assert (=> d!17814 (= lt!87528 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17814 (= lt!87529 ((_ sign_extend 32) (size!1179 (buf!1545 (_2!2658 lt!87426)))))))

(assert (=> d!17814 (= lt!87527 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3133 (_2!2658 lt!87426))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3128 (_2!2658 lt!87426)))))))

(assert (=> d!17814 (invariant!0 (currentBit!3128 (_2!2658 lt!87426)) (currentByte!3133 (_2!2658 lt!87426)) (size!1179 (buf!1545 (_2!2658 lt!87426))))))

(assert (=> d!17814 (= (bitIndex!0 (size!1179 (buf!1545 (_2!2658 lt!87426))) (currentByte!3133 (_2!2658 lt!87426)) (currentBit!3128 (_2!2658 lt!87426))) lt!87527)))

(declare-fun b!55955 () Bool)

(declare-fun res!46590 () Bool)

(assert (=> b!55955 (=> (not res!46590) (not e!37270))))

(assert (=> b!55955 (= res!46590 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!87527))))

(declare-fun b!55956 () Bool)

(declare-fun lt!87530 () (_ BitVec 64))

(assert (=> b!55956 (= e!37270 (bvsle lt!87527 (bvmul lt!87530 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!55956 (or (= lt!87530 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!87530 #b0000000000000000000000000000000000000000000000000000000000001000) lt!87530)))))

(assert (=> b!55956 (= lt!87530 ((_ sign_extend 32) (size!1179 (buf!1545 (_2!2658 lt!87426)))))))

(assert (= (and d!17814 res!46591) b!55955))

(assert (= (and b!55955 res!46590) b!55956))

(declare-fun m!88159 () Bool)

(assert (=> d!17814 m!88159))

(assert (=> d!17814 m!88017))

(assert (=> b!55861 d!17814))

(declare-fun d!17818 () Bool)

(declare-fun res!46596 () Bool)

(declare-fun e!37273 () Bool)

(assert (=> d!17818 (=> (not res!46596) (not e!37273))))

(assert (=> d!17818 (= res!46596 (= (size!1179 (buf!1545 thiss!1379)) (size!1179 (buf!1545 thiss!1379))))))

(assert (=> d!17818 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!37273)))

(declare-fun b!55959 () Bool)

(declare-fun res!46594 () Bool)

(assert (=> b!55959 (=> (not res!46594) (not e!37273))))

(assert (=> b!55959 (= res!46594 (bvsle (bitIndex!0 (size!1179 (buf!1545 thiss!1379)) (currentByte!3133 thiss!1379) (currentBit!3128 thiss!1379)) (bitIndex!0 (size!1179 (buf!1545 thiss!1379)) (currentByte!3133 thiss!1379) (currentBit!3128 thiss!1379))))))

(declare-fun b!55960 () Bool)

(declare-fun e!37272 () Bool)

(assert (=> b!55960 (= e!37273 e!37272)))

(declare-fun res!46595 () Bool)

(assert (=> b!55960 (=> res!46595 e!37272)))

(assert (=> b!55960 (= res!46595 (= (size!1179 (buf!1545 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!55961 () Bool)

(assert (=> b!55961 (= e!37272 (arrayBitRangesEq!0 (buf!1545 thiss!1379) (buf!1545 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1179 (buf!1545 thiss!1379)) (currentByte!3133 thiss!1379) (currentBit!3128 thiss!1379))))))

(assert (= (and d!17818 res!46596) b!55959))

(assert (= (and b!55959 res!46594) b!55960))

(assert (= (and b!55960 (not res!46595)) b!55961))

(assert (=> b!55959 m!88047))

(assert (=> b!55959 m!88047))

(assert (=> b!55961 m!88047))

(assert (=> b!55961 m!88047))

(declare-fun m!88165 () Bool)

(assert (=> b!55961 m!88165))

(assert (=> b!55862 d!17818))

(declare-fun d!17822 () Bool)

(assert (=> d!17822 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!87541 () Unit!3861)

(declare-fun choose!11 (BitStream!2046) Unit!3861)

(assert (=> d!17822 (= lt!87541 (choose!11 thiss!1379))))

(assert (=> d!17822 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!87541)))

(declare-fun bs!4473 () Bool)

(assert (= bs!4473 d!17822))

(assert (=> bs!4473 m!88043))

(declare-fun m!88173 () Bool)

(assert (=> bs!4473 m!88173))

(assert (=> b!55862 d!17822))

(declare-fun d!17828 () Bool)

(declare-fun e!37276 () Bool)

(assert (=> d!17828 e!37276))

(declare-fun res!46601 () Bool)

(assert (=> d!17828 (=> (not res!46601) (not e!37276))))

(declare-fun lt!87546 () (_ BitVec 64))

(declare-fun lt!87547 () (_ BitVec 64))

(declare-fun lt!87542 () (_ BitVec 64))

(assert (=> d!17828 (= res!46601 (= lt!87542 (bvsub lt!87547 lt!87546)))))

(assert (=> d!17828 (or (= (bvand lt!87547 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!87546 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!87547 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!87547 lt!87546) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17828 (= lt!87546 (remainingBits!0 ((_ sign_extend 32) (size!1179 (buf!1545 thiss!1379))) ((_ sign_extend 32) (currentByte!3133 thiss!1379)) ((_ sign_extend 32) (currentBit!3128 thiss!1379))))))

(declare-fun lt!87544 () (_ BitVec 64))

(declare-fun lt!87543 () (_ BitVec 64))

(assert (=> d!17828 (= lt!87547 (bvmul lt!87544 lt!87543))))

(assert (=> d!17828 (or (= lt!87544 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!87543 (bvsdiv (bvmul lt!87544 lt!87543) lt!87544)))))

(assert (=> d!17828 (= lt!87543 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17828 (= lt!87544 ((_ sign_extend 32) (size!1179 (buf!1545 thiss!1379))))))

(assert (=> d!17828 (= lt!87542 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3133 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3128 thiss!1379))))))

(assert (=> d!17828 (invariant!0 (currentBit!3128 thiss!1379) (currentByte!3133 thiss!1379) (size!1179 (buf!1545 thiss!1379)))))

(assert (=> d!17828 (= (bitIndex!0 (size!1179 (buf!1545 thiss!1379)) (currentByte!3133 thiss!1379) (currentBit!3128 thiss!1379)) lt!87542)))

(declare-fun b!55965 () Bool)

(declare-fun res!46600 () Bool)

(assert (=> b!55965 (=> (not res!46600) (not e!37276))))

(assert (=> b!55965 (= res!46600 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!87542))))

(declare-fun b!55966 () Bool)

(declare-fun lt!87545 () (_ BitVec 64))

(assert (=> b!55966 (= e!37276 (bvsle lt!87542 (bvmul lt!87545 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!55966 (or (= lt!87545 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!87545 #b0000000000000000000000000000000000000000000000000000000000001000) lt!87545)))))

(assert (=> b!55966 (= lt!87545 ((_ sign_extend 32) (size!1179 (buf!1545 thiss!1379))))))

(assert (= (and d!17828 res!46601) b!55965))

(assert (= (and b!55965 res!46600) b!55966))

(declare-fun m!88175 () Bool)

(assert (=> d!17828 m!88175))

(assert (=> d!17828 m!88155))

(assert (=> b!55862 d!17828))

(declare-fun d!17830 () Bool)

(assert (=> d!17830 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1179 (buf!1545 thiss!1379))) ((_ sign_extend 32) (currentByte!3133 thiss!1379)) ((_ sign_extend 32) (currentBit!3128 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1179 (buf!1545 thiss!1379))) ((_ sign_extend 32) (currentByte!3133 thiss!1379)) ((_ sign_extend 32) (currentBit!3128 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4474 () Bool)

(assert (= bs!4474 d!17830))

(assert (=> bs!4474 m!88175))

(assert (=> b!55867 d!17830))

(declare-fun d!17832 () Bool)

(assert (=> d!17832 (= (invariant!0 (currentBit!3128 (_2!2658 lt!87426)) (currentByte!3133 (_2!2658 lt!87426)) (size!1179 (buf!1545 (_2!2658 lt!87426)))) (and (bvsge (currentBit!3128 (_2!2658 lt!87426)) #b00000000000000000000000000000000) (bvslt (currentBit!3128 (_2!2658 lt!87426)) #b00000000000000000000000000001000) (bvsge (currentByte!3133 (_2!2658 lt!87426)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3133 (_2!2658 lt!87426)) (size!1179 (buf!1545 (_2!2658 lt!87426)))) (and (= (currentBit!3128 (_2!2658 lt!87426)) #b00000000000000000000000000000000) (= (currentByte!3133 (_2!2658 lt!87426)) (size!1179 (buf!1545 (_2!2658 lt!87426))))))))))

(assert (=> b!55868 d!17832))

(declare-fun d!17834 () Bool)

(assert (=> d!17834 (= (head!417 (byteArrayBitContentToList!0 (_2!2658 lt!87425) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!713 (byteArrayBitContentToList!0 (_2!2658 lt!87425) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!55863 d!17834))

(declare-fun d!17836 () Bool)

(declare-fun c!4005 () Bool)

(assert (=> d!17836 (= c!4005 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!37282 () List!598)

(assert (=> d!17836 (= (byteArrayBitContentToList!0 (_2!2658 lt!87425) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!37282)))

(declare-fun b!55974 () Bool)

(assert (=> b!55974 (= e!37282 Nil!595)))

(declare-fun b!55975 () Bool)

(assert (=> b!55975 (= e!37282 (Cons!594 (not (= (bvand ((_ sign_extend 24) (select (arr!1728 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2658 lt!87425) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!17836 c!4005) b!55974))

(assert (= (and d!17836 (not c!4005)) b!55975))

(assert (=> b!55975 m!88053))

(assert (=> b!55975 m!88129))

(declare-fun m!88179 () Bool)

(assert (=> b!55975 m!88179))

(assert (=> b!55863 d!17836))

(declare-fun d!17840 () Bool)

(assert (=> d!17840 (= (head!417 (bitStreamReadBitsIntoList!0 (_2!2658 lt!87425) (_1!2659 lt!87420) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!713 (bitStreamReadBitsIntoList!0 (_2!2658 lt!87425) (_1!2659 lt!87420) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!55863 d!17840))

(declare-fun b!55987 () Bool)

(declare-fun e!37288 () Bool)

(declare-fun lt!87557 () List!598)

(declare-fun length!279 (List!598) Int)

(assert (=> b!55987 (= e!37288 (> (length!279 lt!87557) 0))))

(declare-fun b!55986 () Bool)

(declare-fun isEmpty!165 (List!598) Bool)

(assert (=> b!55986 (= e!37288 (isEmpty!165 lt!87557))))

(declare-fun b!55984 () Bool)

(declare-datatypes ((tuple2!5106 0))(
  ( (tuple2!5107 (_1!2664 List!598) (_2!2664 BitStream!2046)) )
))
(declare-fun e!37287 () tuple2!5106)

(assert (=> b!55984 (= e!37287 (tuple2!5107 Nil!595 (_1!2659 lt!87420)))))

(declare-datatypes ((tuple2!5108 0))(
  ( (tuple2!5109 (_1!2665 Bool) (_2!2665 BitStream!2046)) )
))
(declare-fun lt!87559 () tuple2!5108)

(declare-fun b!55985 () Bool)

(declare-fun lt!87558 () (_ BitVec 64))

(assert (=> b!55985 (= e!37287 (tuple2!5107 (Cons!594 (_1!2665 lt!87559) (bitStreamReadBitsIntoList!0 (_2!2658 lt!87425) (_2!2665 lt!87559) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!87558))) (_2!2665 lt!87559)))))

(declare-fun readBit!0 (BitStream!2046) tuple2!5108)

(assert (=> b!55985 (= lt!87559 (readBit!0 (_1!2659 lt!87420)))))

(assert (=> b!55985 (= lt!87558 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!17842 () Bool)

(assert (=> d!17842 e!37288))

(declare-fun c!4011 () Bool)

(assert (=> d!17842 (= c!4011 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17842 (= lt!87557 (_1!2664 e!37287))))

(declare-fun c!4010 () Bool)

(assert (=> d!17842 (= c!4010 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17842 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17842 (= (bitStreamReadBitsIntoList!0 (_2!2658 lt!87425) (_1!2659 lt!87420) #b0000000000000000000000000000000000000000000000000000000000000001) lt!87557)))

(assert (= (and d!17842 c!4010) b!55984))

(assert (= (and d!17842 (not c!4010)) b!55985))

(assert (= (and d!17842 c!4011) b!55986))

(assert (= (and d!17842 (not c!4011)) b!55987))

(declare-fun m!88181 () Bool)

(assert (=> b!55987 m!88181))

(declare-fun m!88183 () Bool)

(assert (=> b!55986 m!88183))

(declare-fun m!88185 () Bool)

(assert (=> b!55985 m!88185))

(declare-fun m!88187 () Bool)

(assert (=> b!55985 m!88187))

(assert (=> b!55863 d!17842))

(declare-fun d!17844 () Bool)

(assert (=> d!17844 (validate_offset_bits!1 ((_ sign_extend 32) (size!1179 (buf!1545 (_2!2658 lt!87425)))) ((_ sign_extend 32) (currentByte!3133 thiss!1379)) ((_ sign_extend 32) (currentBit!3128 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!87562 () Unit!3861)

(declare-fun choose!9 (BitStream!2046 array!2592 (_ BitVec 64) BitStream!2046) Unit!3861)

(assert (=> d!17844 (= lt!87562 (choose!9 thiss!1379 (buf!1545 (_2!2658 lt!87425)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2047 (buf!1545 (_2!2658 lt!87425)) (currentByte!3133 thiss!1379) (currentBit!3128 thiss!1379))))))

(assert (=> d!17844 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1545 (_2!2658 lt!87425)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!87562)))

(declare-fun bs!4475 () Bool)

(assert (= bs!4475 d!17844))

(assert (=> bs!4475 m!88031))

(declare-fun m!88189 () Bool)

(assert (=> bs!4475 m!88189))

(assert (=> b!55869 d!17844))

(declare-fun d!17846 () Bool)

(assert (=> d!17846 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1179 (buf!1545 (_2!2658 lt!87425)))) ((_ sign_extend 32) (currentByte!3133 thiss!1379)) ((_ sign_extend 32) (currentBit!3128 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1179 (buf!1545 (_2!2658 lt!87425)))) ((_ sign_extend 32) (currentByte!3133 thiss!1379)) ((_ sign_extend 32) (currentBit!3128 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4476 () Bool)

(assert (= bs!4476 d!17846))

(declare-fun m!88191 () Bool)

(assert (=> bs!4476 m!88191))

(assert (=> b!55869 d!17846))

(declare-fun d!17848 () Bool)

(declare-fun res!46607 () Bool)

(declare-fun e!37290 () Bool)

(assert (=> d!17848 (=> (not res!46607) (not e!37290))))

(assert (=> d!17848 (= res!46607 (= (size!1179 (buf!1545 (_2!2658 lt!87425))) (size!1179 (buf!1545 (_2!2658 lt!87426)))))))

(assert (=> d!17848 (= (isPrefixOf!0 (_2!2658 lt!87425) (_2!2658 lt!87426)) e!37290)))

(declare-fun b!55988 () Bool)

(declare-fun res!46605 () Bool)

(assert (=> b!55988 (=> (not res!46605) (not e!37290))))

(assert (=> b!55988 (= res!46605 (bvsle (bitIndex!0 (size!1179 (buf!1545 (_2!2658 lt!87425))) (currentByte!3133 (_2!2658 lt!87425)) (currentBit!3128 (_2!2658 lt!87425))) (bitIndex!0 (size!1179 (buf!1545 (_2!2658 lt!87426))) (currentByte!3133 (_2!2658 lt!87426)) (currentBit!3128 (_2!2658 lt!87426)))))))

(declare-fun b!55989 () Bool)

(declare-fun e!37289 () Bool)

(assert (=> b!55989 (= e!37290 e!37289)))

(declare-fun res!46606 () Bool)

(assert (=> b!55989 (=> res!46606 e!37289)))

(assert (=> b!55989 (= res!46606 (= (size!1179 (buf!1545 (_2!2658 lt!87425))) #b00000000000000000000000000000000))))

(declare-fun b!55990 () Bool)

(assert (=> b!55990 (= e!37289 (arrayBitRangesEq!0 (buf!1545 (_2!2658 lt!87425)) (buf!1545 (_2!2658 lt!87426)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1179 (buf!1545 (_2!2658 lt!87425))) (currentByte!3133 (_2!2658 lt!87425)) (currentBit!3128 (_2!2658 lt!87425)))))))

(assert (= (and d!17848 res!46607) b!55988))

(assert (= (and b!55988 res!46605) b!55989))

(assert (= (and b!55989 (not res!46606)) b!55990))

(assert (=> b!55988 m!88117))

(assert (=> b!55988 m!88019))

(assert (=> b!55990 m!88117))

(assert (=> b!55990 m!88117))

(declare-fun m!88193 () Bool)

(assert (=> b!55990 m!88193))

(assert (=> b!55869 d!17848))

(declare-fun d!17850 () Bool)

(declare-fun res!46610 () Bool)

(declare-fun e!37292 () Bool)

(assert (=> d!17850 (=> (not res!46610) (not e!37292))))

(assert (=> d!17850 (= res!46610 (= (size!1179 (buf!1545 thiss!1379)) (size!1179 (buf!1545 (_2!2658 lt!87426)))))))

(assert (=> d!17850 (= (isPrefixOf!0 thiss!1379 (_2!2658 lt!87426)) e!37292)))

(declare-fun b!55991 () Bool)

(declare-fun res!46608 () Bool)

(assert (=> b!55991 (=> (not res!46608) (not e!37292))))

(assert (=> b!55991 (= res!46608 (bvsle (bitIndex!0 (size!1179 (buf!1545 thiss!1379)) (currentByte!3133 thiss!1379) (currentBit!3128 thiss!1379)) (bitIndex!0 (size!1179 (buf!1545 (_2!2658 lt!87426))) (currentByte!3133 (_2!2658 lt!87426)) (currentBit!3128 (_2!2658 lt!87426)))))))

(declare-fun b!55992 () Bool)

(declare-fun e!37291 () Bool)

(assert (=> b!55992 (= e!37292 e!37291)))

(declare-fun res!46609 () Bool)

(assert (=> b!55992 (=> res!46609 e!37291)))

(assert (=> b!55992 (= res!46609 (= (size!1179 (buf!1545 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!55993 () Bool)

(assert (=> b!55993 (= e!37291 (arrayBitRangesEq!0 (buf!1545 thiss!1379) (buf!1545 (_2!2658 lt!87426)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1179 (buf!1545 thiss!1379)) (currentByte!3133 thiss!1379) (currentBit!3128 thiss!1379))))))

(assert (= (and d!17850 res!46610) b!55991))

(assert (= (and b!55991 res!46608) b!55992))

(assert (= (and b!55992 (not res!46609)) b!55993))

(assert (=> b!55991 m!88047))

(assert (=> b!55991 m!88019))

(assert (=> b!55993 m!88047))

(assert (=> b!55993 m!88047))

(declare-fun m!88195 () Bool)

(assert (=> b!55993 m!88195))

(assert (=> b!55869 d!17850))

(declare-fun d!17852 () Bool)

(assert (=> d!17852 (isPrefixOf!0 thiss!1379 (_2!2658 lt!87426))))

(declare-fun lt!87565 () Unit!3861)

(declare-fun choose!30 (BitStream!2046 BitStream!2046 BitStream!2046) Unit!3861)

(assert (=> d!17852 (= lt!87565 (choose!30 thiss!1379 (_2!2658 lt!87425) (_2!2658 lt!87426)))))

(assert (=> d!17852 (isPrefixOf!0 thiss!1379 (_2!2658 lt!87425))))

(assert (=> d!17852 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2658 lt!87425) (_2!2658 lt!87426)) lt!87565)))

(declare-fun bs!4477 () Bool)

(assert (= bs!4477 d!17852))

(assert (=> bs!4477 m!88035))

(declare-fun m!88197 () Bool)

(assert (=> bs!4477 m!88197))

(assert (=> bs!4477 m!88055))

(assert (=> b!55869 d!17852))

(declare-fun b!56013 () Bool)

(declare-fun e!37303 () Unit!3861)

(declare-fun Unit!3865 () Unit!3861)

(assert (=> b!56013 (= e!37303 Unit!3865)))

(declare-fun b!56014 () Bool)

(declare-fun res!46626 () Bool)

(declare-fun e!37304 () Bool)

(assert (=> b!56014 (=> (not res!46626) (not e!37304))))

(declare-fun lt!87624 () tuple2!5096)

(assert (=> b!56014 (= res!46626 (isPrefixOf!0 (_1!2659 lt!87624) thiss!1379))))

(declare-fun d!17854 () Bool)

(assert (=> d!17854 e!37304))

(declare-fun res!46627 () Bool)

(assert (=> d!17854 (=> (not res!46627) (not e!37304))))

(assert (=> d!17854 (= res!46627 (isPrefixOf!0 (_1!2659 lt!87624) (_2!2659 lt!87624)))))

(declare-fun lt!87610 () BitStream!2046)

(assert (=> d!17854 (= lt!87624 (tuple2!5097 lt!87610 (_2!2658 lt!87425)))))

(declare-fun lt!87621 () Unit!3861)

(declare-fun lt!87622 () Unit!3861)

(assert (=> d!17854 (= lt!87621 lt!87622)))

(assert (=> d!17854 (isPrefixOf!0 lt!87610 (_2!2658 lt!87425))))

(assert (=> d!17854 (= lt!87622 (lemmaIsPrefixTransitive!0 lt!87610 (_2!2658 lt!87425) (_2!2658 lt!87425)))))

(declare-fun lt!87615 () Unit!3861)

(declare-fun lt!87608 () Unit!3861)

(assert (=> d!17854 (= lt!87615 lt!87608)))

(assert (=> d!17854 (isPrefixOf!0 lt!87610 (_2!2658 lt!87425))))

(assert (=> d!17854 (= lt!87608 (lemmaIsPrefixTransitive!0 lt!87610 thiss!1379 (_2!2658 lt!87425)))))

(declare-fun lt!87611 () Unit!3861)

(assert (=> d!17854 (= lt!87611 e!37303)))

(declare-fun c!4014 () Bool)

(assert (=> d!17854 (= c!4014 (not (= (size!1179 (buf!1545 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!87607 () Unit!3861)

(declare-fun lt!87614 () Unit!3861)

(assert (=> d!17854 (= lt!87607 lt!87614)))

(assert (=> d!17854 (isPrefixOf!0 (_2!2658 lt!87425) (_2!2658 lt!87425))))

(assert (=> d!17854 (= lt!87614 (lemmaIsPrefixRefl!0 (_2!2658 lt!87425)))))

(declare-fun lt!87619 () Unit!3861)

(declare-fun lt!87609 () Unit!3861)

(assert (=> d!17854 (= lt!87619 lt!87609)))

(assert (=> d!17854 (= lt!87609 (lemmaIsPrefixRefl!0 (_2!2658 lt!87425)))))

(declare-fun lt!87625 () Unit!3861)

(declare-fun lt!87606 () Unit!3861)

(assert (=> d!17854 (= lt!87625 lt!87606)))

(assert (=> d!17854 (isPrefixOf!0 lt!87610 lt!87610)))

(assert (=> d!17854 (= lt!87606 (lemmaIsPrefixRefl!0 lt!87610))))

(declare-fun lt!87623 () Unit!3861)

(declare-fun lt!87612 () Unit!3861)

(assert (=> d!17854 (= lt!87623 lt!87612)))

(assert (=> d!17854 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!17854 (= lt!87612 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!17854 (= lt!87610 (BitStream!2047 (buf!1545 (_2!2658 lt!87425)) (currentByte!3133 thiss!1379) (currentBit!3128 thiss!1379)))))

(assert (=> d!17854 (isPrefixOf!0 thiss!1379 (_2!2658 lt!87425))))

(assert (=> d!17854 (= (reader!0 thiss!1379 (_2!2658 lt!87425)) lt!87624)))

(declare-fun b!56015 () Bool)

(declare-fun lt!87617 () (_ BitVec 64))

(declare-fun lt!87620 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2046 (_ BitVec 64)) BitStream!2046)

(assert (=> b!56015 (= e!37304 (= (_1!2659 lt!87624) (withMovedBitIndex!0 (_2!2659 lt!87624) (bvsub lt!87617 lt!87620))))))

(assert (=> b!56015 (or (= (bvand lt!87617 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!87620 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!87617 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!87617 lt!87620) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56015 (= lt!87620 (bitIndex!0 (size!1179 (buf!1545 (_2!2658 lt!87425))) (currentByte!3133 (_2!2658 lt!87425)) (currentBit!3128 (_2!2658 lt!87425))))))

(assert (=> b!56015 (= lt!87617 (bitIndex!0 (size!1179 (buf!1545 thiss!1379)) (currentByte!3133 thiss!1379) (currentBit!3128 thiss!1379)))))

(declare-fun b!56016 () Bool)

(declare-fun lt!87613 () Unit!3861)

(assert (=> b!56016 (= e!37303 lt!87613)))

(declare-fun lt!87616 () (_ BitVec 64))

(assert (=> b!56016 (= lt!87616 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87618 () (_ BitVec 64))

(assert (=> b!56016 (= lt!87618 (bitIndex!0 (size!1179 (buf!1545 thiss!1379)) (currentByte!3133 thiss!1379) (currentBit!3128 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2592 array!2592 (_ BitVec 64) (_ BitVec 64)) Unit!3861)

(assert (=> b!56016 (= lt!87613 (arrayBitRangesEqSymmetric!0 (buf!1545 thiss!1379) (buf!1545 (_2!2658 lt!87425)) lt!87616 lt!87618))))

(assert (=> b!56016 (arrayBitRangesEq!0 (buf!1545 (_2!2658 lt!87425)) (buf!1545 thiss!1379) lt!87616 lt!87618)))

(declare-fun b!56017 () Bool)

(declare-fun res!46628 () Bool)

(assert (=> b!56017 (=> (not res!46628) (not e!37304))))

(assert (=> b!56017 (= res!46628 (isPrefixOf!0 (_2!2659 lt!87624) (_2!2658 lt!87425)))))

(assert (= (and d!17854 c!4014) b!56016))

(assert (= (and d!17854 (not c!4014)) b!56013))

(assert (= (and d!17854 res!46627) b!56014))

(assert (= (and b!56014 res!46626) b!56017))

(assert (= (and b!56017 res!46628) b!56015))

(declare-fun m!88203 () Bool)

(assert (=> b!56014 m!88203))

(assert (=> b!56016 m!88047))

(declare-fun m!88205 () Bool)

(assert (=> b!56016 m!88205))

(declare-fun m!88207 () Bool)

(assert (=> b!56016 m!88207))

(declare-fun m!88209 () Bool)

(assert (=> b!56017 m!88209))

(declare-fun m!88211 () Bool)

(assert (=> b!56015 m!88211))

(assert (=> b!56015 m!88117))

(assert (=> b!56015 m!88047))

(assert (=> d!17854 m!88043))

(declare-fun m!88213 () Bool)

(assert (=> d!17854 m!88213))

(declare-fun m!88215 () Bool)

(assert (=> d!17854 m!88215))

(assert (=> d!17854 m!88055))

(declare-fun m!88217 () Bool)

(assert (=> d!17854 m!88217))

(declare-fun m!88219 () Bool)

(assert (=> d!17854 m!88219))

(declare-fun m!88221 () Bool)

(assert (=> d!17854 m!88221))

(declare-fun m!88223 () Bool)

(assert (=> d!17854 m!88223))

(declare-fun m!88225 () Bool)

(assert (=> d!17854 m!88225))

(assert (=> d!17854 m!88045))

(declare-fun m!88227 () Bool)

(assert (=> d!17854 m!88227))

(assert (=> b!55869 d!17854))

(declare-fun b!56136 () Bool)

(declare-fun e!37359 () Bool)

(declare-fun lt!88102 () tuple2!5094)

(declare-fun lt!88137 () tuple2!5096)

(assert (=> b!56136 (= e!37359 (= (bitStreamReadBitsIntoList!0 (_2!2658 lt!88102) (_1!2659 lt!88137) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2658 lt!88102) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!56136 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56136 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!88095 () Unit!3861)

(declare-fun lt!88132 () Unit!3861)

(assert (=> b!56136 (= lt!88095 lt!88132)))

(declare-fun lt!88133 () (_ BitVec 64))

(assert (=> b!56136 (validate_offset_bits!1 ((_ sign_extend 32) (size!1179 (buf!1545 (_2!2658 lt!88102)))) ((_ sign_extend 32) (currentByte!3133 (_2!2658 lt!87425))) ((_ sign_extend 32) (currentBit!3128 (_2!2658 lt!87425))) lt!88133)))

(assert (=> b!56136 (= lt!88132 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2658 lt!87425) (buf!1545 (_2!2658 lt!88102)) lt!88133))))

(declare-fun e!37357 () Bool)

(assert (=> b!56136 e!37357))

(declare-fun res!46727 () Bool)

(assert (=> b!56136 (=> (not res!46727) (not e!37357))))

(assert (=> b!56136 (= res!46727 (and (= (size!1179 (buf!1545 (_2!2658 lt!87425))) (size!1179 (buf!1545 (_2!2658 lt!88102)))) (bvsge lt!88133 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56136 (= lt!88133 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!56136 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56136 (= lt!88137 (reader!0 (_2!2658 lt!87425) (_2!2658 lt!88102)))))

(declare-fun b!56138 () Bool)

(declare-fun res!46725 () Bool)

(assert (=> b!56138 (=> (not res!46725) (not e!37359))))

(assert (=> b!56138 (= res!46725 (invariant!0 (currentBit!3128 (_2!2658 lt!88102)) (currentByte!3133 (_2!2658 lt!88102)) (size!1179 (buf!1545 (_2!2658 lt!88102)))))))

(declare-fun b!56139 () Bool)

(declare-fun e!37358 () tuple2!5094)

(declare-fun lt!88131 () tuple2!5094)

(declare-fun Unit!3866 () Unit!3861)

(assert (=> b!56139 (= e!37358 (tuple2!5095 Unit!3866 (_2!2658 lt!88131)))))

(declare-fun lt!88126 () tuple2!5094)

(assert (=> b!56139 (= lt!88126 (appendBitFromByte!0 (_2!2658 lt!87425) (select (arr!1728 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!88096 () (_ BitVec 64))

(assert (=> b!56139 (= lt!88096 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!88129 () (_ BitVec 64))

(assert (=> b!56139 (= lt!88129 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!88105 () Unit!3861)

(assert (=> b!56139 (= lt!88105 (validateOffsetBitsIneqLemma!0 (_2!2658 lt!87425) (_2!2658 lt!88126) lt!88096 lt!88129))))

(assert (=> b!56139 (validate_offset_bits!1 ((_ sign_extend 32) (size!1179 (buf!1545 (_2!2658 lt!88126)))) ((_ sign_extend 32) (currentByte!3133 (_2!2658 lt!88126))) ((_ sign_extend 32) (currentBit!3128 (_2!2658 lt!88126))) (bvsub lt!88096 lt!88129))))

(declare-fun lt!88112 () Unit!3861)

(assert (=> b!56139 (= lt!88112 lt!88105)))

(declare-fun lt!88108 () tuple2!5096)

(assert (=> b!56139 (= lt!88108 (reader!0 (_2!2658 lt!87425) (_2!2658 lt!88126)))))

(declare-fun lt!88101 () (_ BitVec 64))

(assert (=> b!56139 (= lt!88101 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!88111 () Unit!3861)

(assert (=> b!56139 (= lt!88111 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2658 lt!87425) (buf!1545 (_2!2658 lt!88126)) lt!88101))))

(assert (=> b!56139 (validate_offset_bits!1 ((_ sign_extend 32) (size!1179 (buf!1545 (_2!2658 lt!88126)))) ((_ sign_extend 32) (currentByte!3133 (_2!2658 lt!87425))) ((_ sign_extend 32) (currentBit!3128 (_2!2658 lt!87425))) lt!88101)))

(declare-fun lt!88134 () Unit!3861)

(assert (=> b!56139 (= lt!88134 lt!88111)))

(assert (=> b!56139 (= (head!417 (byteArrayBitContentToList!0 (_2!2658 lt!88126) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!417 (bitStreamReadBitsIntoList!0 (_2!2658 lt!88126) (_1!2659 lt!88108) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!88098 () Unit!3861)

(declare-fun Unit!3867 () Unit!3861)

(assert (=> b!56139 (= lt!88098 Unit!3867)))

(assert (=> b!56139 (= lt!88131 (appendBitsMSBFirstLoop!0 (_2!2658 lt!88126) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!88130 () Unit!3861)

(assert (=> b!56139 (= lt!88130 (lemmaIsPrefixTransitive!0 (_2!2658 lt!87425) (_2!2658 lt!88126) (_2!2658 lt!88131)))))

(assert (=> b!56139 (isPrefixOf!0 (_2!2658 lt!87425) (_2!2658 lt!88131))))

(declare-fun lt!88118 () Unit!3861)

(assert (=> b!56139 (= lt!88118 lt!88130)))

(assert (=> b!56139 (= (size!1179 (buf!1545 (_2!2658 lt!88131))) (size!1179 (buf!1545 (_2!2658 lt!87425))))))

(declare-fun lt!88120 () Unit!3861)

(declare-fun Unit!3868 () Unit!3861)

(assert (=> b!56139 (= lt!88120 Unit!3868)))

(assert (=> b!56139 (= (bitIndex!0 (size!1179 (buf!1545 (_2!2658 lt!88131))) (currentByte!3133 (_2!2658 lt!88131)) (currentBit!3128 (_2!2658 lt!88131))) (bvsub (bvadd (bitIndex!0 (size!1179 (buf!1545 (_2!2658 lt!87425))) (currentByte!3133 (_2!2658 lt!87425)) (currentBit!3128 (_2!2658 lt!87425))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!88135 () Unit!3861)

(declare-fun Unit!3869 () Unit!3861)

(assert (=> b!56139 (= lt!88135 Unit!3869)))

(assert (=> b!56139 (= (bitIndex!0 (size!1179 (buf!1545 (_2!2658 lt!88131))) (currentByte!3133 (_2!2658 lt!88131)) (currentBit!3128 (_2!2658 lt!88131))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1179 (buf!1545 (_2!2658 lt!88126))) (currentByte!3133 (_2!2658 lt!88126)) (currentBit!3128 (_2!2658 lt!88126))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!88100 () Unit!3861)

(declare-fun Unit!3870 () Unit!3861)

(assert (=> b!56139 (= lt!88100 Unit!3870)))

(declare-fun lt!88115 () tuple2!5096)

(assert (=> b!56139 (= lt!88115 (reader!0 (_2!2658 lt!87425) (_2!2658 lt!88131)))))

(declare-fun lt!88122 () (_ BitVec 64))

(assert (=> b!56139 (= lt!88122 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!88107 () Unit!3861)

(assert (=> b!56139 (= lt!88107 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2658 lt!87425) (buf!1545 (_2!2658 lt!88131)) lt!88122))))

(assert (=> b!56139 (validate_offset_bits!1 ((_ sign_extend 32) (size!1179 (buf!1545 (_2!2658 lt!88131)))) ((_ sign_extend 32) (currentByte!3133 (_2!2658 lt!87425))) ((_ sign_extend 32) (currentBit!3128 (_2!2658 lt!87425))) lt!88122)))

(declare-fun lt!88124 () Unit!3861)

(assert (=> b!56139 (= lt!88124 lt!88107)))

(declare-fun lt!88099 () tuple2!5096)

(declare-fun call!727 () tuple2!5096)

(assert (=> b!56139 (= lt!88099 call!727)))

(declare-fun lt!88117 () (_ BitVec 64))

(assert (=> b!56139 (= lt!88117 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!88110 () Unit!3861)

(assert (=> b!56139 (= lt!88110 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2658 lt!88126) (buf!1545 (_2!2658 lt!88131)) lt!88117))))

(assert (=> b!56139 (validate_offset_bits!1 ((_ sign_extend 32) (size!1179 (buf!1545 (_2!2658 lt!88131)))) ((_ sign_extend 32) (currentByte!3133 (_2!2658 lt!88126))) ((_ sign_extend 32) (currentBit!3128 (_2!2658 lt!88126))) lt!88117)))

(declare-fun lt!88138 () Unit!3861)

(assert (=> b!56139 (= lt!88138 lt!88110)))

(declare-fun lt!88114 () List!598)

(assert (=> b!56139 (= lt!88114 (byteArrayBitContentToList!0 (_2!2658 lt!88131) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!88121 () List!598)

(assert (=> b!56139 (= lt!88121 (byteArrayBitContentToList!0 (_2!2658 lt!88131) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!88106 () List!598)

(assert (=> b!56139 (= lt!88106 (bitStreamReadBitsIntoList!0 (_2!2658 lt!88131) (_1!2659 lt!88115) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!88113 () List!598)

(assert (=> b!56139 (= lt!88113 (bitStreamReadBitsIntoList!0 (_2!2658 lt!88131) (_1!2659 lt!88099) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!88109 () (_ BitVec 64))

(assert (=> b!56139 (= lt!88109 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!88125 () Unit!3861)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2046 BitStream!2046 BitStream!2046 BitStream!2046 (_ BitVec 64) List!598) Unit!3861)

(assert (=> b!56139 (= lt!88125 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2658 lt!88131) (_2!2658 lt!88131) (_1!2659 lt!88115) (_1!2659 lt!88099) lt!88109 lt!88106))))

(declare-fun tail!267 (List!598) List!598)

(assert (=> b!56139 (= (bitStreamReadBitsIntoList!0 (_2!2658 lt!88131) (_1!2659 lt!88099) (bvsub lt!88109 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!267 lt!88106))))

(declare-fun lt!88104 () Unit!3861)

(assert (=> b!56139 (= lt!88104 lt!88125)))

(declare-fun lt!88136 () Unit!3861)

(declare-fun lt!88116 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2592 array!2592 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3861)

(assert (=> b!56139 (= lt!88136 (arrayBitRangesEqImpliesEq!0 (buf!1545 (_2!2658 lt!88126)) (buf!1545 (_2!2658 lt!88131)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!88116 (bitIndex!0 (size!1179 (buf!1545 (_2!2658 lt!88126))) (currentByte!3133 (_2!2658 lt!88126)) (currentBit!3128 (_2!2658 lt!88126)))))))

(declare-fun bitAt!0 (array!2592 (_ BitVec 64)) Bool)

(assert (=> b!56139 (= (bitAt!0 (buf!1545 (_2!2658 lt!88126)) lt!88116) (bitAt!0 (buf!1545 (_2!2658 lt!88131)) lt!88116))))

(declare-fun lt!88097 () Unit!3861)

(assert (=> b!56139 (= lt!88097 lt!88136)))

(declare-fun c!4026 () Bool)

(declare-fun bm!724 () Bool)

(assert (=> bm!724 (= call!727 (reader!0 (ite c!4026 (_2!2658 lt!88126) (_2!2658 lt!87425)) (ite c!4026 (_2!2658 lt!88131) (_2!2658 lt!87425))))))

(declare-fun b!56140 () Bool)

(declare-fun res!46726 () Bool)

(assert (=> b!56140 (=> (not res!46726) (not e!37359))))

(assert (=> b!56140 (= res!46726 (isPrefixOf!0 (_2!2658 lt!87425) (_2!2658 lt!88102)))))

(declare-fun b!56141 () Bool)

(declare-fun res!46729 () Bool)

(assert (=> b!56141 (=> (not res!46729) (not e!37359))))

(assert (=> b!56141 (= res!46729 (= (size!1179 (buf!1545 (_2!2658 lt!88102))) (size!1179 (buf!1545 (_2!2658 lt!87425)))))))

(declare-fun b!56142 () Bool)

(declare-fun res!46724 () Bool)

(assert (=> b!56142 (=> (not res!46724) (not e!37359))))

(assert (=> b!56142 (= res!46724 (= (size!1179 (buf!1545 (_2!2658 lt!87425))) (size!1179 (buf!1545 (_2!2658 lt!88102)))))))

(declare-fun b!56143 () Bool)

(assert (=> b!56143 (= e!37357 (validate_offset_bits!1 ((_ sign_extend 32) (size!1179 (buf!1545 (_2!2658 lt!87425)))) ((_ sign_extend 32) (currentByte!3133 (_2!2658 lt!87425))) ((_ sign_extend 32) (currentBit!3128 (_2!2658 lt!87425))) lt!88133))))

(declare-fun b!56137 () Bool)

(declare-fun Unit!3871 () Unit!3861)

(assert (=> b!56137 (= e!37358 (tuple2!5095 Unit!3871 (_2!2658 lt!87425)))))

(assert (=> b!56137 (= (size!1179 (buf!1545 (_2!2658 lt!87425))) (size!1179 (buf!1545 (_2!2658 lt!87425))))))

(declare-fun lt!88127 () Unit!3861)

(declare-fun Unit!3872 () Unit!3861)

(assert (=> b!56137 (= lt!88127 Unit!3872)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2046 array!2592 array!2592 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!56137 (checkByteArrayBitContent!0 (_2!2658 lt!87425) srcBuffer!2 (_1!2663 (readBits!0 (_1!2659 call!727) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun d!17860 () Bool)

(assert (=> d!17860 e!37359))

(declare-fun res!46728 () Bool)

(assert (=> d!17860 (=> (not res!46728) (not e!37359))))

(declare-fun lt!88128 () (_ BitVec 64))

(assert (=> d!17860 (= res!46728 (= (bitIndex!0 (size!1179 (buf!1545 (_2!2658 lt!88102))) (currentByte!3133 (_2!2658 lt!88102)) (currentBit!3128 (_2!2658 lt!88102))) (bvsub lt!88128 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!17860 (or (= (bvand lt!88128 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!88128 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!88128 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!88119 () (_ BitVec 64))

(assert (=> d!17860 (= lt!88128 (bvadd lt!88119 to!314))))

(assert (=> d!17860 (or (not (= (bvand lt!88119 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!88119 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!88119 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17860 (= lt!88119 (bitIndex!0 (size!1179 (buf!1545 (_2!2658 lt!87425))) (currentByte!3133 (_2!2658 lt!87425)) (currentBit!3128 (_2!2658 lt!87425))))))

(assert (=> d!17860 (= lt!88102 e!37358)))

(assert (=> d!17860 (= c!4026 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!88103 () Unit!3861)

(declare-fun lt!88123 () Unit!3861)

(assert (=> d!17860 (= lt!88103 lt!88123)))

(assert (=> d!17860 (isPrefixOf!0 (_2!2658 lt!87425) (_2!2658 lt!87425))))

(assert (=> d!17860 (= lt!88123 (lemmaIsPrefixRefl!0 (_2!2658 lt!87425)))))

(assert (=> d!17860 (= lt!88116 (bitIndex!0 (size!1179 (buf!1545 (_2!2658 lt!87425))) (currentByte!3133 (_2!2658 lt!87425)) (currentBit!3128 (_2!2658 lt!87425))))))

(assert (=> d!17860 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17860 (= (appendBitsMSBFirstLoop!0 (_2!2658 lt!87425) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!88102)))

(assert (= (and d!17860 c!4026) b!56139))

(assert (= (and d!17860 (not c!4026)) b!56137))

(assert (= (or b!56139 b!56137) bm!724))

(assert (= (and d!17860 res!46728) b!56138))

(assert (= (and b!56138 res!46725) b!56142))

(assert (= (and b!56142 res!46724) b!56140))

(assert (= (and b!56140 res!46726) b!56141))

(assert (= (and b!56141 res!46729) b!56136))

(assert (= (and b!56136 res!46727) b!56143))

(declare-fun m!88481 () Bool)

(assert (=> b!56140 m!88481))

(declare-fun m!88483 () Bool)

(assert (=> bm!724 m!88483))

(declare-fun m!88485 () Bool)

(assert (=> b!56139 m!88485))

(declare-fun m!88487 () Bool)

(assert (=> b!56139 m!88487))

(declare-fun m!88489 () Bool)

(assert (=> b!56139 m!88489))

(declare-fun m!88491 () Bool)

(assert (=> b!56139 m!88491))

(declare-fun m!88493 () Bool)

(assert (=> b!56139 m!88493))

(declare-fun m!88495 () Bool)

(assert (=> b!56139 m!88495))

(declare-fun m!88497 () Bool)

(assert (=> b!56139 m!88497))

(declare-fun m!88499 () Bool)

(assert (=> b!56139 m!88499))

(declare-fun m!88501 () Bool)

(assert (=> b!56139 m!88501))

(declare-fun m!88503 () Bool)

(assert (=> b!56139 m!88503))

(declare-fun m!88505 () Bool)

(assert (=> b!56139 m!88505))

(declare-fun m!88507 () Bool)

(assert (=> b!56139 m!88507))

(declare-fun m!88509 () Bool)

(assert (=> b!56139 m!88509))

(declare-fun m!88511 () Bool)

(assert (=> b!56139 m!88511))

(declare-fun m!88513 () Bool)

(assert (=> b!56139 m!88513))

(declare-fun m!88515 () Bool)

(assert (=> b!56139 m!88515))

(declare-fun m!88517 () Bool)

(assert (=> b!56139 m!88517))

(declare-fun m!88519 () Bool)

(assert (=> b!56139 m!88519))

(assert (=> b!56139 m!88117))

(declare-fun m!88521 () Bool)

(assert (=> b!56139 m!88521))

(declare-fun m!88523 () Bool)

(assert (=> b!56139 m!88523))

(declare-fun m!88525 () Bool)

(assert (=> b!56139 m!88525))

(declare-fun m!88527 () Bool)

(assert (=> b!56139 m!88527))

(declare-fun m!88529 () Bool)

(assert (=> b!56139 m!88529))

(assert (=> b!56139 m!88523))

(assert (=> b!56139 m!88513))

(declare-fun m!88531 () Bool)

(assert (=> b!56139 m!88531))

(declare-fun m!88533 () Bool)

(assert (=> b!56139 m!88533))

(declare-fun m!88535 () Bool)

(assert (=> b!56139 m!88535))

(declare-fun m!88537 () Bool)

(assert (=> b!56139 m!88537))

(assert (=> b!56139 m!88505))

(declare-fun m!88539 () Bool)

(assert (=> b!56139 m!88539))

(declare-fun m!88541 () Bool)

(assert (=> b!56139 m!88541))

(declare-fun m!88543 () Bool)

(assert (=> b!56139 m!88543))

(declare-fun m!88545 () Bool)

(assert (=> b!56139 m!88545))

(assert (=> b!56139 m!88499))

(declare-fun m!88547 () Bool)

(assert (=> b!56138 m!88547))

(declare-fun m!88549 () Bool)

(assert (=> b!56143 m!88549))

(declare-fun m!88551 () Bool)

(assert (=> b!56137 m!88551))

(declare-fun m!88553 () Bool)

(assert (=> b!56137 m!88553))

(declare-fun m!88555 () Bool)

(assert (=> d!17860 m!88555))

(assert (=> d!17860 m!88117))

(assert (=> d!17860 m!88221))

(assert (=> d!17860 m!88225))

(declare-fun m!88557 () Bool)

(assert (=> b!56136 m!88557))

(declare-fun m!88559 () Bool)

(assert (=> b!56136 m!88559))

(declare-fun m!88561 () Bool)

(assert (=> b!56136 m!88561))

(declare-fun m!88563 () Bool)

(assert (=> b!56136 m!88563))

(declare-fun m!88565 () Bool)

(assert (=> b!56136 m!88565))

(assert (=> b!55869 d!17860))

(check-sat (not d!17810) (not b!56014) (not b!55909) (not b!55941) (not b!55985) (not b!55993) (not b!56143) (not b!56140) (not b!55937) (not b!56138) (not d!17798) (not b!56139) (not b!55907) (not d!17800) (not b!56016) (not bm!724) (not d!17822) (not d!17830) (not d!17846) (not d!17828) (not b!56017) (not b!56137) (not b!55961) (not b!55987) (not d!17844) (not b!56015) (not b!55943) (not d!17854) (not b!55988) (not b!55939) (not b!55942) (not b!55936) (not b!55940) (not d!17852) (not b!55991) (not b!55990) (not d!17860) (not d!17814) (not d!17802) (not b!55938) (not b!55975) (not b!55912) (not b!55986) (not b!56136) (not b!55959))
