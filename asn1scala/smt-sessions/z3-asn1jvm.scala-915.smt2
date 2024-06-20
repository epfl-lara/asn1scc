; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25674 () Bool)

(assert start!25674)

(declare-fun b!130921 () Bool)

(declare-fun e!86782 () Bool)

(declare-fun e!86781 () Bool)

(assert (=> b!130921 (= e!86782 (not e!86781))))

(declare-fun res!108575 () Bool)

(assert (=> b!130921 (=> res!108575 e!86781)))

(declare-datatypes ((array!6054 0))(
  ( (array!6055 (arr!3364 (Array (_ BitVec 32) (_ BitVec 8))) (size!2741 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4746 0))(
  ( (BitStream!4747 (buf!3102 array!6054) (currentByte!5875 (_ BitVec 32)) (currentBit!5870 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11292 0))(
  ( (tuple2!11293 (_1!5946 BitStream!4746) (_2!5946 BitStream!4746)) )
))
(declare-fun lt!201948 () tuple2!11292)

(declare-fun arr!237 () array!6054)

(declare-datatypes ((tuple2!11294 0))(
  ( (tuple2!11295 (_1!5947 BitStream!4746) (_2!5947 array!6054)) )
))
(declare-fun lt!201960 () tuple2!11294)

(assert (=> b!130921 (= res!108575 (or (not (= (size!2741 (_2!5947 lt!201960)) (size!2741 arr!237))) (not (= (_1!5947 lt!201960) (_2!5946 lt!201948)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!4746 array!6054 (_ BitVec 32) (_ BitVec 32)) tuple2!11294)

(assert (=> b!130921 (= lt!201960 (readByteArrayLoopPure!0 (_1!5946 lt!201948) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!8096 0))(
  ( (Unit!8097) )
))
(declare-datatypes ((tuple2!11296 0))(
  ( (tuple2!11297 (_1!5948 Unit!8096) (_2!5948 BitStream!4746)) )
))
(declare-fun lt!201962 () tuple2!11296)

(declare-fun lt!201946 () tuple2!11296)

(declare-fun lt!201947 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!130921 (validate_offset_bits!1 ((_ sign_extend 32) (size!2741 (buf!3102 (_2!5948 lt!201962)))) ((_ sign_extend 32) (currentByte!5875 (_2!5948 lt!201946))) ((_ sign_extend 32) (currentBit!5870 (_2!5948 lt!201946))) lt!201947)))

(declare-fun lt!201953 () Unit!8096)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4746 array!6054 (_ BitVec 64)) Unit!8096)

(assert (=> b!130921 (= lt!201953 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5948 lt!201946) (buf!3102 (_2!5948 lt!201962)) lt!201947))))

(declare-fun reader!0 (BitStream!4746 BitStream!4746) tuple2!11292)

(assert (=> b!130921 (= lt!201948 (reader!0 (_2!5948 lt!201946) (_2!5948 lt!201962)))))

(declare-fun b!130922 () Bool)

(declare-fun arrayRangesEq!144 (array!6054 array!6054 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130922 (= e!86781 (not (arrayRangesEq!144 arr!237 (_2!5947 lt!201960) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!130923 () Bool)

(declare-fun res!108567 () Bool)

(declare-fun e!86783 () Bool)

(assert (=> b!130923 (=> (not res!108567) (not e!86783))))

(declare-fun thiss!1634 () BitStream!4746)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!130923 (= res!108567 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2741 (buf!3102 thiss!1634))) ((_ sign_extend 32) (currentByte!5875 thiss!1634)) ((_ sign_extend 32) (currentBit!5870 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!130924 () Bool)

(declare-fun e!86776 () Bool)

(assert (=> b!130924 (= e!86776 e!86782)))

(declare-fun res!108573 () Bool)

(assert (=> b!130924 (=> (not res!108573) (not e!86782))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!130924 (= res!108573 (= (bitIndex!0 (size!2741 (buf!3102 (_2!5948 lt!201962))) (currentByte!5875 (_2!5948 lt!201962)) (currentBit!5870 (_2!5948 lt!201962))) (bvadd (bitIndex!0 (size!2741 (buf!3102 (_2!5948 lt!201946))) (currentByte!5875 (_2!5948 lt!201946)) (currentBit!5870 (_2!5948 lt!201946))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!201947))))))

(assert (=> b!130924 (= lt!201947 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!130925 () Bool)

(assert (=> b!130925 (= e!86783 (not true))))

(assert (=> b!130925 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2741 (buf!3102 (_2!5948 lt!201962)))) ((_ sign_extend 32) (currentByte!5875 thiss!1634)) ((_ sign_extend 32) (currentBit!5870 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!201955 () Unit!8096)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4746 array!6054 (_ BitVec 32)) Unit!8096)

(assert (=> b!130925 (= lt!201955 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3102 (_2!5948 lt!201962)) (bvsub to!404 from!447)))))

(declare-fun lt!201954 () tuple2!11292)

(declare-datatypes ((tuple2!11298 0))(
  ( (tuple2!11299 (_1!5949 BitStream!4746) (_2!5949 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!4746) tuple2!11298)

(assert (=> b!130925 (= (_2!5949 (readBytePure!0 (_1!5946 lt!201954))) (select (arr!3364 arr!237) from!447))))

(declare-fun lt!201956 () tuple2!11292)

(assert (=> b!130925 (= lt!201956 (reader!0 (_2!5948 lt!201946) (_2!5948 lt!201962)))))

(assert (=> b!130925 (= lt!201954 (reader!0 thiss!1634 (_2!5948 lt!201962)))))

(declare-fun e!86774 () Bool)

(assert (=> b!130925 e!86774))

(declare-fun res!108570 () Bool)

(assert (=> b!130925 (=> (not res!108570) (not e!86774))))

(declare-fun lt!201958 () tuple2!11298)

(declare-fun lt!201959 () tuple2!11298)

(assert (=> b!130925 (= res!108570 (= (bitIndex!0 (size!2741 (buf!3102 (_1!5949 lt!201958))) (currentByte!5875 (_1!5949 lt!201958)) (currentBit!5870 (_1!5949 lt!201958))) (bitIndex!0 (size!2741 (buf!3102 (_1!5949 lt!201959))) (currentByte!5875 (_1!5949 lt!201959)) (currentBit!5870 (_1!5949 lt!201959)))))))

(declare-fun lt!201949 () Unit!8096)

(declare-fun lt!201952 () BitStream!4746)

(declare-fun readBytePrefixLemma!0 (BitStream!4746 BitStream!4746) Unit!8096)

(assert (=> b!130925 (= lt!201949 (readBytePrefixLemma!0 lt!201952 (_2!5948 lt!201962)))))

(assert (=> b!130925 (= lt!201959 (readBytePure!0 (BitStream!4747 (buf!3102 (_2!5948 lt!201962)) (currentByte!5875 thiss!1634) (currentBit!5870 thiss!1634))))))

(assert (=> b!130925 (= lt!201958 (readBytePure!0 lt!201952))))

(assert (=> b!130925 (= lt!201952 (BitStream!4747 (buf!3102 (_2!5948 lt!201946)) (currentByte!5875 thiss!1634) (currentBit!5870 thiss!1634)))))

(declare-fun e!86777 () Bool)

(assert (=> b!130925 e!86777))

(declare-fun res!108574 () Bool)

(assert (=> b!130925 (=> (not res!108574) (not e!86777))))

(declare-fun isPrefixOf!0 (BitStream!4746 BitStream!4746) Bool)

(assert (=> b!130925 (= res!108574 (isPrefixOf!0 thiss!1634 (_2!5948 lt!201962)))))

(declare-fun lt!201951 () Unit!8096)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4746 BitStream!4746 BitStream!4746) Unit!8096)

(assert (=> b!130925 (= lt!201951 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5948 lt!201946) (_2!5948 lt!201962)))))

(assert (=> b!130925 e!86776))

(declare-fun res!108569 () Bool)

(assert (=> b!130925 (=> (not res!108569) (not e!86776))))

(assert (=> b!130925 (= res!108569 (= (size!2741 (buf!3102 (_2!5948 lt!201946))) (size!2741 (buf!3102 (_2!5948 lt!201962)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4746 array!6054 (_ BitVec 32) (_ BitVec 32)) tuple2!11296)

(assert (=> b!130925 (= lt!201962 (appendByteArrayLoop!0 (_2!5948 lt!201946) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!130925 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2741 (buf!3102 (_2!5948 lt!201946)))) ((_ sign_extend 32) (currentByte!5875 (_2!5948 lt!201946))) ((_ sign_extend 32) (currentBit!5870 (_2!5948 lt!201946))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!201957 () Unit!8096)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4746 BitStream!4746 (_ BitVec 64) (_ BitVec 32)) Unit!8096)

(assert (=> b!130925 (= lt!201957 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5948 lt!201946) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!86779 () Bool)

(assert (=> b!130925 e!86779))

(declare-fun res!108571 () Bool)

(assert (=> b!130925 (=> (not res!108571) (not e!86779))))

(assert (=> b!130925 (= res!108571 (= (size!2741 (buf!3102 thiss!1634)) (size!2741 (buf!3102 (_2!5948 lt!201946)))))))

(declare-fun appendByte!0 (BitStream!4746 (_ BitVec 8)) tuple2!11296)

(assert (=> b!130925 (= lt!201946 (appendByte!0 thiss!1634 (select (arr!3364 arr!237) from!447)))))

(declare-fun b!130926 () Bool)

(declare-fun res!108568 () Bool)

(assert (=> b!130926 (=> (not res!108568) (not e!86782))))

(assert (=> b!130926 (= res!108568 (isPrefixOf!0 (_2!5948 lt!201946) (_2!5948 lt!201962)))))

(declare-fun b!130927 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130927 (= e!86777 (invariant!0 (currentBit!5870 thiss!1634) (currentByte!5875 thiss!1634) (size!2741 (buf!3102 (_2!5948 lt!201946)))))))

(declare-fun b!130929 () Bool)

(declare-fun res!108566 () Bool)

(assert (=> b!130929 (=> (not res!108566) (not e!86779))))

(assert (=> b!130929 (= res!108566 (isPrefixOf!0 thiss!1634 (_2!5948 lt!201946)))))

(declare-fun b!130930 () Bool)

(declare-fun res!108572 () Bool)

(assert (=> b!130930 (=> (not res!108572) (not e!86783))))

(assert (=> b!130930 (= res!108572 (bvslt from!447 to!404))))

(declare-fun b!130931 () Bool)

(assert (=> b!130931 (= e!86774 (= (_2!5949 lt!201958) (_2!5949 lt!201959)))))

(declare-fun lt!201950 () tuple2!11292)

(declare-fun lt!201961 () tuple2!11298)

(declare-fun b!130932 () Bool)

(assert (=> b!130932 (= e!86779 (and (= (_2!5949 lt!201961) (select (arr!3364 arr!237) from!447)) (= (_1!5949 lt!201961) (_2!5946 lt!201950))))))

(assert (=> b!130932 (= lt!201961 (readBytePure!0 (_1!5946 lt!201950)))))

(assert (=> b!130932 (= lt!201950 (reader!0 thiss!1634 (_2!5948 lt!201946)))))

(declare-fun b!130928 () Bool)

(declare-fun res!108565 () Bool)

(assert (=> b!130928 (=> (not res!108565) (not e!86783))))

(assert (=> b!130928 (= res!108565 (invariant!0 (currentBit!5870 thiss!1634) (currentByte!5875 thiss!1634) (size!2741 (buf!3102 thiss!1634))))))

(declare-fun res!108577 () Bool)

(assert (=> start!25674 (=> (not res!108577) (not e!86783))))

(assert (=> start!25674 (= res!108577 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2741 arr!237))))))

(assert (=> start!25674 e!86783))

(assert (=> start!25674 true))

(declare-fun array_inv!2530 (array!6054) Bool)

(assert (=> start!25674 (array_inv!2530 arr!237)))

(declare-fun e!86775 () Bool)

(declare-fun inv!12 (BitStream!4746) Bool)

(assert (=> start!25674 (and (inv!12 thiss!1634) e!86775)))

(declare-fun b!130933 () Bool)

(assert (=> b!130933 (= e!86775 (array_inv!2530 (buf!3102 thiss!1634)))))

(declare-fun b!130934 () Bool)

(declare-fun res!108576 () Bool)

(assert (=> b!130934 (=> (not res!108576) (not e!86779))))

(assert (=> b!130934 (= res!108576 (= (bitIndex!0 (size!2741 (buf!3102 (_2!5948 lt!201946))) (currentByte!5875 (_2!5948 lt!201946)) (currentBit!5870 (_2!5948 lt!201946))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2741 (buf!3102 thiss!1634)) (currentByte!5875 thiss!1634) (currentBit!5870 thiss!1634)))))))

(assert (= (and start!25674 res!108577) b!130923))

(assert (= (and b!130923 res!108567) b!130930))

(assert (= (and b!130930 res!108572) b!130928))

(assert (= (and b!130928 res!108565) b!130925))

(assert (= (and b!130925 res!108571) b!130934))

(assert (= (and b!130934 res!108576) b!130929))

(assert (= (and b!130929 res!108566) b!130932))

(assert (= (and b!130925 res!108569) b!130924))

(assert (= (and b!130924 res!108573) b!130926))

(assert (= (and b!130926 res!108568) b!130921))

(assert (= (and b!130921 (not res!108575)) b!130922))

(assert (= (and b!130925 res!108574) b!130927))

(assert (= (and b!130925 res!108570) b!130931))

(assert (= start!25674 b!130933))

(declare-fun m!197481 () Bool)

(assert (=> b!130934 m!197481))

(declare-fun m!197483 () Bool)

(assert (=> b!130934 m!197483))

(declare-fun m!197485 () Bool)

(assert (=> b!130933 m!197485))

(declare-fun m!197487 () Bool)

(assert (=> b!130923 m!197487))

(declare-fun m!197489 () Bool)

(assert (=> b!130921 m!197489))

(declare-fun m!197491 () Bool)

(assert (=> b!130921 m!197491))

(declare-fun m!197493 () Bool)

(assert (=> b!130921 m!197493))

(declare-fun m!197495 () Bool)

(assert (=> b!130921 m!197495))

(declare-fun m!197497 () Bool)

(assert (=> b!130929 m!197497))

(declare-fun m!197499 () Bool)

(assert (=> b!130925 m!197499))

(declare-fun m!197501 () Bool)

(assert (=> b!130925 m!197501))

(declare-fun m!197503 () Bool)

(assert (=> b!130925 m!197503))

(declare-fun m!197505 () Bool)

(assert (=> b!130925 m!197505))

(declare-fun m!197507 () Bool)

(assert (=> b!130925 m!197507))

(declare-fun m!197509 () Bool)

(assert (=> b!130925 m!197509))

(declare-fun m!197511 () Bool)

(assert (=> b!130925 m!197511))

(declare-fun m!197513 () Bool)

(assert (=> b!130925 m!197513))

(assert (=> b!130925 m!197495))

(declare-fun m!197515 () Bool)

(assert (=> b!130925 m!197515))

(declare-fun m!197517 () Bool)

(assert (=> b!130925 m!197517))

(declare-fun m!197519 () Bool)

(assert (=> b!130925 m!197519))

(declare-fun m!197521 () Bool)

(assert (=> b!130925 m!197521))

(declare-fun m!197523 () Bool)

(assert (=> b!130925 m!197523))

(declare-fun m!197525 () Bool)

(assert (=> b!130925 m!197525))

(declare-fun m!197527 () Bool)

(assert (=> b!130925 m!197527))

(declare-fun m!197529 () Bool)

(assert (=> b!130925 m!197529))

(assert (=> b!130925 m!197515))

(assert (=> b!130932 m!197515))

(declare-fun m!197531 () Bool)

(assert (=> b!130932 m!197531))

(declare-fun m!197533 () Bool)

(assert (=> b!130932 m!197533))

(declare-fun m!197535 () Bool)

(assert (=> b!130927 m!197535))

(declare-fun m!197537 () Bool)

(assert (=> b!130928 m!197537))

(declare-fun m!197539 () Bool)

(assert (=> b!130924 m!197539))

(assert (=> b!130924 m!197481))

(declare-fun m!197541 () Bool)

(assert (=> b!130926 m!197541))

(declare-fun m!197543 () Bool)

(assert (=> b!130922 m!197543))

(declare-fun m!197545 () Bool)

(assert (=> start!25674 m!197545))

(declare-fun m!197547 () Bool)

(assert (=> start!25674 m!197547))

(check-sat (not b!130922) (not b!130921) (not b!130923) (not b!130934) (not b!130927) (not b!130925) (not b!130926) (not b!130933) (not start!25674) (not b!130924) (not b!130929) (not b!130928) (not b!130932))
