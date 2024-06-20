; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52480 () Bool)

(assert start!52480)

(declare-fun b!242095 () Bool)

(declare-fun e!167839 () Bool)

(declare-fun e!167834 () Bool)

(assert (=> b!242095 (= e!167839 (not e!167834))))

(declare-fun res!202148 () Bool)

(assert (=> b!242095 (=> res!202148 e!167834)))

(declare-datatypes ((array!13291 0))(
  ( (array!13292 (arr!6812 (Array (_ BitVec 32) (_ BitVec 8))) (size!5825 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10572 0))(
  ( (BitStream!10573 (buf!6291 array!13291) (currentByte!11654 (_ BitVec 32)) (currentBit!11649 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17733 0))(
  ( (Unit!17734) )
))
(declare-datatypes ((tuple2!20700 0))(
  ( (tuple2!20701 (_1!11272 Unit!17733) (_2!11272 BitStream!10572)) )
))
(declare-fun lt!377520 () tuple2!20700)

(declare-fun thiss!1005 () BitStream!10572)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242095 (= res!202148 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!5825 (buf!6291 (_2!11272 lt!377520)))) ((_ sign_extend 32) (currentByte!11654 thiss!1005)) ((_ sign_extend 32) (currentBit!11649 thiss!1005)))))))

(declare-fun e!167835 () Bool)

(assert (=> b!242095 e!167835))

(declare-fun res!202152 () Bool)

(assert (=> b!242095 (=> (not res!202152) (not e!167835))))

(declare-fun lt!377526 () tuple2!20700)

(declare-fun isPrefixOf!0 (BitStream!10572 BitStream!10572) Bool)

(assert (=> b!242095 (= res!202152 (isPrefixOf!0 thiss!1005 (_2!11272 lt!377526)))))

(declare-fun lt!377521 () Unit!17733)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10572 BitStream!10572 BitStream!10572) Unit!17733)

(assert (=> b!242095 (= lt!377521 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11272 lt!377520) (_2!11272 lt!377526)))))

(declare-fun e!167837 () Bool)

(assert (=> b!242095 e!167837))

(declare-fun res!202142 () Bool)

(assert (=> b!242095 (=> (not res!202142) (not e!167837))))

(assert (=> b!242095 (= res!202142 (= (size!5825 (buf!6291 (_2!11272 lt!377520))) (size!5825 (buf!6291 (_2!11272 lt!377526)))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun appendNBitsLoop!0 (BitStream!10572 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20700)

(assert (=> b!242095 (= lt!377526 (appendNBitsLoop!0 (_2!11272 lt!377520) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242095 (validate_offset_bits!1 ((_ sign_extend 32) (size!5825 (buf!6291 (_2!11272 lt!377520)))) ((_ sign_extend 32) (currentByte!11654 (_2!11272 lt!377520))) ((_ sign_extend 32) (currentBit!11649 (_2!11272 lt!377520))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!377519 () Unit!17733)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10572 BitStream!10572 (_ BitVec 64) (_ BitVec 64)) Unit!17733)

(assert (=> b!242095 (= lt!377519 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11272 lt!377520) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!167836 () Bool)

(assert (=> b!242095 e!167836))

(declare-fun res!202143 () Bool)

(assert (=> b!242095 (=> (not res!202143) (not e!167836))))

(assert (=> b!242095 (= res!202143 (= (size!5825 (buf!6291 thiss!1005)) (size!5825 (buf!6291 (_2!11272 lt!377520)))))))

(declare-fun appendBit!0 (BitStream!10572 Bool) tuple2!20700)

(assert (=> b!242095 (= lt!377520 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!242096 () Bool)

(declare-fun e!167831 () Bool)

(assert (=> b!242096 (= e!167836 e!167831)))

(declare-fun res!202141 () Bool)

(assert (=> b!242096 (=> (not res!202141) (not e!167831))))

(declare-fun lt!377515 () (_ BitVec 64))

(declare-fun lt!377523 () (_ BitVec 64))

(assert (=> b!242096 (= res!202141 (= lt!377515 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!377523)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!242096 (= lt!377515 (bitIndex!0 (size!5825 (buf!6291 (_2!11272 lt!377520))) (currentByte!11654 (_2!11272 lt!377520)) (currentBit!11649 (_2!11272 lt!377520))))))

(assert (=> b!242096 (= lt!377523 (bitIndex!0 (size!5825 (buf!6291 thiss!1005)) (currentByte!11654 thiss!1005) (currentBit!11649 thiss!1005)))))

(declare-fun b!242097 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!242097 (= e!167835 (invariant!0 (currentBit!11649 thiss!1005) (currentByte!11654 thiss!1005) (size!5825 (buf!6291 (_2!11272 lt!377520)))))))

(declare-fun b!242098 () Bool)

(declare-fun res!202149 () Bool)

(assert (=> b!242098 (=> (not res!202149) (not e!167831))))

(assert (=> b!242098 (= res!202149 (isPrefixOf!0 thiss!1005 (_2!11272 lt!377520)))))

(declare-fun res!202146 () Bool)

(assert (=> start!52480 (=> (not res!202146) (not e!167839))))

(assert (=> start!52480 (= res!202146 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52480 e!167839))

(assert (=> start!52480 true))

(declare-fun e!167838 () Bool)

(declare-fun inv!12 (BitStream!10572) Bool)

(assert (=> start!52480 (and (inv!12 thiss!1005) e!167838)))

(declare-fun b!242099 () Bool)

(declare-fun res!202144 () Bool)

(assert (=> b!242099 (=> (not res!202144) (not e!167839))))

(assert (=> b!242099 (= res!202144 (validate_offset_bits!1 ((_ sign_extend 32) (size!5825 (buf!6291 thiss!1005))) ((_ sign_extend 32) (currentByte!11654 thiss!1005)) ((_ sign_extend 32) (currentBit!11649 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!242100 () Bool)

(declare-fun e!167833 () Bool)

(declare-datatypes ((tuple2!20702 0))(
  ( (tuple2!20703 (_1!11273 BitStream!10572) (_2!11273 Bool)) )
))
(declare-fun lt!377524 () tuple2!20702)

(declare-datatypes ((tuple2!20704 0))(
  ( (tuple2!20705 (_1!11274 BitStream!10572) (_2!11274 BitStream!10572)) )
))
(declare-fun lt!377517 () tuple2!20704)

(assert (=> b!242100 (= e!167833 (not (or (not (_2!11273 lt!377524)) (not (= (_1!11273 lt!377524) (_2!11274 lt!377517))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10572 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20702)

(assert (=> b!242100 (= lt!377524 (checkBitsLoopPure!0 (_1!11274 lt!377517) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!377525 () (_ BitVec 64))

(assert (=> b!242100 (validate_offset_bits!1 ((_ sign_extend 32) (size!5825 (buf!6291 (_2!11272 lt!377526)))) ((_ sign_extend 32) (currentByte!11654 (_2!11272 lt!377520))) ((_ sign_extend 32) (currentBit!11649 (_2!11272 lt!377520))) lt!377525)))

(declare-fun lt!377518 () Unit!17733)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10572 array!13291 (_ BitVec 64)) Unit!17733)

(assert (=> b!242100 (= lt!377518 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11272 lt!377520) (buf!6291 (_2!11272 lt!377526)) lt!377525))))

(declare-fun reader!0 (BitStream!10572 BitStream!10572) tuple2!20704)

(assert (=> b!242100 (= lt!377517 (reader!0 (_2!11272 lt!377520) (_2!11272 lt!377526)))))

(declare-fun b!242101 () Bool)

(declare-fun res!202151 () Bool)

(assert (=> b!242101 (=> res!202151 e!167834)))

(declare-fun arrayBitRangesEq!0 (array!13291 array!13291 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242101 (= res!202151 (not (arrayBitRangesEq!0 (buf!6291 (_2!11272 lt!377520)) (buf!6291 (_2!11272 lt!377526)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!5825 (buf!6291 (_2!11272 lt!377520))) (currentByte!11654 thiss!1005) (currentBit!11649 thiss!1005))))))))

(declare-fun b!242102 () Bool)

(declare-fun array_inv!5566 (array!13291) Bool)

(assert (=> b!242102 (= e!167838 (array_inv!5566 (buf!6291 thiss!1005)))))

(declare-fun b!242103 () Bool)

(declare-fun res!202140 () Bool)

(assert (=> b!242103 (=> (not res!202140) (not e!167833))))

(assert (=> b!242103 (= res!202140 (isPrefixOf!0 (_2!11272 lt!377520) (_2!11272 lt!377526)))))

(declare-fun b!242104 () Bool)

(assert (=> b!242104 (= e!167834 true)))

(declare-fun lt!377516 () tuple2!20702)

(declare-fun readBitPure!0 (BitStream!10572) tuple2!20702)

(assert (=> b!242104 (= lt!377516 (readBitPure!0 (BitStream!10573 (buf!6291 (_2!11272 lt!377526)) (currentByte!11654 thiss!1005) (currentBit!11649 thiss!1005))))))

(declare-fun lt!377522 () tuple2!20702)

(assert (=> b!242104 (= lt!377522 (readBitPure!0 (BitStream!10573 (buf!6291 (_2!11272 lt!377520)) (currentByte!11654 thiss!1005) (currentBit!11649 thiss!1005))))))

(assert (=> b!242104 (invariant!0 (currentBit!11649 thiss!1005) (currentByte!11654 thiss!1005) (size!5825 (buf!6291 (_2!11272 lt!377526))))))

(declare-fun b!242105 () Bool)

(declare-fun e!167840 () Bool)

(declare-fun lt!377514 () tuple2!20702)

(assert (=> b!242105 (= e!167840 (= (bitIndex!0 (size!5825 (buf!6291 (_1!11273 lt!377514))) (currentByte!11654 (_1!11273 lt!377514)) (currentBit!11649 (_1!11273 lt!377514))) lt!377515))))

(declare-fun b!242106 () Bool)

(assert (=> b!242106 (= e!167831 e!167840)))

(declare-fun res!202150 () Bool)

(assert (=> b!242106 (=> (not res!202150) (not e!167840))))

(assert (=> b!242106 (= res!202150 (and (= (_2!11273 lt!377514) bit!26) (= (_1!11273 lt!377514) (_2!11272 lt!377520))))))

(declare-fun readerFrom!0 (BitStream!10572 (_ BitVec 32) (_ BitVec 32)) BitStream!10572)

(assert (=> b!242106 (= lt!377514 (readBitPure!0 (readerFrom!0 (_2!11272 lt!377520) (currentBit!11649 thiss!1005) (currentByte!11654 thiss!1005))))))

(declare-fun b!242107 () Bool)

(assert (=> b!242107 (= e!167837 e!167833)))

(declare-fun res!202147 () Bool)

(assert (=> b!242107 (=> (not res!202147) (not e!167833))))

(assert (=> b!242107 (= res!202147 (= (bitIndex!0 (size!5825 (buf!6291 (_2!11272 lt!377526))) (currentByte!11654 (_2!11272 lt!377526)) (currentBit!11649 (_2!11272 lt!377526))) (bvadd (bitIndex!0 (size!5825 (buf!6291 (_2!11272 lt!377520))) (currentByte!11654 (_2!11272 lt!377520)) (currentBit!11649 (_2!11272 lt!377520))) lt!377525)))))

(assert (=> b!242107 (= lt!377525 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!242108 () Bool)

(declare-fun res!202145 () Bool)

(assert (=> b!242108 (=> (not res!202145) (not e!167839))))

(assert (=> b!242108 (= res!202145 (bvslt from!289 nBits!297))))

(assert (= (and start!52480 res!202146) b!242099))

(assert (= (and b!242099 res!202144) b!242108))

(assert (= (and b!242108 res!202145) b!242095))

(assert (= (and b!242095 res!202143) b!242096))

(assert (= (and b!242096 res!202141) b!242098))

(assert (= (and b!242098 res!202149) b!242106))

(assert (= (and b!242106 res!202150) b!242105))

(assert (= (and b!242095 res!202142) b!242107))

(assert (= (and b!242107 res!202147) b!242103))

(assert (= (and b!242103 res!202140) b!242100))

(assert (= (and b!242095 res!202152) b!242097))

(assert (= (and b!242095 (not res!202148)) b!242101))

(assert (= (and b!242101 (not res!202151)) b!242104))

(assert (= start!52480 b!242102))

(declare-fun m!364819 () Bool)

(assert (=> b!242099 m!364819))

(declare-fun m!364821 () Bool)

(assert (=> b!242103 m!364821))

(declare-fun m!364823 () Bool)

(assert (=> b!242102 m!364823))

(declare-fun m!364825 () Bool)

(assert (=> b!242101 m!364825))

(declare-fun m!364827 () Bool)

(assert (=> b!242101 m!364827))

(declare-fun m!364829 () Bool)

(assert (=> b!242100 m!364829))

(declare-fun m!364831 () Bool)

(assert (=> b!242100 m!364831))

(declare-fun m!364833 () Bool)

(assert (=> b!242100 m!364833))

(declare-fun m!364835 () Bool)

(assert (=> b!242100 m!364835))

(declare-fun m!364837 () Bool)

(assert (=> b!242106 m!364837))

(assert (=> b!242106 m!364837))

(declare-fun m!364839 () Bool)

(assert (=> b!242106 m!364839))

(declare-fun m!364841 () Bool)

(assert (=> b!242105 m!364841))

(declare-fun m!364843 () Bool)

(assert (=> b!242095 m!364843))

(declare-fun m!364845 () Bool)

(assert (=> b!242095 m!364845))

(declare-fun m!364847 () Bool)

(assert (=> b!242095 m!364847))

(declare-fun m!364849 () Bool)

(assert (=> b!242095 m!364849))

(declare-fun m!364851 () Bool)

(assert (=> b!242095 m!364851))

(declare-fun m!364853 () Bool)

(assert (=> b!242095 m!364853))

(declare-fun m!364855 () Bool)

(assert (=> b!242095 m!364855))

(declare-fun m!364857 () Bool)

(assert (=> b!242098 m!364857))

(declare-fun m!364859 () Bool)

(assert (=> b!242107 m!364859))

(declare-fun m!364861 () Bool)

(assert (=> b!242107 m!364861))

(declare-fun m!364863 () Bool)

(assert (=> b!242104 m!364863))

(declare-fun m!364865 () Bool)

(assert (=> b!242104 m!364865))

(declare-fun m!364867 () Bool)

(assert (=> b!242104 m!364867))

(declare-fun m!364869 () Bool)

(assert (=> start!52480 m!364869))

(assert (=> b!242096 m!364861))

(declare-fun m!364871 () Bool)

(assert (=> b!242096 m!364871))

(declare-fun m!364873 () Bool)

(assert (=> b!242097 m!364873))

(check-sat (not b!242101) (not b!242107) (not b!242103) (not b!242096) (not b!242098) (not start!52480) (not b!242100) (not b!242102) (not b!242104) (not b!242095) (not b!242099) (not b!242106) (not b!242097) (not b!242105))
