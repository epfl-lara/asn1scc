; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24966 () Bool)

(assert start!24966)

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-fun e!83318 () Bool)

(declare-datatypes ((array!5717 0))(
  ( (array!5718 (arr!3192 (Array (_ BitVec 32) (_ BitVec 8))) (size!2587 (_ BitVec 32))) )
))
(declare-fun arr!227 () array!5717)

(declare-fun b!126423 () Bool)

(declare-datatypes ((BitStream!4498 0))(
  ( (BitStream!4499 (buf!2969 array!5717) (currentByte!5702 (_ BitVec 32)) (currentBit!5697 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10588 0))(
  ( (tuple2!10589 (_1!5576 BitStream!4498) (_2!5576 array!5717)) )
))
(declare-fun lt!197561 () tuple2!10588)

(declare-fun arrayRangesEq!74 (array!5717 array!5717 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!126423 (= e!83318 (not (arrayRangesEq!74 arr!227 (_2!5576 lt!197561) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun res!104764 () Bool)

(declare-fun e!83313 () Bool)

(assert (=> start!24966 (=> (not res!104764) (not e!83313))))

(assert (=> start!24966 (= res!104764 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2587 arr!227))))))

(assert (=> start!24966 e!83313))

(assert (=> start!24966 true))

(declare-fun array_inv!2376 (array!5717) Bool)

(assert (=> start!24966 (array_inv!2376 arr!227)))

(declare-fun thiss!1614 () BitStream!4498)

(declare-fun e!83315 () Bool)

(declare-fun inv!12 (BitStream!4498) Bool)

(assert (=> start!24966 (and (inv!12 thiss!1614) e!83315)))

(declare-fun b!126424 () Bool)

(declare-fun res!104758 () Bool)

(declare-fun e!83312 () Bool)

(assert (=> b!126424 (=> (not res!104758) (not e!83312))))

(declare-datatypes ((Unit!7777 0))(
  ( (Unit!7778) )
))
(declare-datatypes ((tuple2!10590 0))(
  ( (tuple2!10591 (_1!5577 Unit!7777) (_2!5577 BitStream!4498)) )
))
(declare-fun lt!197563 () tuple2!10590)

(declare-fun isPrefixOf!0 (BitStream!4498 BitStream!4498) Bool)

(assert (=> b!126424 (= res!104758 (isPrefixOf!0 thiss!1614 (_2!5577 lt!197563)))))

(declare-fun b!126425 () Bool)

(declare-fun e!83314 () Bool)

(assert (=> b!126425 (= e!83314 e!83312)))

(declare-fun res!104762 () Bool)

(assert (=> b!126425 (=> (not res!104762) (not e!83312))))

(declare-fun lt!197566 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!126425 (= res!104762 (= (bitIndex!0 (size!2587 (buf!2969 (_2!5577 lt!197563))) (currentByte!5702 (_2!5577 lt!197563)) (currentBit!5697 (_2!5577 lt!197563))) (bvadd (bitIndex!0 (size!2587 (buf!2969 thiss!1614)) (currentByte!5702 thiss!1614) (currentBit!5697 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!197566))))))

(assert (=> b!126425 (= lt!197566 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!126426 () Bool)

(assert (=> b!126426 (= e!83315 (array_inv!2376 (buf!2969 thiss!1614)))))

(declare-fun b!126427 () Bool)

(declare-fun e!83311 () Bool)

(assert (=> b!126427 (= e!83313 (not e!83311))))

(declare-fun res!104761 () Bool)

(assert (=> b!126427 (=> res!104761 e!83311)))

(assert (=> b!126427 (= res!104761 (not (= (bitIndex!0 (size!2587 (buf!2969 (_2!5577 lt!197563))) (currentByte!5702 (_2!5577 lt!197563)) (currentBit!5697 (_2!5577 lt!197563))) (bvadd (bitIndex!0 (size!2587 (buf!2969 thiss!1614)) (currentByte!5702 thiss!1614) (currentBit!5697 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(assert (=> b!126427 e!83314))

(declare-fun res!104760 () Bool)

(assert (=> b!126427 (=> (not res!104760) (not e!83314))))

(assert (=> b!126427 (= res!104760 (= (size!2587 (buf!2969 thiss!1614)) (size!2587 (buf!2969 (_2!5577 lt!197563)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4498 array!5717 (_ BitVec 32) (_ BitVec 32)) tuple2!10590)

(assert (=> b!126427 (= lt!197563 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!126428 () Bool)

(assert (=> b!126428 (= e!83311 true)))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!126428 (validate_offset_bits!1 ((_ sign_extend 32) (size!2587 (buf!2969 (_2!5577 lt!197563)))) ((_ sign_extend 32) (currentByte!5702 thiss!1614)) ((_ sign_extend 32) (currentBit!5697 thiss!1614)) ((_ sign_extend 32) noOfBytes!1))))

(declare-fun lt!197564 () Unit!7777)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4498 array!5717 (_ BitVec 64)) Unit!7777)

(assert (=> b!126428 (= lt!197564 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2969 (_2!5577 lt!197563)) ((_ sign_extend 32) noOfBytes!1)))))

(declare-datatypes ((tuple2!10592 0))(
  ( (tuple2!10593 (_1!5578 BitStream!4498) (_2!5578 BitStream!4498)) )
))
(declare-fun lt!197562 () tuple2!10592)

(declare-fun reader!0 (BitStream!4498 BitStream!4498) tuple2!10592)

(assert (=> b!126428 (= lt!197562 (reader!0 thiss!1614 (_2!5577 lt!197563)))))

(declare-fun b!126429 () Bool)

(assert (=> b!126429 (= e!83312 (not e!83318))))

(declare-fun res!104763 () Bool)

(assert (=> b!126429 (=> res!104763 e!83318)))

(declare-fun lt!197565 () tuple2!10592)

(assert (=> b!126429 (= res!104763 (or (not (= (size!2587 (_2!5576 lt!197561)) (size!2587 arr!227))) (not (= (_1!5576 lt!197561) (_2!5578 lt!197565)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4498 array!5717 (_ BitVec 32) (_ BitVec 32)) tuple2!10588)

(assert (=> b!126429 (= lt!197561 (readByteArrayLoopPure!0 (_1!5578 lt!197565) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> b!126429 (validate_offset_bits!1 ((_ sign_extend 32) (size!2587 (buf!2969 (_2!5577 lt!197563)))) ((_ sign_extend 32) (currentByte!5702 thiss!1614)) ((_ sign_extend 32) (currentBit!5697 thiss!1614)) lt!197566)))

(declare-fun lt!197567 () Unit!7777)

(assert (=> b!126429 (= lt!197567 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2969 (_2!5577 lt!197563)) lt!197566))))

(assert (=> b!126429 (= lt!197565 (reader!0 thiss!1614 (_2!5577 lt!197563)))))

(declare-fun b!126430 () Bool)

(declare-fun res!104757 () Bool)

(assert (=> b!126430 (=> (not res!104757) (not e!83313))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!126430 (= res!104757 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2587 (buf!2969 thiss!1614))) ((_ sign_extend 32) (currentByte!5702 thiss!1614)) ((_ sign_extend 32) (currentBit!5697 thiss!1614)) noOfBytes!1))))

(declare-fun b!126431 () Bool)

(declare-fun res!104759 () Bool)

(assert (=> b!126431 (=> res!104759 e!83311)))

(assert (=> b!126431 (= res!104759 (not (isPrefixOf!0 thiss!1614 (_2!5577 lt!197563))))))

(assert (= (and start!24966 res!104764) b!126430))

(assert (= (and b!126430 res!104757) b!126427))

(assert (= (and b!126427 res!104760) b!126425))

(assert (= (and b!126425 res!104762) b!126424))

(assert (= (and b!126424 res!104758) b!126429))

(assert (= (and b!126429 (not res!104763)) b!126423))

(assert (= (and b!126427 (not res!104761)) b!126431))

(assert (= (and b!126431 (not res!104759)) b!126428))

(assert (= start!24966 b!126426))

(declare-fun m!191913 () Bool)

(assert (=> b!126424 m!191913))

(declare-fun m!191915 () Bool)

(assert (=> start!24966 m!191915))

(declare-fun m!191917 () Bool)

(assert (=> start!24966 m!191917))

(assert (=> b!126431 m!191913))

(declare-fun m!191919 () Bool)

(assert (=> b!126429 m!191919))

(declare-fun m!191921 () Bool)

(assert (=> b!126429 m!191921))

(declare-fun m!191923 () Bool)

(assert (=> b!126429 m!191923))

(declare-fun m!191925 () Bool)

(assert (=> b!126429 m!191925))

(declare-fun m!191927 () Bool)

(assert (=> b!126426 m!191927))

(declare-fun m!191929 () Bool)

(assert (=> b!126423 m!191929))

(declare-fun m!191931 () Bool)

(assert (=> b!126428 m!191931))

(declare-fun m!191933 () Bool)

(assert (=> b!126428 m!191933))

(assert (=> b!126428 m!191925))

(declare-fun m!191935 () Bool)

(assert (=> b!126427 m!191935))

(declare-fun m!191937 () Bool)

(assert (=> b!126427 m!191937))

(declare-fun m!191939 () Bool)

(assert (=> b!126427 m!191939))

(assert (=> b!126425 m!191935))

(assert (=> b!126425 m!191937))

(declare-fun m!191941 () Bool)

(assert (=> b!126430 m!191941))

(push 1)

(assert (not b!126430))

(assert (not b!126424))

(assert (not b!126425))

(assert (not b!126427))

(assert (not b!126423))

(assert (not b!126431))

(assert (not b!126426))

(assert (not start!24966))

(assert (not b!126429))

(assert (not b!126428))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

