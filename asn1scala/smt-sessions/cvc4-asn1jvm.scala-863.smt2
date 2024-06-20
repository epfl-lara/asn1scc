; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24970 () Bool)

(assert start!24970)

(declare-fun e!83362 () Bool)

(declare-datatypes ((array!5721 0))(
  ( (array!5722 (arr!3194 (Array (_ BitVec 32) (_ BitVec 8))) (size!2589 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4502 0))(
  ( (BitStream!4503 (buf!2971 array!5721) (currentByte!5704 (_ BitVec 32)) (currentBit!5699 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10600 0))(
  ( (tuple2!10601 (_1!5582 BitStream!4502) (_2!5582 array!5721)) )
))
(declare-fun lt!197604 () tuple2!10600)

(declare-fun arr!227 () array!5721)

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-fun b!126477 () Bool)

(declare-fun arrayRangesEq!76 (array!5721 array!5721 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!126477 (= e!83362 (not (arrayRangesEq!76 arr!227 (_2!5582 lt!197604) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun res!104808 () Bool)

(declare-fun e!83366 () Bool)

(assert (=> start!24970 (=> (not res!104808) (not e!83366))))

(assert (=> start!24970 (= res!104808 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2589 arr!227))))))

(assert (=> start!24970 e!83366))

(assert (=> start!24970 true))

(declare-fun array_inv!2378 (array!5721) Bool)

(assert (=> start!24970 (array_inv!2378 arr!227)))

(declare-fun thiss!1614 () BitStream!4502)

(declare-fun e!83363 () Bool)

(declare-fun inv!12 (BitStream!4502) Bool)

(assert (=> start!24970 (and (inv!12 thiss!1614) e!83363)))

(declare-fun b!126478 () Bool)

(declare-fun e!83364 () Bool)

(assert (=> b!126478 (= e!83366 (not e!83364))))

(declare-fun res!104806 () Bool)

(assert (=> b!126478 (=> res!104806 e!83364)))

(declare-datatypes ((Unit!7781 0))(
  ( (Unit!7782) )
))
(declare-datatypes ((tuple2!10602 0))(
  ( (tuple2!10603 (_1!5583 Unit!7781) (_2!5583 BitStream!4502)) )
))
(declare-fun lt!197603 () tuple2!10602)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!126478 (= res!104806 (not (= (bitIndex!0 (size!2589 (buf!2971 (_2!5583 lt!197603))) (currentByte!5704 (_2!5583 lt!197603)) (currentBit!5699 (_2!5583 lt!197603))) (bvadd (bitIndex!0 (size!2589 (buf!2971 thiss!1614)) (currentByte!5704 thiss!1614) (currentBit!5699 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(declare-fun e!83360 () Bool)

(assert (=> b!126478 e!83360))

(declare-fun res!104805 () Bool)

(assert (=> b!126478 (=> (not res!104805) (not e!83360))))

(assert (=> b!126478 (= res!104805 (= (size!2589 (buf!2971 thiss!1614)) (size!2589 (buf!2971 (_2!5583 lt!197603)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4502 array!5721 (_ BitVec 32) (_ BitVec 32)) tuple2!10602)

(assert (=> b!126478 (= lt!197603 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!126479 () Bool)

(declare-fun res!104809 () Bool)

(assert (=> b!126479 (=> res!104809 e!83364)))

(declare-fun isPrefixOf!0 (BitStream!4502 BitStream!4502) Bool)

(assert (=> b!126479 (= res!104809 (not (isPrefixOf!0 thiss!1614 (_2!5583 lt!197603))))))

(declare-fun b!126480 () Bool)

(declare-fun res!104811 () Bool)

(assert (=> b!126480 (=> (not res!104811) (not e!83366))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!126480 (= res!104811 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2589 (buf!2971 thiss!1614))) ((_ sign_extend 32) (currentByte!5704 thiss!1614)) ((_ sign_extend 32) (currentBit!5699 thiss!1614)) noOfBytes!1))))

(declare-fun b!126481 () Bool)

(assert (=> b!126481 (= e!83363 (array_inv!2378 (buf!2971 thiss!1614)))))

(declare-fun b!126482 () Bool)

(declare-fun res!104810 () Bool)

(declare-fun e!83359 () Bool)

(assert (=> b!126482 (=> (not res!104810) (not e!83359))))

(assert (=> b!126482 (= res!104810 (isPrefixOf!0 thiss!1614 (_2!5583 lt!197603)))))

(declare-fun b!126483 () Bool)

(assert (=> b!126483 (= e!83360 e!83359)))

(declare-fun res!104812 () Bool)

(assert (=> b!126483 (=> (not res!104812) (not e!83359))))

(declare-fun lt!197609 () (_ BitVec 64))

(assert (=> b!126483 (= res!104812 (= (bitIndex!0 (size!2589 (buf!2971 (_2!5583 lt!197603))) (currentByte!5704 (_2!5583 lt!197603)) (currentBit!5699 (_2!5583 lt!197603))) (bvadd (bitIndex!0 (size!2589 (buf!2971 thiss!1614)) (currentByte!5704 thiss!1614) (currentBit!5699 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!197609))))))

(assert (=> b!126483 (= lt!197609 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!126484 () Bool)

(assert (=> b!126484 (= e!83364 true)))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!126484 (validate_offset_bits!1 ((_ sign_extend 32) (size!2589 (buf!2971 (_2!5583 lt!197603)))) ((_ sign_extend 32) (currentByte!5704 thiss!1614)) ((_ sign_extend 32) (currentBit!5699 thiss!1614)) ((_ sign_extend 32) noOfBytes!1))))

(declare-fun lt!197605 () Unit!7781)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4502 array!5721 (_ BitVec 64)) Unit!7781)

(assert (=> b!126484 (= lt!197605 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2971 (_2!5583 lt!197603)) ((_ sign_extend 32) noOfBytes!1)))))

(declare-datatypes ((tuple2!10604 0))(
  ( (tuple2!10605 (_1!5584 BitStream!4502) (_2!5584 BitStream!4502)) )
))
(declare-fun lt!197607 () tuple2!10604)

(declare-fun reader!0 (BitStream!4502 BitStream!4502) tuple2!10604)

(assert (=> b!126484 (= lt!197607 (reader!0 thiss!1614 (_2!5583 lt!197603)))))

(declare-fun b!126485 () Bool)

(assert (=> b!126485 (= e!83359 (not e!83362))))

(declare-fun res!104807 () Bool)

(assert (=> b!126485 (=> res!104807 e!83362)))

(declare-fun lt!197606 () tuple2!10604)

(assert (=> b!126485 (= res!104807 (or (not (= (size!2589 (_2!5582 lt!197604)) (size!2589 arr!227))) (not (= (_1!5582 lt!197604) (_2!5584 lt!197606)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4502 array!5721 (_ BitVec 32) (_ BitVec 32)) tuple2!10600)

(assert (=> b!126485 (= lt!197604 (readByteArrayLoopPure!0 (_1!5584 lt!197606) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> b!126485 (validate_offset_bits!1 ((_ sign_extend 32) (size!2589 (buf!2971 (_2!5583 lt!197603)))) ((_ sign_extend 32) (currentByte!5704 thiss!1614)) ((_ sign_extend 32) (currentBit!5699 thiss!1614)) lt!197609)))

(declare-fun lt!197608 () Unit!7781)

(assert (=> b!126485 (= lt!197608 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2971 (_2!5583 lt!197603)) lt!197609))))

(assert (=> b!126485 (= lt!197606 (reader!0 thiss!1614 (_2!5583 lt!197603)))))

(assert (= (and start!24970 res!104808) b!126480))

(assert (= (and b!126480 res!104811) b!126478))

(assert (= (and b!126478 res!104805) b!126483))

(assert (= (and b!126483 res!104812) b!126482))

(assert (= (and b!126482 res!104810) b!126485))

(assert (= (and b!126485 (not res!104807)) b!126477))

(assert (= (and b!126478 (not res!104806)) b!126479))

(assert (= (and b!126479 (not res!104809)) b!126484))

(assert (= start!24970 b!126481))

(declare-fun m!191973 () Bool)

(assert (=> start!24970 m!191973))

(declare-fun m!191975 () Bool)

(assert (=> start!24970 m!191975))

(declare-fun m!191977 () Bool)

(assert (=> b!126483 m!191977))

(declare-fun m!191979 () Bool)

(assert (=> b!126483 m!191979))

(declare-fun m!191981 () Bool)

(assert (=> b!126479 m!191981))

(declare-fun m!191983 () Bool)

(assert (=> b!126481 m!191983))

(declare-fun m!191985 () Bool)

(assert (=> b!126485 m!191985))

(declare-fun m!191987 () Bool)

(assert (=> b!126485 m!191987))

(declare-fun m!191989 () Bool)

(assert (=> b!126485 m!191989))

(declare-fun m!191991 () Bool)

(assert (=> b!126485 m!191991))

(assert (=> b!126478 m!191977))

(assert (=> b!126478 m!191979))

(declare-fun m!191993 () Bool)

(assert (=> b!126478 m!191993))

(assert (=> b!126482 m!191981))

(declare-fun m!191995 () Bool)

(assert (=> b!126477 m!191995))

(declare-fun m!191997 () Bool)

(assert (=> b!126484 m!191997))

(declare-fun m!191999 () Bool)

(assert (=> b!126484 m!191999))

(assert (=> b!126484 m!191991))

(declare-fun m!192001 () Bool)

(assert (=> b!126480 m!192001))

(push 1)

(assert (not b!126484))

(assert (not b!126483))

(assert (not b!126479))

(assert (not b!126482))

(assert (not start!24970))

(assert (not b!126481))

(assert (not b!126477))

(assert (not b!126478))

(assert (not b!126480))

(assert (not b!126485))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

