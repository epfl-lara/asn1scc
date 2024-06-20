; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43968 () Bool)

(assert start!43968)

(declare-fun b!209308 () Bool)

(declare-fun res!175702 () Bool)

(declare-fun e!142893 () Bool)

(assert (=> b!209308 (=> res!175702 e!142893)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!209308 (= res!175702 (bvsge i!590 nBits!348))))

(declare-fun b!209309 () Bool)

(declare-fun e!142901 () Bool)

(declare-fun e!142892 () Bool)

(assert (=> b!209309 (= e!142901 e!142892)))

(declare-fun res!175684 () Bool)

(assert (=> b!209309 (=> res!175684 e!142892)))

(declare-fun lt!327758 () (_ BitVec 64))

(declare-fun lt!327756 () (_ BitVec 64))

(assert (=> b!209309 (= res!175684 (not (= lt!327758 (bvsub (bvsub (bvadd lt!327756 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-datatypes ((array!10466 0))(
  ( (array!10467 (arr!5530 (Array (_ BitVec 32) (_ BitVec 8))) (size!4600 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8308 0))(
  ( (BitStream!8309 (buf!5114 array!10466) (currentByte!9650 (_ BitVec 32)) (currentBit!9645 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14911 0))(
  ( (Unit!14912) )
))
(declare-datatypes ((tuple2!17942 0))(
  ( (tuple2!17943 (_1!9626 Unit!14911) (_2!9626 BitStream!8308)) )
))
(declare-fun lt!327768 () tuple2!17942)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!209309 (= lt!327758 (bitIndex!0 (size!4600 (buf!5114 (_2!9626 lt!327768))) (currentByte!9650 (_2!9626 lt!327768)) (currentBit!9645 (_2!9626 lt!327768))))))

(declare-fun thiss!1204 () BitStream!8308)

(declare-fun isPrefixOf!0 (BitStream!8308 BitStream!8308) Bool)

(assert (=> b!209309 (isPrefixOf!0 thiss!1204 (_2!9626 lt!327768))))

(declare-fun lt!327753 () Unit!14911)

(declare-fun lt!327761 () tuple2!17942)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8308 BitStream!8308 BitStream!8308) Unit!14911)

(assert (=> b!209309 (= lt!327753 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9626 lt!327761) (_2!9626 lt!327768)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8308 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17942)

(assert (=> b!209309 (= lt!327768 (appendBitsLSBFirstLoopTR!0 (_2!9626 lt!327761) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!209310 () Bool)

(declare-fun res!175692 () Bool)

(assert (=> b!209310 (=> res!175692 e!142892)))

(declare-fun lt!327749 () (_ BitVec 64))

(assert (=> b!209310 (= res!175692 (or (not (= (size!4600 (buf!5114 (_2!9626 lt!327768))) (size!4600 (buf!5114 thiss!1204)))) (not (= lt!327758 (bvsub (bvadd lt!327749 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!209311 () Bool)

(declare-fun e!142898 () Bool)

(declare-datatypes ((tuple2!17944 0))(
  ( (tuple2!17945 (_1!9627 BitStream!8308) (_2!9627 Bool)) )
))
(declare-fun lt!327755 () tuple2!17944)

(declare-fun lt!327763 () tuple2!17944)

(assert (=> b!209311 (= e!142898 (= (_2!9627 lt!327755) (_2!9627 lt!327763)))))

(declare-fun b!209312 () Bool)

(declare-fun lt!327757 () (_ BitVec 64))

(assert (=> b!209312 (= e!142893 (= (bvand lt!327757 #b1111111111111111111111111111111111111111111111111111111111111111) lt!327757))))

(declare-fun b!209313 () Bool)

(declare-fun res!175698 () Bool)

(declare-fun e!142899 () Bool)

(assert (=> b!209313 (=> (not res!175698) (not e!142899))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!209313 (= res!175698 (invariant!0 (currentBit!9645 thiss!1204) (currentByte!9650 thiss!1204) (size!4600 (buf!5114 thiss!1204))))))

(declare-fun b!209314 () Bool)

(declare-fun res!175690 () Bool)

(assert (=> b!209314 (=> res!175690 e!142892)))

(assert (=> b!209314 (= res!175690 (not (isPrefixOf!0 thiss!1204 (_2!9626 lt!327761))))))

(declare-fun b!209315 () Bool)

(declare-fun res!175689 () Bool)

(assert (=> b!209315 (=> res!175689 e!142893)))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!209315 (= res!175689 (not (= (bvand lt!327757 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!209316 () Bool)

(declare-fun e!142902 () Bool)

(declare-fun e!142897 () Bool)

(assert (=> b!209316 (= e!142902 e!142897)))

(declare-fun res!175688 () Bool)

(assert (=> b!209316 (=> (not res!175688) (not e!142897))))

(declare-fun lt!327752 () (_ BitVec 64))

(declare-fun lt!327765 () (_ BitVec 64))

(assert (=> b!209316 (= res!175688 (= lt!327752 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!327765)))))

(assert (=> b!209316 (= lt!327752 (bitIndex!0 (size!4600 (buf!5114 (_2!9626 lt!327761))) (currentByte!9650 (_2!9626 lt!327761)) (currentBit!9645 (_2!9626 lt!327761))))))

(assert (=> b!209316 (= lt!327765 (bitIndex!0 (size!4600 (buf!5114 thiss!1204)) (currentByte!9650 thiss!1204) (currentBit!9645 thiss!1204)))))

(declare-fun b!209317 () Bool)

(declare-fun e!142895 () Bool)

(declare-fun lt!327764 () tuple2!17944)

(assert (=> b!209317 (= e!142895 (= (bitIndex!0 (size!4600 (buf!5114 (_1!9627 lt!327764))) (currentByte!9650 (_1!9627 lt!327764)) (currentBit!9645 (_1!9627 lt!327764))) lt!327752))))

(declare-fun b!209318 () Bool)

(declare-fun e!142896 () Bool)

(declare-fun array_inv!4341 (array!10466) Bool)

(assert (=> b!209318 (= e!142896 (array_inv!4341 (buf!5114 thiss!1204)))))

(declare-fun res!175696 () Bool)

(declare-fun e!142900 () Bool)

(assert (=> start!43968 (=> (not res!175696) (not e!142900))))

(assert (=> start!43968 (= res!175696 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43968 e!142900))

(assert (=> start!43968 true))

(declare-fun inv!12 (BitStream!8308) Bool)

(assert (=> start!43968 (and (inv!12 thiss!1204) e!142896)))

(declare-fun b!209319 () Bool)

(declare-fun res!175693 () Bool)

(assert (=> b!209319 (=> (not res!175693) (not e!142897))))

(assert (=> b!209319 (= res!175693 (isPrefixOf!0 thiss!1204 (_2!9626 lt!327761)))))

(declare-fun b!209320 () Bool)

(declare-fun e!142891 () Bool)

(assert (=> b!209320 (= e!142891 (invariant!0 (currentBit!9645 thiss!1204) (currentByte!9650 thiss!1204) (size!4600 (buf!5114 (_2!9626 lt!327768)))))))

(declare-fun b!209321 () Bool)

(declare-fun res!175699 () Bool)

(assert (=> b!209321 (=> res!175699 e!142893)))

(declare-datatypes ((tuple2!17946 0))(
  ( (tuple2!17947 (_1!9628 BitStream!8308) (_2!9628 BitStream!8308)) )
))
(declare-fun lt!327748 () tuple2!17946)

(declare-fun lt!327762 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!209321 (= res!175699 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4600 (buf!5114 (_1!9628 lt!327748)))) ((_ sign_extend 32) (currentByte!9650 (_1!9628 lt!327748))) ((_ sign_extend 32) (currentBit!9645 (_1!9628 lt!327748))) lt!327762)))))

(declare-fun b!209322 () Bool)

(assert (=> b!209322 (= e!142900 e!142899)))

(declare-fun res!175691 () Bool)

(assert (=> b!209322 (=> (not res!175691) (not e!142899))))

(assert (=> b!209322 (= res!175691 (validate_offset_bits!1 ((_ sign_extend 32) (size!4600 (buf!5114 thiss!1204))) ((_ sign_extend 32) (currentByte!9650 thiss!1204)) ((_ sign_extend 32) (currentBit!9645 thiss!1204)) lt!327762))))

(assert (=> b!209322 (= lt!327762 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!209323 () Bool)

(assert (=> b!209323 (= e!142899 (not e!142901))))

(declare-fun res!175687 () Bool)

(assert (=> b!209323 (=> res!175687 e!142901)))

(assert (=> b!209323 (= res!175687 (not (= lt!327756 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!327749))))))

(assert (=> b!209323 (= lt!327756 (bitIndex!0 (size!4600 (buf!5114 (_2!9626 lt!327761))) (currentByte!9650 (_2!9626 lt!327761)) (currentBit!9645 (_2!9626 lt!327761))))))

(assert (=> b!209323 (= lt!327749 (bitIndex!0 (size!4600 (buf!5114 thiss!1204)) (currentByte!9650 thiss!1204) (currentBit!9645 thiss!1204)))))

(assert (=> b!209323 e!142902))

(declare-fun res!175685 () Bool)

(assert (=> b!209323 (=> (not res!175685) (not e!142902))))

(assert (=> b!209323 (= res!175685 (= (size!4600 (buf!5114 thiss!1204)) (size!4600 (buf!5114 (_2!9626 lt!327761)))))))

(declare-fun lt!327747 () Bool)

(declare-fun appendBit!0 (BitStream!8308 Bool) tuple2!17942)

(assert (=> b!209323 (= lt!327761 (appendBit!0 thiss!1204 lt!327747))))

(declare-fun lt!327769 () (_ BitVec 64))

(assert (=> b!209323 (= lt!327747 (not (= (bvand v!189 lt!327769) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209323 (= lt!327769 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!209324 () Bool)

(assert (=> b!209324 (= e!142897 e!142895)))

(declare-fun res!175700 () Bool)

(assert (=> b!209324 (=> (not res!175700) (not e!142895))))

(assert (=> b!209324 (= res!175700 (and (= (_2!9627 lt!327764) lt!327747) (= (_1!9627 lt!327764) (_2!9626 lt!327761))))))

(declare-fun readBitPure!0 (BitStream!8308) tuple2!17944)

(declare-fun readerFrom!0 (BitStream!8308 (_ BitVec 32) (_ BitVec 32)) BitStream!8308)

(assert (=> b!209324 (= lt!327764 (readBitPure!0 (readerFrom!0 (_2!9626 lt!327761) (currentBit!9645 thiss!1204) (currentByte!9650 thiss!1204))))))

(declare-fun b!209325 () Bool)

(assert (=> b!209325 (= e!142892 e!142893)))

(declare-fun res!175695 () Bool)

(assert (=> b!209325 (=> res!175695 e!142893)))

(declare-fun lt!327751 () tuple2!17946)

(declare-fun lt!327766 () tuple2!17944)

(declare-datatypes ((tuple2!17948 0))(
  ( (tuple2!17949 (_1!9629 BitStream!8308) (_2!9629 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8308 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17948)

(assert (=> b!209325 (= res!175695 (not (= (_1!9629 (readNBitsLSBFirstsLoopPure!0 (_1!9628 lt!327751) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!327757 (ite (_2!9627 lt!327766) lt!327769 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9628 lt!327751))))))

(declare-fun lt!327759 () (_ BitVec 64))

(assert (=> b!209325 (validate_offset_bits!1 ((_ sign_extend 32) (size!4600 (buf!5114 (_2!9626 lt!327768)))) ((_ sign_extend 32) (currentByte!9650 (_2!9626 lt!327761))) ((_ sign_extend 32) (currentBit!9645 (_2!9626 lt!327761))) lt!327759)))

(declare-fun lt!327760 () Unit!14911)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8308 array!10466 (_ BitVec 64)) Unit!14911)

(assert (=> b!209325 (= lt!327760 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9626 lt!327761) (buf!5114 (_2!9626 lt!327768)) lt!327759))))

(assert (=> b!209325 (= lt!327759 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!327754 () tuple2!17948)

(assert (=> b!209325 (= lt!327754 (readNBitsLSBFirstsLoopPure!0 (_1!9628 lt!327748) nBits!348 i!590 lt!327757))))

(assert (=> b!209325 (validate_offset_bits!1 ((_ sign_extend 32) (size!4600 (buf!5114 (_2!9626 lt!327768)))) ((_ sign_extend 32) (currentByte!9650 thiss!1204)) ((_ sign_extend 32) (currentBit!9645 thiss!1204)) lt!327762)))

(declare-fun lt!327767 () Unit!14911)

(assert (=> b!209325 (= lt!327767 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5114 (_2!9626 lt!327768)) lt!327762))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!209325 (= lt!327757 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!209325 (= (_2!9627 lt!327766) lt!327747)))

(assert (=> b!209325 (= lt!327766 (readBitPure!0 (_1!9628 lt!327748)))))

(declare-fun reader!0 (BitStream!8308 BitStream!8308) tuple2!17946)

(assert (=> b!209325 (= lt!327751 (reader!0 (_2!9626 lt!327761) (_2!9626 lt!327768)))))

(assert (=> b!209325 (= lt!327748 (reader!0 thiss!1204 (_2!9626 lt!327768)))))

(assert (=> b!209325 e!142898))

(declare-fun res!175701 () Bool)

(assert (=> b!209325 (=> (not res!175701) (not e!142898))))

(assert (=> b!209325 (= res!175701 (= (bitIndex!0 (size!4600 (buf!5114 (_1!9627 lt!327755))) (currentByte!9650 (_1!9627 lt!327755)) (currentBit!9645 (_1!9627 lt!327755))) (bitIndex!0 (size!4600 (buf!5114 (_1!9627 lt!327763))) (currentByte!9650 (_1!9627 lt!327763)) (currentBit!9645 (_1!9627 lt!327763)))))))

(declare-fun lt!327770 () Unit!14911)

(declare-fun lt!327750 () BitStream!8308)

(declare-fun readBitPrefixLemma!0 (BitStream!8308 BitStream!8308) Unit!14911)

(assert (=> b!209325 (= lt!327770 (readBitPrefixLemma!0 lt!327750 (_2!9626 lt!327768)))))

(assert (=> b!209325 (= lt!327763 (readBitPure!0 (BitStream!8309 (buf!5114 (_2!9626 lt!327768)) (currentByte!9650 thiss!1204) (currentBit!9645 thiss!1204))))))

(assert (=> b!209325 (= lt!327755 (readBitPure!0 lt!327750))))

(assert (=> b!209325 e!142891))

(declare-fun res!175703 () Bool)

(assert (=> b!209325 (=> (not res!175703) (not e!142891))))

(assert (=> b!209325 (= res!175703 (invariant!0 (currentBit!9645 thiss!1204) (currentByte!9650 thiss!1204) (size!4600 (buf!5114 (_2!9626 lt!327761)))))))

(assert (=> b!209325 (= lt!327750 (BitStream!8309 (buf!5114 (_2!9626 lt!327761)) (currentByte!9650 thiss!1204) (currentBit!9645 thiss!1204)))))

(declare-fun b!209326 () Bool)

(declare-fun res!175686 () Bool)

(assert (=> b!209326 (=> res!175686 e!142892)))

(assert (=> b!209326 (= res!175686 (not (invariant!0 (currentBit!9645 (_2!9626 lt!327768)) (currentByte!9650 (_2!9626 lt!327768)) (size!4600 (buf!5114 (_2!9626 lt!327768))))))))

(declare-fun b!209327 () Bool)

(declare-fun res!175694 () Bool)

(assert (=> b!209327 (=> (not res!175694) (not e!142899))))

(assert (=> b!209327 (= res!175694 (not (= i!590 nBits!348)))))

(declare-fun b!209328 () Bool)

(declare-fun res!175697 () Bool)

(assert (=> b!209328 (=> res!175697 e!142892)))

(assert (=> b!209328 (= res!175697 (not (isPrefixOf!0 (_2!9626 lt!327761) (_2!9626 lt!327768))))))

(assert (= (and start!43968 res!175696) b!209322))

(assert (= (and b!209322 res!175691) b!209313))

(assert (= (and b!209313 res!175698) b!209327))

(assert (= (and b!209327 res!175694) b!209323))

(assert (= (and b!209323 res!175685) b!209316))

(assert (= (and b!209316 res!175688) b!209319))

(assert (= (and b!209319 res!175693) b!209324))

(assert (= (and b!209324 res!175700) b!209317))

(assert (= (and b!209323 (not res!175687)) b!209309))

(assert (= (and b!209309 (not res!175684)) b!209326))

(assert (= (and b!209326 (not res!175686)) b!209310))

(assert (= (and b!209310 (not res!175692)) b!209328))

(assert (= (and b!209328 (not res!175697)) b!209314))

(assert (= (and b!209314 (not res!175690)) b!209325))

(assert (= (and b!209325 res!175703) b!209320))

(assert (= (and b!209325 res!175701) b!209311))

(assert (= (and b!209325 (not res!175695)) b!209308))

(assert (= (and b!209308 (not res!175702)) b!209321))

(assert (= (and b!209321 (not res!175699)) b!209315))

(assert (= (and b!209315 (not res!175689)) b!209312))

(assert (= start!43968 b!209318))

(declare-fun m!322143 () Bool)

(assert (=> b!209316 m!322143))

(declare-fun m!322145 () Bool)

(assert (=> b!209316 m!322145))

(declare-fun m!322147 () Bool)

(assert (=> b!209326 m!322147))

(declare-fun m!322149 () Bool)

(assert (=> b!209309 m!322149))

(declare-fun m!322151 () Bool)

(assert (=> b!209309 m!322151))

(declare-fun m!322153 () Bool)

(assert (=> b!209309 m!322153))

(declare-fun m!322155 () Bool)

(assert (=> b!209309 m!322155))

(declare-fun m!322157 () Bool)

(assert (=> b!209324 m!322157))

(assert (=> b!209324 m!322157))

(declare-fun m!322159 () Bool)

(assert (=> b!209324 m!322159))

(declare-fun m!322161 () Bool)

(assert (=> b!209322 m!322161))

(declare-fun m!322163 () Bool)

(assert (=> b!209317 m!322163))

(declare-fun m!322165 () Bool)

(assert (=> b!209325 m!322165))

(declare-fun m!322167 () Bool)

(assert (=> b!209325 m!322167))

(declare-fun m!322169 () Bool)

(assert (=> b!209325 m!322169))

(declare-fun m!322171 () Bool)

(assert (=> b!209325 m!322171))

(declare-fun m!322173 () Bool)

(assert (=> b!209325 m!322173))

(declare-fun m!322175 () Bool)

(assert (=> b!209325 m!322175))

(declare-fun m!322177 () Bool)

(assert (=> b!209325 m!322177))

(declare-fun m!322179 () Bool)

(assert (=> b!209325 m!322179))

(declare-fun m!322181 () Bool)

(assert (=> b!209325 m!322181))

(declare-fun m!322183 () Bool)

(assert (=> b!209325 m!322183))

(declare-fun m!322185 () Bool)

(assert (=> b!209325 m!322185))

(declare-fun m!322187 () Bool)

(assert (=> b!209325 m!322187))

(declare-fun m!322189 () Bool)

(assert (=> b!209325 m!322189))

(declare-fun m!322191 () Bool)

(assert (=> b!209325 m!322191))

(declare-fun m!322193 () Bool)

(assert (=> b!209325 m!322193))

(declare-fun m!322195 () Bool)

(assert (=> b!209325 m!322195))

(declare-fun m!322197 () Bool)

(assert (=> b!209319 m!322197))

(assert (=> b!209323 m!322143))

(assert (=> b!209323 m!322145))

(declare-fun m!322199 () Bool)

(assert (=> b!209323 m!322199))

(assert (=> b!209314 m!322197))

(declare-fun m!322201 () Bool)

(assert (=> b!209315 m!322201))

(declare-fun m!322203 () Bool)

(assert (=> b!209320 m!322203))

(declare-fun m!322205 () Bool)

(assert (=> start!43968 m!322205))

(declare-fun m!322207 () Bool)

(assert (=> b!209328 m!322207))

(declare-fun m!322209 () Bool)

(assert (=> b!209313 m!322209))

(declare-fun m!322211 () Bool)

(assert (=> b!209318 m!322211))

(declare-fun m!322213 () Bool)

(assert (=> b!209321 m!322213))

(push 1)

