; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52364 () Bool)

(assert start!52364)

(declare-fun b!241029 () Bool)

(declare-fun e!167014 () Bool)

(assert (=> b!241029 (= e!167014 (not true))))

(declare-datatypes ((array!13193 0))(
  ( (array!13194 (arr!6765 (Array (_ BitVec 32) (_ BitVec 8))) (size!5778 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10478 0))(
  ( (BitStream!10479 (buf!6244 array!13193) (currentByte!11604 (_ BitVec 32)) (currentBit!11599 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20514 0))(
  ( (tuple2!20515 (_1!11179 BitStream!10478) (_2!11179 BitStream!10478)) )
))
(declare-fun lt!376617 () tuple2!20514)

(declare-fun thiss!982 () BitStream!10478)

(declare-datatypes ((Unit!17657 0))(
  ( (Unit!17658) )
))
(declare-datatypes ((tuple2!20516 0))(
  ( (tuple2!20517 (_1!11180 Unit!17657) (_2!11180 BitStream!10478)) )
))
(declare-fun lt!376613 () tuple2!20516)

(declare-fun reader!0 (BitStream!10478 BitStream!10478) tuple2!20514)

(assert (=> b!241029 (= lt!376617 (reader!0 thiss!982 (_2!11180 lt!376613)))))

(declare-fun lt!376615 () Bool)

(declare-fun isPrefixOf!0 (BitStream!10478 BitStream!10478) Bool)

(assert (=> b!241029 (= lt!376615 (isPrefixOf!0 thiss!982 (_2!11180 lt!376613)))))

(declare-fun lt!376614 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241029 (= lt!376614 (bitIndex!0 (size!5778 (buf!6244 (_2!11180 lt!376613))) (currentByte!11604 (_2!11180 lt!376613)) (currentBit!11599 (_2!11180 lt!376613))))))

(declare-fun lt!376619 () (_ BitVec 64))

(assert (=> b!241029 (= lt!376619 (bitIndex!0 (size!5778 (buf!6244 thiss!982)) (currentByte!11604 thiss!982) (currentBit!11599 thiss!982)))))

(declare-fun e!167013 () Bool)

(assert (=> b!241029 e!167013))

(declare-fun res!201219 () Bool)

(assert (=> b!241029 (=> (not res!201219) (not e!167013))))

(assert (=> b!241029 (= res!201219 (= (size!5778 (buf!6244 thiss!982)) (size!5778 (buf!6244 (_2!11180 lt!376613)))))))

(declare-fun nBits!288 () (_ BitVec 64))

(declare-fun bit!21 () Bool)

(declare-fun appendNBitsLoop!0 (BitStream!10478 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20516)

(assert (=> b!241029 (= lt!376613 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!241030 () Bool)

(declare-fun e!167012 () Bool)

(declare-fun array_inv!5519 (array!13193) Bool)

(assert (=> b!241030 (= e!167012 (array_inv!5519 (buf!6244 thiss!982)))))

(declare-fun b!241032 () Bool)

(declare-fun res!201216 () Bool)

(assert (=> b!241032 (=> (not res!201216) (not e!167013))))

(assert (=> b!241032 (= res!201216 (isPrefixOf!0 thiss!982 (_2!11180 lt!376613)))))

(declare-fun b!241033 () Bool)

(declare-fun res!201217 () Bool)

(assert (=> b!241033 (=> (not res!201217) (not e!167014))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241033 (= res!201217 (validate_offset_bits!1 ((_ sign_extend 32) (size!5778 (buf!6244 thiss!982))) ((_ sign_extend 32) (currentByte!11604 thiss!982)) ((_ sign_extend 32) (currentBit!11599 thiss!982)) nBits!288))))

(declare-fun b!241034 () Bool)

(declare-datatypes ((tuple2!20518 0))(
  ( (tuple2!20519 (_1!11181 BitStream!10478) (_2!11181 Bool)) )
))
(declare-fun lt!376616 () tuple2!20518)

(declare-fun lt!376618 () tuple2!20514)

(assert (=> b!241034 (= e!167013 (not (or (not (_2!11181 lt!376616)) (not (= (_1!11181 lt!376616) (_2!11179 lt!376618))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10478 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20518)

(assert (=> b!241034 (= lt!376616 (checkBitsLoopPure!0 (_1!11179 lt!376618) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241034 (validate_offset_bits!1 ((_ sign_extend 32) (size!5778 (buf!6244 (_2!11180 lt!376613)))) ((_ sign_extend 32) (currentByte!11604 thiss!982)) ((_ sign_extend 32) (currentBit!11599 thiss!982)) nBits!288)))

(declare-fun lt!376620 () Unit!17657)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10478 array!13193 (_ BitVec 64)) Unit!17657)

(assert (=> b!241034 (= lt!376620 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6244 (_2!11180 lt!376613)) nBits!288))))

(assert (=> b!241034 (= lt!376618 (reader!0 thiss!982 (_2!11180 lt!376613)))))

(declare-fun res!201218 () Bool)

(assert (=> start!52364 (=> (not res!201218) (not e!167014))))

(assert (=> start!52364 (= res!201218 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52364 e!167014))

(assert (=> start!52364 true))

(declare-fun inv!12 (BitStream!10478) Bool)

(assert (=> start!52364 (and (inv!12 thiss!982) e!167012)))

(declare-fun b!241031 () Bool)

(declare-fun res!201215 () Bool)

(assert (=> b!241031 (=> (not res!201215) (not e!167013))))

(assert (=> b!241031 (= res!201215 (= (bitIndex!0 (size!5778 (buf!6244 (_2!11180 lt!376613))) (currentByte!11604 (_2!11180 lt!376613)) (currentBit!11599 (_2!11180 lt!376613))) (bvadd (bitIndex!0 (size!5778 (buf!6244 thiss!982)) (currentByte!11604 thiss!982) (currentBit!11599 thiss!982)) nBits!288)))))

(assert (= (and start!52364 res!201218) b!241033))

(assert (= (and b!241033 res!201217) b!241029))

(assert (= (and b!241029 res!201219) b!241031))

(assert (= (and b!241031 res!201215) b!241032))

(assert (= (and b!241032 res!201216) b!241034))

(assert (= start!52364 b!241030))

(declare-fun m!363701 () Bool)

(assert (=> b!241029 m!363701))

(declare-fun m!363703 () Bool)

(assert (=> b!241029 m!363703))

(declare-fun m!363705 () Bool)

(assert (=> b!241029 m!363705))

(declare-fun m!363707 () Bool)

(assert (=> b!241029 m!363707))

(declare-fun m!363709 () Bool)

(assert (=> b!241029 m!363709))

(declare-fun m!363711 () Bool)

(assert (=> b!241030 m!363711))

(assert (=> b!241032 m!363703))

(declare-fun m!363713 () Bool)

(assert (=> start!52364 m!363713))

(declare-fun m!363715 () Bool)

(assert (=> b!241033 m!363715))

(declare-fun m!363717 () Bool)

(assert (=> b!241034 m!363717))

(declare-fun m!363719 () Bool)

(assert (=> b!241034 m!363719))

(declare-fun m!363721 () Bool)

(assert (=> b!241034 m!363721))

(assert (=> b!241034 m!363707))

(assert (=> b!241031 m!363709))

(assert (=> b!241031 m!363701))

(push 1)

(assert (not b!241029))

(assert (not b!241033))

(assert (not start!52364))

(assert (not b!241030))

(assert (not b!241032))

(assert (not b!241031))

(assert (not b!241034))

(check-sat)

