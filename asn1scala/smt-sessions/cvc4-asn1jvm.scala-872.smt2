; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25156 () Bool)

(assert start!25156)

(declare-fun b!127434 () Bool)

(declare-fun res!105650 () Bool)

(declare-fun e!84144 () Bool)

(assert (=> b!127434 (=> res!105650 e!84144)))

(declare-datatypes ((array!5781 0))(
  ( (array!5782 (arr!3233 (Array (_ BitVec 32) (_ BitVec 8))) (size!2616 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4556 0))(
  ( (BitStream!4557 (buf!3004 array!5781) (currentByte!5749 (_ BitVec 32)) (currentBit!5744 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4556)

(declare-datatypes ((Unit!7835 0))(
  ( (Unit!7836) )
))
(declare-datatypes ((tuple2!10744 0))(
  ( (tuple2!10745 (_1!5660 Unit!7835) (_2!5660 BitStream!4556)) )
))
(declare-fun lt!198826 () tuple2!10744)

(declare-fun isPrefixOf!0 (BitStream!4556 BitStream!4556) Bool)

(assert (=> b!127434 (= res!105650 (not (isPrefixOf!0 thiss!1614 (_2!5660 lt!198826))))))

(declare-fun res!105652 () Bool)

(declare-fun e!84143 () Bool)

(assert (=> start!25156 (=> (not res!105652) (not e!84143))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-fun arr!227 () array!5781)

(assert (=> start!25156 (= res!105652 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2616 arr!227))))))

(assert (=> start!25156 e!84143))

(assert (=> start!25156 true))

(declare-fun array_inv!2405 (array!5781) Bool)

(assert (=> start!25156 (array_inv!2405 arr!227)))

(declare-fun e!84139 () Bool)

(declare-fun inv!12 (BitStream!4556) Bool)

(assert (=> start!25156 (and (inv!12 thiss!1614) e!84139)))

(declare-datatypes ((tuple2!10746 0))(
  ( (tuple2!10747 (_1!5661 BitStream!4556) (_2!5661 array!5781)) )
))
(declare-fun lt!198827 () tuple2!10746)

(declare-fun e!84146 () Bool)

(declare-fun b!127435 () Bool)

(declare-fun arrayRangesEq!100 (array!5781 array!5781 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!127435 (= e!84146 (not (arrayRangesEq!100 arr!227 (_2!5661 lt!198827) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!127436 () Bool)

(assert (=> b!127436 (= e!84143 (not e!84144))))

(declare-fun res!105651 () Bool)

(assert (=> b!127436 (=> res!105651 e!84144)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!127436 (= res!105651 (not (= (bitIndex!0 (size!2616 (buf!3004 (_2!5660 lt!198826))) (currentByte!5749 (_2!5660 lt!198826)) (currentBit!5744 (_2!5660 lt!198826))) (bvadd (bitIndex!0 (size!2616 (buf!3004 thiss!1614)) (currentByte!5749 thiss!1614) (currentBit!5744 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(declare-fun e!84145 () Bool)

(assert (=> b!127436 e!84145))

(declare-fun res!105649 () Bool)

(assert (=> b!127436 (=> (not res!105649) (not e!84145))))

(assert (=> b!127436 (= res!105649 (= (size!2616 (buf!3004 thiss!1614)) (size!2616 (buf!3004 (_2!5660 lt!198826)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4556 array!5781 (_ BitVec 32) (_ BitVec 32)) tuple2!10744)

(assert (=> b!127436 (= lt!198826 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!127437 () Bool)

(declare-fun e!84142 () Bool)

(assert (=> b!127437 (= e!84145 e!84142)))

(declare-fun res!105645 () Bool)

(assert (=> b!127437 (=> (not res!105645) (not e!84142))))

(declare-fun lt!198823 () (_ BitVec 64))

(assert (=> b!127437 (= res!105645 (= (bitIndex!0 (size!2616 (buf!3004 (_2!5660 lt!198826))) (currentByte!5749 (_2!5660 lt!198826)) (currentBit!5744 (_2!5660 lt!198826))) (bvadd (bitIndex!0 (size!2616 (buf!3004 thiss!1614)) (currentByte!5749 thiss!1614) (currentBit!5744 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!198823))))))

(assert (=> b!127437 (= lt!198823 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!127438 () Bool)

(assert (=> b!127438 (= e!84139 (array_inv!2405 (buf!3004 thiss!1614)))))

(declare-fun b!127439 () Bool)

(assert (=> b!127439 (= e!84144 (bvsge ((_ sign_extend 32) noOfBytes!1) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!10748 0))(
  ( (tuple2!10749 (_1!5662 BitStream!4556) (_2!5662 BitStream!4556)) )
))
(declare-fun lt!198824 () tuple2!10748)

(declare-fun reader!0 (BitStream!4556 BitStream!4556) tuple2!10748)

(assert (=> b!127439 (= lt!198824 (reader!0 thiss!1614 (_2!5660 lt!198826)))))

(declare-fun b!127440 () Bool)

(declare-fun res!105648 () Bool)

(assert (=> b!127440 (=> (not res!105648) (not e!84142))))

(assert (=> b!127440 (= res!105648 (isPrefixOf!0 thiss!1614 (_2!5660 lt!198826)))))

(declare-fun b!127441 () Bool)

(assert (=> b!127441 (= e!84142 (not e!84146))))

(declare-fun res!105647 () Bool)

(assert (=> b!127441 (=> res!105647 e!84146)))

(declare-fun lt!198822 () tuple2!10748)

(assert (=> b!127441 (= res!105647 (or (not (= (size!2616 (_2!5661 lt!198827)) (size!2616 arr!227))) (not (= (_1!5661 lt!198827) (_2!5662 lt!198822)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4556 array!5781 (_ BitVec 32) (_ BitVec 32)) tuple2!10746)

(assert (=> b!127441 (= lt!198827 (readByteArrayLoopPure!0 (_1!5662 lt!198822) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!127441 (validate_offset_bits!1 ((_ sign_extend 32) (size!2616 (buf!3004 (_2!5660 lt!198826)))) ((_ sign_extend 32) (currentByte!5749 thiss!1614)) ((_ sign_extend 32) (currentBit!5744 thiss!1614)) lt!198823)))

(declare-fun lt!198825 () Unit!7835)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4556 array!5781 (_ BitVec 64)) Unit!7835)

(assert (=> b!127441 (= lt!198825 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!3004 (_2!5660 lt!198826)) lt!198823))))

(assert (=> b!127441 (= lt!198822 (reader!0 thiss!1614 (_2!5660 lt!198826)))))

(declare-fun b!127442 () Bool)

(declare-fun res!105646 () Bool)

(assert (=> b!127442 (=> (not res!105646) (not e!84143))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!127442 (= res!105646 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2616 (buf!3004 thiss!1614))) ((_ sign_extend 32) (currentByte!5749 thiss!1614)) ((_ sign_extend 32) (currentBit!5744 thiss!1614)) noOfBytes!1))))

(assert (= (and start!25156 res!105652) b!127442))

(assert (= (and b!127442 res!105646) b!127436))

(assert (= (and b!127436 res!105649) b!127437))

(assert (= (and b!127437 res!105645) b!127440))

(assert (= (and b!127440 res!105648) b!127441))

(assert (= (and b!127441 (not res!105647)) b!127435))

(assert (= (and b!127436 (not res!105651)) b!127434))

(assert (= (and b!127434 (not res!105650)) b!127439))

(assert (= start!25156 b!127438))

(declare-fun m!193129 () Bool)

(assert (=> b!127439 m!193129))

(declare-fun m!193131 () Bool)

(assert (=> b!127434 m!193131))

(declare-fun m!193133 () Bool)

(assert (=> b!127442 m!193133))

(declare-fun m!193135 () Bool)

(assert (=> b!127435 m!193135))

(declare-fun m!193137 () Bool)

(assert (=> start!25156 m!193137))

(declare-fun m!193139 () Bool)

(assert (=> start!25156 m!193139))

(declare-fun m!193141 () Bool)

(assert (=> b!127441 m!193141))

(declare-fun m!193143 () Bool)

(assert (=> b!127441 m!193143))

(declare-fun m!193145 () Bool)

(assert (=> b!127441 m!193145))

(assert (=> b!127441 m!193129))

(declare-fun m!193147 () Bool)

(assert (=> b!127436 m!193147))

(declare-fun m!193149 () Bool)

(assert (=> b!127436 m!193149))

(declare-fun m!193151 () Bool)

(assert (=> b!127436 m!193151))

(declare-fun m!193153 () Bool)

(assert (=> b!127438 m!193153))

(assert (=> b!127440 m!193131))

(assert (=> b!127437 m!193147))

(assert (=> b!127437 m!193149))

(push 1)

(assert (not b!127442))

(assert (not b!127438))

(assert (not b!127437))

(assert (not b!127435))

(assert (not b!127440))

(assert (not b!127441))

(assert (not start!25156))

(assert (not b!127439))

(assert (not b!127436))

(assert (not b!127434))

(check-sat)

(pop 1)

(push 1)

(check-sat)

