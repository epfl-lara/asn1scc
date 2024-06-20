; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25072 () Bool)

(assert start!25072)

(declare-fun b!127052 () Bool)

(declare-fun e!83841 () Bool)

(declare-datatypes ((array!5760 0))(
  ( (array!5761 (arr!3218 (Array (_ BitVec 32) (_ BitVec 8))) (size!2607 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4538 0))(
  ( (BitStream!4539 (buf!2992 array!5760) (currentByte!5731 (_ BitVec 32)) (currentBit!5726 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4538)

(declare-fun array_inv!2396 (array!5760) Bool)

(assert (=> b!127052 (= e!83841 (array_inv!2396 (buf!2992 thiss!1614)))))

(declare-fun b!127053 () Bool)

(declare-fun e!83840 () Bool)

(declare-fun e!83844 () Bool)

(assert (=> b!127053 (= e!83840 (not e!83844))))

(declare-fun res!105310 () Bool)

(assert (=> b!127053 (=> res!105310 e!83844)))

(declare-datatypes ((tuple2!10690 0))(
  ( (tuple2!10691 (_1!5630 BitStream!4538) (_2!5630 array!5760)) )
))
(declare-fun lt!198296 () tuple2!10690)

(declare-fun arr!227 () array!5760)

(declare-datatypes ((tuple2!10692 0))(
  ( (tuple2!10693 (_1!5631 BitStream!4538) (_2!5631 BitStream!4538)) )
))
(declare-fun lt!198293 () tuple2!10692)

(assert (=> b!127053 (= res!105310 (or (not (= (size!2607 (_2!5630 lt!198296)) (size!2607 arr!227))) (not (= (_1!5630 lt!198296) (_2!5631 lt!198293)))))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!4538 array!5760 (_ BitVec 32) (_ BitVec 32)) tuple2!10690)

(assert (=> b!127053 (= lt!198296 (readByteArrayLoopPure!0 (_1!5631 lt!198293) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-datatypes ((Unit!7814 0))(
  ( (Unit!7815) )
))
(declare-datatypes ((tuple2!10694 0))(
  ( (tuple2!10695 (_1!5632 Unit!7814) (_2!5632 BitStream!4538)) )
))
(declare-fun lt!198291 () tuple2!10694)

(declare-fun lt!198292 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!127053 (validate_offset_bits!1 ((_ sign_extend 32) (size!2607 (buf!2992 (_2!5632 lt!198291)))) ((_ sign_extend 32) (currentByte!5731 thiss!1614)) ((_ sign_extend 32) (currentBit!5726 thiss!1614)) lt!198292)))

(declare-fun lt!198295 () Unit!7814)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4538 array!5760 (_ BitVec 64)) Unit!7814)

(assert (=> b!127053 (= lt!198295 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2992 (_2!5632 lt!198291)) lt!198292))))

(declare-fun reader!0 (BitStream!4538 BitStream!4538) tuple2!10692)

(assert (=> b!127053 (= lt!198293 (reader!0 thiss!1614 (_2!5632 lt!198291)))))

(declare-fun b!127054 () Bool)

(declare-fun e!83842 () Bool)

(assert (=> b!127054 (= e!83842 (not (or (= ((_ sign_extend 32) noOfBytes!1) #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1)) ((_ sign_extend 32) noOfBytes!1))))))))

(declare-fun lt!198294 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!127054 (= lt!198294 (bitIndex!0 (size!2607 (buf!2992 thiss!1614)) (currentByte!5731 thiss!1614) (currentBit!5726 thiss!1614)))))

(declare-fun e!83846 () Bool)

(assert (=> b!127054 e!83846))

(declare-fun res!105308 () Bool)

(assert (=> b!127054 (=> (not res!105308) (not e!83846))))

(assert (=> b!127054 (= res!105308 (= (size!2607 (buf!2992 thiss!1614)) (size!2607 (buf!2992 (_2!5632 lt!198291)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4538 array!5760 (_ BitVec 32) (_ BitVec 32)) tuple2!10694)

(assert (=> b!127054 (= lt!198291 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun res!105312 () Bool)

(assert (=> start!25072 (=> (not res!105312) (not e!83842))))

(assert (=> start!25072 (= res!105312 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2607 arr!227))))))

(assert (=> start!25072 e!83842))

(assert (=> start!25072 true))

(assert (=> start!25072 (array_inv!2396 arr!227)))

(declare-fun inv!12 (BitStream!4538) Bool)

(assert (=> start!25072 (and (inv!12 thiss!1614) e!83841)))

(declare-fun b!127055 () Bool)

(declare-fun res!105311 () Bool)

(assert (=> b!127055 (=> (not res!105311) (not e!83842))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!127055 (= res!105311 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2607 (buf!2992 thiss!1614))) ((_ sign_extend 32) (currentByte!5731 thiss!1614)) ((_ sign_extend 32) (currentBit!5726 thiss!1614)) noOfBytes!1))))

(declare-fun b!127056 () Bool)

(assert (=> b!127056 (= e!83846 e!83840)))

(declare-fun res!105313 () Bool)

(assert (=> b!127056 (=> (not res!105313) (not e!83840))))

(assert (=> b!127056 (= res!105313 (= (bitIndex!0 (size!2607 (buf!2992 (_2!5632 lt!198291))) (currentByte!5731 (_2!5632 lt!198291)) (currentBit!5726 (_2!5632 lt!198291))) (bvadd (bitIndex!0 (size!2607 (buf!2992 thiss!1614)) (currentByte!5731 thiss!1614) (currentBit!5726 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!198292))))))

(assert (=> b!127056 (= lt!198292 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!127057 () Bool)

(declare-fun res!105309 () Bool)

(assert (=> b!127057 (=> (not res!105309) (not e!83840))))

(declare-fun isPrefixOf!0 (BitStream!4538 BitStream!4538) Bool)

(assert (=> b!127057 (= res!105309 (isPrefixOf!0 thiss!1614 (_2!5632 lt!198291)))))

(declare-fun b!127058 () Bool)

(declare-fun arrayRangesEq!91 (array!5760 array!5760 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!127058 (= e!83844 (not (arrayRangesEq!91 arr!227 (_2!5630 lt!198296) #b00000000000000000000000000000000 noOfBytes!1)))))

(assert (= (and start!25072 res!105312) b!127055))

(assert (= (and b!127055 res!105311) b!127054))

(assert (= (and b!127054 res!105308) b!127056))

(assert (= (and b!127056 res!105313) b!127057))

(assert (= (and b!127057 res!105309) b!127053))

(assert (= (and b!127053 (not res!105310)) b!127058))

(assert (= start!25072 b!127052))

(declare-fun m!192685 () Bool)

(assert (=> b!127053 m!192685))

(declare-fun m!192687 () Bool)

(assert (=> b!127053 m!192687))

(declare-fun m!192689 () Bool)

(assert (=> b!127053 m!192689))

(declare-fun m!192691 () Bool)

(assert (=> b!127053 m!192691))

(declare-fun m!192693 () Bool)

(assert (=> b!127057 m!192693))

(declare-fun m!192695 () Bool)

(assert (=> b!127052 m!192695))

(declare-fun m!192697 () Bool)

(assert (=> b!127054 m!192697))

(declare-fun m!192699 () Bool)

(assert (=> b!127054 m!192699))

(declare-fun m!192701 () Bool)

(assert (=> start!25072 m!192701))

(declare-fun m!192703 () Bool)

(assert (=> start!25072 m!192703))

(declare-fun m!192705 () Bool)

(assert (=> b!127055 m!192705))

(declare-fun m!192707 () Bool)

(assert (=> b!127056 m!192707))

(assert (=> b!127056 m!192697))

(declare-fun m!192709 () Bool)

(assert (=> b!127058 m!192709))

(push 1)

(assert (not b!127057))

(assert (not b!127053))

(assert (not start!25072))

(assert (not b!127058))

(assert (not b!127056))

(assert (not b!127054))

(assert (not b!127055))

(assert (not b!127052))

(check-sat)

(pop 1)

(push 1)

(check-sat)

