; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25160 () Bool)

(assert start!25160)

(declare-fun b!127493 () Bool)

(declare-fun e!84194 () Bool)

(declare-fun e!84196 () Bool)

(assert (=> b!127493 (= e!84194 e!84196)))

(declare-fun res!105705 () Bool)

(assert (=> b!127493 (=> res!105705 e!84196)))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(assert (=> b!127493 (= res!105705 (bvslt ((_ sign_extend 32) noOfBytes!1) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!5785 0))(
  ( (array!5786 (arr!3235 (Array (_ BitVec 32) (_ BitVec 8))) (size!2618 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4560 0))(
  ( (BitStream!4561 (buf!3006 array!5785) (currentByte!5751 (_ BitVec 32)) (currentBit!5746 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10756 0))(
  ( (tuple2!10757 (_1!5666 BitStream!4560) (_2!5666 BitStream!4560)) )
))
(declare-fun lt!198862 () tuple2!10756)

(declare-fun thiss!1614 () BitStream!4560)

(declare-datatypes ((Unit!7839 0))(
  ( (Unit!7840) )
))
(declare-datatypes ((tuple2!10758 0))(
  ( (tuple2!10759 (_1!5667 Unit!7839) (_2!5667 BitStream!4560)) )
))
(declare-fun lt!198861 () tuple2!10758)

(declare-fun reader!0 (BitStream!4560 BitStream!4560) tuple2!10756)

(assert (=> b!127493 (= lt!198862 (reader!0 thiss!1614 (_2!5667 lt!198861)))))

(declare-fun b!127494 () Bool)

(declare-fun res!105706 () Bool)

(assert (=> b!127494 (=> res!105706 e!84194)))

(declare-fun isPrefixOf!0 (BitStream!4560 BitStream!4560) Bool)

(assert (=> b!127494 (= res!105706 (not (isPrefixOf!0 thiss!1614 (_2!5667 lt!198861))))))

(declare-fun b!127495 () Bool)

(declare-fun e!84200 () Bool)

(declare-fun e!84192 () Bool)

(assert (=> b!127495 (= e!84200 e!84192)))

(declare-fun res!105703 () Bool)

(assert (=> b!127495 (=> (not res!105703) (not e!84192))))

(declare-fun lt!198860 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!127495 (= res!105703 (= (bitIndex!0 (size!2618 (buf!3006 (_2!5667 lt!198861))) (currentByte!5751 (_2!5667 lt!198861)) (currentBit!5746 (_2!5667 lt!198861))) (bvadd (bitIndex!0 (size!2618 (buf!3006 thiss!1614)) (currentByte!5751 thiss!1614) (currentBit!5746 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!198860))))))

(assert (=> b!127495 (= lt!198860 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun e!84197 () Bool)

(declare-fun arr!227 () array!5785)

(declare-datatypes ((tuple2!10760 0))(
  ( (tuple2!10761 (_1!5668 BitStream!4560) (_2!5668 array!5785)) )
))
(declare-fun lt!198859 () tuple2!10760)

(declare-fun b!127496 () Bool)

(declare-fun arrayRangesEq!102 (array!5785 array!5785 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!127496 (= e!84197 (not (arrayRangesEq!102 arr!227 (_2!5668 lt!198859) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!127497 () Bool)

(declare-fun e!84193 () Bool)

(declare-fun array_inv!2407 (array!5785) Bool)

(assert (=> b!127497 (= e!84193 (array_inv!2407 (buf!3006 thiss!1614)))))

(declare-fun b!127498 () Bool)

(declare-fun e!84198 () Bool)

(assert (=> b!127498 (= e!84198 (not e!84194))))

(declare-fun res!105698 () Bool)

(assert (=> b!127498 (=> res!105698 e!84194)))

(assert (=> b!127498 (= res!105698 (not (= (bitIndex!0 (size!2618 (buf!3006 (_2!5667 lt!198861))) (currentByte!5751 (_2!5667 lt!198861)) (currentBit!5746 (_2!5667 lt!198861))) (bvadd (bitIndex!0 (size!2618 (buf!3006 thiss!1614)) (currentByte!5751 thiss!1614) (currentBit!5746 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(assert (=> b!127498 e!84200))

(declare-fun res!105704 () Bool)

(assert (=> b!127498 (=> (not res!105704) (not e!84200))))

(assert (=> b!127498 (= res!105704 (= (size!2618 (buf!3006 thiss!1614)) (size!2618 (buf!3006 (_2!5667 lt!198861)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4560 array!5785 (_ BitVec 32) (_ BitVec 32)) tuple2!10758)

(assert (=> b!127498 (= lt!198861 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun res!105699 () Bool)

(assert (=> start!25160 (=> (not res!105699) (not e!84198))))

(assert (=> start!25160 (= res!105699 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2618 arr!227))))))

(assert (=> start!25160 e!84198))

(assert (=> start!25160 true))

(assert (=> start!25160 (array_inv!2407 arr!227)))

(declare-fun inv!12 (BitStream!4560) Bool)

(assert (=> start!25160 (and (inv!12 thiss!1614) e!84193)))

(declare-fun b!127499 () Bool)

(assert (=> b!127499 (= e!84192 (not e!84197))))

(declare-fun res!105702 () Bool)

(assert (=> b!127499 (=> res!105702 e!84197)))

(declare-fun lt!198858 () tuple2!10756)

(assert (=> b!127499 (= res!105702 (or (not (= (size!2618 (_2!5668 lt!198859)) (size!2618 arr!227))) (not (= (_1!5668 lt!198859) (_2!5666 lt!198858)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4560 array!5785 (_ BitVec 32) (_ BitVec 32)) tuple2!10760)

(assert (=> b!127499 (= lt!198859 (readByteArrayLoopPure!0 (_1!5666 lt!198858) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!127499 (validate_offset_bits!1 ((_ sign_extend 32) (size!2618 (buf!3006 (_2!5667 lt!198861)))) ((_ sign_extend 32) (currentByte!5751 thiss!1614)) ((_ sign_extend 32) (currentBit!5746 thiss!1614)) lt!198860)))

(declare-fun lt!198863 () Unit!7839)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4560 array!5785 (_ BitVec 64)) Unit!7839)

(assert (=> b!127499 (= lt!198863 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!3006 (_2!5667 lt!198861)) lt!198860))))

(assert (=> b!127499 (= lt!198858 (reader!0 thiss!1614 (_2!5667 lt!198861)))))

(declare-fun b!127500 () Bool)

(declare-fun res!105701 () Bool)

(assert (=> b!127500 (=> (not res!105701) (not e!84198))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!127500 (= res!105701 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2618 (buf!3006 thiss!1614))) ((_ sign_extend 32) (currentByte!5751 thiss!1614)) ((_ sign_extend 32) (currentBit!5746 thiss!1614)) noOfBytes!1))))

(declare-fun b!127501 () Bool)

(declare-fun res!105700 () Bool)

(assert (=> b!127501 (=> (not res!105700) (not e!84192))))

(assert (=> b!127501 (= res!105700 (isPrefixOf!0 thiss!1614 (_2!5667 lt!198861)))))

(declare-fun b!127502 () Bool)

(assert (=> b!127502 (= e!84196 (validate_offset_bits!1 ((_ sign_extend 32) (size!2618 (buf!3006 thiss!1614))) ((_ sign_extend 32) (currentByte!5751 thiss!1614)) ((_ sign_extend 32) (currentBit!5746 thiss!1614)) ((_ sign_extend 32) noOfBytes!1)))))

(assert (= (and start!25160 res!105699) b!127500))

(assert (= (and b!127500 res!105701) b!127498))

(assert (= (and b!127498 res!105704) b!127495))

(assert (= (and b!127495 res!105703) b!127501))

(assert (= (and b!127501 res!105700) b!127499))

(assert (= (and b!127499 (not res!105702)) b!127496))

(assert (= (and b!127498 (not res!105698)) b!127494))

(assert (= (and b!127494 (not res!105706)) b!127493))

(assert (= (and b!127493 (not res!105705)) b!127502))

(assert (= start!25160 b!127497))

(declare-fun m!193183 () Bool)

(assert (=> b!127496 m!193183))

(declare-fun m!193185 () Bool)

(assert (=> b!127493 m!193185))

(declare-fun m!193187 () Bool)

(assert (=> b!127495 m!193187))

(declare-fun m!193189 () Bool)

(assert (=> b!127495 m!193189))

(declare-fun m!193191 () Bool)

(assert (=> b!127497 m!193191))

(declare-fun m!193193 () Bool)

(assert (=> b!127502 m!193193))

(declare-fun m!193195 () Bool)

(assert (=> start!25160 m!193195))

(declare-fun m!193197 () Bool)

(assert (=> start!25160 m!193197))

(declare-fun m!193199 () Bool)

(assert (=> b!127499 m!193199))

(declare-fun m!193201 () Bool)

(assert (=> b!127499 m!193201))

(declare-fun m!193203 () Bool)

(assert (=> b!127499 m!193203))

(assert (=> b!127499 m!193185))

(declare-fun m!193205 () Bool)

(assert (=> b!127501 m!193205))

(assert (=> b!127494 m!193205))

(declare-fun m!193207 () Bool)

(assert (=> b!127500 m!193207))

(assert (=> b!127498 m!193187))

(assert (=> b!127498 m!193189))

(declare-fun m!193209 () Bool)

(assert (=> b!127498 m!193209))

(check-sat (not b!127497) (not b!127494) (not b!127498) (not start!25160) (not b!127500) (not b!127501) (not b!127502) (not b!127495) (not b!127496) (not b!127493) (not b!127499))
(check-sat)
