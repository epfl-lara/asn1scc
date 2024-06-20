; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52368 () Bool)

(assert start!52368)

(declare-fun res!201247 () Bool)

(declare-fun e!167039 () Bool)

(assert (=> start!52368 (=> (not res!201247) (not e!167039))))

(declare-fun nBits!288 () (_ BitVec 64))

(assert (=> start!52368 (= res!201247 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52368 e!167039))

(assert (=> start!52368 true))

(declare-datatypes ((array!13197 0))(
  ( (array!13198 (arr!6767 (Array (_ BitVec 32) (_ BitVec 8))) (size!5780 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10482 0))(
  ( (BitStream!10483 (buf!6246 array!13197) (currentByte!11606 (_ BitVec 32)) (currentBit!11601 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10482)

(declare-fun e!167038 () Bool)

(declare-fun inv!12 (BitStream!10482) Bool)

(assert (=> start!52368 (and (inv!12 thiss!982) e!167038)))

(declare-fun b!241065 () Bool)

(declare-fun res!201248 () Bool)

(declare-fun e!167036 () Bool)

(assert (=> b!241065 (=> (not res!201248) (not e!167036))))

(declare-datatypes ((Unit!17661 0))(
  ( (Unit!17662) )
))
(declare-datatypes ((tuple2!20526 0))(
  ( (tuple2!20527 (_1!11185 Unit!17661) (_2!11185 BitStream!10482)) )
))
(declare-fun lt!376661 () tuple2!20526)

(declare-fun isPrefixOf!0 (BitStream!10482 BitStream!10482) Bool)

(assert (=> b!241065 (= res!201248 (isPrefixOf!0 thiss!982 (_2!11185 lt!376661)))))

(declare-fun b!241066 () Bool)

(declare-fun res!201245 () Bool)

(assert (=> b!241066 (=> (not res!201245) (not e!167036))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241066 (= res!201245 (= (bitIndex!0 (size!5780 (buf!6246 (_2!11185 lt!376661))) (currentByte!11606 (_2!11185 lt!376661)) (currentBit!11601 (_2!11185 lt!376661))) (bvadd (bitIndex!0 (size!5780 (buf!6246 thiss!982)) (currentByte!11606 thiss!982) (currentBit!11601 thiss!982)) nBits!288)))))

(declare-fun b!241067 () Bool)

(declare-datatypes ((tuple2!20528 0))(
  ( (tuple2!20529 (_1!11186 BitStream!10482) (_2!11186 Bool)) )
))
(declare-fun lt!376662 () tuple2!20528)

(declare-datatypes ((tuple2!20530 0))(
  ( (tuple2!20531 (_1!11187 BitStream!10482) (_2!11187 BitStream!10482)) )
))
(declare-fun lt!376666 () tuple2!20530)

(assert (=> b!241067 (= e!167036 (not (or (not (_2!11186 lt!376662)) (not (= (_1!11186 lt!376662) (_2!11187 lt!376666))))))))

(declare-fun bit!21 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10482 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20528)

(assert (=> b!241067 (= lt!376662 (checkBitsLoopPure!0 (_1!11187 lt!376666) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241067 (validate_offset_bits!1 ((_ sign_extend 32) (size!5780 (buf!6246 (_2!11185 lt!376661)))) ((_ sign_extend 32) (currentByte!11606 thiss!982)) ((_ sign_extend 32) (currentBit!11601 thiss!982)) nBits!288)))

(declare-fun lt!376663 () Unit!17661)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10482 array!13197 (_ BitVec 64)) Unit!17661)

(assert (=> b!241067 (= lt!376663 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6246 (_2!11185 lt!376661)) nBits!288))))

(declare-fun reader!0 (BitStream!10482 BitStream!10482) tuple2!20530)

(assert (=> b!241067 (= lt!376666 (reader!0 thiss!982 (_2!11185 lt!376661)))))

(declare-fun b!241068 () Bool)

(assert (=> b!241068 (= e!167039 (not true))))

(declare-fun lt!376664 () tuple2!20530)

(assert (=> b!241068 (= lt!376664 (reader!0 thiss!982 (_2!11185 lt!376661)))))

(declare-fun lt!376667 () Bool)

(assert (=> b!241068 (= lt!376667 (isPrefixOf!0 thiss!982 (_2!11185 lt!376661)))))

(declare-fun lt!376668 () (_ BitVec 64))

(assert (=> b!241068 (= lt!376668 (bitIndex!0 (size!5780 (buf!6246 (_2!11185 lt!376661))) (currentByte!11606 (_2!11185 lt!376661)) (currentBit!11601 (_2!11185 lt!376661))))))

(declare-fun lt!376665 () (_ BitVec 64))

(assert (=> b!241068 (= lt!376665 (bitIndex!0 (size!5780 (buf!6246 thiss!982)) (currentByte!11606 thiss!982) (currentBit!11601 thiss!982)))))

(assert (=> b!241068 e!167036))

(declare-fun res!201249 () Bool)

(assert (=> b!241068 (=> (not res!201249) (not e!167036))))

(assert (=> b!241068 (= res!201249 (= (size!5780 (buf!6246 thiss!982)) (size!5780 (buf!6246 (_2!11185 lt!376661)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10482 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20526)

(assert (=> b!241068 (= lt!376661 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!241069 () Bool)

(declare-fun array_inv!5521 (array!13197) Bool)

(assert (=> b!241069 (= e!167038 (array_inv!5521 (buf!6246 thiss!982)))))

(declare-fun b!241070 () Bool)

(declare-fun res!201246 () Bool)

(assert (=> b!241070 (=> (not res!201246) (not e!167039))))

(assert (=> b!241070 (= res!201246 (validate_offset_bits!1 ((_ sign_extend 32) (size!5780 (buf!6246 thiss!982))) ((_ sign_extend 32) (currentByte!11606 thiss!982)) ((_ sign_extend 32) (currentBit!11601 thiss!982)) nBits!288))))

(assert (= (and start!52368 res!201247) b!241070))

(assert (= (and b!241070 res!201246) b!241068))

(assert (= (and b!241068 res!201249) b!241066))

(assert (= (and b!241066 res!201245) b!241065))

(assert (= (and b!241065 res!201248) b!241067))

(assert (= start!52368 b!241069))

(declare-fun m!363745 () Bool)

(assert (=> b!241068 m!363745))

(declare-fun m!363747 () Bool)

(assert (=> b!241068 m!363747))

(declare-fun m!363749 () Bool)

(assert (=> b!241068 m!363749))

(declare-fun m!363751 () Bool)

(assert (=> b!241068 m!363751))

(declare-fun m!363753 () Bool)

(assert (=> b!241068 m!363753))

(declare-fun m!363755 () Bool)

(assert (=> b!241067 m!363755))

(declare-fun m!363757 () Bool)

(assert (=> b!241067 m!363757))

(declare-fun m!363759 () Bool)

(assert (=> b!241067 m!363759))

(assert (=> b!241067 m!363751))

(declare-fun m!363761 () Bool)

(assert (=> b!241070 m!363761))

(declare-fun m!363763 () Bool)

(assert (=> start!52368 m!363763))

(assert (=> b!241066 m!363745))

(assert (=> b!241066 m!363747))

(declare-fun m!363765 () Bool)

(assert (=> b!241069 m!363765))

(assert (=> b!241065 m!363753))

(check-sat (not b!241069) (not start!52368) (not b!241066) (not b!241065) (not b!241068) (not b!241070) (not b!241067))
