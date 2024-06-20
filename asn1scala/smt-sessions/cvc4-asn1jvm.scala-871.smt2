; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25150 () Bool)

(assert start!25150)

(declare-fun b!127353 () Bool)

(declare-fun e!84068 () Bool)

(declare-fun e!84071 () Bool)

(assert (=> b!127353 (= e!84068 (not e!84071))))

(declare-fun res!105573 () Bool)

(assert (=> b!127353 (=> res!105573 e!84071)))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!5775 0))(
  ( (array!5776 (arr!3230 (Array (_ BitVec 32) (_ BitVec 8))) (size!2613 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4550 0))(
  ( (BitStream!4551 (buf!3001 array!5775) (currentByte!5746 (_ BitVec 32)) (currentBit!5741 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4550)

(declare-datatypes ((Unit!7829 0))(
  ( (Unit!7830) )
))
(declare-datatypes ((tuple2!10726 0))(
  ( (tuple2!10727 (_1!5651 Unit!7829) (_2!5651 BitStream!4550)) )
))
(declare-fun lt!198771 () tuple2!10726)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!127353 (= res!105573 (not (= (bitIndex!0 (size!2613 (buf!3001 (_2!5651 lt!198771))) (currentByte!5746 (_2!5651 lt!198771)) (currentBit!5741 (_2!5651 lt!198771))) (bvadd (bitIndex!0 (size!2613 (buf!3001 thiss!1614)) (currentByte!5746 thiss!1614) (currentBit!5741 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(declare-fun e!84067 () Bool)

(assert (=> b!127353 e!84067))

(declare-fun res!105574 () Bool)

(assert (=> b!127353 (=> (not res!105574) (not e!84067))))

(assert (=> b!127353 (= res!105574 (= (size!2613 (buf!3001 thiss!1614)) (size!2613 (buf!3001 (_2!5651 lt!198771)))))))

(declare-fun arr!227 () array!5775)

(declare-fun appendByteArrayLoop!0 (BitStream!4550 array!5775 (_ BitVec 32) (_ BitVec 32)) tuple2!10726)

(assert (=> b!127353 (= lt!198771 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun res!105576 () Bool)

(assert (=> start!25150 (=> (not res!105576) (not e!84068))))

(assert (=> start!25150 (= res!105576 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2613 arr!227))))))

(assert (=> start!25150 e!84068))

(assert (=> start!25150 true))

(declare-fun array_inv!2402 (array!5775) Bool)

(assert (=> start!25150 (array_inv!2402 arr!227)))

(declare-fun e!84072 () Bool)

(declare-fun inv!12 (BitStream!4550) Bool)

(assert (=> start!25150 (and (inv!12 thiss!1614) e!84072)))

(declare-fun b!127354 () Bool)

(assert (=> b!127354 (= e!84071 true)))

(declare-datatypes ((tuple2!10728 0))(
  ( (tuple2!10729 (_1!5652 BitStream!4550) (_2!5652 BitStream!4550)) )
))
(declare-fun lt!198770 () tuple2!10728)

(declare-fun reader!0 (BitStream!4550 BitStream!4550) tuple2!10728)

(assert (=> b!127354 (= lt!198770 (reader!0 thiss!1614 (_2!5651 lt!198771)))))

(declare-fun b!127355 () Bool)

(declare-fun e!84069 () Bool)

(declare-fun e!84074 () Bool)

(assert (=> b!127355 (= e!84069 (not e!84074))))

(declare-fun res!105579 () Bool)

(assert (=> b!127355 (=> res!105579 e!84074)))

(declare-datatypes ((tuple2!10730 0))(
  ( (tuple2!10731 (_1!5653 BitStream!4550) (_2!5653 array!5775)) )
))
(declare-fun lt!198768 () tuple2!10730)

(declare-fun lt!198773 () tuple2!10728)

(assert (=> b!127355 (= res!105579 (or (not (= (size!2613 (_2!5653 lt!198768)) (size!2613 arr!227))) (not (= (_1!5653 lt!198768) (_2!5652 lt!198773)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4550 array!5775 (_ BitVec 32) (_ BitVec 32)) tuple2!10730)

(assert (=> b!127355 (= lt!198768 (readByteArrayLoopPure!0 (_1!5652 lt!198773) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun lt!198769 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!127355 (validate_offset_bits!1 ((_ sign_extend 32) (size!2613 (buf!3001 (_2!5651 lt!198771)))) ((_ sign_extend 32) (currentByte!5746 thiss!1614)) ((_ sign_extend 32) (currentBit!5741 thiss!1614)) lt!198769)))

(declare-fun lt!198772 () Unit!7829)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4550 array!5775 (_ BitVec 64)) Unit!7829)

(assert (=> b!127355 (= lt!198772 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!3001 (_2!5651 lt!198771)) lt!198769))))

(assert (=> b!127355 (= lt!198773 (reader!0 thiss!1614 (_2!5651 lt!198771)))))

(declare-fun b!127356 () Bool)

(assert (=> b!127356 (= e!84067 e!84069)))

(declare-fun res!105580 () Bool)

(assert (=> b!127356 (=> (not res!105580) (not e!84069))))

(assert (=> b!127356 (= res!105580 (= (bitIndex!0 (size!2613 (buf!3001 (_2!5651 lt!198771))) (currentByte!5746 (_2!5651 lt!198771)) (currentBit!5741 (_2!5651 lt!198771))) (bvadd (bitIndex!0 (size!2613 (buf!3001 thiss!1614)) (currentByte!5746 thiss!1614) (currentBit!5741 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!198769))))))

(assert (=> b!127356 (= lt!198769 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!127357 () Bool)

(assert (=> b!127357 (= e!84072 (array_inv!2402 (buf!3001 thiss!1614)))))

(declare-fun b!127358 () Bool)

(declare-fun res!105578 () Bool)

(assert (=> b!127358 (=> res!105578 e!84071)))

(declare-fun isPrefixOf!0 (BitStream!4550 BitStream!4550) Bool)

(assert (=> b!127358 (= res!105578 (not (isPrefixOf!0 thiss!1614 (_2!5651 lt!198771))))))

(declare-fun b!127359 () Bool)

(declare-fun arrayRangesEq!97 (array!5775 array!5775 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!127359 (= e!84074 (not (arrayRangesEq!97 arr!227 (_2!5653 lt!198768) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!127360 () Bool)

(declare-fun res!105577 () Bool)

(assert (=> b!127360 (=> (not res!105577) (not e!84069))))

(assert (=> b!127360 (= res!105577 (isPrefixOf!0 thiss!1614 (_2!5651 lt!198771)))))

(declare-fun b!127361 () Bool)

(declare-fun res!105575 () Bool)

(assert (=> b!127361 (=> (not res!105575) (not e!84068))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!127361 (= res!105575 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2613 (buf!3001 thiss!1614))) ((_ sign_extend 32) (currentByte!5746 thiss!1614)) ((_ sign_extend 32) (currentBit!5741 thiss!1614)) noOfBytes!1))))

(assert (= (and start!25150 res!105576) b!127361))

(assert (= (and b!127361 res!105575) b!127353))

(assert (= (and b!127353 res!105574) b!127356))

(assert (= (and b!127356 res!105580) b!127360))

(assert (= (and b!127360 res!105577) b!127355))

(assert (= (and b!127355 (not res!105579)) b!127359))

(assert (= (and b!127353 (not res!105573)) b!127358))

(assert (= (and b!127358 (not res!105578)) b!127354))

(assert (= start!25150 b!127357))

(declare-fun m!193051 () Bool)

(assert (=> start!25150 m!193051))

(declare-fun m!193053 () Bool)

(assert (=> start!25150 m!193053))

(declare-fun m!193055 () Bool)

(assert (=> b!127358 m!193055))

(declare-fun m!193057 () Bool)

(assert (=> b!127356 m!193057))

(declare-fun m!193059 () Bool)

(assert (=> b!127356 m!193059))

(declare-fun m!193061 () Bool)

(assert (=> b!127359 m!193061))

(declare-fun m!193063 () Bool)

(assert (=> b!127354 m!193063))

(declare-fun m!193065 () Bool)

(assert (=> b!127355 m!193065))

(declare-fun m!193067 () Bool)

(assert (=> b!127355 m!193067))

(declare-fun m!193069 () Bool)

(assert (=> b!127355 m!193069))

(assert (=> b!127355 m!193063))

(assert (=> b!127360 m!193055))

(assert (=> b!127353 m!193057))

(assert (=> b!127353 m!193059))

(declare-fun m!193071 () Bool)

(assert (=> b!127353 m!193071))

(declare-fun m!193073 () Bool)

(assert (=> b!127357 m!193073))

(declare-fun m!193075 () Bool)

(assert (=> b!127361 m!193075))

(push 1)

(assert (not b!127353))

(assert (not b!127357))

(assert (not b!127359))

(assert (not b!127358))

(assert (not start!25150))

(assert (not b!127356))

(assert (not b!127360))

(assert (not b!127354))

(assert (not b!127355))

(assert (not b!127361))

(check-sat)

