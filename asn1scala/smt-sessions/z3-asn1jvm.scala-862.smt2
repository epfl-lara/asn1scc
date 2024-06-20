; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24962 () Bool)

(assert start!24962)

(declare-fun b!126369 () Bool)

(declare-fun e!83263 () Bool)

(declare-fun e!83265 () Bool)

(assert (=> b!126369 (= e!83263 (not e!83265))))

(declare-fun res!104716 () Bool)

(assert (=> b!126369 (=> res!104716 e!83265)))

(declare-datatypes ((array!5713 0))(
  ( (array!5714 (arr!3190 (Array (_ BitVec 32) (_ BitVec 8))) (size!2585 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4494 0))(
  ( (BitStream!4495 (buf!2967 array!5713) (currentByte!5700 (_ BitVec 32)) (currentBit!5695 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10576 0))(
  ( (tuple2!10577 (_1!5570 BitStream!4494) (_2!5570 array!5713)) )
))
(declare-fun lt!197524 () tuple2!10576)

(declare-datatypes ((tuple2!10578 0))(
  ( (tuple2!10579 (_1!5571 BitStream!4494) (_2!5571 BitStream!4494)) )
))
(declare-fun lt!197525 () tuple2!10578)

(declare-fun arr!227 () array!5713)

(assert (=> b!126369 (= res!104716 (or (not (= (size!2585 (_2!5570 lt!197524)) (size!2585 arr!227))) (not (= (_1!5570 lt!197524) (_2!5571 lt!197525)))))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!4494 array!5713 (_ BitVec 32) (_ BitVec 32)) tuple2!10576)

(assert (=> b!126369 (= lt!197524 (readByteArrayLoopPure!0 (_1!5571 lt!197525) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-datatypes ((Unit!7773 0))(
  ( (Unit!7774) )
))
(declare-datatypes ((tuple2!10580 0))(
  ( (tuple2!10581 (_1!5572 Unit!7773) (_2!5572 BitStream!4494)) )
))
(declare-fun lt!197526 () tuple2!10580)

(declare-fun thiss!1614 () BitStream!4494)

(declare-fun lt!197523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!126369 (validate_offset_bits!1 ((_ sign_extend 32) (size!2585 (buf!2967 (_2!5572 lt!197526)))) ((_ sign_extend 32) (currentByte!5700 thiss!1614)) ((_ sign_extend 32) (currentBit!5695 thiss!1614)) lt!197523)))

(declare-fun lt!197527 () Unit!7773)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4494 array!5713 (_ BitVec 64)) Unit!7773)

(assert (=> b!126369 (= lt!197527 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2967 (_2!5572 lt!197526)) lt!197523))))

(declare-fun reader!0 (BitStream!4494 BitStream!4494) tuple2!10578)

(assert (=> b!126369 (= lt!197525 (reader!0 thiss!1614 (_2!5572 lt!197526)))))

(declare-fun res!104710 () Bool)

(declare-fun e!83268 () Bool)

(assert (=> start!24962 (=> (not res!104710) (not e!83268))))

(assert (=> start!24962 (= res!104710 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2585 arr!227))))))

(assert (=> start!24962 e!83268))

(assert (=> start!24962 true))

(declare-fun array_inv!2374 (array!5713) Bool)

(assert (=> start!24962 (array_inv!2374 arr!227)))

(declare-fun e!83269 () Bool)

(declare-fun inv!12 (BitStream!4494) Bool)

(assert (=> start!24962 (and (inv!12 thiss!1614) e!83269)))

(declare-fun b!126370 () Bool)

(declare-fun arrayRangesEq!72 (array!5713 array!5713 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!126370 (= e!83265 (not (arrayRangesEq!72 arr!227 (_2!5570 lt!197524) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!126371 () Bool)

(declare-fun res!104712 () Bool)

(assert (=> b!126371 (=> (not res!104712) (not e!83268))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!126371 (= res!104712 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2585 (buf!2967 thiss!1614))) ((_ sign_extend 32) (currentByte!5700 thiss!1614)) ((_ sign_extend 32) (currentBit!5695 thiss!1614)) noOfBytes!1))))

(declare-fun b!126372 () Bool)

(declare-fun e!83267 () Bool)

(assert (=> b!126372 (= e!83267 e!83263)))

(declare-fun res!104711 () Bool)

(assert (=> b!126372 (=> (not res!104711) (not e!83263))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!126372 (= res!104711 (= (bitIndex!0 (size!2585 (buf!2967 (_2!5572 lt!197526))) (currentByte!5700 (_2!5572 lt!197526)) (currentBit!5695 (_2!5572 lt!197526))) (bvadd (bitIndex!0 (size!2585 (buf!2967 thiss!1614)) (currentByte!5700 thiss!1614) (currentBit!5695 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!197523))))))

(assert (=> b!126372 (= lt!197523 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!126373 () Bool)

(declare-fun res!104709 () Bool)

(declare-fun e!83266 () Bool)

(assert (=> b!126373 (=> res!104709 e!83266)))

(declare-fun isPrefixOf!0 (BitStream!4494 BitStream!4494) Bool)

(assert (=> b!126373 (= res!104709 (not (isPrefixOf!0 thiss!1614 (_2!5572 lt!197526))))))

(declare-fun b!126374 () Bool)

(assert (=> b!126374 (= e!83268 (not e!83266))))

(declare-fun res!104713 () Bool)

(assert (=> b!126374 (=> res!104713 e!83266)))

(assert (=> b!126374 (= res!104713 (not (= (bitIndex!0 (size!2585 (buf!2967 (_2!5572 lt!197526))) (currentByte!5700 (_2!5572 lt!197526)) (currentBit!5695 (_2!5572 lt!197526))) (bvadd (bitIndex!0 (size!2585 (buf!2967 thiss!1614)) (currentByte!5700 thiss!1614) (currentBit!5695 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(assert (=> b!126374 e!83267))

(declare-fun res!104714 () Bool)

(assert (=> b!126374 (=> (not res!104714) (not e!83267))))

(assert (=> b!126374 (= res!104714 (= (size!2585 (buf!2967 thiss!1614)) (size!2585 (buf!2967 (_2!5572 lt!197526)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4494 array!5713 (_ BitVec 32) (_ BitVec 32)) tuple2!10580)

(assert (=> b!126374 (= lt!197526 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!126375 () Bool)

(declare-fun res!104715 () Bool)

(assert (=> b!126375 (=> (not res!104715) (not e!83263))))

(assert (=> b!126375 (= res!104715 (isPrefixOf!0 thiss!1614 (_2!5572 lt!197526)))))

(declare-fun b!126376 () Bool)

(assert (=> b!126376 (= e!83266 true)))

(declare-fun lt!197528 () tuple2!10578)

(assert (=> b!126376 (= lt!197528 (reader!0 thiss!1614 (_2!5572 lt!197526)))))

(declare-fun b!126377 () Bool)

(assert (=> b!126377 (= e!83269 (array_inv!2374 (buf!2967 thiss!1614)))))

(assert (= (and start!24962 res!104710) b!126371))

(assert (= (and b!126371 res!104712) b!126374))

(assert (= (and b!126374 res!104714) b!126372))

(assert (= (and b!126372 res!104711) b!126375))

(assert (= (and b!126375 res!104715) b!126369))

(assert (= (and b!126369 (not res!104716)) b!126370))

(assert (= (and b!126374 (not res!104713)) b!126373))

(assert (= (and b!126373 (not res!104709)) b!126376))

(assert (= start!24962 b!126377))

(declare-fun m!191861 () Bool)

(assert (=> b!126372 m!191861))

(declare-fun m!191863 () Bool)

(assert (=> b!126372 m!191863))

(declare-fun m!191865 () Bool)

(assert (=> b!126375 m!191865))

(declare-fun m!191867 () Bool)

(assert (=> b!126370 m!191867))

(declare-fun m!191869 () Bool)

(assert (=> b!126369 m!191869))

(declare-fun m!191871 () Bool)

(assert (=> b!126369 m!191871))

(declare-fun m!191873 () Bool)

(assert (=> b!126369 m!191873))

(declare-fun m!191875 () Bool)

(assert (=> b!126369 m!191875))

(assert (=> b!126376 m!191875))

(declare-fun m!191877 () Bool)

(assert (=> b!126377 m!191877))

(assert (=> b!126373 m!191865))

(assert (=> b!126374 m!191861))

(assert (=> b!126374 m!191863))

(declare-fun m!191879 () Bool)

(assert (=> b!126374 m!191879))

(declare-fun m!191881 () Bool)

(assert (=> start!24962 m!191881))

(declare-fun m!191883 () Bool)

(assert (=> start!24962 m!191883))

(declare-fun m!191885 () Bool)

(assert (=> b!126371 m!191885))

(check-sat (not b!126374) (not b!126369) (not b!126376) (not start!24962) (not b!126377) (not b!126375) (not b!126373) (not b!126370) (not b!126371) (not b!126372))
