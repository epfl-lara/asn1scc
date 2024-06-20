; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25058 () Bool)

(assert start!25058)

(declare-fun b!126933 () Bool)

(declare-fun e!83716 () Bool)

(assert (=> b!126933 (= e!83716 true)))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!5746 0))(
  ( (array!5747 (arr!3211 (Array (_ BitVec 32) (_ BitVec 8))) (size!2600 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4524 0))(
  ( (BitStream!4525 (buf!2985 array!5746) (currentByte!5724 (_ BitVec 32)) (currentBit!5719 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10666 0))(
  ( (tuple2!10667 (_1!5618 BitStream!4524) (_2!5618 BitStream!4524)) )
))
(declare-fun lt!198215 () tuple2!10666)

(declare-datatypes ((tuple2!10668 0))(
  ( (tuple2!10669 (_1!5619 BitStream!4524) (_2!5619 array!5746)) )
))
(declare-fun lt!198211 () tuple2!10668)

(declare-fun arr!227 () array!5746)

(declare-fun readByteArrayLoopPure!0 (BitStream!4524 array!5746 (_ BitVec 32) (_ BitVec 32)) tuple2!10668)

(assert (=> b!126933 (= lt!198211 (readByteArrayLoopPure!0 (_1!5618 lt!198215) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-datatypes ((Unit!7806 0))(
  ( (Unit!7807) )
))
(declare-datatypes ((tuple2!10670 0))(
  ( (tuple2!10671 (_1!5620 Unit!7806) (_2!5620 BitStream!4524)) )
))
(declare-fun lt!198216 () tuple2!10670)

(declare-fun thiss!1614 () BitStream!4524)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!126933 (validate_offset_bits!1 ((_ sign_extend 32) (size!2600 (buf!2985 (_2!5620 lt!198216)))) ((_ sign_extend 32) (currentByte!5724 thiss!1614)) ((_ sign_extend 32) (currentBit!5719 thiss!1614)) ((_ sign_extend 32) noOfBytes!1))))

(declare-fun lt!198213 () Unit!7806)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4524 array!5746 (_ BitVec 64)) Unit!7806)

(assert (=> b!126933 (= lt!198213 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2985 (_2!5620 lt!198216)) ((_ sign_extend 32) noOfBytes!1)))))

(declare-fun reader!0 (BitStream!4524 BitStream!4524) tuple2!10666)

(assert (=> b!126933 (= lt!198215 (reader!0 thiss!1614 (_2!5620 lt!198216)))))

(declare-fun b!126934 () Bool)

(declare-fun res!105214 () Bool)

(declare-fun e!83717 () Bool)

(assert (=> b!126934 (=> (not res!105214) (not e!83717))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!126934 (= res!105214 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2600 (buf!2985 thiss!1614))) ((_ sign_extend 32) (currentByte!5724 thiss!1614)) ((_ sign_extend 32) (currentBit!5719 thiss!1614)) noOfBytes!1))))

(declare-fun b!126935 () Bool)

(declare-fun res!105215 () Bool)

(declare-fun e!83722 () Bool)

(assert (=> b!126935 (=> (not res!105215) (not e!83722))))

(declare-fun isPrefixOf!0 (BitStream!4524 BitStream!4524) Bool)

(assert (=> b!126935 (= res!105215 (isPrefixOf!0 thiss!1614 (_2!5620 lt!198216)))))

(declare-fun b!126936 () Bool)

(declare-fun e!83721 () Bool)

(assert (=> b!126936 (= e!83721 e!83722)))

(declare-fun res!105217 () Bool)

(assert (=> b!126936 (=> (not res!105217) (not e!83722))))

(declare-fun lt!198212 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!126936 (= res!105217 (= (bitIndex!0 (size!2600 (buf!2985 (_2!5620 lt!198216))) (currentByte!5724 (_2!5620 lt!198216)) (currentBit!5719 (_2!5620 lt!198216))) (bvadd (bitIndex!0 (size!2600 (buf!2985 thiss!1614)) (currentByte!5724 thiss!1614) (currentBit!5719 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!198212))))))

(assert (=> b!126936 (= lt!198212 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!126937 () Bool)

(declare-fun res!105216 () Bool)

(assert (=> b!126937 (=> res!105216 e!83716)))

(assert (=> b!126937 (= res!105216 (not (isPrefixOf!0 thiss!1614 (_2!5620 lt!198216))))))

(declare-fun b!126938 () Bool)

(declare-fun e!83718 () Bool)

(declare-fun array_inv!2389 (array!5746) Bool)

(assert (=> b!126938 (= e!83718 (array_inv!2389 (buf!2985 thiss!1614)))))

(declare-fun b!126939 () Bool)

(assert (=> b!126939 (= e!83717 (not e!83716))))

(declare-fun res!105210 () Bool)

(assert (=> b!126939 (=> res!105210 e!83716)))

(assert (=> b!126939 (= res!105210 (not (= (bitIndex!0 (size!2600 (buf!2985 (_2!5620 lt!198216))) (currentByte!5724 (_2!5620 lt!198216)) (currentBit!5719 (_2!5620 lt!198216))) (bvadd (bitIndex!0 (size!2600 (buf!2985 thiss!1614)) (currentByte!5724 thiss!1614) (currentBit!5719 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(assert (=> b!126939 e!83721))

(declare-fun res!105213 () Bool)

(assert (=> b!126939 (=> (not res!105213) (not e!83721))))

(assert (=> b!126939 (= res!105213 (= (size!2600 (buf!2985 thiss!1614)) (size!2600 (buf!2985 (_2!5620 lt!198216)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4524 array!5746 (_ BitVec 32) (_ BitVec 32)) tuple2!10670)

(assert (=> b!126939 (= lt!198216 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun lt!198214 () tuple2!10668)

(declare-fun e!83719 () Bool)

(declare-fun b!126940 () Bool)

(declare-fun arrayRangesEq!87 (array!5746 array!5746 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!126940 (= e!83719 (not (arrayRangesEq!87 arr!227 (_2!5619 lt!198214) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun res!105212 () Bool)

(assert (=> start!25058 (=> (not res!105212) (not e!83717))))

(assert (=> start!25058 (= res!105212 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2600 arr!227))))))

(assert (=> start!25058 e!83717))

(assert (=> start!25058 true))

(assert (=> start!25058 (array_inv!2389 arr!227)))

(declare-fun inv!12 (BitStream!4524) Bool)

(assert (=> start!25058 (and (inv!12 thiss!1614) e!83718)))

(declare-fun b!126941 () Bool)

(assert (=> b!126941 (= e!83722 (not e!83719))))

(declare-fun res!105211 () Bool)

(assert (=> b!126941 (=> res!105211 e!83719)))

(declare-fun lt!198217 () tuple2!10666)

(assert (=> b!126941 (= res!105211 (or (not (= (size!2600 (_2!5619 lt!198214)) (size!2600 arr!227))) (not (= (_1!5619 lt!198214) (_2!5618 lt!198217)))))))

(assert (=> b!126941 (= lt!198214 (readByteArrayLoopPure!0 (_1!5618 lt!198217) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> b!126941 (validate_offset_bits!1 ((_ sign_extend 32) (size!2600 (buf!2985 (_2!5620 lt!198216)))) ((_ sign_extend 32) (currentByte!5724 thiss!1614)) ((_ sign_extend 32) (currentBit!5719 thiss!1614)) lt!198212)))

(declare-fun lt!198218 () Unit!7806)

(assert (=> b!126941 (= lt!198218 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2985 (_2!5620 lt!198216)) lt!198212))))

(assert (=> b!126941 (= lt!198217 (reader!0 thiss!1614 (_2!5620 lt!198216)))))

(assert (= (and start!25058 res!105212) b!126934))

(assert (= (and b!126934 res!105214) b!126939))

(assert (= (and b!126939 res!105213) b!126936))

(assert (= (and b!126936 res!105217) b!126935))

(assert (= (and b!126935 res!105215) b!126941))

(assert (= (and b!126941 (not res!105211)) b!126940))

(assert (= (and b!126939 (not res!105210)) b!126937))

(assert (= (and b!126937 (not res!105216)) b!126933))

(assert (= start!25058 b!126938))

(declare-fun m!192545 () Bool)

(assert (=> b!126933 m!192545))

(declare-fun m!192547 () Bool)

(assert (=> b!126933 m!192547))

(declare-fun m!192549 () Bool)

(assert (=> b!126933 m!192549))

(declare-fun m!192551 () Bool)

(assert (=> b!126933 m!192551))

(declare-fun m!192553 () Bool)

(assert (=> b!126936 m!192553))

(declare-fun m!192555 () Bool)

(assert (=> b!126936 m!192555))

(declare-fun m!192557 () Bool)

(assert (=> start!25058 m!192557))

(declare-fun m!192559 () Bool)

(assert (=> start!25058 m!192559))

(declare-fun m!192561 () Bool)

(assert (=> b!126938 m!192561))

(declare-fun m!192563 () Bool)

(assert (=> b!126934 m!192563))

(declare-fun m!192565 () Bool)

(assert (=> b!126941 m!192565))

(declare-fun m!192567 () Bool)

(assert (=> b!126941 m!192567))

(declare-fun m!192569 () Bool)

(assert (=> b!126941 m!192569))

(assert (=> b!126941 m!192551))

(declare-fun m!192571 () Bool)

(assert (=> b!126937 m!192571))

(assert (=> b!126935 m!192571))

(declare-fun m!192573 () Bool)

(assert (=> b!126940 m!192573))

(assert (=> b!126939 m!192553))

(assert (=> b!126939 m!192555))

(declare-fun m!192575 () Bool)

(assert (=> b!126939 m!192575))

(check-sat (not start!25058) (not b!126935) (not b!126933) (not b!126938) (not b!126941) (not b!126937) (not b!126939) (not b!126936) (not b!126934) (not b!126940))
