; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25158 () Bool)

(assert start!25158)

(declare-fun b!127463 () Bool)

(declare-fun e!84166 () Bool)

(declare-fun e!84168 () Bool)

(assert (=> b!127463 (= e!84166 (not e!84168))))

(declare-fun res!105677 () Bool)

(assert (=> b!127463 (=> res!105677 e!84168)))

(declare-datatypes ((array!5783 0))(
  ( (array!5784 (arr!3234 (Array (_ BitVec 32) (_ BitVec 8))) (size!2617 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4558 0))(
  ( (BitStream!4559 (buf!3005 array!5783) (currentByte!5750 (_ BitVec 32)) (currentBit!5745 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10750 0))(
  ( (tuple2!10751 (_1!5663 BitStream!4558) (_2!5663 BitStream!4558)) )
))
(declare-fun lt!198843 () tuple2!10750)

(declare-datatypes ((tuple2!10752 0))(
  ( (tuple2!10753 (_1!5664 BitStream!4558) (_2!5664 array!5783)) )
))
(declare-fun lt!198845 () tuple2!10752)

(declare-fun arr!227 () array!5783)

(assert (=> b!127463 (= res!105677 (or (not (= (size!2617 (_2!5664 lt!198845)) (size!2617 arr!227))) (not (= (_1!5664 lt!198845) (_2!5663 lt!198843)))))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!4558 array!5783 (_ BitVec 32) (_ BitVec 32)) tuple2!10752)

(assert (=> b!127463 (= lt!198845 (readByteArrayLoopPure!0 (_1!5663 lt!198843) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-datatypes ((Unit!7837 0))(
  ( (Unit!7838) )
))
(declare-datatypes ((tuple2!10754 0))(
  ( (tuple2!10755 (_1!5665 Unit!7837) (_2!5665 BitStream!4558)) )
))
(declare-fun lt!198844 () tuple2!10754)

(declare-fun thiss!1614 () BitStream!4558)

(declare-fun lt!198840 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!127463 (validate_offset_bits!1 ((_ sign_extend 32) (size!2617 (buf!3005 (_2!5665 lt!198844)))) ((_ sign_extend 32) (currentByte!5750 thiss!1614)) ((_ sign_extend 32) (currentBit!5745 thiss!1614)) lt!198840)))

(declare-fun lt!198841 () Unit!7837)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4558 array!5783 (_ BitVec 64)) Unit!7837)

(assert (=> b!127463 (= lt!198841 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!3005 (_2!5665 lt!198844)) lt!198840))))

(declare-fun reader!0 (BitStream!4558 BitStream!4558) tuple2!10750)

(assert (=> b!127463 (= lt!198843 (reader!0 thiss!1614 (_2!5665 lt!198844)))))

(declare-fun b!127464 () Bool)

(declare-fun e!84169 () Bool)

(assert (=> b!127464 (= e!84169 (validate_offset_bits!1 ((_ sign_extend 32) (size!2617 (buf!3005 thiss!1614))) ((_ sign_extend 32) (currentByte!5750 thiss!1614)) ((_ sign_extend 32) (currentBit!5745 thiss!1614)) ((_ sign_extend 32) noOfBytes!1)))))

(declare-fun b!127465 () Bool)

(declare-fun res!105671 () Bool)

(declare-fun e!84167 () Bool)

(assert (=> b!127465 (=> res!105671 e!84167)))

(declare-fun isPrefixOf!0 (BitStream!4558 BitStream!4558) Bool)

(assert (=> b!127465 (= res!105671 (not (isPrefixOf!0 thiss!1614 (_2!5665 lt!198844))))))

(declare-fun b!127466 () Bool)

(assert (=> b!127466 (= e!84167 e!84169)))

(declare-fun res!105674 () Bool)

(assert (=> b!127466 (=> res!105674 e!84169)))

(assert (=> b!127466 (= res!105674 (bvslt ((_ sign_extend 32) noOfBytes!1) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!198842 () tuple2!10750)

(assert (=> b!127466 (= lt!198842 (reader!0 thiss!1614 (_2!5665 lt!198844)))))

(declare-fun b!127467 () Bool)

(declare-fun e!84173 () Bool)

(assert (=> b!127467 (= e!84173 e!84166)))

(declare-fun res!105675 () Bool)

(assert (=> b!127467 (=> (not res!105675) (not e!84166))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!127467 (= res!105675 (= (bitIndex!0 (size!2617 (buf!3005 (_2!5665 lt!198844))) (currentByte!5750 (_2!5665 lt!198844)) (currentBit!5745 (_2!5665 lt!198844))) (bvadd (bitIndex!0 (size!2617 (buf!3005 thiss!1614)) (currentByte!5750 thiss!1614) (currentBit!5745 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!198840))))))

(assert (=> b!127467 (= lt!198840 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!127468 () Bool)

(declare-fun e!84171 () Bool)

(declare-fun array_inv!2406 (array!5783) Bool)

(assert (=> b!127468 (= e!84171 (array_inv!2406 (buf!3005 thiss!1614)))))

(declare-fun res!105672 () Bool)

(declare-fun e!84165 () Bool)

(assert (=> start!25158 (=> (not res!105672) (not e!84165))))

(assert (=> start!25158 (= res!105672 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2617 arr!227))))))

(assert (=> start!25158 e!84165))

(assert (=> start!25158 true))

(assert (=> start!25158 (array_inv!2406 arr!227)))

(declare-fun inv!12 (BitStream!4558) Bool)

(assert (=> start!25158 (and (inv!12 thiss!1614) e!84171)))

(declare-fun b!127469 () Bool)

(declare-fun res!105678 () Bool)

(assert (=> b!127469 (=> (not res!105678) (not e!84165))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!127469 (= res!105678 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2617 (buf!3005 thiss!1614))) ((_ sign_extend 32) (currentByte!5750 thiss!1614)) ((_ sign_extend 32) (currentBit!5745 thiss!1614)) noOfBytes!1))))

(declare-fun b!127470 () Bool)

(declare-fun res!105673 () Bool)

(assert (=> b!127470 (=> (not res!105673) (not e!84166))))

(assert (=> b!127470 (= res!105673 (isPrefixOf!0 thiss!1614 (_2!5665 lt!198844)))))

(declare-fun b!127471 () Bool)

(declare-fun arrayRangesEq!101 (array!5783 array!5783 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!127471 (= e!84168 (not (arrayRangesEq!101 arr!227 (_2!5664 lt!198845) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!127472 () Bool)

(assert (=> b!127472 (= e!84165 (not e!84167))))

(declare-fun res!105679 () Bool)

(assert (=> b!127472 (=> res!105679 e!84167)))

(assert (=> b!127472 (= res!105679 (not (= (bitIndex!0 (size!2617 (buf!3005 (_2!5665 lt!198844))) (currentByte!5750 (_2!5665 lt!198844)) (currentBit!5745 (_2!5665 lt!198844))) (bvadd (bitIndex!0 (size!2617 (buf!3005 thiss!1614)) (currentByte!5750 thiss!1614) (currentBit!5745 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(assert (=> b!127472 e!84173))

(declare-fun res!105676 () Bool)

(assert (=> b!127472 (=> (not res!105676) (not e!84173))))

(assert (=> b!127472 (= res!105676 (= (size!2617 (buf!3005 thiss!1614)) (size!2617 (buf!3005 (_2!5665 lt!198844)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4558 array!5783 (_ BitVec 32) (_ BitVec 32)) tuple2!10754)

(assert (=> b!127472 (= lt!198844 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (= (and start!25158 res!105672) b!127469))

(assert (= (and b!127469 res!105678) b!127472))

(assert (= (and b!127472 res!105676) b!127467))

(assert (= (and b!127467 res!105675) b!127470))

(assert (= (and b!127470 res!105673) b!127463))

(assert (= (and b!127463 (not res!105677)) b!127471))

(assert (= (and b!127472 (not res!105679)) b!127465))

(assert (= (and b!127465 (not res!105671)) b!127466))

(assert (= (and b!127466 (not res!105674)) b!127464))

(assert (= start!25158 b!127468))

(declare-fun m!193155 () Bool)

(assert (=> b!127468 m!193155))

(declare-fun m!193157 () Bool)

(assert (=> b!127470 m!193157))

(declare-fun m!193159 () Bool)

(assert (=> b!127466 m!193159))

(declare-fun m!193161 () Bool)

(assert (=> b!127469 m!193161))

(declare-fun m!193163 () Bool)

(assert (=> b!127471 m!193163))

(declare-fun m!193165 () Bool)

(assert (=> b!127467 m!193165))

(declare-fun m!193167 () Bool)

(assert (=> b!127467 m!193167))

(declare-fun m!193169 () Bool)

(assert (=> b!127464 m!193169))

(declare-fun m!193171 () Bool)

(assert (=> b!127463 m!193171))

(declare-fun m!193173 () Bool)

(assert (=> b!127463 m!193173))

(declare-fun m!193175 () Bool)

(assert (=> b!127463 m!193175))

(assert (=> b!127463 m!193159))

(declare-fun m!193177 () Bool)

(assert (=> start!25158 m!193177))

(declare-fun m!193179 () Bool)

(assert (=> start!25158 m!193179))

(assert (=> b!127472 m!193165))

(assert (=> b!127472 m!193167))

(declare-fun m!193181 () Bool)

(assert (=> b!127472 m!193181))

(assert (=> b!127465 m!193157))

(push 1)

(assert (not b!127468))

(assert (not b!127471))

(assert (not b!127472))

(assert (not b!127465))

(assert (not b!127467))

(assert (not b!127464))

(assert (not b!127470))

(assert (not b!127469))

(assert (not b!127466))

(assert (not start!25158))

(assert (not b!127463))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

