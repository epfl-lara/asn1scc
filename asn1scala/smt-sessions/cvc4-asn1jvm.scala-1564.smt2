; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43978 () Bool)

(assert start!43978)

(declare-fun b!209599 () Bool)

(declare-fun e!143079 () Bool)

(declare-datatypes ((array!10476 0))(
  ( (array!10477 (arr!5535 (Array (_ BitVec 32) (_ BitVec 8))) (size!4605 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8318 0))(
  ( (BitStream!8319 (buf!5119 array!10476) (currentByte!9655 (_ BitVec 32)) (currentBit!9650 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!17982 0))(
  ( (tuple2!17983 (_1!9646 BitStream!8318) (_2!9646 Bool)) )
))
(declare-fun lt!328149 () tuple2!17982)

(declare-fun lt!328139 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!209599 (= e!143079 (= (bitIndex!0 (size!4605 (buf!5119 (_1!9646 lt!328149))) (currentByte!9655 (_1!9646 lt!328149)) (currentBit!9650 (_1!9646 lt!328149))) lt!328139))))

(declare-fun b!209601 () Bool)

(declare-fun res!175973 () Bool)

(declare-fun e!143073 () Bool)

(assert (=> b!209601 (=> (not res!175973) (not e!143073))))

(declare-fun thiss!1204 () BitStream!8318)

(declare-datatypes ((Unit!14921 0))(
  ( (Unit!14922) )
))
(declare-datatypes ((tuple2!17984 0))(
  ( (tuple2!17985 (_1!9647 Unit!14921) (_2!9647 BitStream!8318)) )
))
(declare-fun lt!328143 () tuple2!17984)

(declare-fun isPrefixOf!0 (BitStream!8318 BitStream!8318) Bool)

(assert (=> b!209601 (= res!175973 (isPrefixOf!0 thiss!1204 (_2!9647 lt!328143)))))

(declare-fun b!209602 () Bool)

(declare-fun res!175963 () Bool)

(declare-fun e!143072 () Bool)

(assert (=> b!209602 (=> (not res!175963) (not e!143072))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!209602 (= res!175963 (invariant!0 (currentBit!9650 thiss!1204) (currentByte!9655 thiss!1204) (size!4605 (buf!5119 thiss!1204))))))

(declare-fun b!209603 () Bool)

(declare-fun e!143081 () Bool)

(declare-fun array_inv!4346 (array!10476) Bool)

(assert (=> b!209603 (= e!143081 (array_inv!4346 (buf!5119 thiss!1204)))))

(declare-fun b!209604 () Bool)

(declare-fun res!175968 () Bool)

(declare-fun e!143076 () Bool)

(assert (=> b!209604 (=> res!175968 e!143076)))

(assert (=> b!209604 (= res!175968 (not (isPrefixOf!0 thiss!1204 (_2!9647 lt!328143))))))

(declare-fun b!209605 () Bool)

(declare-fun res!175972 () Bool)

(assert (=> b!209605 (=> (not res!175972) (not e!143072))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!209605 (= res!175972 (not (= i!590 nBits!348)))))

(declare-fun lt!328157 () (_ BitVec 64))

(declare-fun lt!328142 () (_ BitVec 64))

(declare-fun e!143082 () Bool)

(declare-fun b!209606 () Bool)

(declare-fun lt!328163 () (_ BitVec 64))

(assert (=> b!209606 (= e!143082 (or (= lt!328163 (bvand lt!328157 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!328163 (bvand (bvsub lt!328142 lt!328157) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!209606 (= lt!328163 (bvand lt!328142 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!17986 0))(
  ( (tuple2!17987 (_1!9648 BitStream!8318) (_2!9648 (_ BitVec 64))) )
))
(declare-fun lt!328160 () tuple2!17986)

(declare-fun lt!328162 () tuple2!17986)

(assert (=> b!209606 (and (= (_2!9648 lt!328160) (_2!9648 lt!328162)) (= (_1!9648 lt!328160) (_1!9648 lt!328162)))))

(declare-fun lt!328144 () Unit!14921)

(declare-fun lt!328145 () (_ BitVec 64))

(declare-datatypes ((tuple2!17988 0))(
  ( (tuple2!17989 (_1!9649 BitStream!8318) (_2!9649 BitStream!8318)) )
))
(declare-fun lt!328140 () tuple2!17988)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8318 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14921)

(assert (=> b!209606 (= lt!328144 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9649 lt!328140) nBits!348 i!590 lt!328145))))

(declare-fun lt!328152 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8318 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17986)

(declare-fun withMovedBitIndex!0 (BitStream!8318 (_ BitVec 64)) BitStream!8318)

(assert (=> b!209606 (= lt!328162 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9649 lt!328140) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!328152))))

(declare-fun b!209607 () Bool)

(declare-fun res!175961 () Bool)

(assert (=> b!209607 (=> res!175961 e!143076)))

(declare-fun lt!328153 () tuple2!17984)

(assert (=> b!209607 (= res!175961 (or (not (= (size!4605 (buf!5119 (_2!9647 lt!328153))) (size!4605 (buf!5119 thiss!1204)))) (not (= lt!328157 (bvsub (bvadd lt!328142 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!209608 () Bool)

(assert (=> b!209608 (= e!143076 e!143082)))

(declare-fun res!175975 () Bool)

(assert (=> b!209608 (=> res!175975 e!143082)))

(declare-fun lt!328146 () tuple2!17988)

(assert (=> b!209608 (= res!175975 (not (= (_1!9648 (readNBitsLSBFirstsLoopPure!0 (_1!9649 lt!328146) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!328152)) (_2!9649 lt!328146))))))

(declare-fun lt!328148 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!209608 (validate_offset_bits!1 ((_ sign_extend 32) (size!4605 (buf!5119 (_2!9647 lt!328153)))) ((_ sign_extend 32) (currentByte!9655 (_2!9647 lt!328143))) ((_ sign_extend 32) (currentBit!9650 (_2!9647 lt!328143))) lt!328148)))

(declare-fun lt!328156 () Unit!14921)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8318 array!10476 (_ BitVec 64)) Unit!14921)

(assert (=> b!209608 (= lt!328156 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9647 lt!328143) (buf!5119 (_2!9647 lt!328153)) lt!328148))))

(assert (=> b!209608 (= lt!328148 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!328166 () tuple2!17982)

(declare-fun lt!328155 () (_ BitVec 64))

(assert (=> b!209608 (= lt!328152 (bvor lt!328145 (ite (_2!9646 lt!328166) lt!328155 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209608 (= lt!328160 (readNBitsLSBFirstsLoopPure!0 (_1!9649 lt!328140) nBits!348 i!590 lt!328145))))

(declare-fun lt!328165 () (_ BitVec 64))

(assert (=> b!209608 (validate_offset_bits!1 ((_ sign_extend 32) (size!4605 (buf!5119 (_2!9647 lt!328153)))) ((_ sign_extend 32) (currentByte!9655 thiss!1204)) ((_ sign_extend 32) (currentBit!9650 thiss!1204)) lt!328165)))

(declare-fun lt!328158 () Unit!14921)

(assert (=> b!209608 (= lt!328158 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5119 (_2!9647 lt!328153)) lt!328165))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!209608 (= lt!328145 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!328150 () Bool)

(assert (=> b!209608 (= (_2!9646 lt!328166) lt!328150)))

(declare-fun readBitPure!0 (BitStream!8318) tuple2!17982)

(assert (=> b!209608 (= lt!328166 (readBitPure!0 (_1!9649 lt!328140)))))

(declare-fun reader!0 (BitStream!8318 BitStream!8318) tuple2!17988)

(assert (=> b!209608 (= lt!328146 (reader!0 (_2!9647 lt!328143) (_2!9647 lt!328153)))))

(assert (=> b!209608 (= lt!328140 (reader!0 thiss!1204 (_2!9647 lt!328153)))))

(declare-fun e!143074 () Bool)

(assert (=> b!209608 e!143074))

(declare-fun res!175962 () Bool)

(assert (=> b!209608 (=> (not res!175962) (not e!143074))))

(declare-fun lt!328151 () tuple2!17982)

(declare-fun lt!328141 () tuple2!17982)

(assert (=> b!209608 (= res!175962 (= (bitIndex!0 (size!4605 (buf!5119 (_1!9646 lt!328151))) (currentByte!9655 (_1!9646 lt!328151)) (currentBit!9650 (_1!9646 lt!328151))) (bitIndex!0 (size!4605 (buf!5119 (_1!9646 lt!328141))) (currentByte!9655 (_1!9646 lt!328141)) (currentBit!9650 (_1!9646 lt!328141)))))))

(declare-fun lt!328154 () Unit!14921)

(declare-fun lt!328147 () BitStream!8318)

(declare-fun readBitPrefixLemma!0 (BitStream!8318 BitStream!8318) Unit!14921)

(assert (=> b!209608 (= lt!328154 (readBitPrefixLemma!0 lt!328147 (_2!9647 lt!328153)))))

(assert (=> b!209608 (= lt!328141 (readBitPure!0 (BitStream!8319 (buf!5119 (_2!9647 lt!328153)) (currentByte!9655 thiss!1204) (currentBit!9650 thiss!1204))))))

(assert (=> b!209608 (= lt!328151 (readBitPure!0 lt!328147))))

(declare-fun e!143078 () Bool)

(assert (=> b!209608 e!143078))

(declare-fun res!175967 () Bool)

(assert (=> b!209608 (=> (not res!175967) (not e!143078))))

(assert (=> b!209608 (= res!175967 (invariant!0 (currentBit!9650 thiss!1204) (currentByte!9655 thiss!1204) (size!4605 (buf!5119 (_2!9647 lt!328143)))))))

(assert (=> b!209608 (= lt!328147 (BitStream!8319 (buf!5119 (_2!9647 lt!328143)) (currentByte!9655 thiss!1204) (currentBit!9650 thiss!1204)))))

(declare-fun b!209609 () Bool)

(assert (=> b!209609 (= e!143074 (= (_2!9646 lt!328151) (_2!9646 lt!328141)))))

(declare-fun b!209610 () Bool)

(assert (=> b!209610 (= e!143078 (invariant!0 (currentBit!9650 thiss!1204) (currentByte!9655 thiss!1204) (size!4605 (buf!5119 (_2!9647 lt!328153)))))))

(declare-fun res!175976 () Bool)

(declare-fun e!143080 () Bool)

(assert (=> start!43978 (=> (not res!175976) (not e!143080))))

(assert (=> start!43978 (= res!175976 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43978 e!143080))

(assert (=> start!43978 true))

(declare-fun inv!12 (BitStream!8318) Bool)

(assert (=> start!43978 (and (inv!12 thiss!1204) e!143081)))

(declare-fun b!209600 () Bool)

(assert (=> b!209600 (= e!143073 e!143079)))

(declare-fun res!175971 () Bool)

(assert (=> b!209600 (=> (not res!175971) (not e!143079))))

(assert (=> b!209600 (= res!175971 (and (= (_2!9646 lt!328149) lt!328150) (= (_1!9646 lt!328149) (_2!9647 lt!328143))))))

(declare-fun readerFrom!0 (BitStream!8318 (_ BitVec 32) (_ BitVec 32)) BitStream!8318)

(assert (=> b!209600 (= lt!328149 (readBitPure!0 (readerFrom!0 (_2!9647 lt!328143) (currentBit!9650 thiss!1204) (currentByte!9655 thiss!1204))))))

(declare-fun b!209611 () Bool)

(declare-fun res!175966 () Bool)

(assert (=> b!209611 (=> res!175966 e!143076)))

(assert (=> b!209611 (= res!175966 (not (isPrefixOf!0 (_2!9647 lt!328143) (_2!9647 lt!328153))))))

(declare-fun b!209612 () Bool)

(declare-fun res!175964 () Bool)

(assert (=> b!209612 (=> res!175964 e!143076)))

(assert (=> b!209612 (= res!175964 (not (invariant!0 (currentBit!9650 (_2!9647 lt!328153)) (currentByte!9655 (_2!9647 lt!328153)) (size!4605 (buf!5119 (_2!9647 lt!328153))))))))

(declare-fun b!209613 () Bool)

(declare-fun e!143071 () Bool)

(assert (=> b!209613 (= e!143072 (not e!143071))))

(declare-fun res!175969 () Bool)

(assert (=> b!209613 (=> res!175969 e!143071)))

(declare-fun lt!328161 () (_ BitVec 64))

(assert (=> b!209613 (= res!175969 (not (= lt!328161 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!328142))))))

(assert (=> b!209613 (= lt!328161 (bitIndex!0 (size!4605 (buf!5119 (_2!9647 lt!328143))) (currentByte!9655 (_2!9647 lt!328143)) (currentBit!9650 (_2!9647 lt!328143))))))

(assert (=> b!209613 (= lt!328142 (bitIndex!0 (size!4605 (buf!5119 thiss!1204)) (currentByte!9655 thiss!1204) (currentBit!9650 thiss!1204)))))

(declare-fun e!143075 () Bool)

(assert (=> b!209613 e!143075))

(declare-fun res!175960 () Bool)

(assert (=> b!209613 (=> (not res!175960) (not e!143075))))

(assert (=> b!209613 (= res!175960 (= (size!4605 (buf!5119 thiss!1204)) (size!4605 (buf!5119 (_2!9647 lt!328143)))))))

(declare-fun appendBit!0 (BitStream!8318 Bool) tuple2!17984)

(assert (=> b!209613 (= lt!328143 (appendBit!0 thiss!1204 lt!328150))))

(assert (=> b!209613 (= lt!328150 (not (= (bvand v!189 lt!328155) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209613 (= lt!328155 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!209614 () Bool)

(assert (=> b!209614 (= e!143071 e!143076)))

(declare-fun res!175970 () Bool)

(assert (=> b!209614 (=> res!175970 e!143076)))

(assert (=> b!209614 (= res!175970 (not (= lt!328157 (bvsub (bvsub (bvadd lt!328161 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!209614 (= lt!328157 (bitIndex!0 (size!4605 (buf!5119 (_2!9647 lt!328153))) (currentByte!9655 (_2!9647 lt!328153)) (currentBit!9650 (_2!9647 lt!328153))))))

(assert (=> b!209614 (isPrefixOf!0 thiss!1204 (_2!9647 lt!328153))))

(declare-fun lt!328164 () Unit!14921)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8318 BitStream!8318 BitStream!8318) Unit!14921)

(assert (=> b!209614 (= lt!328164 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9647 lt!328143) (_2!9647 lt!328153)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8318 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17984)

(assert (=> b!209614 (= lt!328153 (appendBitsLSBFirstLoopTR!0 (_2!9647 lt!328143) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!209615 () Bool)

(assert (=> b!209615 (= e!143080 e!143072)))

(declare-fun res!175974 () Bool)

(assert (=> b!209615 (=> (not res!175974) (not e!143072))))

(assert (=> b!209615 (= res!175974 (validate_offset_bits!1 ((_ sign_extend 32) (size!4605 (buf!5119 thiss!1204))) ((_ sign_extend 32) (currentByte!9655 thiss!1204)) ((_ sign_extend 32) (currentBit!9650 thiss!1204)) lt!328165))))

(assert (=> b!209615 (= lt!328165 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!209616 () Bool)

(assert (=> b!209616 (= e!143075 e!143073)))

(declare-fun res!175965 () Bool)

(assert (=> b!209616 (=> (not res!175965) (not e!143073))))

(declare-fun lt!328159 () (_ BitVec 64))

(assert (=> b!209616 (= res!175965 (= lt!328139 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!328159)))))

(assert (=> b!209616 (= lt!328139 (bitIndex!0 (size!4605 (buf!5119 (_2!9647 lt!328143))) (currentByte!9655 (_2!9647 lt!328143)) (currentBit!9650 (_2!9647 lt!328143))))))

(assert (=> b!209616 (= lt!328159 (bitIndex!0 (size!4605 (buf!5119 thiss!1204)) (currentByte!9655 thiss!1204) (currentBit!9650 thiss!1204)))))

(assert (= (and start!43978 res!175976) b!209615))

(assert (= (and b!209615 res!175974) b!209602))

(assert (= (and b!209602 res!175963) b!209605))

(assert (= (and b!209605 res!175972) b!209613))

(assert (= (and b!209613 res!175960) b!209616))

(assert (= (and b!209616 res!175965) b!209601))

(assert (= (and b!209601 res!175973) b!209600))

(assert (= (and b!209600 res!175971) b!209599))

(assert (= (and b!209613 (not res!175969)) b!209614))

(assert (= (and b!209614 (not res!175970)) b!209612))

(assert (= (and b!209612 (not res!175964)) b!209607))

(assert (= (and b!209607 (not res!175961)) b!209611))

(assert (= (and b!209611 (not res!175966)) b!209604))

(assert (= (and b!209604 (not res!175968)) b!209608))

(assert (= (and b!209608 res!175967) b!209610))

(assert (= (and b!209608 res!175962) b!209609))

(assert (= (and b!209608 (not res!175975)) b!209606))

(assert (= start!43978 b!209603))

(declare-fun m!322507 () Bool)

(assert (=> b!209613 m!322507))

(declare-fun m!322509 () Bool)

(assert (=> b!209613 m!322509))

(declare-fun m!322511 () Bool)

(assert (=> b!209613 m!322511))

(declare-fun m!322513 () Bool)

(assert (=> start!43978 m!322513))

(declare-fun m!322515 () Bool)

(assert (=> b!209601 m!322515))

(declare-fun m!322517 () Bool)

(assert (=> b!209615 m!322517))

(assert (=> b!209616 m!322507))

(assert (=> b!209616 m!322509))

(declare-fun m!322519 () Bool)

(assert (=> b!209610 m!322519))

(declare-fun m!322521 () Bool)

(assert (=> b!209600 m!322521))

(assert (=> b!209600 m!322521))

(declare-fun m!322523 () Bool)

(assert (=> b!209600 m!322523))

(declare-fun m!322525 () Bool)

(assert (=> b!209603 m!322525))

(declare-fun m!322527 () Bool)

(assert (=> b!209611 m!322527))

(declare-fun m!322529 () Bool)

(assert (=> b!209614 m!322529))

(declare-fun m!322531 () Bool)

(assert (=> b!209614 m!322531))

(declare-fun m!322533 () Bool)

(assert (=> b!209614 m!322533))

(declare-fun m!322535 () Bool)

(assert (=> b!209614 m!322535))

(assert (=> b!209604 m!322515))

(declare-fun m!322537 () Bool)

(assert (=> b!209606 m!322537))

(declare-fun m!322539 () Bool)

(assert (=> b!209606 m!322539))

(assert (=> b!209606 m!322539))

(declare-fun m!322541 () Bool)

(assert (=> b!209606 m!322541))

(declare-fun m!322543 () Bool)

(assert (=> b!209602 m!322543))

(declare-fun m!322545 () Bool)

(assert (=> b!209612 m!322545))

(declare-fun m!322547 () Bool)

(assert (=> b!209608 m!322547))

(declare-fun m!322549 () Bool)

(assert (=> b!209608 m!322549))

(declare-fun m!322551 () Bool)

(assert (=> b!209608 m!322551))

(declare-fun m!322553 () Bool)

(assert (=> b!209608 m!322553))

(declare-fun m!322555 () Bool)

(assert (=> b!209608 m!322555))

(declare-fun m!322557 () Bool)

(assert (=> b!209608 m!322557))

(declare-fun m!322559 () Bool)

(assert (=> b!209608 m!322559))

(declare-fun m!322561 () Bool)

(assert (=> b!209608 m!322561))

(declare-fun m!322563 () Bool)

(assert (=> b!209608 m!322563))

(declare-fun m!322565 () Bool)

(assert (=> b!209608 m!322565))

(declare-fun m!322567 () Bool)

(assert (=> b!209608 m!322567))

(declare-fun m!322569 () Bool)

(assert (=> b!209608 m!322569))

(declare-fun m!322571 () Bool)

(assert (=> b!209608 m!322571))

(declare-fun m!322573 () Bool)

(assert (=> b!209608 m!322573))

(declare-fun m!322575 () Bool)

(assert (=> b!209608 m!322575))

(declare-fun m!322577 () Bool)

(assert (=> b!209608 m!322577))

(declare-fun m!322579 () Bool)

(assert (=> b!209599 m!322579))

(push 1)

(assert (not b!209614))

(assert (not b!209606))

(assert (not b!209613))

(assert (not b!209611))

(assert (not b!209610))

(assert (not b!209601))

(assert (not b!209604))

(assert (not b!209608))

(assert (not b!209603))

(assert (not start!43978))

(assert (not b!209612))

(assert (not b!209602))

(assert (not b!209600))

(assert (not b!209615))

(assert (not b!209616))

(assert (not b!209599))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!70875 () Bool)

(assert (=> d!70875 (= (invariant!0 (currentBit!9650 (_2!9647 lt!328153)) (currentByte!9655 (_2!9647 lt!328153)) (size!4605 (buf!5119 (_2!9647 lt!328153)))) (and (bvsge (currentBit!9650 (_2!9647 lt!328153)) #b00000000000000000000000000000000) (bvslt (currentBit!9650 (_2!9647 lt!328153)) #b00000000000000000000000000001000) (bvsge (currentByte!9655 (_2!9647 lt!328153)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9655 (_2!9647 lt!328153)) (size!4605 (buf!5119 (_2!9647 lt!328153)))) (and (= (currentBit!9650 (_2!9647 lt!328153)) #b00000000000000000000000000000000) (= (currentByte!9655 (_2!9647 lt!328153)) (size!4605 (buf!5119 (_2!9647 lt!328153))))))))))

(assert (=> b!209612 d!70875))

(declare-fun d!70879 () Bool)

(declare-fun e!143126 () Bool)

(assert (=> d!70879 e!143126))

(declare-fun res!176046 () Bool)

(assert (=> d!70879 (=> (not res!176046) (not e!143126))))

(declare-fun lt!328376 () (_ BitVec 64))

(declare-fun lt!328377 () (_ BitVec 64))

(declare-fun lt!328374 () (_ BitVec 64))

(assert (=> d!70879 (= res!176046 (= lt!328374 (bvsub lt!328376 lt!328377)))))

(assert (=> d!70879 (or (= (bvand lt!328376 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!328377 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!328376 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!328376 lt!328377) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!70879 (= lt!328377 (remainingBits!0 ((_ sign_extend 32) (size!4605 (buf!5119 (_2!9647 lt!328143)))) ((_ sign_extend 32) (currentByte!9655 (_2!9647 lt!328143))) ((_ sign_extend 32) (currentBit!9650 (_2!9647 lt!328143)))))))

(declare-fun lt!328375 () (_ BitVec 64))

(declare-fun lt!328373 () (_ BitVec 64))

(assert (=> d!70879 (= lt!328376 (bvmul lt!328375 lt!328373))))

(assert (=> d!70879 (or (= lt!328375 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!328373 (bvsdiv (bvmul lt!328375 lt!328373) lt!328375)))))

(assert (=> d!70879 (= lt!328373 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70879 (= lt!328375 ((_ sign_extend 32) (size!4605 (buf!5119 (_2!9647 lt!328143)))))))

(assert (=> d!70879 (= lt!328374 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9655 (_2!9647 lt!328143))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9650 (_2!9647 lt!328143)))))))

(assert (=> d!70879 (invariant!0 (currentBit!9650 (_2!9647 lt!328143)) (currentByte!9655 (_2!9647 lt!328143)) (size!4605 (buf!5119 (_2!9647 lt!328143))))))

(assert (=> d!70879 (= (bitIndex!0 (size!4605 (buf!5119 (_2!9647 lt!328143))) (currentByte!9655 (_2!9647 lt!328143)) (currentBit!9650 (_2!9647 lt!328143))) lt!328374)))

(declare-fun b!209694 () Bool)

(declare-fun res!176047 () Bool)

(assert (=> b!209694 (=> (not res!176047) (not e!143126))))

(assert (=> b!209694 (= res!176047 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!328374))))

(declare-fun b!209695 () Bool)

(declare-fun lt!328378 () (_ BitVec 64))

(assert (=> b!209695 (= e!143126 (bvsle lt!328374 (bvmul lt!328378 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!209695 (or (= lt!328378 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!328378 #b0000000000000000000000000000000000000000000000000000000000001000) lt!328378)))))

(assert (=> b!209695 (= lt!328378 ((_ sign_extend 32) (size!4605 (buf!5119 (_2!9647 lt!328143)))))))

(assert (= (and d!70879 res!176046) b!209694))

(assert (= (and b!209694 res!176047) b!209695))

(declare-fun m!322723 () Bool)

(assert (=> d!70879 m!322723))

(declare-fun m!322725 () Bool)

(assert (=> d!70879 m!322725))

(assert (=> b!209613 d!70879))

(declare-fun d!70881 () Bool)

(declare-fun e!143127 () Bool)

(assert (=> d!70881 e!143127))

(declare-fun res!176048 () Bool)

(assert (=> d!70881 (=> (not res!176048) (not e!143127))))

(declare-fun lt!328382 () (_ BitVec 64))

(declare-fun lt!328383 () (_ BitVec 64))

(declare-fun lt!328380 () (_ BitVec 64))

(assert (=> d!70881 (= res!176048 (= lt!328380 (bvsub lt!328382 lt!328383)))))

(assert (=> d!70881 (or (= (bvand lt!328382 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!328383 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!328382 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!328382 lt!328383) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70881 (= lt!328383 (remainingBits!0 ((_ sign_extend 32) (size!4605 (buf!5119 thiss!1204))) ((_ sign_extend 32) (currentByte!9655 thiss!1204)) ((_ sign_extend 32) (currentBit!9650 thiss!1204))))))

(declare-fun lt!328381 () (_ BitVec 64))

(declare-fun lt!328379 () (_ BitVec 64))

(assert (=> d!70881 (= lt!328382 (bvmul lt!328381 lt!328379))))

(assert (=> d!70881 (or (= lt!328381 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!328379 (bvsdiv (bvmul lt!328381 lt!328379) lt!328381)))))

(assert (=> d!70881 (= lt!328379 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70881 (= lt!328381 ((_ sign_extend 32) (size!4605 (buf!5119 thiss!1204))))))

(assert (=> d!70881 (= lt!328380 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9655 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9650 thiss!1204))))))

(assert (=> d!70881 (invariant!0 (currentBit!9650 thiss!1204) (currentByte!9655 thiss!1204) (size!4605 (buf!5119 thiss!1204)))))

(assert (=> d!70881 (= (bitIndex!0 (size!4605 (buf!5119 thiss!1204)) (currentByte!9655 thiss!1204) (currentBit!9650 thiss!1204)) lt!328380)))

(declare-fun b!209696 () Bool)

(declare-fun res!176049 () Bool)

(assert (=> b!209696 (=> (not res!176049) (not e!143127))))

(assert (=> b!209696 (= res!176049 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!328380))))

(declare-fun b!209697 () Bool)

(declare-fun lt!328384 () (_ BitVec 64))

(assert (=> b!209697 (= e!143127 (bvsle lt!328380 (bvmul lt!328384 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!209697 (or (= lt!328384 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!328384 #b0000000000000000000000000000000000000000000000000000000000001000) lt!328384)))))

(assert (=> b!209697 (= lt!328384 ((_ sign_extend 32) (size!4605 (buf!5119 thiss!1204))))))

(assert (= (and d!70881 res!176048) b!209696))

(assert (= (and b!209696 res!176049) b!209697))

(declare-fun m!322727 () Bool)

(assert (=> d!70881 m!322727))

(assert (=> d!70881 m!322543))

(assert (=> b!209613 d!70881))

(declare-fun b!209708 () Bool)

(declare-fun res!176058 () Bool)

(declare-fun e!143132 () Bool)

(assert (=> b!209708 (=> (not res!176058) (not e!143132))))

(declare-fun lt!328396 () tuple2!17984)

(assert (=> b!209708 (= res!176058 (isPrefixOf!0 thiss!1204 (_2!9647 lt!328396)))))

(declare-fun b!209710 () Bool)

(declare-fun e!143133 () Bool)

(declare-fun lt!328393 () tuple2!17982)

(assert (=> b!209710 (= e!143133 (= (bitIndex!0 (size!4605 (buf!5119 (_1!9646 lt!328393))) (currentByte!9655 (_1!9646 lt!328393)) (currentBit!9650 (_1!9646 lt!328393))) (bitIndex!0 (size!4605 (buf!5119 (_2!9647 lt!328396))) (currentByte!9655 (_2!9647 lt!328396)) (currentBit!9650 (_2!9647 lt!328396)))))))

(declare-fun d!70883 () Bool)

(assert (=> d!70883 e!143132))

(declare-fun res!176059 () Bool)

(assert (=> d!70883 (=> (not res!176059) (not e!143132))))

(assert (=> d!70883 (= res!176059 (= (size!4605 (buf!5119 thiss!1204)) (size!4605 (buf!5119 (_2!9647 lt!328396)))))))

(declare-fun choose!16 (BitStream!8318 Bool) tuple2!17984)

(assert (=> d!70883 (= lt!328396 (choose!16 thiss!1204 lt!328150))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!70883 (validate_offset_bit!0 ((_ sign_extend 32) (size!4605 (buf!5119 thiss!1204))) ((_ sign_extend 32) (currentByte!9655 thiss!1204)) ((_ sign_extend 32) (currentBit!9650 thiss!1204)))))

(assert (=> d!70883 (= (appendBit!0 thiss!1204 lt!328150) lt!328396)))

(declare-fun b!209707 () Bool)

(declare-fun res!176061 () Bool)

(assert (=> b!209707 (=> (not res!176061) (not e!143132))))

(declare-fun lt!328395 () (_ BitVec 64))

(declare-fun lt!328394 () (_ BitVec 64))

(assert (=> b!209707 (= res!176061 (= (bitIndex!0 (size!4605 (buf!5119 (_2!9647 lt!328396))) (currentByte!9655 (_2!9647 lt!328396)) (currentBit!9650 (_2!9647 lt!328396))) (bvadd lt!328394 lt!328395)))))

(assert (=> b!209707 (or (not (= (bvand lt!328394 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!328395 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!328394 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!328394 lt!328395) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209707 (= lt!328395 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!209707 (= lt!328394 (bitIndex!0 (size!4605 (buf!5119 thiss!1204)) (currentByte!9655 thiss!1204) (currentBit!9650 thiss!1204)))))

(declare-fun b!209709 () Bool)

(assert (=> b!209709 (= e!143132 e!143133)))

(declare-fun res!176060 () Bool)

(assert (=> b!209709 (=> (not res!176060) (not e!143133))))

(assert (=> b!209709 (= res!176060 (and (= (_2!9646 lt!328393) lt!328150) (= (_1!9646 lt!328393) (_2!9647 lt!328396))))))

(assert (=> b!209709 (= lt!328393 (readBitPure!0 (readerFrom!0 (_2!9647 lt!328396) (currentBit!9650 thiss!1204) (currentByte!9655 thiss!1204))))))

(assert (= (and d!70883 res!176059) b!209707))

(assert (= (and b!209707 res!176061) b!209708))

(assert (= (and b!209708 res!176058) b!209709))

(assert (= (and b!209709 res!176060) b!209710))

(declare-fun m!322729 () Bool)

(assert (=> b!209707 m!322729))

(assert (=> b!209707 m!322509))

(declare-fun m!322731 () Bool)

(assert (=> d!70883 m!322731))

(declare-fun m!322733 () Bool)

(assert (=> d!70883 m!322733))

(declare-fun m!322735 () Bool)

(assert (=> b!209710 m!322735))

(assert (=> b!209710 m!322729))

(declare-fun m!322737 () Bool)

(assert (=> b!209709 m!322737))

(assert (=> b!209709 m!322737))

(declare-fun m!322739 () Bool)

(assert (=> b!209709 m!322739))

(declare-fun m!322741 () Bool)

(assert (=> b!209708 m!322741))

(assert (=> b!209613 d!70883))

(declare-fun d!70885 () Bool)

(assert (=> d!70885 (= (invariant!0 (currentBit!9650 thiss!1204) (currentByte!9655 thiss!1204) (size!4605 (buf!5119 thiss!1204))) (and (bvsge (currentBit!9650 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9650 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9655 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9655 thiss!1204) (size!4605 (buf!5119 thiss!1204))) (and (= (currentBit!9650 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9655 thiss!1204) (size!4605 (buf!5119 thiss!1204)))))))))

(assert (=> b!209602 d!70885))

(declare-fun d!70887 () Bool)

(assert (=> d!70887 (= (array_inv!4346 (buf!5119 thiss!1204)) (bvsge (size!4605 (buf!5119 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!209603 d!70887))

(declare-fun d!70889 () Bool)

(declare-fun e!143134 () Bool)

(assert (=> d!70889 e!143134))

(declare-fun res!176062 () Bool)

(assert (=> d!70889 (=> (not res!176062) (not e!143134))))

(declare-fun lt!328401 () (_ BitVec 64))

(declare-fun lt!328400 () (_ BitVec 64))

(declare-fun lt!328398 () (_ BitVec 64))

(assert (=> d!70889 (= res!176062 (= lt!328398 (bvsub lt!328400 lt!328401)))))

(assert (=> d!70889 (or (= (bvand lt!328400 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!328401 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!328400 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!328400 lt!328401) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70889 (= lt!328401 (remainingBits!0 ((_ sign_extend 32) (size!4605 (buf!5119 (_2!9647 lt!328153)))) ((_ sign_extend 32) (currentByte!9655 (_2!9647 lt!328153))) ((_ sign_extend 32) (currentBit!9650 (_2!9647 lt!328153)))))))

(declare-fun lt!328399 () (_ BitVec 64))

(declare-fun lt!328397 () (_ BitVec 64))

(assert (=> d!70889 (= lt!328400 (bvmul lt!328399 lt!328397))))

(assert (=> d!70889 (or (= lt!328399 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!328397 (bvsdiv (bvmul lt!328399 lt!328397) lt!328399)))))

(assert (=> d!70889 (= lt!328397 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70889 (= lt!328399 ((_ sign_extend 32) (size!4605 (buf!5119 (_2!9647 lt!328153)))))))

(assert (=> d!70889 (= lt!328398 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9655 (_2!9647 lt!328153))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9650 (_2!9647 lt!328153)))))))

(assert (=> d!70889 (invariant!0 (currentBit!9650 (_2!9647 lt!328153)) (currentByte!9655 (_2!9647 lt!328153)) (size!4605 (buf!5119 (_2!9647 lt!328153))))))

(assert (=> d!70889 (= (bitIndex!0 (size!4605 (buf!5119 (_2!9647 lt!328153))) (currentByte!9655 (_2!9647 lt!328153)) (currentBit!9650 (_2!9647 lt!328153))) lt!328398)))

(declare-fun b!209711 () Bool)

(declare-fun res!176063 () Bool)

(assert (=> b!209711 (=> (not res!176063) (not e!143134))))

(assert (=> b!209711 (= res!176063 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!328398))))

(declare-fun b!209712 () Bool)

(declare-fun lt!328402 () (_ BitVec 64))

(assert (=> b!209712 (= e!143134 (bvsle lt!328398 (bvmul lt!328402 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!209712 (or (= lt!328402 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!328402 #b0000000000000000000000000000000000000000000000000000000000001000) lt!328402)))))

(assert (=> b!209712 (= lt!328402 ((_ sign_extend 32) (size!4605 (buf!5119 (_2!9647 lt!328153)))))))

(assert (= (and d!70889 res!176062) b!209711))

(assert (= (and b!209711 res!176063) b!209712))

(declare-fun m!322743 () Bool)

(assert (=> d!70889 m!322743))

(assert (=> d!70889 m!322545))

(assert (=> b!209614 d!70889))

(declare-fun d!70891 () Bool)

(declare-fun res!176072 () Bool)

(declare-fun e!143139 () Bool)

(assert (=> d!70891 (=> (not res!176072) (not e!143139))))

(assert (=> d!70891 (= res!176072 (= (size!4605 (buf!5119 thiss!1204)) (size!4605 (buf!5119 (_2!9647 lt!328153)))))))

(assert (=> d!70891 (= (isPrefixOf!0 thiss!1204 (_2!9647 lt!328153)) e!143139)))

(declare-fun b!209719 () Bool)

(declare-fun res!176070 () Bool)

(assert (=> b!209719 (=> (not res!176070) (not e!143139))))

(assert (=> b!209719 (= res!176070 (bvsle (bitIndex!0 (size!4605 (buf!5119 thiss!1204)) (currentByte!9655 thiss!1204) (currentBit!9650 thiss!1204)) (bitIndex!0 (size!4605 (buf!5119 (_2!9647 lt!328153))) (currentByte!9655 (_2!9647 lt!328153)) (currentBit!9650 (_2!9647 lt!328153)))))))

(declare-fun b!209720 () Bool)

(declare-fun e!143140 () Bool)

(assert (=> b!209720 (= e!143139 e!143140)))

(declare-fun res!176071 () Bool)

(assert (=> b!209720 (=> res!176071 e!143140)))

(assert (=> b!209720 (= res!176071 (= (size!4605 (buf!5119 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!209721 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10476 array!10476 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!209721 (= e!143140 (arrayBitRangesEq!0 (buf!5119 thiss!1204) (buf!5119 (_2!9647 lt!328153)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4605 (buf!5119 thiss!1204)) (currentByte!9655 thiss!1204) (currentBit!9650 thiss!1204))))))

(assert (= (and d!70891 res!176072) b!209719))

(assert (= (and b!209719 res!176070) b!209720))

(assert (= (and b!209720 (not res!176071)) b!209721))

(assert (=> b!209719 m!322509))

(assert (=> b!209719 m!322529))

(assert (=> b!209721 m!322509))

(assert (=> b!209721 m!322509))

(declare-fun m!322745 () Bool)

(assert (=> b!209721 m!322745))

(assert (=> b!209614 d!70891))

(declare-fun d!70893 () Bool)

(assert (=> d!70893 (isPrefixOf!0 thiss!1204 (_2!9647 lt!328153))))

(declare-fun lt!328405 () Unit!14921)

(declare-fun choose!30 (BitStream!8318 BitStream!8318 BitStream!8318) Unit!14921)

(assert (=> d!70893 (= lt!328405 (choose!30 thiss!1204 (_2!9647 lt!328143) (_2!9647 lt!328153)))))

(assert (=> d!70893 (isPrefixOf!0 thiss!1204 (_2!9647 lt!328143))))

(assert (=> d!70893 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9647 lt!328143) (_2!9647 lt!328153)) lt!328405)))

(declare-fun bs!17413 () Bool)

(assert (= bs!17413 d!70893))

(assert (=> bs!17413 m!322531))

(declare-fun m!322747 () Bool)

(assert (=> bs!17413 m!322747))

(assert (=> bs!17413 m!322515))

(assert (=> b!209614 d!70893))

(declare-fun call!3303 () Bool)

(declare-fun lt!328919 () tuple2!17984)

(declare-fun bm!3300 () Bool)

(declare-fun c!10318 () Bool)

(assert (=> bm!3300 (= call!3303 (isPrefixOf!0 (_2!9647 lt!328143) (ite c!10318 (_2!9647 lt!328143) (_2!9647 lt!328919))))))

(declare-fun b!209873 () Bool)

(declare-fun e!143233 () Bool)

(declare-fun lt!328887 () tuple2!17986)

(declare-fun lt!328912 () tuple2!17988)

(assert (=> b!209873 (= e!143233 (= (_1!9648 lt!328887) (_2!9649 lt!328912)))))

(declare-fun b!209874 () Bool)

(declare-fun e!143228 () tuple2!17984)

(declare-fun Unit!14936 () Unit!14921)

(assert (=> b!209874 (= e!143228 (tuple2!17985 Unit!14936 (_2!9647 lt!328143)))))

(declare-fun lt!328927 () Unit!14921)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8318) Unit!14921)

(assert (=> b!209874 (= lt!328927 (lemmaIsPrefixRefl!0 (_2!9647 lt!328143)))))

(assert (=> b!209874 call!3303))

(declare-fun lt!328878 () Unit!14921)

(assert (=> b!209874 (= lt!328878 lt!328927)))

(declare-fun b!209875 () Bool)

(declare-fun res!176206 () Bool)

(declare-fun e!143226 () Bool)

(assert (=> b!209875 (=> (not res!176206) (not e!143226))))

(declare-fun lt!328918 () (_ BitVec 64))

(declare-fun lt!328926 () (_ BitVec 64))

(declare-fun lt!328905 () tuple2!17984)

(assert (=> b!209875 (= res!176206 (= (bitIndex!0 (size!4605 (buf!5119 (_2!9647 lt!328905))) (currentByte!9655 (_2!9647 lt!328905)) (currentBit!9650 (_2!9647 lt!328905))) (bvsub lt!328918 lt!328926)))))

(assert (=> b!209875 (or (= (bvand lt!328918 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!328926 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!328918 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!328918 lt!328926) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209875 (= lt!328926 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!328916 () (_ BitVec 64))

(declare-fun lt!328913 () (_ BitVec 64))

(assert (=> b!209875 (= lt!328918 (bvadd lt!328916 lt!328913))))

(assert (=> b!209875 (or (not (= (bvand lt!328916 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!328913 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!328916 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!328916 lt!328913) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209875 (= lt!328913 ((_ sign_extend 32) nBits!348))))

(assert (=> b!209875 (= lt!328916 (bitIndex!0 (size!4605 (buf!5119 (_2!9647 lt!328143))) (currentByte!9655 (_2!9647 lt!328143)) (currentBit!9650 (_2!9647 lt!328143))))))

(declare-fun b!209876 () Bool)

(declare-fun e!143230 () Bool)

(declare-fun lt!328924 () tuple2!17982)

(declare-fun lt!328876 () tuple2!17982)

(assert (=> b!209876 (= e!143230 (= (_2!9646 lt!328924) (_2!9646 lt!328876)))))

(declare-fun b!209877 () Bool)

(declare-fun lt!328881 () tuple2!17982)

(declare-fun lt!328922 () tuple2!17984)

(assert (=> b!209877 (= lt!328881 (readBitPure!0 (readerFrom!0 (_2!9647 lt!328922) (currentBit!9650 (_2!9647 lt!328143)) (currentByte!9655 (_2!9647 lt!328143)))))))

(declare-fun lt!328908 () Bool)

(declare-fun res!176204 () Bool)

(assert (=> b!209877 (= res!176204 (and (= (_2!9646 lt!328881) lt!328908) (= (_1!9646 lt!328881) (_2!9647 lt!328922))))))

(declare-fun e!143232 () Bool)

(assert (=> b!209877 (=> (not res!176204) (not e!143232))))

(declare-fun e!143227 () Bool)

(assert (=> b!209877 (= e!143227 e!143232)))

(declare-fun b!209878 () Bool)

(declare-fun e!143234 () Bool)

(declare-fun lt!328879 () tuple2!17986)

(declare-fun lt!328890 () tuple2!17988)

(assert (=> b!209878 (= e!143234 (= (_1!9648 lt!328879) (_2!9649 lt!328890)))))

(declare-fun d!70895 () Bool)

(assert (=> d!70895 e!143226))

(declare-fun res!176203 () Bool)

(assert (=> d!70895 (=> (not res!176203) (not e!143226))))

(assert (=> d!70895 (= res!176203 (invariant!0 (currentBit!9650 (_2!9647 lt!328905)) (currentByte!9655 (_2!9647 lt!328905)) (size!4605 (buf!5119 (_2!9647 lt!328905)))))))

(assert (=> d!70895 (= lt!328905 e!143228)))

(assert (=> d!70895 (= c!10318 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!70895 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!70895 (= (appendBitsLSBFirstLoopTR!0 (_2!9647 lt!328143) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!328905)))

(declare-fun b!209879 () Bool)

(assert (=> b!209879 (= e!143232 (= (bitIndex!0 (size!4605 (buf!5119 (_1!9646 lt!328881))) (currentByte!9655 (_1!9646 lt!328881)) (currentBit!9650 (_1!9646 lt!328881))) (bitIndex!0 (size!4605 (buf!5119 (_2!9647 lt!328922))) (currentByte!9655 (_2!9647 lt!328922)) (currentBit!9650 (_2!9647 lt!328922)))))))

(declare-fun b!209880 () Bool)

(declare-fun res!176198 () Bool)

(assert (=> b!209880 (= res!176198 (isPrefixOf!0 (_2!9647 lt!328143) (_2!9647 lt!328922)))))

(assert (=> b!209880 (=> (not res!176198) (not e!143227))))

(declare-fun b!209881 () Bool)

(declare-fun e!143231 () Bool)

(declare-fun lt!328925 () (_ BitVec 64))

(assert (=> b!209881 (= e!143231 (validate_offset_bits!1 ((_ sign_extend 32) (size!4605 (buf!5119 (_2!9647 lt!328143)))) ((_ sign_extend 32) (currentByte!9655 (_2!9647 lt!328143))) ((_ sign_extend 32) (currentBit!9650 (_2!9647 lt!328143))) lt!328925))))

(declare-fun b!209882 () Bool)

(declare-fun e!143229 () (_ BitVec 64))

(assert (=> b!209882 (= e!143229 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!209883 () Bool)

(assert (=> b!209883 (= e!143228 (tuple2!17985 (_1!9647 lt!328919) (_2!9647 lt!328919)))))

(assert (=> b!209883 (= lt!328908 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209883 (= lt!328922 (appendBit!0 (_2!9647 lt!328143) lt!328908))))

(declare-fun res!176200 () Bool)

(assert (=> b!209883 (= res!176200 (= (size!4605 (buf!5119 (_2!9647 lt!328143))) (size!4605 (buf!5119 (_2!9647 lt!328922)))))))

(assert (=> b!209883 (=> (not res!176200) (not e!143227))))

(assert (=> b!209883 e!143227))

(declare-fun lt!328900 () tuple2!17984)

(assert (=> b!209883 (= lt!328900 lt!328922)))

(assert (=> b!209883 (= lt!328919 (appendBitsLSBFirstLoopTR!0 (_2!9647 lt!328900) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!328882 () Unit!14921)

(assert (=> b!209883 (= lt!328882 (lemmaIsPrefixTransitive!0 (_2!9647 lt!328143) (_2!9647 lt!328900) (_2!9647 lt!328919)))))

(assert (=> b!209883 call!3303))

(declare-fun lt!328892 () Unit!14921)

(assert (=> b!209883 (= lt!328892 lt!328882)))

(assert (=> b!209883 (invariant!0 (currentBit!9650 (_2!9647 lt!328143)) (currentByte!9655 (_2!9647 lt!328143)) (size!4605 (buf!5119 (_2!9647 lt!328900))))))

(declare-fun lt!328911 () BitStream!8318)

(assert (=> b!209883 (= lt!328911 (BitStream!8319 (buf!5119 (_2!9647 lt!328900)) (currentByte!9655 (_2!9647 lt!328143)) (currentBit!9650 (_2!9647 lt!328143))))))

(assert (=> b!209883 (invariant!0 (currentBit!9650 lt!328911) (currentByte!9655 lt!328911) (size!4605 (buf!5119 (_2!9647 lt!328919))))))

(declare-fun lt!328907 () BitStream!8318)

(assert (=> b!209883 (= lt!328907 (BitStream!8319 (buf!5119 (_2!9647 lt!328919)) (currentByte!9655 lt!328911) (currentBit!9650 lt!328911)))))

(assert (=> b!209883 (= lt!328924 (readBitPure!0 lt!328911))))

(assert (=> b!209883 (= lt!328876 (readBitPure!0 lt!328907))))

(declare-fun lt!328915 () Unit!14921)

(assert (=> b!209883 (= lt!328915 (readBitPrefixLemma!0 lt!328911 (_2!9647 lt!328919)))))

(declare-fun res!176199 () Bool)

(assert (=> b!209883 (= res!176199 (= (bitIndex!0 (size!4605 (buf!5119 (_1!9646 lt!328924))) (currentByte!9655 (_1!9646 lt!328924)) (currentBit!9650 (_1!9646 lt!328924))) (bitIndex!0 (size!4605 (buf!5119 (_1!9646 lt!328876))) (currentByte!9655 (_1!9646 lt!328876)) (currentBit!9650 (_1!9646 lt!328876)))))))

(assert (=> b!209883 (=> (not res!176199) (not e!143230))))

(assert (=> b!209883 e!143230))

(declare-fun lt!328917 () Unit!14921)

(assert (=> b!209883 (= lt!328917 lt!328915)))

(declare-fun lt!328888 () tuple2!17988)

(assert (=> b!209883 (= lt!328888 (reader!0 (_2!9647 lt!328143) (_2!9647 lt!328919)))))

(declare-fun lt!328895 () tuple2!17988)

(assert (=> b!209883 (= lt!328895 (reader!0 (_2!9647 lt!328900) (_2!9647 lt!328919)))))

(declare-fun lt!328897 () tuple2!17982)

(assert (=> b!209883 (= lt!328897 (readBitPure!0 (_1!9649 lt!328888)))))

(assert (=> b!209883 (= (_2!9646 lt!328897) lt!328908)))

(declare-fun lt!328883 () Unit!14921)

(declare-fun Unit!14937 () Unit!14921)

(assert (=> b!209883 (= lt!328883 Unit!14937)))

(declare-fun lt!328914 () (_ BitVec 64))

(assert (=> b!209883 (= lt!328914 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!328906 () (_ BitVec 64))

(assert (=> b!209883 (= lt!328906 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!328884 () Unit!14921)

(assert (=> b!209883 (= lt!328884 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9647 lt!328143) (buf!5119 (_2!9647 lt!328919)) lt!328906))))

(assert (=> b!209883 (validate_offset_bits!1 ((_ sign_extend 32) (size!4605 (buf!5119 (_2!9647 lt!328919)))) ((_ sign_extend 32) (currentByte!9655 (_2!9647 lt!328143))) ((_ sign_extend 32) (currentBit!9650 (_2!9647 lt!328143))) lt!328906)))

(declare-fun lt!328880 () Unit!14921)

(assert (=> b!209883 (= lt!328880 lt!328884)))

(declare-fun lt!328893 () tuple2!17986)

(assert (=> b!209883 (= lt!328893 (readNBitsLSBFirstsLoopPure!0 (_1!9649 lt!328888) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!328914))))

(declare-fun lt!328886 () (_ BitVec 64))

(assert (=> b!209883 (= lt!328886 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!328898 () Unit!14921)

(assert (=> b!209883 (= lt!328898 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9647 lt!328900) (buf!5119 (_2!9647 lt!328919)) lt!328886))))

(assert (=> b!209883 (validate_offset_bits!1 ((_ sign_extend 32) (size!4605 (buf!5119 (_2!9647 lt!328919)))) ((_ sign_extend 32) (currentByte!9655 (_2!9647 lt!328900))) ((_ sign_extend 32) (currentBit!9650 (_2!9647 lt!328900))) lt!328886)))

(declare-fun lt!328909 () Unit!14921)

(assert (=> b!209883 (= lt!328909 lt!328898)))

(declare-fun lt!328896 () tuple2!17986)

(assert (=> b!209883 (= lt!328896 (readNBitsLSBFirstsLoopPure!0 (_1!9649 lt!328895) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!328914 (ite (_2!9646 lt!328897) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!328877 () tuple2!17986)

(assert (=> b!209883 (= lt!328877 (readNBitsLSBFirstsLoopPure!0 (_1!9649 lt!328888) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!328914))))

(declare-fun c!10317 () Bool)

(assert (=> b!209883 (= c!10317 (_2!9646 (readBitPure!0 (_1!9649 lt!328888))))))

(declare-fun lt!328920 () tuple2!17986)

(assert (=> b!209883 (= lt!328920 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9649 lt!328888) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!328914 e!143229)))))

(declare-fun lt!328885 () Unit!14921)

(assert (=> b!209883 (= lt!328885 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9649 lt!328888) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!328914))))

(assert (=> b!209883 (and (= (_2!9648 lt!328877) (_2!9648 lt!328920)) (= (_1!9648 lt!328877) (_1!9648 lt!328920)))))

(declare-fun lt!328923 () Unit!14921)

(assert (=> b!209883 (= lt!328923 lt!328885)))

(assert (=> b!209883 (= (_1!9649 lt!328888) (withMovedBitIndex!0 (_2!9649 lt!328888) (bvsub (bitIndex!0 (size!4605 (buf!5119 (_2!9647 lt!328143))) (currentByte!9655 (_2!9647 lt!328143)) (currentBit!9650 (_2!9647 lt!328143))) (bitIndex!0 (size!4605 (buf!5119 (_2!9647 lt!328919))) (currentByte!9655 (_2!9647 lt!328919)) (currentBit!9650 (_2!9647 lt!328919))))))))

(declare-fun lt!328902 () Unit!14921)

(declare-fun Unit!14938 () Unit!14921)

(assert (=> b!209883 (= lt!328902 Unit!14938)))

(assert (=> b!209883 (= (_1!9649 lt!328895) (withMovedBitIndex!0 (_2!9649 lt!328895) (bvsub (bitIndex!0 (size!4605 (buf!5119 (_2!9647 lt!328900))) (currentByte!9655 (_2!9647 lt!328900)) (currentBit!9650 (_2!9647 lt!328900))) (bitIndex!0 (size!4605 (buf!5119 (_2!9647 lt!328919))) (currentByte!9655 (_2!9647 lt!328919)) (currentBit!9650 (_2!9647 lt!328919))))))))

(declare-fun lt!328929 () Unit!14921)

(declare-fun Unit!14939 () Unit!14921)

(assert (=> b!209883 (= lt!328929 Unit!14939)))

(assert (=> b!209883 (= (bitIndex!0 (size!4605 (buf!5119 (_2!9647 lt!328143))) (currentByte!9655 (_2!9647 lt!328143)) (currentBit!9650 (_2!9647 lt!328143))) (bvsub (bitIndex!0 (size!4605 (buf!5119 (_2!9647 lt!328900))) (currentByte!9655 (_2!9647 lt!328900)) (currentBit!9650 (_2!9647 lt!328900))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!328903 () Unit!14921)

(declare-fun Unit!14940 () Unit!14921)

(assert (=> b!209883 (= lt!328903 Unit!14940)))

(assert (=> b!209883 (= (_2!9648 lt!328893) (_2!9648 lt!328896))))

(declare-fun lt!328910 () Unit!14921)

(declare-fun Unit!14941 () Unit!14921)

(assert (=> b!209883 (= lt!328910 Unit!14941)))

(assert (=> b!209883 (invariant!0 (currentBit!9650 (_2!9647 lt!328919)) (currentByte!9655 (_2!9647 lt!328919)) (size!4605 (buf!5119 (_2!9647 lt!328919))))))

(declare-fun lt!328921 () Unit!14921)

(declare-fun Unit!14942 () Unit!14921)

(assert (=> b!209883 (= lt!328921 Unit!14942)))

(assert (=> b!209883 (= (size!4605 (buf!5119 (_2!9647 lt!328143))) (size!4605 (buf!5119 (_2!9647 lt!328919))))))

(declare-fun lt!328889 () Unit!14921)

(declare-fun Unit!14943 () Unit!14921)

(assert (=> b!209883 (= lt!328889 Unit!14943)))

(assert (=> b!209883 (= (bitIndex!0 (size!4605 (buf!5119 (_2!9647 lt!328919))) (currentByte!9655 (_2!9647 lt!328919)) (currentBit!9650 (_2!9647 lt!328919))) (bvsub (bvadd (bitIndex!0 (size!4605 (buf!5119 (_2!9647 lt!328143))) (currentByte!9655 (_2!9647 lt!328143)) (currentBit!9650 (_2!9647 lt!328143))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!328891 () Unit!14921)

(declare-fun Unit!14944 () Unit!14921)

(assert (=> b!209883 (= lt!328891 Unit!14944)))

(declare-fun lt!328875 () Unit!14921)

(declare-fun Unit!14945 () Unit!14921)

(assert (=> b!209883 (= lt!328875 Unit!14945)))

(assert (=> b!209883 (= lt!328912 (reader!0 (_2!9647 lt!328143) (_2!9647 lt!328919)))))

(declare-fun lt!328901 () (_ BitVec 64))

(assert (=> b!209883 (= lt!328901 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!328928 () Unit!14921)

(assert (=> b!209883 (= lt!328928 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9647 lt!328143) (buf!5119 (_2!9647 lt!328919)) lt!328901))))

(assert (=> b!209883 (validate_offset_bits!1 ((_ sign_extend 32) (size!4605 (buf!5119 (_2!9647 lt!328919)))) ((_ sign_extend 32) (currentByte!9655 (_2!9647 lt!328143))) ((_ sign_extend 32) (currentBit!9650 (_2!9647 lt!328143))) lt!328901)))

(declare-fun lt!328899 () Unit!14921)

(assert (=> b!209883 (= lt!328899 lt!328928)))

(assert (=> b!209883 (= lt!328887 (readNBitsLSBFirstsLoopPure!0 (_1!9649 lt!328912) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!176196 () Bool)

(assert (=> b!209883 (= res!176196 (= (_2!9648 lt!328887) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!209883 (=> (not res!176196) (not e!143233))))

(assert (=> b!209883 e!143233))

(declare-fun lt!328874 () Unit!14921)

(declare-fun Unit!14946 () Unit!14921)

(assert (=> b!209883 (= lt!328874 Unit!14946)))

(declare-fun b!209884 () Bool)

(declare-fun res!176207 () Bool)

(assert (=> b!209884 (=> (not res!176207) (not e!143226))))

(assert (=> b!209884 (= res!176207 (= (size!4605 (buf!5119 (_2!9647 lt!328143))) (size!4605 (buf!5119 (_2!9647 lt!328905)))))))

(declare-fun b!209885 () Bool)

(assert (=> b!209885 (= e!143226 e!143234)))

(declare-fun res!176201 () Bool)

(assert (=> b!209885 (=> (not res!176201) (not e!143234))))

(assert (=> b!209885 (= res!176201 (= (_2!9648 lt!328879) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!209885 (= lt!328879 (readNBitsLSBFirstsLoopPure!0 (_1!9649 lt!328890) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!328894 () Unit!14921)

(declare-fun lt!328904 () Unit!14921)

(assert (=> b!209885 (= lt!328894 lt!328904)))

(assert (=> b!209885 (validate_offset_bits!1 ((_ sign_extend 32) (size!4605 (buf!5119 (_2!9647 lt!328905)))) ((_ sign_extend 32) (currentByte!9655 (_2!9647 lt!328143))) ((_ sign_extend 32) (currentBit!9650 (_2!9647 lt!328143))) lt!328925)))

(assert (=> b!209885 (= lt!328904 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9647 lt!328143) (buf!5119 (_2!9647 lt!328905)) lt!328925))))

(assert (=> b!209885 e!143231))

(declare-fun res!176197 () Bool)

(assert (=> b!209885 (=> (not res!176197) (not e!143231))))

(assert (=> b!209885 (= res!176197 (and (= (size!4605 (buf!5119 (_2!9647 lt!328143))) (size!4605 (buf!5119 (_2!9647 lt!328905)))) (bvsge lt!328925 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209885 (= lt!328925 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!209885 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!209885 (= lt!328890 (reader!0 (_2!9647 lt!328143) (_2!9647 lt!328905)))))

(declare-fun b!209886 () Bool)

(declare-fun res!176202 () Bool)

(assert (=> b!209886 (= res!176202 (= (bitIndex!0 (size!4605 (buf!5119 (_2!9647 lt!328922))) (currentByte!9655 (_2!9647 lt!328922)) (currentBit!9650 (_2!9647 lt!328922))) (bvadd (bitIndex!0 (size!4605 (buf!5119 (_2!9647 lt!328143))) (currentByte!9655 (_2!9647 lt!328143)) (currentBit!9650 (_2!9647 lt!328143))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!209886 (=> (not res!176202) (not e!143227))))

(declare-fun b!209887 () Bool)

(assert (=> b!209887 (= e!143229 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!209888 () Bool)

(declare-fun res!176205 () Bool)

(assert (=> b!209888 (=> (not res!176205) (not e!143226))))

(assert (=> b!209888 (= res!176205 (isPrefixOf!0 (_2!9647 lt!328143) (_2!9647 lt!328905)))))

(assert (= (and d!70895 c!10318) b!209874))

(assert (= (and d!70895 (not c!10318)) b!209883))

(assert (= (and b!209883 res!176200) b!209886))

(assert (= (and b!209886 res!176202) b!209880))

(assert (= (and b!209880 res!176198) b!209877))

(assert (= (and b!209877 res!176204) b!209879))

(assert (= (and b!209883 res!176199) b!209876))

(assert (= (and b!209883 c!10317) b!209882))

(assert (= (and b!209883 (not c!10317)) b!209887))

(assert (= (and b!209883 res!176196) b!209873))

(assert (= (or b!209874 b!209883) bm!3300))

(assert (= (and d!70895 res!176203) b!209884))

(assert (= (and b!209884 res!176207) b!209875))

(assert (= (and b!209875 res!176206) b!209888))

(assert (= (and b!209888 res!176205) b!209885))

(assert (= (and b!209885 res!176197) b!209881))

(assert (= (and b!209885 res!176201) b!209878))

(declare-fun m!322979 () Bool)

(assert (=> b!209874 m!322979))

(declare-fun m!322981 () Bool)

(assert (=> b!209886 m!322981))

(assert (=> b!209886 m!322507))

(declare-fun m!322983 () Bool)

(assert (=> b!209888 m!322983))

(declare-fun m!322985 () Bool)

(assert (=> b!209875 m!322985))

(assert (=> b!209875 m!322507))

(declare-fun m!322987 () Bool)

(assert (=> b!209885 m!322987))

(declare-fun m!322989 () Bool)

(assert (=> b!209885 m!322989))

(declare-fun m!322991 () Bool)

(assert (=> b!209885 m!322991))

(declare-fun m!322993 () Bool)

(assert (=> b!209885 m!322993))

(declare-fun m!322995 () Bool)

(assert (=> b!209885 m!322995))

(declare-fun m!322997 () Bool)

(assert (=> b!209885 m!322997))

(declare-fun m!322999 () Bool)

(assert (=> b!209877 m!322999))

(assert (=> b!209877 m!322999))

(declare-fun m!323001 () Bool)

(assert (=> b!209877 m!323001))

(declare-fun m!323003 () Bool)

(assert (=> b!209881 m!323003))

(declare-fun m!323005 () Bool)

(assert (=> b!209883 m!323005))

(declare-fun m!323007 () Bool)

(assert (=> b!209883 m!323007))

(declare-fun m!323009 () Bool)

(assert (=> b!209883 m!323009))

(assert (=> b!209883 m!322989))

(declare-fun m!323011 () Bool)

(assert (=> b!209883 m!323011))

(declare-fun m!323013 () Bool)

(assert (=> b!209883 m!323013))

(assert (=> b!209883 m!322993))

(declare-fun m!323015 () Bool)

(assert (=> b!209883 m!323015))

(declare-fun m!323017 () Bool)

(assert (=> b!209883 m!323017))

(declare-fun m!323019 () Bool)

(assert (=> b!209883 m!323019))

(declare-fun m!323021 () Bool)

(assert (=> b!209883 m!323021))

(declare-fun m!323023 () Bool)

(assert (=> b!209883 m!323023))

(declare-fun m!323025 () Bool)

(assert (=> b!209883 m!323025))

(declare-fun m!323027 () Bool)

(assert (=> b!209883 m!323027))

(declare-fun m!323029 () Bool)

(assert (=> b!209883 m!323029))

(declare-fun m!323031 () Bool)

(assert (=> b!209883 m!323031))

(declare-fun m!323033 () Bool)

(assert (=> b!209883 m!323033))

(declare-fun m!323035 () Bool)

(assert (=> b!209883 m!323035))

(declare-fun m!323037 () Bool)

(assert (=> b!209883 m!323037))

(declare-fun m!323039 () Bool)

(assert (=> b!209883 m!323039))

(declare-fun m!323041 () Bool)

(assert (=> b!209883 m!323041))

(declare-fun m!323043 () Bool)

(assert (=> b!209883 m!323043))

(declare-fun m!323045 () Bool)

(assert (=> b!209883 m!323045))

(declare-fun m!323047 () Bool)

(assert (=> b!209883 m!323047))

(declare-fun m!323049 () Bool)

(assert (=> b!209883 m!323049))

(declare-fun m!323051 () Bool)

(assert (=> b!209883 m!323051))

(declare-fun m!323053 () Bool)

(assert (=> b!209883 m!323053))

(declare-fun m!323055 () Bool)

(assert (=> b!209883 m!323055))

(assert (=> b!209883 m!322507))

(assert (=> b!209883 m!323043))

(declare-fun m!323057 () Bool)

(assert (=> b!209883 m!323057))

(declare-fun m!323059 () Bool)

(assert (=> b!209883 m!323059))

(declare-fun m!323061 () Bool)

(assert (=> b!209883 m!323061))

(declare-fun m!323063 () Bool)

(assert (=> b!209883 m!323063))

(declare-fun m!323065 () Bool)

(assert (=> b!209880 m!323065))

(declare-fun m!323067 () Bool)

(assert (=> d!70895 m!323067))

(declare-fun m!323069 () Bool)

(assert (=> b!209879 m!323069))

(assert (=> b!209879 m!322981))

(declare-fun m!323071 () Bool)

(assert (=> bm!3300 m!323071))

(assert (=> b!209614 d!70895))

(declare-fun d!70965 () Bool)

(declare-fun e!143235 () Bool)

(assert (=> d!70965 e!143235))

(declare-fun res!176208 () Bool)

(assert (=> d!70965 (=> (not res!176208) (not e!143235))))

(declare-fun lt!328931 () (_ BitVec 64))

(declare-fun lt!328933 () (_ BitVec 64))

(declare-fun lt!328934 () (_ BitVec 64))

(assert (=> d!70965 (= res!176208 (= lt!328931 (bvsub lt!328933 lt!328934)))))

(assert (=> d!70965 (or (= (bvand lt!328933 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!328934 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!328933 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!328933 lt!328934) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70965 (= lt!328934 (remainingBits!0 ((_ sign_extend 32) (size!4605 (buf!5119 (_1!9646 lt!328149)))) ((_ sign_extend 32) (currentByte!9655 (_1!9646 lt!328149))) ((_ sign_extend 32) (currentBit!9650 (_1!9646 lt!328149)))))))

(declare-fun lt!328932 () (_ BitVec 64))

(declare-fun lt!328930 () (_ BitVec 64))

(assert (=> d!70965 (= lt!328933 (bvmul lt!328932 lt!328930))))

(assert (=> d!70965 (or (= lt!328932 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!328930 (bvsdiv (bvmul lt!328932 lt!328930) lt!328932)))))

(assert (=> d!70965 (= lt!328930 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70965 (= lt!328932 ((_ sign_extend 32) (size!4605 (buf!5119 (_1!9646 lt!328149)))))))

(assert (=> d!70965 (= lt!328931 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9655 (_1!9646 lt!328149))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9650 (_1!9646 lt!328149)))))))

(assert (=> d!70965 (invariant!0 (currentBit!9650 (_1!9646 lt!328149)) (currentByte!9655 (_1!9646 lt!328149)) (size!4605 (buf!5119 (_1!9646 lt!328149))))))

(assert (=> d!70965 (= (bitIndex!0 (size!4605 (buf!5119 (_1!9646 lt!328149))) (currentByte!9655 (_1!9646 lt!328149)) (currentBit!9650 (_1!9646 lt!328149))) lt!328931)))

(declare-fun b!209889 () Bool)

(declare-fun res!176209 () Bool)

(assert (=> b!209889 (=> (not res!176209) (not e!143235))))

(assert (=> b!209889 (= res!176209 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!328931))))

(declare-fun b!209890 () Bool)

(declare-fun lt!328935 () (_ BitVec 64))

(assert (=> b!209890 (= e!143235 (bvsle lt!328931 (bvmul lt!328935 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!209890 (or (= lt!328935 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!328935 #b0000000000000000000000000000000000000000000000000000000000001000) lt!328935)))))

(assert (=> b!209890 (= lt!328935 ((_ sign_extend 32) (size!4605 (buf!5119 (_1!9646 lt!328149)))))))

(assert (= (and d!70965 res!176208) b!209889))

(assert (= (and b!209889 res!176209) b!209890))

(declare-fun m!323073 () Bool)

(assert (=> d!70965 m!323073))

(declare-fun m!323075 () Bool)

(assert (=> d!70965 m!323075))

(assert (=> b!209599 d!70965))

(declare-fun d!70967 () Bool)

(assert (=> d!70967 (= (invariant!0 (currentBit!9650 thiss!1204) (currentByte!9655 thiss!1204) (size!4605 (buf!5119 (_2!9647 lt!328153)))) (and (bvsge (currentBit!9650 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9650 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9655 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9655 thiss!1204) (size!4605 (buf!5119 (_2!9647 lt!328153)))) (and (= (currentBit!9650 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9655 thiss!1204) (size!4605 (buf!5119 (_2!9647 lt!328153))))))))))

(assert (=> b!209610 d!70967))

(declare-fun d!70969 () Bool)

(declare-fun res!176212 () Bool)

(declare-fun e!143236 () Bool)

(assert (=> d!70969 (=> (not res!176212) (not e!143236))))

(assert (=> d!70969 (= res!176212 (= (size!4605 (buf!5119 (_2!9647 lt!328143))) (size!4605 (buf!5119 (_2!9647 lt!328153)))))))

(assert (=> d!70969 (= (isPrefixOf!0 (_2!9647 lt!328143) (_2!9647 lt!328153)) e!143236)))

(declare-fun b!209891 () Bool)

(declare-fun res!176210 () Bool)

(assert (=> b!209891 (=> (not res!176210) (not e!143236))))

(assert (=> b!209891 (= res!176210 (bvsle (bitIndex!0 (size!4605 (buf!5119 (_2!9647 lt!328143))) (currentByte!9655 (_2!9647 lt!328143)) (currentBit!9650 (_2!9647 lt!328143))) (bitIndex!0 (size!4605 (buf!5119 (_2!9647 lt!328153))) (currentByte!9655 (_2!9647 lt!328153)) (currentBit!9650 (_2!9647 lt!328153)))))))

(declare-fun b!209892 () Bool)

(declare-fun e!143237 () Bool)

(assert (=> b!209892 (= e!143236 e!143237)))

(declare-fun res!176211 () Bool)

(assert (=> b!209892 (=> res!176211 e!143237)))

(assert (=> b!209892 (= res!176211 (= (size!4605 (buf!5119 (_2!9647 lt!328143))) #b00000000000000000000000000000000))))

(declare-fun b!209893 () Bool)

(assert (=> b!209893 (= e!143237 (arrayBitRangesEq!0 (buf!5119 (_2!9647 lt!328143)) (buf!5119 (_2!9647 lt!328153)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4605 (buf!5119 (_2!9647 lt!328143))) (currentByte!9655 (_2!9647 lt!328143)) (currentBit!9650 (_2!9647 lt!328143)))))))

(assert (= (and d!70969 res!176212) b!209891))

(assert (= (and b!209891 res!176210) b!209892))

(assert (= (and b!209892 (not res!176211)) b!209893))

(assert (=> b!209891 m!322507))

(assert (=> b!209891 m!322529))

(assert (=> b!209893 m!322507))

(assert (=> b!209893 m!322507))

(declare-fun m!323077 () Bool)

(assert (=> b!209893 m!323077))

(assert (=> b!209611 d!70969))

(declare-fun d!70971 () Bool)

(declare-datatypes ((tuple2!17994 0))(
  ( (tuple2!17995 (_1!9652 Bool) (_2!9652 BitStream!8318)) )
))
(declare-fun lt!328938 () tuple2!17994)

(declare-fun readBit!0 (BitStream!8318) tuple2!17994)

(assert (=> d!70971 (= lt!328938 (readBit!0 (readerFrom!0 (_2!9647 lt!328143) (currentBit!9650 thiss!1204) (currentByte!9655 thiss!1204))))))

(assert (=> d!70971 (= (readBitPure!0 (readerFrom!0 (_2!9647 lt!328143) (currentBit!9650 thiss!1204) (currentByte!9655 thiss!1204))) (tuple2!17983 (_2!9652 lt!328938) (_1!9652 lt!328938)))))

(declare-fun bs!17429 () Bool)

(assert (= bs!17429 d!70971))

(assert (=> bs!17429 m!322521))

(declare-fun m!323079 () Bool)

(assert (=> bs!17429 m!323079))

(assert (=> b!209600 d!70971))

(declare-fun d!70973 () Bool)

(declare-fun e!143240 () Bool)

(assert (=> d!70973 e!143240))

(declare-fun res!176216 () Bool)

(assert (=> d!70973 (=> (not res!176216) (not e!143240))))

(assert (=> d!70973 (= res!176216 (invariant!0 (currentBit!9650 (_2!9647 lt!328143)) (currentByte!9655 (_2!9647 lt!328143)) (size!4605 (buf!5119 (_2!9647 lt!328143)))))))

(assert (=> d!70973 (= (readerFrom!0 (_2!9647 lt!328143) (currentBit!9650 thiss!1204) (currentByte!9655 thiss!1204)) (BitStream!8319 (buf!5119 (_2!9647 lt!328143)) (currentByte!9655 thiss!1204) (currentBit!9650 thiss!1204)))))

(declare-fun b!209896 () Bool)

(assert (=> b!209896 (= e!143240 (invariant!0 (currentBit!9650 thiss!1204) (currentByte!9655 thiss!1204) (size!4605 (buf!5119 (_2!9647 lt!328143)))))))

(assert (= (and d!70973 res!176216) b!209896))

(assert (=> d!70973 m!322725))

(assert (=> b!209896 m!322551))

(assert (=> b!209600 d!70973))

(declare-fun d!70975 () Bool)

(declare-fun res!176219 () Bool)

(declare-fun e!143241 () Bool)

(assert (=> d!70975 (=> (not res!176219) (not e!143241))))

(assert (=> d!70975 (= res!176219 (= (size!4605 (buf!5119 thiss!1204)) (size!4605 (buf!5119 (_2!9647 lt!328143)))))))

(assert (=> d!70975 (= (isPrefixOf!0 thiss!1204 (_2!9647 lt!328143)) e!143241)))

(declare-fun b!209897 () Bool)

(declare-fun res!176217 () Bool)

(assert (=> b!209897 (=> (not res!176217) (not e!143241))))

(assert (=> b!209897 (= res!176217 (bvsle (bitIndex!0 (size!4605 (buf!5119 thiss!1204)) (currentByte!9655 thiss!1204) (currentBit!9650 thiss!1204)) (bitIndex!0 (size!4605 (buf!5119 (_2!9647 lt!328143))) (currentByte!9655 (_2!9647 lt!328143)) (currentBit!9650 (_2!9647 lt!328143)))))))

(declare-fun b!209898 () Bool)

(declare-fun e!143242 () Bool)

(assert (=> b!209898 (= e!143241 e!143242)))

(declare-fun res!176218 () Bool)

(assert (=> b!209898 (=> res!176218 e!143242)))

(assert (=> b!209898 (= res!176218 (= (size!4605 (buf!5119 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!209899 () Bool)

(assert (=> b!209899 (= e!143242 (arrayBitRangesEq!0 (buf!5119 thiss!1204) (buf!5119 (_2!9647 lt!328143)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4605 (buf!5119 thiss!1204)) (currentByte!9655 thiss!1204) (currentBit!9650 thiss!1204))))))

(assert (= (and d!70975 res!176219) b!209897))

(assert (= (and b!209897 res!176217) b!209898))

(assert (= (and b!209898 (not res!176218)) b!209899))

(assert (=> b!209897 m!322509))

(assert (=> b!209897 m!322507))

(assert (=> b!209899 m!322509))

(assert (=> b!209899 m!322509))

(declare-fun m!323081 () Bool)

(assert (=> b!209899 m!323081))

(assert (=> b!209601 d!70975))

(declare-fun d!70977 () Bool)

(assert (=> d!70977 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!209608 d!70977))

(declare-fun d!70979 () Bool)

(declare-fun e!143243 () Bool)

(assert (=> d!70979 e!143243))

(declare-fun res!176220 () Bool)

(assert (=> d!70979 (=> (not res!176220) (not e!143243))))

(declare-fun lt!328943 () (_ BitVec 64))

(declare-fun lt!328940 () (_ BitVec 64))

(declare-fun lt!328942 () (_ BitVec 64))

(assert (=> d!70979 (= res!176220 (= lt!328940 (bvsub lt!328942 lt!328943)))))

(assert (=> d!70979 (or (= (bvand lt!328942 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!328943 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!328942 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!328942 lt!328943) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70979 (= lt!328943 (remainingBits!0 ((_ sign_extend 32) (size!4605 (buf!5119 (_1!9646 lt!328141)))) ((_ sign_extend 32) (currentByte!9655 (_1!9646 lt!328141))) ((_ sign_extend 32) (currentBit!9650 (_1!9646 lt!328141)))))))

(declare-fun lt!328941 () (_ BitVec 64))

(declare-fun lt!328939 () (_ BitVec 64))

(assert (=> d!70979 (= lt!328942 (bvmul lt!328941 lt!328939))))

(assert (=> d!70979 (or (= lt!328941 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!328939 (bvsdiv (bvmul lt!328941 lt!328939) lt!328941)))))

(assert (=> d!70979 (= lt!328939 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70979 (= lt!328941 ((_ sign_extend 32) (size!4605 (buf!5119 (_1!9646 lt!328141)))))))

(assert (=> d!70979 (= lt!328940 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9655 (_1!9646 lt!328141))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9650 (_1!9646 lt!328141)))))))

(assert (=> d!70979 (invariant!0 (currentBit!9650 (_1!9646 lt!328141)) (currentByte!9655 (_1!9646 lt!328141)) (size!4605 (buf!5119 (_1!9646 lt!328141))))))

(assert (=> d!70979 (= (bitIndex!0 (size!4605 (buf!5119 (_1!9646 lt!328141))) (currentByte!9655 (_1!9646 lt!328141)) (currentBit!9650 (_1!9646 lt!328141))) lt!328940)))

(declare-fun b!209900 () Bool)

(declare-fun res!176221 () Bool)

(assert (=> b!209900 (=> (not res!176221) (not e!143243))))

(assert (=> b!209900 (= res!176221 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!328940))))

(declare-fun b!209901 () Bool)

(declare-fun lt!328944 () (_ BitVec 64))

(assert (=> b!209901 (= e!143243 (bvsle lt!328940 (bvmul lt!328944 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!209901 (or (= lt!328944 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!328944 #b0000000000000000000000000000000000000000000000000000000000001000) lt!328944)))))

(assert (=> b!209901 (= lt!328944 ((_ sign_extend 32) (size!4605 (buf!5119 (_1!9646 lt!328141)))))))

(assert (= (and d!70979 res!176220) b!209900))

(assert (= (and b!209900 res!176221) b!209901))

(declare-fun m!323083 () Bool)

(assert (=> d!70979 m!323083))

(declare-fun m!323085 () Bool)

(assert (=> d!70979 m!323085))

(assert (=> b!209608 d!70979))

(declare-fun d!70981 () Bool)

(declare-fun lt!328945 () tuple2!17994)

(assert (=> d!70981 (= lt!328945 (readBit!0 lt!328147))))

(assert (=> d!70981 (= (readBitPure!0 lt!328147) (tuple2!17983 (_2!9652 lt!328945) (_1!9652 lt!328945)))))

(declare-fun bs!17430 () Bool)

(assert (= bs!17430 d!70981))

(declare-fun m!323087 () Bool)

(assert (=> bs!17430 m!323087))

(assert (=> b!209608 d!70981))

(declare-fun d!70983 () Bool)

(declare-fun lt!328946 () tuple2!17994)

(assert (=> d!70983 (= lt!328946 (readBit!0 (_1!9649 lt!328140)))))

(assert (=> d!70983 (= (readBitPure!0 (_1!9649 lt!328140)) (tuple2!17983 (_2!9652 lt!328946) (_1!9652 lt!328946)))))

(declare-fun bs!17431 () Bool)

(assert (= bs!17431 d!70983))

(declare-fun m!323089 () Bool)

(assert (=> bs!17431 m!323089))

(assert (=> b!209608 d!70983))

(declare-fun d!70985 () Bool)

(declare-fun e!143244 () Bool)

(assert (=> d!70985 e!143244))

(declare-fun res!176222 () Bool)

(assert (=> d!70985 (=> (not res!176222) (not e!143244))))

(declare-fun lt!328951 () (_ BitVec 64))

(declare-fun lt!328948 () (_ BitVec 64))

(declare-fun lt!328950 () (_ BitVec 64))

(assert (=> d!70985 (= res!176222 (= lt!328948 (bvsub lt!328950 lt!328951)))))

(assert (=> d!70985 (or (= (bvand lt!328950 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!328951 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!328950 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!328950 lt!328951) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70985 (= lt!328951 (remainingBits!0 ((_ sign_extend 32) (size!4605 (buf!5119 (_1!9646 lt!328151)))) ((_ sign_extend 32) (currentByte!9655 (_1!9646 lt!328151))) ((_ sign_extend 32) (currentBit!9650 (_1!9646 lt!328151)))))))

(declare-fun lt!328949 () (_ BitVec 64))

(declare-fun lt!328947 () (_ BitVec 64))

(assert (=> d!70985 (= lt!328950 (bvmul lt!328949 lt!328947))))

(assert (=> d!70985 (or (= lt!328949 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!328947 (bvsdiv (bvmul lt!328949 lt!328947) lt!328949)))))

(assert (=> d!70985 (= lt!328947 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70985 (= lt!328949 ((_ sign_extend 32) (size!4605 (buf!5119 (_1!9646 lt!328151)))))))

(assert (=> d!70985 (= lt!328948 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9655 (_1!9646 lt!328151))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9650 (_1!9646 lt!328151)))))))

(assert (=> d!70985 (invariant!0 (currentBit!9650 (_1!9646 lt!328151)) (currentByte!9655 (_1!9646 lt!328151)) (size!4605 (buf!5119 (_1!9646 lt!328151))))))

(assert (=> d!70985 (= (bitIndex!0 (size!4605 (buf!5119 (_1!9646 lt!328151))) (currentByte!9655 (_1!9646 lt!328151)) (currentBit!9650 (_1!9646 lt!328151))) lt!328948)))

(declare-fun b!209902 () Bool)

(declare-fun res!176223 () Bool)

(assert (=> b!209902 (=> (not res!176223) (not e!143244))))

(assert (=> b!209902 (= res!176223 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!328948))))

(declare-fun b!209903 () Bool)

(declare-fun lt!328952 () (_ BitVec 64))

(assert (=> b!209903 (= e!143244 (bvsle lt!328948 (bvmul lt!328952 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!209903 (or (= lt!328952 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!328952 #b0000000000000000000000000000000000000000000000000000000000001000) lt!328952)))))

(assert (=> b!209903 (= lt!328952 ((_ sign_extend 32) (size!4605 (buf!5119 (_1!9646 lt!328151)))))))

(assert (= (and d!70985 res!176222) b!209902))

(assert (= (and b!209902 res!176223) b!209903))

(declare-fun m!323091 () Bool)

(assert (=> d!70985 m!323091))

(declare-fun m!323093 () Bool)

(assert (=> d!70985 m!323093))

(assert (=> b!209608 d!70985))

(declare-fun d!70987 () Bool)

(assert (=> d!70987 (validate_offset_bits!1 ((_ sign_extend 32) (size!4605 (buf!5119 (_2!9647 lt!328153)))) ((_ sign_extend 32) (currentByte!9655 (_2!9647 lt!328143))) ((_ sign_extend 32) (currentBit!9650 (_2!9647 lt!328143))) lt!328148)))

(declare-fun lt!328955 () Unit!14921)

(declare-fun choose!9 (BitStream!8318 array!10476 (_ BitVec 64) BitStream!8318) Unit!14921)

(assert (=> d!70987 (= lt!328955 (choose!9 (_2!9647 lt!328143) (buf!5119 (_2!9647 lt!328153)) lt!328148 (BitStream!8319 (buf!5119 (_2!9647 lt!328153)) (currentByte!9655 (_2!9647 lt!328143)) (currentBit!9650 (_2!9647 lt!328143)))))))

(assert (=> d!70987 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9647 lt!328143) (buf!5119 (_2!9647 lt!328153)) lt!328148) lt!328955)))

(declare-fun bs!17432 () Bool)

(assert (= bs!17432 d!70987))

(assert (=> bs!17432 m!322553))

(declare-fun m!323095 () Bool)

(assert (=> bs!17432 m!323095))

(assert (=> b!209608 d!70987))

(declare-fun d!70989 () Bool)

(assert (=> d!70989 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4605 (buf!5119 (_2!9647 lt!328153)))) ((_ sign_extend 32) (currentByte!9655 thiss!1204)) ((_ sign_extend 32) (currentBit!9650 thiss!1204)) lt!328165) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4605 (buf!5119 (_2!9647 lt!328153)))) ((_ sign_extend 32) (currentByte!9655 thiss!1204)) ((_ sign_extend 32) (currentBit!9650 thiss!1204))) lt!328165))))

(declare-fun bs!17433 () Bool)

(assert (= bs!17433 d!70989))

(declare-fun m!323097 () Bool)

(assert (=> bs!17433 m!323097))

(assert (=> b!209608 d!70989))

(declare-fun d!70991 () Bool)

(declare-fun lt!328956 () tuple2!17994)

(assert (=> d!70991 (= lt!328956 (readBit!0 (BitStream!8319 (buf!5119 (_2!9647 lt!328153)) (currentByte!9655 thiss!1204) (currentBit!9650 thiss!1204))))))

(assert (=> d!70991 (= (readBitPure!0 (BitStream!8319 (buf!5119 (_2!9647 lt!328153)) (currentByte!9655 thiss!1204) (currentBit!9650 thiss!1204))) (tuple2!17983 (_2!9652 lt!328956) (_1!9652 lt!328956)))))

(declare-fun bs!17434 () Bool)

(assert (= bs!17434 d!70991))

(declare-fun m!323099 () Bool)

(assert (=> bs!17434 m!323099))

(assert (=> b!209608 d!70991))

(declare-fun d!70993 () Bool)

(declare-datatypes ((tuple2!17996 0))(
  ( (tuple2!17997 (_1!9653 (_ BitVec 64)) (_2!9653 BitStream!8318)) )
))
(declare-fun lt!328959 () tuple2!17996)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8318 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17996)

(assert (=> d!70993 (= lt!328959 (readNBitsLSBFirstsLoop!0 (_1!9649 lt!328140) nBits!348 i!590 lt!328145))))

(assert (=> d!70993 (= (readNBitsLSBFirstsLoopPure!0 (_1!9649 lt!328140) nBits!348 i!590 lt!328145) (tuple2!17987 (_2!9653 lt!328959) (_1!9653 lt!328959)))))

(declare-fun bs!17435 () Bool)

(assert (= bs!17435 d!70993))

(declare-fun m!323101 () Bool)

(assert (=> bs!17435 m!323101))

(assert (=> b!209608 d!70993))

(declare-fun d!70995 () Bool)

(assert (=> d!70995 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4605 (buf!5119 (_2!9647 lt!328153)))) ((_ sign_extend 32) (currentByte!9655 (_2!9647 lt!328143))) ((_ sign_extend 32) (currentBit!9650 (_2!9647 lt!328143))) lt!328148) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4605 (buf!5119 (_2!9647 lt!328153)))) ((_ sign_extend 32) (currentByte!9655 (_2!9647 lt!328143))) ((_ sign_extend 32) (currentBit!9650 (_2!9647 lt!328143)))) lt!328148))))

(declare-fun bs!17436 () Bool)

(assert (= bs!17436 d!70995))

(declare-fun m!323103 () Bool)

(assert (=> bs!17436 m!323103))

(assert (=> b!209608 d!70995))

(declare-fun d!70997 () Bool)

(declare-fun e!143250 () Bool)

(assert (=> d!70997 e!143250))

(declare-fun res!176231 () Bool)

(assert (=> d!70997 (=> (not res!176231) (not e!143250))))

(declare-fun lt!329014 () tuple2!17988)

(assert (=> d!70997 (= res!176231 (isPrefixOf!0 (_1!9649 lt!329014) (_2!9649 lt!329014)))))

(declare-fun lt!329010 () BitStream!8318)

(assert (=> d!70997 (= lt!329014 (tuple2!17989 lt!329010 (_2!9647 lt!328153)))))

(declare-fun lt!329004 () Unit!14921)

(declare-fun lt!329000 () Unit!14921)

(assert (=> d!70997 (= lt!329004 lt!329000)))

(assert (=> d!70997 (isPrefixOf!0 lt!329010 (_2!9647 lt!328153))))

(assert (=> d!70997 (= lt!329000 (lemmaIsPrefixTransitive!0 lt!329010 (_2!9647 lt!328153) (_2!9647 lt!328153)))))

(declare-fun lt!329009 () Unit!14921)

(declare-fun lt!329017 () Unit!14921)

(assert (=> d!70997 (= lt!329009 lt!329017)))

(assert (=> d!70997 (isPrefixOf!0 lt!329010 (_2!9647 lt!328153))))

(assert (=> d!70997 (= lt!329017 (lemmaIsPrefixTransitive!0 lt!329010 thiss!1204 (_2!9647 lt!328153)))))

(declare-fun lt!329018 () Unit!14921)

(declare-fun e!143249 () Unit!14921)

(assert (=> d!70997 (= lt!329018 e!143249)))

(declare-fun c!10321 () Bool)

(assert (=> d!70997 (= c!10321 (not (= (size!4605 (buf!5119 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!329005 () Unit!14921)

(declare-fun lt!329012 () Unit!14921)

(assert (=> d!70997 (= lt!329005 lt!329012)))

(assert (=> d!70997 (isPrefixOf!0 (_2!9647 lt!328153) (_2!9647 lt!328153))))

(assert (=> d!70997 (= lt!329012 (lemmaIsPrefixRefl!0 (_2!9647 lt!328153)))))

(declare-fun lt!329019 () Unit!14921)

(declare-fun lt!329011 () Unit!14921)

(assert (=> d!70997 (= lt!329019 lt!329011)))

(assert (=> d!70997 (= lt!329011 (lemmaIsPrefixRefl!0 (_2!9647 lt!328153)))))

(declare-fun lt!329008 () Unit!14921)

(declare-fun lt!329007 () Unit!14921)

(assert (=> d!70997 (= lt!329008 lt!329007)))

(assert (=> d!70997 (isPrefixOf!0 lt!329010 lt!329010)))

(assert (=> d!70997 (= lt!329007 (lemmaIsPrefixRefl!0 lt!329010))))

(declare-fun lt!329002 () Unit!14921)

(declare-fun lt!329013 () Unit!14921)

(assert (=> d!70997 (= lt!329002 lt!329013)))

(assert (=> d!70997 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!70997 (= lt!329013 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!70997 (= lt!329010 (BitStream!8319 (buf!5119 (_2!9647 lt!328153)) (currentByte!9655 thiss!1204) (currentBit!9650 thiss!1204)))))

(assert (=> d!70997 (isPrefixOf!0 thiss!1204 (_2!9647 lt!328153))))

(assert (=> d!70997 (= (reader!0 thiss!1204 (_2!9647 lt!328153)) lt!329014)))

(declare-fun b!209914 () Bool)

(declare-fun lt!329006 () Unit!14921)

(assert (=> b!209914 (= e!143249 lt!329006)))

(declare-fun lt!329016 () (_ BitVec 64))

(assert (=> b!209914 (= lt!329016 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!329003 () (_ BitVec 64))

(assert (=> b!209914 (= lt!329003 (bitIndex!0 (size!4605 (buf!5119 thiss!1204)) (currentByte!9655 thiss!1204) (currentBit!9650 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10476 array!10476 (_ BitVec 64) (_ BitVec 64)) Unit!14921)

(assert (=> b!209914 (= lt!329006 (arrayBitRangesEqSymmetric!0 (buf!5119 thiss!1204) (buf!5119 (_2!9647 lt!328153)) lt!329016 lt!329003))))

(assert (=> b!209914 (arrayBitRangesEq!0 (buf!5119 (_2!9647 lt!328153)) (buf!5119 thiss!1204) lt!329016 lt!329003)))

(declare-fun b!209915 () Bool)

(declare-fun res!176230 () Bool)

(assert (=> b!209915 (=> (not res!176230) (not e!143250))))

(assert (=> b!209915 (= res!176230 (isPrefixOf!0 (_1!9649 lt!329014) thiss!1204))))

(declare-fun b!209916 () Bool)

(declare-fun res!176232 () Bool)

(assert (=> b!209916 (=> (not res!176232) (not e!143250))))

(assert (=> b!209916 (= res!176232 (isPrefixOf!0 (_2!9649 lt!329014) (_2!9647 lt!328153)))))

(declare-fun b!209917 () Bool)

(declare-fun Unit!14947 () Unit!14921)

(assert (=> b!209917 (= e!143249 Unit!14947)))

(declare-fun b!209918 () Bool)

(declare-fun lt!329001 () (_ BitVec 64))

(declare-fun lt!329015 () (_ BitVec 64))

(assert (=> b!209918 (= e!143250 (= (_1!9649 lt!329014) (withMovedBitIndex!0 (_2!9649 lt!329014) (bvsub lt!329015 lt!329001))))))

(assert (=> b!209918 (or (= (bvand lt!329015 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!329001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!329015 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!329015 lt!329001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209918 (= lt!329001 (bitIndex!0 (size!4605 (buf!5119 (_2!9647 lt!328153))) (currentByte!9655 (_2!9647 lt!328153)) (currentBit!9650 (_2!9647 lt!328153))))))

(assert (=> b!209918 (= lt!329015 (bitIndex!0 (size!4605 (buf!5119 thiss!1204)) (currentByte!9655 thiss!1204) (currentBit!9650 thiss!1204)))))

(assert (= (and d!70997 c!10321) b!209914))

(assert (= (and d!70997 (not c!10321)) b!209917))

(assert (= (and d!70997 res!176231) b!209915))

(assert (= (and b!209915 res!176230) b!209916))

(assert (= (and b!209916 res!176232) b!209918))

(declare-fun m!323105 () Bool)

(assert (=> d!70997 m!323105))

(declare-fun m!323107 () Bool)

(assert (=> d!70997 m!323107))

(declare-fun m!323109 () Bool)

(assert (=> d!70997 m!323109))

(declare-fun m!323111 () Bool)

(assert (=> d!70997 m!323111))

(declare-fun m!323113 () Bool)

(assert (=> d!70997 m!323113))

(declare-fun m!323115 () Bool)

(assert (=> d!70997 m!323115))

(declare-fun m!323117 () Bool)

(assert (=> d!70997 m!323117))

(assert (=> d!70997 m!322531))

(declare-fun m!323119 () Bool)

(assert (=> d!70997 m!323119))

(declare-fun m!323121 () Bool)

(assert (=> d!70997 m!323121))

(declare-fun m!323123 () Bool)

(assert (=> d!70997 m!323123))

(assert (=> b!209914 m!322509))

(declare-fun m!323125 () Bool)

(assert (=> b!209914 m!323125))

(declare-fun m!323127 () Bool)

(assert (=> b!209914 m!323127))

(declare-fun m!323129 () Bool)

(assert (=> b!209918 m!323129))

(assert (=> b!209918 m!322529))

(assert (=> b!209918 m!322509))

(declare-fun m!323131 () Bool)

(assert (=> b!209915 m!323131))

(declare-fun m!323133 () Bool)

(assert (=> b!209916 m!323133))

(assert (=> b!209608 d!70997))

(declare-fun d!70999 () Bool)

(declare-fun e!143253 () Bool)

(assert (=> d!70999 e!143253))

(declare-fun res!176235 () Bool)

(assert (=> d!70999 (=> (not res!176235) (not e!143253))))

(declare-fun lt!329028 () tuple2!17982)

(declare-fun lt!329031 () tuple2!17982)

(assert (=> d!70999 (= res!176235 (= (bitIndex!0 (size!4605 (buf!5119 (_1!9646 lt!329028))) (currentByte!9655 (_1!9646 lt!329028)) (currentBit!9650 (_1!9646 lt!329028))) (bitIndex!0 (size!4605 (buf!5119 (_1!9646 lt!329031))) (currentByte!9655 (_1!9646 lt!329031)) (currentBit!9650 (_1!9646 lt!329031)))))))

(declare-fun lt!329030 () BitStream!8318)

(declare-fun lt!329029 () Unit!14921)

(declare-fun choose!50 (BitStream!8318 BitStream!8318 BitStream!8318 tuple2!17982 tuple2!17982 BitStream!8318 Bool tuple2!17982 tuple2!17982 BitStream!8318 Bool) Unit!14921)

(assert (=> d!70999 (= lt!329029 (choose!50 lt!328147 (_2!9647 lt!328153) lt!329030 lt!329028 (tuple2!17983 (_1!9646 lt!329028) (_2!9646 lt!329028)) (_1!9646 lt!329028) (_2!9646 lt!329028) lt!329031 (tuple2!17983 (_1!9646 lt!329031) (_2!9646 lt!329031)) (_1!9646 lt!329031) (_2!9646 lt!329031)))))

(assert (=> d!70999 (= lt!329031 (readBitPure!0 lt!329030))))

(assert (=> d!70999 (= lt!329028 (readBitPure!0 lt!328147))))

(assert (=> d!70999 (= lt!329030 (BitStream!8319 (buf!5119 (_2!9647 lt!328153)) (currentByte!9655 lt!328147) (currentBit!9650 lt!328147)))))

(assert (=> d!70999 (invariant!0 (currentBit!9650 lt!328147) (currentByte!9655 lt!328147) (size!4605 (buf!5119 (_2!9647 lt!328153))))))

(assert (=> d!70999 (= (readBitPrefixLemma!0 lt!328147 (_2!9647 lt!328153)) lt!329029)))

(declare-fun b!209921 () Bool)

(assert (=> b!209921 (= e!143253 (= (_2!9646 lt!329028) (_2!9646 lt!329031)))))

(assert (= (and d!70999 res!176235) b!209921))

(declare-fun m!323135 () Bool)

(assert (=> d!70999 m!323135))

(declare-fun m!323137 () Bool)

(assert (=> d!70999 m!323137))

(assert (=> d!70999 m!322549))

(declare-fun m!323139 () Bool)

(assert (=> d!70999 m!323139))

(declare-fun m!323141 () Bool)

(assert (=> d!70999 m!323141))

(declare-fun m!323143 () Bool)

(assert (=> d!70999 m!323143))

(assert (=> b!209608 d!70999))

(declare-fun d!71001 () Bool)

(declare-fun e!143255 () Bool)

(assert (=> d!71001 e!143255))

(declare-fun res!176237 () Bool)

(assert (=> d!71001 (=> (not res!176237) (not e!143255))))

(declare-fun lt!329046 () tuple2!17988)

(assert (=> d!71001 (= res!176237 (isPrefixOf!0 (_1!9649 lt!329046) (_2!9649 lt!329046)))))

(declare-fun lt!329042 () BitStream!8318)

(assert (=> d!71001 (= lt!329046 (tuple2!17989 lt!329042 (_2!9647 lt!328153)))))

(declare-fun lt!329036 () Unit!14921)

(declare-fun lt!329032 () Unit!14921)

(assert (=> d!71001 (= lt!329036 lt!329032)))

(assert (=> d!71001 (isPrefixOf!0 lt!329042 (_2!9647 lt!328153))))

(assert (=> d!71001 (= lt!329032 (lemmaIsPrefixTransitive!0 lt!329042 (_2!9647 lt!328153) (_2!9647 lt!328153)))))

(declare-fun lt!329041 () Unit!14921)

(declare-fun lt!329049 () Unit!14921)

(assert (=> d!71001 (= lt!329041 lt!329049)))

(assert (=> d!71001 (isPrefixOf!0 lt!329042 (_2!9647 lt!328153))))

(assert (=> d!71001 (= lt!329049 (lemmaIsPrefixTransitive!0 lt!329042 (_2!9647 lt!328143) (_2!9647 lt!328153)))))

(declare-fun lt!329050 () Unit!14921)

(declare-fun e!143254 () Unit!14921)

(assert (=> d!71001 (= lt!329050 e!143254)))

(declare-fun c!10322 () Bool)

(assert (=> d!71001 (= c!10322 (not (= (size!4605 (buf!5119 (_2!9647 lt!328143))) #b00000000000000000000000000000000)))))

(declare-fun lt!329037 () Unit!14921)

(declare-fun lt!329044 () Unit!14921)

(assert (=> d!71001 (= lt!329037 lt!329044)))

(assert (=> d!71001 (isPrefixOf!0 (_2!9647 lt!328153) (_2!9647 lt!328153))))

(assert (=> d!71001 (= lt!329044 (lemmaIsPrefixRefl!0 (_2!9647 lt!328153)))))

(declare-fun lt!329051 () Unit!14921)

(declare-fun lt!329043 () Unit!14921)

(assert (=> d!71001 (= lt!329051 lt!329043)))

(assert (=> d!71001 (= lt!329043 (lemmaIsPrefixRefl!0 (_2!9647 lt!328153)))))

(declare-fun lt!329040 () Unit!14921)

(declare-fun lt!329039 () Unit!14921)

(assert (=> d!71001 (= lt!329040 lt!329039)))

(assert (=> d!71001 (isPrefixOf!0 lt!329042 lt!329042)))

(assert (=> d!71001 (= lt!329039 (lemmaIsPrefixRefl!0 lt!329042))))

(declare-fun lt!329034 () Unit!14921)

(declare-fun lt!329045 () Unit!14921)

(assert (=> d!71001 (= lt!329034 lt!329045)))

(assert (=> d!71001 (isPrefixOf!0 (_2!9647 lt!328143) (_2!9647 lt!328143))))

(assert (=> d!71001 (= lt!329045 (lemmaIsPrefixRefl!0 (_2!9647 lt!328143)))))

(assert (=> d!71001 (= lt!329042 (BitStream!8319 (buf!5119 (_2!9647 lt!328153)) (currentByte!9655 (_2!9647 lt!328143)) (currentBit!9650 (_2!9647 lt!328143))))))

(assert (=> d!71001 (isPrefixOf!0 (_2!9647 lt!328143) (_2!9647 lt!328153))))

(assert (=> d!71001 (= (reader!0 (_2!9647 lt!328143) (_2!9647 lt!328153)) lt!329046)))

(declare-fun b!209922 () Bool)

(declare-fun lt!329038 () Unit!14921)

(assert (=> b!209922 (= e!143254 lt!329038)))

(declare-fun lt!329048 () (_ BitVec 64))

(assert (=> b!209922 (= lt!329048 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!329035 () (_ BitVec 64))

(assert (=> b!209922 (= lt!329035 (bitIndex!0 (size!4605 (buf!5119 (_2!9647 lt!328143))) (currentByte!9655 (_2!9647 lt!328143)) (currentBit!9650 (_2!9647 lt!328143))))))

(assert (=> b!209922 (= lt!329038 (arrayBitRangesEqSymmetric!0 (buf!5119 (_2!9647 lt!328143)) (buf!5119 (_2!9647 lt!328153)) lt!329048 lt!329035))))

(assert (=> b!209922 (arrayBitRangesEq!0 (buf!5119 (_2!9647 lt!328153)) (buf!5119 (_2!9647 lt!328143)) lt!329048 lt!329035)))

(declare-fun b!209923 () Bool)

(declare-fun res!176236 () Bool)

(assert (=> b!209923 (=> (not res!176236) (not e!143255))))

(assert (=> b!209923 (= res!176236 (isPrefixOf!0 (_1!9649 lt!329046) (_2!9647 lt!328143)))))

(declare-fun b!209924 () Bool)

(declare-fun res!176238 () Bool)

(assert (=> b!209924 (=> (not res!176238) (not e!143255))))

(assert (=> b!209924 (= res!176238 (isPrefixOf!0 (_2!9649 lt!329046) (_2!9647 lt!328153)))))

(declare-fun b!209925 () Bool)

(declare-fun Unit!14948 () Unit!14921)

(assert (=> b!209925 (= e!143254 Unit!14948)))

(declare-fun lt!329033 () (_ BitVec 64))

(declare-fun lt!329047 () (_ BitVec 64))

(declare-fun b!209926 () Bool)

(assert (=> b!209926 (= e!143255 (= (_1!9649 lt!329046) (withMovedBitIndex!0 (_2!9649 lt!329046) (bvsub lt!329047 lt!329033))))))

(assert (=> b!209926 (or (= (bvand lt!329047 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!329033 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!329047 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!329047 lt!329033) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209926 (= lt!329033 (bitIndex!0 (size!4605 (buf!5119 (_2!9647 lt!328153))) (currentByte!9655 (_2!9647 lt!328153)) (currentBit!9650 (_2!9647 lt!328153))))))

(assert (=> b!209926 (= lt!329047 (bitIndex!0 (size!4605 (buf!5119 (_2!9647 lt!328143))) (currentByte!9655 (_2!9647 lt!328143)) (currentBit!9650 (_2!9647 lt!328143))))))

(assert (= (and d!71001 c!10322) b!209922))

(assert (= (and d!71001 (not c!10322)) b!209925))

(assert (= (and d!71001 res!176237) b!209923))

(assert (= (and b!209923 res!176236) b!209924))

(assert (= (and b!209924 res!176238) b!209926))

(declare-fun m!323145 () Bool)

(assert (=> d!71001 m!323145))

(declare-fun m!323147 () Bool)

(assert (=> d!71001 m!323147))

(declare-fun m!323149 () Bool)

(assert (=> d!71001 m!323149))

(declare-fun m!323151 () Bool)

(assert (=> d!71001 m!323151))

(declare-fun m!323153 () Bool)

(assert (=> d!71001 m!323153))

(declare-fun m!323155 () Bool)

(assert (=> d!71001 m!323155))

(assert (=> d!71001 m!323117))

(assert (=> d!71001 m!322527))

(declare-fun m!323157 () Bool)

(assert (=> d!71001 m!323157))

(assert (=> d!71001 m!323121))

(assert (=> d!71001 m!322979))

(assert (=> b!209922 m!322507))

(declare-fun m!323159 () Bool)

(assert (=> b!209922 m!323159))

(declare-fun m!323161 () Bool)

(assert (=> b!209922 m!323161))

(declare-fun m!323163 () Bool)

(assert (=> b!209926 m!323163))

(assert (=> b!209926 m!322529))

(assert (=> b!209926 m!322507))

(declare-fun m!323165 () Bool)

(assert (=> b!209923 m!323165))

(declare-fun m!323167 () Bool)

(assert (=> b!209924 m!323167))

(assert (=> b!209608 d!71001))

(declare-fun d!71003 () Bool)

(assert (=> d!71003 (validate_offset_bits!1 ((_ sign_extend 32) (size!4605 (buf!5119 (_2!9647 lt!328153)))) ((_ sign_extend 32) (currentByte!9655 thiss!1204)) ((_ sign_extend 32) (currentBit!9650 thiss!1204)) lt!328165)))

(declare-fun lt!329052 () Unit!14921)

(assert (=> d!71003 (= lt!329052 (choose!9 thiss!1204 (buf!5119 (_2!9647 lt!328153)) lt!328165 (BitStream!8319 (buf!5119 (_2!9647 lt!328153)) (currentByte!9655 thiss!1204) (currentBit!9650 thiss!1204))))))

(assert (=> d!71003 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5119 (_2!9647 lt!328153)) lt!328165) lt!329052)))

(declare-fun bs!17437 () Bool)

(assert (= bs!17437 d!71003))

(assert (=> bs!17437 m!322547))

(declare-fun m!323169 () Bool)

(assert (=> bs!17437 m!323169))

(assert (=> b!209608 d!71003))

(declare-fun d!71005 () Bool)

(assert (=> d!71005 (= (invariant!0 (currentBit!9650 thiss!1204) (currentByte!9655 thiss!1204) (size!4605 (buf!5119 (_2!9647 lt!328143)))) (and (bvsge (currentBit!9650 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9650 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9655 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9655 thiss!1204) (size!4605 (buf!5119 (_2!9647 lt!328143)))) (and (= (currentBit!9650 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9655 thiss!1204) (size!4605 (buf!5119 (_2!9647 lt!328143))))))))))

(assert (=> b!209608 d!71005))

(declare-fun d!71007 () Bool)

(declare-fun lt!329053 () tuple2!17996)

(assert (=> d!71007 (= lt!329053 (readNBitsLSBFirstsLoop!0 (_1!9649 lt!328146) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!328152))))

(assert (=> d!71007 (= (readNBitsLSBFirstsLoopPure!0 (_1!9649 lt!328146) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!328152) (tuple2!17987 (_2!9653 lt!329053) (_1!9653 lt!329053)))))

(declare-fun bs!17438 () Bool)

(assert (= bs!17438 d!71007))

(declare-fun m!323171 () Bool)

(assert (=> bs!17438 m!323171))

(assert (=> b!209608 d!71007))

(declare-fun d!71009 () Bool)

(assert (=> d!71009 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4605 (buf!5119 thiss!1204))) ((_ sign_extend 32) (currentByte!9655 thiss!1204)) ((_ sign_extend 32) (currentBit!9650 thiss!1204)) lt!328165) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4605 (buf!5119 thiss!1204))) ((_ sign_extend 32) (currentByte!9655 thiss!1204)) ((_ sign_extend 32) (currentBit!9650 thiss!1204))) lt!328165))))

(declare-fun bs!17439 () Bool)

(assert (= bs!17439 d!71009))

(assert (=> bs!17439 m!322727))

(assert (=> b!209615 d!71009))

(assert (=> b!209604 d!70975))

(declare-fun d!71011 () Bool)

(assert (=> d!71011 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9650 thiss!1204) (currentByte!9655 thiss!1204) (size!4605 (buf!5119 thiss!1204))))))

(declare-fun bs!17440 () Bool)

(assert (= bs!17440 d!71011))

(assert (=> bs!17440 m!322543))

(assert (=> start!43978 d!71011))

(assert (=> b!209616 d!70879))

(assert (=> b!209616 d!70881))

(declare-fun d!71013 () Bool)

(declare-fun lt!329066 () tuple2!17986)

(declare-fun lt!329068 () tuple2!17986)

(assert (=> d!71013 (and (= (_2!9648 lt!329066) (_2!9648 lt!329068)) (= (_1!9648 lt!329066) (_1!9648 lt!329068)))))

(declare-fun lt!329070 () Unit!14921)

(declare-fun lt!329071 () (_ BitVec 64))

(declare-fun lt!329067 () BitStream!8318)

(declare-fun lt!329069 () Bool)

(declare-fun choose!56 (BitStream!8318 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!17986 tuple2!17986 BitStream!8318 (_ BitVec 64) Bool BitStream!8318 (_ BitVec 64) tuple2!17986 tuple2!17986 BitStream!8318 (_ BitVec 64)) Unit!14921)

(assert (=> d!71013 (= lt!329070 (choose!56 (_1!9649 lt!328140) nBits!348 i!590 lt!328145 lt!329066 (tuple2!17987 (_1!9648 lt!329066) (_2!9648 lt!329066)) (_1!9648 lt!329066) (_2!9648 lt!329066) lt!329069 lt!329067 lt!329071 lt!329068 (tuple2!17987 (_1!9648 lt!329068) (_2!9648 lt!329068)) (_1!9648 lt!329068) (_2!9648 lt!329068)))))

(assert (=> d!71013 (= lt!329068 (readNBitsLSBFirstsLoopPure!0 lt!329067 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!329071))))

(assert (=> d!71013 (= lt!329071 (bvor lt!328145 (ite lt!329069 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71013 (= lt!329067 (withMovedBitIndex!0 (_1!9649 lt!328140) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!71013 (= lt!329069 (_2!9646 (readBitPure!0 (_1!9649 lt!328140))))))

(assert (=> d!71013 (= lt!329066 (readNBitsLSBFirstsLoopPure!0 (_1!9649 lt!328140) nBits!348 i!590 lt!328145))))

(assert (=> d!71013 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9649 lt!328140) nBits!348 i!590 lt!328145) lt!329070)))

(declare-fun bs!17442 () Bool)

(assert (= bs!17442 d!71013))

(declare-fun m!323173 () Bool)

(assert (=> bs!17442 m!323173))

(declare-fun m!323175 () Bool)

(assert (=> bs!17442 m!323175))

(assert (=> bs!17442 m!322539))

(assert (=> bs!17442 m!322571))

(assert (=> bs!17442 m!322573))

(assert (=> b!209606 d!71013))

(declare-fun lt!329072 () tuple2!17996)

(declare-fun d!71015 () Bool)

(assert (=> d!71015 (= lt!329072 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!9649 lt!328140) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!328152))))

(assert (=> d!71015 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9649 lt!328140) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!328152) (tuple2!17987 (_2!9653 lt!329072) (_1!9653 lt!329072)))))

(declare-fun bs!17443 () Bool)

(assert (= bs!17443 d!71015))

(assert (=> bs!17443 m!322539))

(declare-fun m!323177 () Bool)

(assert (=> bs!17443 m!323177))

(assert (=> b!209606 d!71015))

(declare-fun d!71017 () Bool)

(declare-fun e!143258 () Bool)

(assert (=> d!71017 e!143258))

(declare-fun res!176241 () Bool)

(assert (=> d!71017 (=> (not res!176241) (not e!143258))))

(declare-fun lt!329078 () (_ BitVec 64))

(declare-fun lt!329077 () BitStream!8318)

(assert (=> d!71017 (= res!176241 (= (bvadd lt!329078 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4605 (buf!5119 lt!329077)) (currentByte!9655 lt!329077) (currentBit!9650 lt!329077))))))

(assert (=> d!71017 (or (not (= (bvand lt!329078 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!329078 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!329078 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71017 (= lt!329078 (bitIndex!0 (size!4605 (buf!5119 (_1!9649 lt!328140))) (currentByte!9655 (_1!9649 lt!328140)) (currentBit!9650 (_1!9649 lt!328140))))))

(declare-fun moveBitIndex!0 (BitStream!8318 (_ BitVec 64)) tuple2!17984)

(assert (=> d!71017 (= lt!329077 (_2!9647 (moveBitIndex!0 (_1!9649 lt!328140) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8318 (_ BitVec 64)) Bool)

(assert (=> d!71017 (moveBitIndexPrecond!0 (_1!9649 lt!328140) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!71017 (= (withMovedBitIndex!0 (_1!9649 lt!328140) #b0000000000000000000000000000000000000000000000000000000000000001) lt!329077)))

(declare-fun b!209929 () Bool)

(assert (=> b!209929 (= e!143258 (= (size!4605 (buf!5119 (_1!9649 lt!328140))) (size!4605 (buf!5119 lt!329077))))))

(assert (= (and d!71017 res!176241) b!209929))

(declare-fun m!323179 () Bool)

(assert (=> d!71017 m!323179))

(declare-fun m!323181 () Bool)

(assert (=> d!71017 m!323181))

(declare-fun m!323183 () Bool)

(assert (=> d!71017 m!323183))

(declare-fun m!323185 () Bool)

(assert (=> d!71017 m!323185))

(assert (=> b!209606 d!71017))

(push 1)

(assert (not b!209883))

(assert (not d!71017))

(assert (not d!70979))

(assert (not d!70973))

(assert (not b!209897))

(assert (not d!70993))

(assert (not b!209891))

(assert (not d!71009))

(assert (not d!71011))

(assert (not d!70889))

(assert (not b!209893))

(assert (not b!209874))

(assert (not b!209877))

(assert (not b!209924))

(assert (not b!209915))

(assert (not bm!3300))

(assert (not d!70995))

(assert (not b!209707))

(assert (not b!209916))

(assert (not d!70965))

(assert (not d!70989))

(assert (not b!209710))

(assert (not b!209708))

(assert (not d!71013))

(assert (not d!71001))

(assert (not d!70879))

(assert (not b!209923))

(assert (not d!70987))

(assert (not d!70983))

(assert (not b!209914))

(assert (not d!70893))

(assert (not b!209896))

(assert (not d!70991))

(assert (not b!209880))

(assert (not d!70985))

(assert (not d!70883))

(assert (not b!209879))

(assert (not b!209899))

(assert (not d!70981))

(assert (not b!209926))

(assert (not d!71003))

(assert (not b!209875))

(assert (not d!70999))

(assert (not d!70881))

(assert (not b!209721))

(assert (not d!70971))

(assert (not b!209885))

(assert (not b!209888))

(assert (not b!209881))

(assert (not d!70895))

(assert (not d!71015))

(assert (not b!209709))

(assert (not d!70997))

(assert (not b!209918))

(assert (not d!71007))

(assert (not b!209922))

(assert (not b!209719))

(assert (not b!209886))

(check-sat)

(pop 1)

(push 1)

(check-sat)

