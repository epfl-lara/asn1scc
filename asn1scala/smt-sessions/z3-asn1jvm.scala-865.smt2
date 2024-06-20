; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25046 () Bool)

(assert start!25046)

(declare-fun b!126771 () Bool)

(declare-fun e!83578 () Bool)

(assert (=> b!126771 (= e!83578 true)))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!5734 0))(
  ( (array!5735 (arr!3205 (Array (_ BitVec 32) (_ BitVec 8))) (size!2594 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4512 0))(
  ( (BitStream!4513 (buf!2979 array!5734) (currentByte!5718 (_ BitVec 32)) (currentBit!5713 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10630 0))(
  ( (tuple2!10631 (_1!5600 BitStream!4512) (_2!5600 array!5734)) )
))
(declare-fun lt!198074 () tuple2!10630)

(declare-datatypes ((tuple2!10632 0))(
  ( (tuple2!10633 (_1!5601 BitStream!4512) (_2!5601 BitStream!4512)) )
))
(declare-fun lt!198073 () tuple2!10632)

(declare-fun arr!227 () array!5734)

(declare-fun readByteArrayLoopPure!0 (BitStream!4512 array!5734 (_ BitVec 32) (_ BitVec 32)) tuple2!10630)

(assert (=> b!126771 (= lt!198074 (readByteArrayLoopPure!0 (_1!5601 lt!198073) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-datatypes ((Unit!7794 0))(
  ( (Unit!7795) )
))
(declare-datatypes ((tuple2!10634 0))(
  ( (tuple2!10635 (_1!5602 Unit!7794) (_2!5602 BitStream!4512)) )
))
(declare-fun lt!198071 () tuple2!10634)

(declare-fun thiss!1614 () BitStream!4512)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!126771 (validate_offset_bits!1 ((_ sign_extend 32) (size!2594 (buf!2979 (_2!5602 lt!198071)))) ((_ sign_extend 32) (currentByte!5718 thiss!1614)) ((_ sign_extend 32) (currentBit!5713 thiss!1614)) ((_ sign_extend 32) noOfBytes!1))))

(declare-fun lt!198070 () Unit!7794)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4512 array!5734 (_ BitVec 64)) Unit!7794)

(assert (=> b!126771 (= lt!198070 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2979 (_2!5602 lt!198071)) ((_ sign_extend 32) noOfBytes!1)))))

(declare-fun reader!0 (BitStream!4512 BitStream!4512) tuple2!10632)

(assert (=> b!126771 (= lt!198073 (reader!0 thiss!1614 (_2!5602 lt!198071)))))

(declare-fun b!126772 () Bool)

(declare-fun e!83577 () Bool)

(declare-fun lt!198072 () tuple2!10630)

(declare-fun arrayRangesEq!81 (array!5734 array!5734 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!126772 (= e!83577 (not (arrayRangesEq!81 arr!227 (_2!5600 lt!198072) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!126773 () Bool)

(declare-fun e!83576 () Bool)

(declare-fun e!83574 () Bool)

(assert (=> b!126773 (= e!83576 e!83574)))

(declare-fun res!105066 () Bool)

(assert (=> b!126773 (=> (not res!105066) (not e!83574))))

(declare-fun lt!198067 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!126773 (= res!105066 (= (bitIndex!0 (size!2594 (buf!2979 (_2!5602 lt!198071))) (currentByte!5718 (_2!5602 lt!198071)) (currentBit!5713 (_2!5602 lt!198071))) (bvadd (bitIndex!0 (size!2594 (buf!2979 thiss!1614)) (currentByte!5718 thiss!1614) (currentBit!5713 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!198067))))))

(assert (=> b!126773 (= lt!198067 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!126774 () Bool)

(assert (=> b!126774 (= e!83574 (not e!83577))))

(declare-fun res!105073 () Bool)

(assert (=> b!126774 (=> res!105073 e!83577)))

(declare-fun lt!198068 () tuple2!10632)

(assert (=> b!126774 (= res!105073 (or (not (= (size!2594 (_2!5600 lt!198072)) (size!2594 arr!227))) (not (= (_1!5600 lt!198072) (_2!5601 lt!198068)))))))

(assert (=> b!126774 (= lt!198072 (readByteArrayLoopPure!0 (_1!5601 lt!198068) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> b!126774 (validate_offset_bits!1 ((_ sign_extend 32) (size!2594 (buf!2979 (_2!5602 lt!198071)))) ((_ sign_extend 32) (currentByte!5718 thiss!1614)) ((_ sign_extend 32) (currentBit!5713 thiss!1614)) lt!198067)))

(declare-fun lt!198069 () Unit!7794)

(assert (=> b!126774 (= lt!198069 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2979 (_2!5602 lt!198071)) lt!198067))))

(assert (=> b!126774 (= lt!198068 (reader!0 thiss!1614 (_2!5602 lt!198071)))))

(declare-fun b!126775 () Bool)

(declare-fun res!105069 () Bool)

(assert (=> b!126775 (=> (not res!105069) (not e!83574))))

(declare-fun isPrefixOf!0 (BitStream!4512 BitStream!4512) Bool)

(assert (=> b!126775 (= res!105069 (isPrefixOf!0 thiss!1614 (_2!5602 lt!198071)))))

(declare-fun b!126776 () Bool)

(declare-fun e!83575 () Bool)

(declare-fun array_inv!2383 (array!5734) Bool)

(assert (=> b!126776 (= e!83575 (array_inv!2383 (buf!2979 thiss!1614)))))

(declare-fun res!105067 () Bool)

(declare-fun e!83573 () Bool)

(assert (=> start!25046 (=> (not res!105067) (not e!83573))))

(assert (=> start!25046 (= res!105067 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2594 arr!227))))))

(assert (=> start!25046 e!83573))

(assert (=> start!25046 true))

(assert (=> start!25046 (array_inv!2383 arr!227)))

(declare-fun inv!12 (BitStream!4512) Bool)

(assert (=> start!25046 (and (inv!12 thiss!1614) e!83575)))

(declare-fun b!126777 () Bool)

(declare-fun res!105070 () Bool)

(assert (=> b!126777 (=> res!105070 e!83578)))

(assert (=> b!126777 (= res!105070 (not (isPrefixOf!0 thiss!1614 (_2!5602 lt!198071))))))

(declare-fun b!126778 () Bool)

(assert (=> b!126778 (= e!83573 (not e!83578))))

(declare-fun res!105068 () Bool)

(assert (=> b!126778 (=> res!105068 e!83578)))

(assert (=> b!126778 (= res!105068 (not (= (bitIndex!0 (size!2594 (buf!2979 (_2!5602 lt!198071))) (currentByte!5718 (_2!5602 lt!198071)) (currentBit!5713 (_2!5602 lt!198071))) (bvadd (bitIndex!0 (size!2594 (buf!2979 thiss!1614)) (currentByte!5718 thiss!1614) (currentBit!5713 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(assert (=> b!126778 e!83576))

(declare-fun res!105072 () Bool)

(assert (=> b!126778 (=> (not res!105072) (not e!83576))))

(assert (=> b!126778 (= res!105072 (= (size!2594 (buf!2979 thiss!1614)) (size!2594 (buf!2979 (_2!5602 lt!198071)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4512 array!5734 (_ BitVec 32) (_ BitVec 32)) tuple2!10634)

(assert (=> b!126778 (= lt!198071 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!126779 () Bool)

(declare-fun res!105071 () Bool)

(assert (=> b!126779 (=> (not res!105071) (not e!83573))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!126779 (= res!105071 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2594 (buf!2979 thiss!1614))) ((_ sign_extend 32) (currentByte!5718 thiss!1614)) ((_ sign_extend 32) (currentBit!5713 thiss!1614)) noOfBytes!1))))

(assert (= (and start!25046 res!105067) b!126779))

(assert (= (and b!126779 res!105071) b!126778))

(assert (= (and b!126778 res!105072) b!126773))

(assert (= (and b!126773 res!105066) b!126775))

(assert (= (and b!126775 res!105069) b!126774))

(assert (= (and b!126774 (not res!105073)) b!126772))

(assert (= (and b!126778 (not res!105068)) b!126777))

(assert (= (and b!126777 (not res!105070)) b!126771))

(assert (= start!25046 b!126776))

(declare-fun m!192353 () Bool)

(assert (=> b!126776 m!192353))

(declare-fun m!192355 () Bool)

(assert (=> b!126773 m!192355))

(declare-fun m!192357 () Bool)

(assert (=> b!126773 m!192357))

(declare-fun m!192359 () Bool)

(assert (=> b!126774 m!192359))

(declare-fun m!192361 () Bool)

(assert (=> b!126774 m!192361))

(declare-fun m!192363 () Bool)

(assert (=> b!126774 m!192363))

(declare-fun m!192365 () Bool)

(assert (=> b!126774 m!192365))

(assert (=> b!126778 m!192355))

(assert (=> b!126778 m!192357))

(declare-fun m!192367 () Bool)

(assert (=> b!126778 m!192367))

(declare-fun m!192369 () Bool)

(assert (=> b!126771 m!192369))

(declare-fun m!192371 () Bool)

(assert (=> b!126771 m!192371))

(declare-fun m!192373 () Bool)

(assert (=> b!126771 m!192373))

(assert (=> b!126771 m!192365))

(declare-fun m!192375 () Bool)

(assert (=> b!126772 m!192375))

(declare-fun m!192377 () Bool)

(assert (=> b!126779 m!192377))

(declare-fun m!192379 () Bool)

(assert (=> b!126775 m!192379))

(assert (=> b!126777 m!192379))

(declare-fun m!192381 () Bool)

(assert (=> start!25046 m!192381))

(declare-fun m!192383 () Bool)

(assert (=> start!25046 m!192383))

(check-sat (not b!126776) (not b!126778) (not b!126775) (not b!126773) (not b!126772) (not start!25046) (not b!126777) (not b!126771) (not b!126779) (not b!126774))
