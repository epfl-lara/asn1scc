; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26380 () Bool)

(assert start!26380)

(declare-fun b!135426 () Bool)

(declare-fun e!89908 () Bool)

(declare-datatypes ((array!6180 0))(
  ( (array!6181 (arr!3463 (Array (_ BitVec 32) (_ BitVec 8))) (size!2798 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4860 0))(
  ( (BitStream!4861 (buf!3191 array!6180) (currentByte!5988 (_ BitVec 32)) (currentBit!5983 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4860)

(declare-fun array_inv!2587 (array!6180) Bool)

(assert (=> b!135426 (= e!89908 (array_inv!2587 (buf!3191 thiss!1634)))))

(declare-fun b!135427 () Bool)

(declare-fun e!89907 () Bool)

(declare-fun e!89913 () Bool)

(assert (=> b!135427 (= e!89907 (not e!89913))))

(declare-fun res!112631 () Bool)

(assert (=> b!135427 (=> res!112631 e!89913)))

(declare-datatypes ((tuple2!11780 0))(
  ( (tuple2!11781 (_1!6206 BitStream!4860) (_2!6206 array!6180)) )
))
(declare-fun lt!210206 () tuple2!11780)

(declare-datatypes ((tuple2!11782 0))(
  ( (tuple2!11783 (_1!6207 BitStream!4860) (_2!6207 BitStream!4860)) )
))
(declare-fun lt!210211 () tuple2!11782)

(declare-fun arr!237 () array!6180)

(assert (=> b!135427 (= res!112631 (or (not (= (size!2798 (_2!6206 lt!210206)) (size!2798 arr!237))) (not (= (_1!6206 lt!210206) (_2!6207 lt!210211)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!4860 array!6180 (_ BitVec 32) (_ BitVec 32)) tuple2!11780)

(assert (=> b!135427 (= lt!210206 (readByteArrayLoopPure!0 (_1!6207 lt!210211) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!8434 0))(
  ( (Unit!8435) )
))
(declare-datatypes ((tuple2!11784 0))(
  ( (tuple2!11785 (_1!6208 Unit!8434) (_2!6208 BitStream!4860)) )
))
(declare-fun lt!210210 () tuple2!11784)

(declare-fun lt!210212 () tuple2!11784)

(declare-fun lt!210213 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!135427 (validate_offset_bits!1 ((_ sign_extend 32) (size!2798 (buf!3191 (_2!6208 lt!210210)))) ((_ sign_extend 32) (currentByte!5988 (_2!6208 lt!210212))) ((_ sign_extend 32) (currentBit!5983 (_2!6208 lt!210212))) lt!210213)))

(declare-fun lt!210205 () Unit!8434)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4860 array!6180 (_ BitVec 64)) Unit!8434)

(assert (=> b!135427 (= lt!210205 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6208 lt!210212) (buf!3191 (_2!6208 lt!210210)) lt!210213))))

(declare-fun reader!0 (BitStream!4860 BitStream!4860) tuple2!11782)

(assert (=> b!135427 (= lt!210211 (reader!0 (_2!6208 lt!210212) (_2!6208 lt!210210)))))

(declare-fun b!135428 () Bool)

(declare-fun res!112639 () Bool)

(declare-fun e!89909 () Bool)

(assert (=> b!135428 (=> (not res!112639) (not e!89909))))

(assert (=> b!135428 (= res!112639 (bvslt from!447 to!404))))

(declare-fun b!135429 () Bool)

(declare-fun res!112635 () Bool)

(assert (=> b!135429 (=> (not res!112635) (not e!89909))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!135429 (= res!112635 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2798 (buf!3191 thiss!1634))) ((_ sign_extend 32) (currentByte!5988 thiss!1634)) ((_ sign_extend 32) (currentBit!5983 thiss!1634)) (bvsub to!404 from!447)))))

(declare-datatypes ((tuple2!11786 0))(
  ( (tuple2!11787 (_1!6209 BitStream!4860) (_2!6209 (_ BitVec 8))) )
))
(declare-fun lt!210224 () tuple2!11786)

(declare-fun b!135430 () Bool)

(declare-fun e!89905 () Bool)

(declare-fun lt!210214 () tuple2!11782)

(assert (=> b!135430 (= e!89905 (and (= (_2!6209 lt!210224) (select (arr!3463 arr!237) from!447)) (= (_1!6209 lt!210224) (_2!6207 lt!210214))))))

(declare-fun readBytePure!0 (BitStream!4860) tuple2!11786)

(assert (=> b!135430 (= lt!210224 (readBytePure!0 (_1!6207 lt!210214)))))

(assert (=> b!135430 (= lt!210214 (reader!0 thiss!1634 (_2!6208 lt!210212)))))

(declare-fun b!135431 () Bool)

(declare-fun res!112642 () Bool)

(assert (=> b!135431 (=> (not res!112642) (not e!89907))))

(declare-fun isPrefixOf!0 (BitStream!4860 BitStream!4860) Bool)

(assert (=> b!135431 (= res!112642 (isPrefixOf!0 (_2!6208 lt!210212) (_2!6208 lt!210210)))))

(declare-fun b!135432 () Bool)

(declare-fun arrayRangesEq!201 (array!6180 array!6180 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135432 (= e!89913 (not (arrayRangesEq!201 arr!237 (_2!6206 lt!210206) #b00000000000000000000000000000000 to!404)))))

(declare-fun res!112643 () Bool)

(assert (=> start!26380 (=> (not res!112643) (not e!89909))))

(assert (=> start!26380 (= res!112643 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2798 arr!237))))))

(assert (=> start!26380 e!89909))

(assert (=> start!26380 true))

(assert (=> start!26380 (array_inv!2587 arr!237)))

(declare-fun inv!12 (BitStream!4860) Bool)

(assert (=> start!26380 (and (inv!12 thiss!1634) e!89908)))

(declare-fun b!135433 () Bool)

(declare-fun e!89911 () Bool)

(declare-fun lt!210207 () tuple2!11786)

(declare-fun lt!210215 () tuple2!11786)

(assert (=> b!135433 (= e!89911 (= (_2!6209 lt!210207) (_2!6209 lt!210215)))))

(declare-fun b!135434 () Bool)

(declare-fun res!112640 () Bool)

(assert (=> b!135434 (=> (not res!112640) (not e!89905))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!135434 (= res!112640 (= (bitIndex!0 (size!2798 (buf!3191 (_2!6208 lt!210212))) (currentByte!5988 (_2!6208 lt!210212)) (currentBit!5983 (_2!6208 lt!210212))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2798 (buf!3191 thiss!1634)) (currentByte!5988 thiss!1634) (currentBit!5983 thiss!1634)))))))

(declare-fun b!135435 () Bool)

(declare-fun e!89906 () Bool)

(assert (=> b!135435 (= e!89909 (not e!89906))))

(declare-fun res!112636 () Bool)

(assert (=> b!135435 (=> res!112636 e!89906)))

(declare-fun lt!210229 () tuple2!11780)

(declare-fun lt!210208 () tuple2!11780)

(assert (=> b!135435 (= res!112636 (not (arrayRangesEq!201 (_2!6206 lt!210229) (_2!6206 lt!210208) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!210218 () tuple2!11780)

(assert (=> b!135435 (arrayRangesEq!201 (_2!6206 lt!210229) (_2!6206 lt!210218) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!210223 () tuple2!11782)

(declare-fun lt!210225 () Unit!8434)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4860 array!6180 (_ BitVec 32) (_ BitVec 32)) Unit!8434)

(assert (=> b!135435 (= lt!210225 (readByteArrayLoopArrayPrefixLemma!0 (_1!6207 lt!210223) arr!237 from!447 to!404))))

(declare-fun lt!210226 () array!6180)

(declare-fun withMovedByteIndex!0 (BitStream!4860 (_ BitVec 32)) BitStream!4860)

(assert (=> b!135435 (= lt!210218 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6207 lt!210223) #b00000000000000000000000000000001) lt!210226 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!210217 () tuple2!11782)

(assert (=> b!135435 (= lt!210208 (readByteArrayLoopPure!0 (_1!6207 lt!210217) lt!210226 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!210222 () tuple2!11786)

(assert (=> b!135435 (= lt!210226 (array!6181 (store (arr!3463 arr!237) from!447 (_2!6209 lt!210222)) (size!2798 arr!237)))))

(declare-fun lt!210221 () (_ BitVec 32))

(assert (=> b!135435 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2798 (buf!3191 (_2!6208 lt!210210)))) ((_ sign_extend 32) (currentByte!5988 (_2!6208 lt!210212))) ((_ sign_extend 32) (currentBit!5983 (_2!6208 lt!210212))) lt!210221)))

(declare-fun lt!210219 () Unit!8434)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4860 array!6180 (_ BitVec 32)) Unit!8434)

(assert (=> b!135435 (= lt!210219 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6208 lt!210212) (buf!3191 (_2!6208 lt!210210)) lt!210221))))

(assert (=> b!135435 (= (_1!6206 lt!210229) (_2!6207 lt!210223))))

(assert (=> b!135435 (= lt!210229 (readByteArrayLoopPure!0 (_1!6207 lt!210223) arr!237 from!447 to!404))))

(assert (=> b!135435 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2798 (buf!3191 (_2!6208 lt!210210)))) ((_ sign_extend 32) (currentByte!5988 thiss!1634)) ((_ sign_extend 32) (currentBit!5983 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!210227 () Unit!8434)

(assert (=> b!135435 (= lt!210227 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3191 (_2!6208 lt!210210)) (bvsub to!404 from!447)))))

(assert (=> b!135435 (= (_2!6209 lt!210222) (select (arr!3463 arr!237) from!447))))

(assert (=> b!135435 (= lt!210222 (readBytePure!0 (_1!6207 lt!210223)))))

(assert (=> b!135435 (= lt!210217 (reader!0 (_2!6208 lt!210212) (_2!6208 lt!210210)))))

(assert (=> b!135435 (= lt!210223 (reader!0 thiss!1634 (_2!6208 lt!210210)))))

(assert (=> b!135435 e!89911))

(declare-fun res!112641 () Bool)

(assert (=> b!135435 (=> (not res!112641) (not e!89911))))

(assert (=> b!135435 (= res!112641 (= (bitIndex!0 (size!2798 (buf!3191 (_1!6209 lt!210207))) (currentByte!5988 (_1!6209 lt!210207)) (currentBit!5983 (_1!6209 lt!210207))) (bitIndex!0 (size!2798 (buf!3191 (_1!6209 lt!210215))) (currentByte!5988 (_1!6209 lt!210215)) (currentBit!5983 (_1!6209 lt!210215)))))))

(declare-fun lt!210209 () Unit!8434)

(declare-fun lt!210220 () BitStream!4860)

(declare-fun readBytePrefixLemma!0 (BitStream!4860 BitStream!4860) Unit!8434)

(assert (=> b!135435 (= lt!210209 (readBytePrefixLemma!0 lt!210220 (_2!6208 lt!210210)))))

(assert (=> b!135435 (= lt!210215 (readBytePure!0 (BitStream!4861 (buf!3191 (_2!6208 lt!210210)) (currentByte!5988 thiss!1634) (currentBit!5983 thiss!1634))))))

(assert (=> b!135435 (= lt!210207 (readBytePure!0 lt!210220))))

(assert (=> b!135435 (= lt!210220 (BitStream!4861 (buf!3191 (_2!6208 lt!210212)) (currentByte!5988 thiss!1634) (currentBit!5983 thiss!1634)))))

(declare-fun e!89912 () Bool)

(assert (=> b!135435 e!89912))

(declare-fun res!112644 () Bool)

(assert (=> b!135435 (=> (not res!112644) (not e!89912))))

(assert (=> b!135435 (= res!112644 (isPrefixOf!0 thiss!1634 (_2!6208 lt!210210)))))

(declare-fun lt!210216 () Unit!8434)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4860 BitStream!4860 BitStream!4860) Unit!8434)

(assert (=> b!135435 (= lt!210216 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6208 lt!210212) (_2!6208 lt!210210)))))

(declare-fun e!89903 () Bool)

(assert (=> b!135435 e!89903))

(declare-fun res!112632 () Bool)

(assert (=> b!135435 (=> (not res!112632) (not e!89903))))

(assert (=> b!135435 (= res!112632 (= (size!2798 (buf!3191 (_2!6208 lt!210212))) (size!2798 (buf!3191 (_2!6208 lt!210210)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4860 array!6180 (_ BitVec 32) (_ BitVec 32)) tuple2!11784)

(assert (=> b!135435 (= lt!210210 (appendByteArrayLoop!0 (_2!6208 lt!210212) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!135435 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2798 (buf!3191 (_2!6208 lt!210212)))) ((_ sign_extend 32) (currentByte!5988 (_2!6208 lt!210212))) ((_ sign_extend 32) (currentBit!5983 (_2!6208 lt!210212))) lt!210221)))

(assert (=> b!135435 (= lt!210221 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!210228 () Unit!8434)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4860 BitStream!4860 (_ BitVec 64) (_ BitVec 32)) Unit!8434)

(assert (=> b!135435 (= lt!210228 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6208 lt!210212) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!135435 e!89905))

(declare-fun res!112634 () Bool)

(assert (=> b!135435 (=> (not res!112634) (not e!89905))))

(assert (=> b!135435 (= res!112634 (= (size!2798 (buf!3191 thiss!1634)) (size!2798 (buf!3191 (_2!6208 lt!210212)))))))

(declare-fun appendByte!0 (BitStream!4860 (_ BitVec 8)) tuple2!11784)

(assert (=> b!135435 (= lt!210212 (appendByte!0 thiss!1634 (select (arr!3463 arr!237) from!447)))))

(declare-fun b!135436 () Bool)

(assert (=> b!135436 (= e!89906 true)))

(assert (=> b!135436 (arrayRangesEq!201 (_2!6206 lt!210208) (_2!6206 lt!210229) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!210204 () Unit!8434)

(declare-fun arrayRangesEqSymmetricLemma!14 (array!6180 array!6180 (_ BitVec 32) (_ BitVec 32)) Unit!8434)

(assert (=> b!135436 (= lt!210204 (arrayRangesEqSymmetricLemma!14 (_2!6206 lt!210229) (_2!6206 lt!210208) #b00000000000000000000000000000000 to!404))))

(declare-fun b!135437 () Bool)

(declare-fun res!112633 () Bool)

(assert (=> b!135437 (=> (not res!112633) (not e!89905))))

(assert (=> b!135437 (= res!112633 (isPrefixOf!0 thiss!1634 (_2!6208 lt!210212)))))

(declare-fun b!135438 () Bool)

(declare-fun res!112638 () Bool)

(assert (=> b!135438 (=> (not res!112638) (not e!89909))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135438 (= res!112638 (invariant!0 (currentBit!5983 thiss!1634) (currentByte!5988 thiss!1634) (size!2798 (buf!3191 thiss!1634))))))

(declare-fun b!135439 () Bool)

(assert (=> b!135439 (= e!89903 e!89907)))

(declare-fun res!112637 () Bool)

(assert (=> b!135439 (=> (not res!112637) (not e!89907))))

(assert (=> b!135439 (= res!112637 (= (bitIndex!0 (size!2798 (buf!3191 (_2!6208 lt!210210))) (currentByte!5988 (_2!6208 lt!210210)) (currentBit!5983 (_2!6208 lt!210210))) (bvadd (bitIndex!0 (size!2798 (buf!3191 (_2!6208 lt!210212))) (currentByte!5988 (_2!6208 lt!210212)) (currentBit!5983 (_2!6208 lt!210212))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!210213))))))

(assert (=> b!135439 (= lt!210213 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!135440 () Bool)

(assert (=> b!135440 (= e!89912 (invariant!0 (currentBit!5983 thiss!1634) (currentByte!5988 thiss!1634) (size!2798 (buf!3191 (_2!6208 lt!210212)))))))

(assert (= (and start!26380 res!112643) b!135429))

(assert (= (and b!135429 res!112635) b!135428))

(assert (= (and b!135428 res!112639) b!135438))

(assert (= (and b!135438 res!112638) b!135435))

(assert (= (and b!135435 res!112634) b!135434))

(assert (= (and b!135434 res!112640) b!135437))

(assert (= (and b!135437 res!112633) b!135430))

(assert (= (and b!135435 res!112632) b!135439))

(assert (= (and b!135439 res!112637) b!135431))

(assert (= (and b!135431 res!112642) b!135427))

(assert (= (and b!135427 (not res!112631)) b!135432))

(assert (= (and b!135435 res!112644) b!135440))

(assert (= (and b!135435 res!112641) b!135433))

(assert (= (and b!135435 (not res!112636)) b!135436))

(assert (= start!26380 b!135426))

(declare-fun m!206595 () Bool)

(assert (=> b!135430 m!206595))

(declare-fun m!206597 () Bool)

(assert (=> b!135430 m!206597))

(declare-fun m!206599 () Bool)

(assert (=> b!135430 m!206599))

(declare-fun m!206601 () Bool)

(assert (=> b!135436 m!206601))

(declare-fun m!206603 () Bool)

(assert (=> b!135436 m!206603))

(declare-fun m!206605 () Bool)

(assert (=> b!135439 m!206605))

(declare-fun m!206607 () Bool)

(assert (=> b!135439 m!206607))

(declare-fun m!206609 () Bool)

(assert (=> b!135427 m!206609))

(declare-fun m!206611 () Bool)

(assert (=> b!135427 m!206611))

(declare-fun m!206613 () Bool)

(assert (=> b!135427 m!206613))

(declare-fun m!206615 () Bool)

(assert (=> b!135427 m!206615))

(declare-fun m!206617 () Bool)

(assert (=> start!26380 m!206617))

(declare-fun m!206619 () Bool)

(assert (=> start!26380 m!206619))

(declare-fun m!206621 () Bool)

(assert (=> b!135431 m!206621))

(declare-fun m!206623 () Bool)

(assert (=> b!135429 m!206623))

(declare-fun m!206625 () Bool)

(assert (=> b!135440 m!206625))

(declare-fun m!206627 () Bool)

(assert (=> b!135426 m!206627))

(declare-fun m!206629 () Bool)

(assert (=> b!135432 m!206629))

(declare-fun m!206631 () Bool)

(assert (=> b!135435 m!206631))

(declare-fun m!206633 () Bool)

(assert (=> b!135435 m!206633))

(declare-fun m!206635 () Bool)

(assert (=> b!135435 m!206635))

(declare-fun m!206637 () Bool)

(assert (=> b!135435 m!206637))

(declare-fun m!206639 () Bool)

(assert (=> b!135435 m!206639))

(declare-fun m!206641 () Bool)

(assert (=> b!135435 m!206641))

(declare-fun m!206643 () Bool)

(assert (=> b!135435 m!206643))

(declare-fun m!206645 () Bool)

(assert (=> b!135435 m!206645))

(declare-fun m!206647 () Bool)

(assert (=> b!135435 m!206647))

(declare-fun m!206649 () Bool)

(assert (=> b!135435 m!206649))

(assert (=> b!135435 m!206595))

(declare-fun m!206651 () Bool)

(assert (=> b!135435 m!206651))

(declare-fun m!206653 () Bool)

(assert (=> b!135435 m!206653))

(declare-fun m!206655 () Bool)

(assert (=> b!135435 m!206655))

(assert (=> b!135435 m!206631))

(declare-fun m!206657 () Bool)

(assert (=> b!135435 m!206657))

(declare-fun m!206659 () Bool)

(assert (=> b!135435 m!206659))

(declare-fun m!206661 () Bool)

(assert (=> b!135435 m!206661))

(declare-fun m!206663 () Bool)

(assert (=> b!135435 m!206663))

(declare-fun m!206665 () Bool)

(assert (=> b!135435 m!206665))

(declare-fun m!206667 () Bool)

(assert (=> b!135435 m!206667))

(declare-fun m!206669 () Bool)

(assert (=> b!135435 m!206669))

(declare-fun m!206671 () Bool)

(assert (=> b!135435 m!206671))

(declare-fun m!206673 () Bool)

(assert (=> b!135435 m!206673))

(declare-fun m!206675 () Bool)

(assert (=> b!135435 m!206675))

(assert (=> b!135435 m!206615))

(declare-fun m!206677 () Bool)

(assert (=> b!135435 m!206677))

(assert (=> b!135435 m!206595))

(declare-fun m!206679 () Bool)

(assert (=> b!135435 m!206679))

(assert (=> b!135434 m!206607))

(declare-fun m!206681 () Bool)

(assert (=> b!135434 m!206681))

(declare-fun m!206683 () Bool)

(assert (=> b!135437 m!206683))

(declare-fun m!206685 () Bool)

(assert (=> b!135438 m!206685))

(check-sat (not b!135439) (not b!135430) (not b!135436) (not b!135429) (not b!135437) (not b!135440) (not b!135431) (not b!135438) (not b!135432) (not b!135426) (not b!135434) (not b!135435) (not start!26380) (not b!135427))
