; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25060 () Bool)

(assert start!25060)

(declare-fun b!126960 () Bool)

(declare-fun e!83746 () Bool)

(declare-fun e!83744 () Bool)

(assert (=> b!126960 (= e!83746 (not e!83744))))

(declare-fun res!105237 () Bool)

(assert (=> b!126960 (=> res!105237 e!83744)))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!5748 0))(
  ( (array!5749 (arr!3212 (Array (_ BitVec 32) (_ BitVec 8))) (size!2601 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4526 0))(
  ( (BitStream!4527 (buf!2986 array!5748) (currentByte!5725 (_ BitVec 32)) (currentBit!5720 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4526)

(declare-datatypes ((Unit!7808 0))(
  ( (Unit!7809) )
))
(declare-datatypes ((tuple2!10672 0))(
  ( (tuple2!10673 (_1!5621 Unit!7808) (_2!5621 BitStream!4526)) )
))
(declare-fun lt!198237 () tuple2!10672)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!126960 (= res!105237 (not (= (bitIndex!0 (size!2601 (buf!2986 (_2!5621 lt!198237))) (currentByte!5725 (_2!5621 lt!198237)) (currentBit!5720 (_2!5621 lt!198237))) (bvadd (bitIndex!0 (size!2601 (buf!2986 thiss!1614)) (currentByte!5725 thiss!1614) (currentBit!5720 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(declare-fun e!83740 () Bool)

(assert (=> b!126960 e!83740))

(declare-fun res!105236 () Bool)

(assert (=> b!126960 (=> (not res!105236) (not e!83740))))

(assert (=> b!126960 (= res!105236 (= (size!2601 (buf!2986 thiss!1614)) (size!2601 (buf!2986 (_2!5621 lt!198237)))))))

(declare-fun arr!227 () array!5748)

(declare-fun appendByteArrayLoop!0 (BitStream!4526 array!5748 (_ BitVec 32) (_ BitVec 32)) tuple2!10672)

(assert (=> b!126960 (= lt!198237 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun res!105239 () Bool)

(assert (=> start!25060 (=> (not res!105239) (not e!83746))))

(assert (=> start!25060 (= res!105239 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2601 arr!227))))))

(assert (=> start!25060 e!83746))

(assert (=> start!25060 true))

(declare-fun array_inv!2390 (array!5748) Bool)

(assert (=> start!25060 (array_inv!2390 arr!227)))

(declare-fun e!83745 () Bool)

(declare-fun inv!12 (BitStream!4526) Bool)

(assert (=> start!25060 (and (inv!12 thiss!1614) e!83745)))

(declare-fun b!126961 () Bool)

(declare-fun e!83742 () Bool)

(declare-fun e!83743 () Bool)

(assert (=> b!126961 (= e!83742 (not e!83743))))

(declare-fun res!105240 () Bool)

(assert (=> b!126961 (=> res!105240 e!83743)))

(declare-datatypes ((tuple2!10674 0))(
  ( (tuple2!10675 (_1!5622 BitStream!4526) (_2!5622 array!5748)) )
))
(declare-fun lt!198235 () tuple2!10674)

(declare-datatypes ((tuple2!10676 0))(
  ( (tuple2!10677 (_1!5623 BitStream!4526) (_2!5623 BitStream!4526)) )
))
(declare-fun lt!198241 () tuple2!10676)

(assert (=> b!126961 (= res!105240 (or (not (= (size!2601 (_2!5622 lt!198235)) (size!2601 arr!227))) (not (= (_1!5622 lt!198235) (_2!5623 lt!198241)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4526 array!5748 (_ BitVec 32) (_ BitVec 32)) tuple2!10674)

(assert (=> b!126961 (= lt!198235 (readByteArrayLoopPure!0 (_1!5623 lt!198241) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun lt!198240 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!126961 (validate_offset_bits!1 ((_ sign_extend 32) (size!2601 (buf!2986 (_2!5621 lt!198237)))) ((_ sign_extend 32) (currentByte!5725 thiss!1614)) ((_ sign_extend 32) (currentBit!5720 thiss!1614)) lt!198240)))

(declare-fun lt!198238 () Unit!7808)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4526 array!5748 (_ BitVec 64)) Unit!7808)

(assert (=> b!126961 (= lt!198238 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2986 (_2!5621 lt!198237)) lt!198240))))

(declare-fun reader!0 (BitStream!4526 BitStream!4526) tuple2!10676)

(assert (=> b!126961 (= lt!198241 (reader!0 thiss!1614 (_2!5621 lt!198237)))))

(declare-fun b!126962 () Bool)

(declare-fun res!105238 () Bool)

(assert (=> b!126962 (=> res!105238 e!83744)))

(declare-fun isPrefixOf!0 (BitStream!4526 BitStream!4526) Bool)

(assert (=> b!126962 (= res!105238 (not (isPrefixOf!0 thiss!1614 (_2!5621 lt!198237))))))

(declare-fun b!126963 () Bool)

(assert (=> b!126963 (= e!83744 true)))

(declare-fun lt!198236 () tuple2!10676)

(declare-fun lt!198242 () tuple2!10674)

(assert (=> b!126963 (= lt!198242 (readByteArrayLoopPure!0 (_1!5623 lt!198236) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> b!126963 (validate_offset_bits!1 ((_ sign_extend 32) (size!2601 (buf!2986 (_2!5621 lt!198237)))) ((_ sign_extend 32) (currentByte!5725 thiss!1614)) ((_ sign_extend 32) (currentBit!5720 thiss!1614)) ((_ sign_extend 32) noOfBytes!1))))

(declare-fun lt!198239 () Unit!7808)

(assert (=> b!126963 (= lt!198239 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2986 (_2!5621 lt!198237)) ((_ sign_extend 32) noOfBytes!1)))))

(assert (=> b!126963 (= lt!198236 (reader!0 thiss!1614 (_2!5621 lt!198237)))))

(declare-fun b!126964 () Bool)

(declare-fun res!105234 () Bool)

(assert (=> b!126964 (=> (not res!105234) (not e!83742))))

(assert (=> b!126964 (= res!105234 (isPrefixOf!0 thiss!1614 (_2!5621 lt!198237)))))

(declare-fun b!126965 () Bool)

(declare-fun res!105241 () Bool)

(assert (=> b!126965 (=> (not res!105241) (not e!83746))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!126965 (= res!105241 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2601 (buf!2986 thiss!1614))) ((_ sign_extend 32) (currentByte!5725 thiss!1614)) ((_ sign_extend 32) (currentBit!5720 thiss!1614)) noOfBytes!1))))

(declare-fun b!126966 () Bool)

(declare-fun arrayRangesEq!88 (array!5748 array!5748 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!126966 (= e!83743 (not (arrayRangesEq!88 arr!227 (_2!5622 lt!198235) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!126967 () Bool)

(assert (=> b!126967 (= e!83740 e!83742)))

(declare-fun res!105235 () Bool)

(assert (=> b!126967 (=> (not res!105235) (not e!83742))))

(assert (=> b!126967 (= res!105235 (= (bitIndex!0 (size!2601 (buf!2986 (_2!5621 lt!198237))) (currentByte!5725 (_2!5621 lt!198237)) (currentBit!5720 (_2!5621 lt!198237))) (bvadd (bitIndex!0 (size!2601 (buf!2986 thiss!1614)) (currentByte!5725 thiss!1614) (currentBit!5720 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!198240))))))

(assert (=> b!126967 (= lt!198240 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!126968 () Bool)

(assert (=> b!126968 (= e!83745 (array_inv!2390 (buf!2986 thiss!1614)))))

(assert (= (and start!25060 res!105239) b!126965))

(assert (= (and b!126965 res!105241) b!126960))

(assert (= (and b!126960 res!105236) b!126967))

(assert (= (and b!126967 res!105235) b!126964))

(assert (= (and b!126964 res!105234) b!126961))

(assert (= (and b!126961 (not res!105240)) b!126966))

(assert (= (and b!126960 (not res!105237)) b!126962))

(assert (= (and b!126962 (not res!105238)) b!126963))

(assert (= start!25060 b!126968))

(declare-fun m!192577 () Bool)

(assert (=> start!25060 m!192577))

(declare-fun m!192579 () Bool)

(assert (=> start!25060 m!192579))

(declare-fun m!192581 () Bool)

(assert (=> b!126967 m!192581))

(declare-fun m!192583 () Bool)

(assert (=> b!126967 m!192583))

(declare-fun m!192585 () Bool)

(assert (=> b!126968 m!192585))

(declare-fun m!192587 () Bool)

(assert (=> b!126966 m!192587))

(declare-fun m!192589 () Bool)

(assert (=> b!126961 m!192589))

(declare-fun m!192591 () Bool)

(assert (=> b!126961 m!192591))

(declare-fun m!192593 () Bool)

(assert (=> b!126961 m!192593))

(declare-fun m!192595 () Bool)

(assert (=> b!126961 m!192595))

(declare-fun m!192597 () Bool)

(assert (=> b!126963 m!192597))

(declare-fun m!192599 () Bool)

(assert (=> b!126963 m!192599))

(declare-fun m!192601 () Bool)

(assert (=> b!126963 m!192601))

(assert (=> b!126963 m!192595))

(declare-fun m!192603 () Bool)

(assert (=> b!126962 m!192603))

(assert (=> b!126964 m!192603))

(declare-fun m!192605 () Bool)

(assert (=> b!126965 m!192605))

(assert (=> b!126960 m!192581))

(assert (=> b!126960 m!192583))

(declare-fun m!192607 () Bool)

(assert (=> b!126960 m!192607))

(push 1)

(assert (not b!126962))

(assert (not b!126963))

(assert (not b!126964))

(assert (not b!126966))

(assert (not b!126968))

(assert (not b!126960))

(assert (not b!126967))

(assert (not b!126965))

(assert (not b!126961))

(assert (not start!25060))

(check-sat)

