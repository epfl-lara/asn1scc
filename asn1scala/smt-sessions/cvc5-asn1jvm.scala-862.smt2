; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24960 () Bool)

(assert start!24960)

(declare-fun b!126342 () Bool)

(declare-fun e!83243 () Bool)

(assert (=> b!126342 (= e!83243 true)))

(declare-datatypes ((array!5711 0))(
  ( (array!5712 (arr!3189 (Array (_ BitVec 32) (_ BitVec 8))) (size!2584 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4492 0))(
  ( (BitStream!4493 (buf!2966 array!5711) (currentByte!5699 (_ BitVec 32)) (currentBit!5694 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10570 0))(
  ( (tuple2!10571 (_1!5567 BitStream!4492) (_2!5567 BitStream!4492)) )
))
(declare-fun lt!197505 () tuple2!10570)

(declare-fun thiss!1614 () BitStream!4492)

(declare-datatypes ((Unit!7771 0))(
  ( (Unit!7772) )
))
(declare-datatypes ((tuple2!10572 0))(
  ( (tuple2!10573 (_1!5568 Unit!7771) (_2!5568 BitStream!4492)) )
))
(declare-fun lt!197509 () tuple2!10572)

(declare-fun reader!0 (BitStream!4492 BitStream!4492) tuple2!10570)

(assert (=> b!126342 (= lt!197505 (reader!0 thiss!1614 (_2!5568 lt!197509)))))

(declare-fun b!126343 () Bool)

(declare-datatypes ((tuple2!10574 0))(
  ( (tuple2!10575 (_1!5569 BitStream!4492) (_2!5569 array!5711)) )
))
(declare-fun lt!197510 () tuple2!10574)

(declare-fun arr!227 () array!5711)

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-fun e!83244 () Bool)

(declare-fun arrayRangesEq!71 (array!5711 array!5711 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!126343 (= e!83244 (not (arrayRangesEq!71 arr!227 (_2!5569 lt!197510) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!126344 () Bool)

(declare-fun e!83242 () Bool)

(assert (=> b!126344 (= e!83242 (not e!83244))))

(declare-fun res!104690 () Bool)

(assert (=> b!126344 (=> res!104690 e!83244)))

(declare-fun lt!197508 () tuple2!10570)

(assert (=> b!126344 (= res!104690 (or (not (= (size!2584 (_2!5569 lt!197510)) (size!2584 arr!227))) (not (= (_1!5569 lt!197510) (_2!5567 lt!197508)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4492 array!5711 (_ BitVec 32) (_ BitVec 32)) tuple2!10574)

(assert (=> b!126344 (= lt!197510 (readByteArrayLoopPure!0 (_1!5567 lt!197508) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun lt!197507 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!126344 (validate_offset_bits!1 ((_ sign_extend 32) (size!2584 (buf!2966 (_2!5568 lt!197509)))) ((_ sign_extend 32) (currentByte!5699 thiss!1614)) ((_ sign_extend 32) (currentBit!5694 thiss!1614)) lt!197507)))

(declare-fun lt!197506 () Unit!7771)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4492 array!5711 (_ BitVec 64)) Unit!7771)

(assert (=> b!126344 (= lt!197506 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2966 (_2!5568 lt!197509)) lt!197507))))

(assert (=> b!126344 (= lt!197508 (reader!0 thiss!1614 (_2!5568 lt!197509)))))

(declare-fun b!126345 () Bool)

(declare-fun res!104687 () Bool)

(declare-fun e!83246 () Bool)

(assert (=> b!126345 (=> (not res!104687) (not e!83246))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!126345 (= res!104687 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2584 (buf!2966 thiss!1614))) ((_ sign_extend 32) (currentByte!5699 thiss!1614)) ((_ sign_extend 32) (currentBit!5694 thiss!1614)) noOfBytes!1))))

(declare-fun b!126346 () Bool)

(assert (=> b!126346 (= e!83246 (not e!83243))))

(declare-fun res!104685 () Bool)

(assert (=> b!126346 (=> res!104685 e!83243)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!126346 (= res!104685 (not (= (bitIndex!0 (size!2584 (buf!2966 (_2!5568 lt!197509))) (currentByte!5699 (_2!5568 lt!197509)) (currentBit!5694 (_2!5568 lt!197509))) (bvadd (bitIndex!0 (size!2584 (buf!2966 thiss!1614)) (currentByte!5699 thiss!1614) (currentBit!5694 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(declare-fun e!83241 () Bool)

(assert (=> b!126346 e!83241))

(declare-fun res!104686 () Bool)

(assert (=> b!126346 (=> (not res!104686) (not e!83241))))

(assert (=> b!126346 (= res!104686 (= (size!2584 (buf!2966 thiss!1614)) (size!2584 (buf!2966 (_2!5568 lt!197509)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4492 array!5711 (_ BitVec 32) (_ BitVec 32)) tuple2!10572)

(assert (=> b!126346 (= lt!197509 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun res!104689 () Bool)

(assert (=> start!24960 (=> (not res!104689) (not e!83246))))

(assert (=> start!24960 (= res!104689 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2584 arr!227))))))

(assert (=> start!24960 e!83246))

(assert (=> start!24960 true))

(declare-fun array_inv!2373 (array!5711) Bool)

(assert (=> start!24960 (array_inv!2373 arr!227)))

(declare-fun e!83245 () Bool)

(declare-fun inv!12 (BitStream!4492) Bool)

(assert (=> start!24960 (and (inv!12 thiss!1614) e!83245)))

(declare-fun b!126347 () Bool)

(assert (=> b!126347 (= e!83241 e!83242)))

(declare-fun res!104692 () Bool)

(assert (=> b!126347 (=> (not res!104692) (not e!83242))))

(assert (=> b!126347 (= res!104692 (= (bitIndex!0 (size!2584 (buf!2966 (_2!5568 lt!197509))) (currentByte!5699 (_2!5568 lt!197509)) (currentBit!5694 (_2!5568 lt!197509))) (bvadd (bitIndex!0 (size!2584 (buf!2966 thiss!1614)) (currentByte!5699 thiss!1614) (currentBit!5694 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!197507))))))

(assert (=> b!126347 (= lt!197507 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!126348 () Bool)

(declare-fun res!104691 () Bool)

(assert (=> b!126348 (=> (not res!104691) (not e!83242))))

(declare-fun isPrefixOf!0 (BitStream!4492 BitStream!4492) Bool)

(assert (=> b!126348 (= res!104691 (isPrefixOf!0 thiss!1614 (_2!5568 lt!197509)))))

(declare-fun b!126349 () Bool)

(assert (=> b!126349 (= e!83245 (array_inv!2373 (buf!2966 thiss!1614)))))

(declare-fun b!126350 () Bool)

(declare-fun res!104688 () Bool)

(assert (=> b!126350 (=> res!104688 e!83243)))

(assert (=> b!126350 (= res!104688 (not (isPrefixOf!0 thiss!1614 (_2!5568 lt!197509))))))

(assert (= (and start!24960 res!104689) b!126345))

(assert (= (and b!126345 res!104687) b!126346))

(assert (= (and b!126346 res!104686) b!126347))

(assert (= (and b!126347 res!104692) b!126348))

(assert (= (and b!126348 res!104691) b!126344))

(assert (= (and b!126344 (not res!104690)) b!126343))

(assert (= (and b!126346 (not res!104685)) b!126350))

(assert (= (and b!126350 (not res!104688)) b!126342))

(assert (= start!24960 b!126349))

(declare-fun m!191835 () Bool)

(assert (=> b!126342 m!191835))

(declare-fun m!191837 () Bool)

(assert (=> b!126348 m!191837))

(assert (=> b!126350 m!191837))

(declare-fun m!191839 () Bool)

(assert (=> b!126347 m!191839))

(declare-fun m!191841 () Bool)

(assert (=> b!126347 m!191841))

(declare-fun m!191843 () Bool)

(assert (=> b!126349 m!191843))

(assert (=> b!126346 m!191839))

(assert (=> b!126346 m!191841))

(declare-fun m!191845 () Bool)

(assert (=> b!126346 m!191845))

(declare-fun m!191847 () Bool)

(assert (=> b!126344 m!191847))

(declare-fun m!191849 () Bool)

(assert (=> b!126344 m!191849))

(declare-fun m!191851 () Bool)

(assert (=> b!126344 m!191851))

(assert (=> b!126344 m!191835))

(declare-fun m!191853 () Bool)

(assert (=> start!24960 m!191853))

(declare-fun m!191855 () Bool)

(assert (=> start!24960 m!191855))

(declare-fun m!191857 () Bool)

(assert (=> b!126343 m!191857))

(declare-fun m!191859 () Bool)

(assert (=> b!126345 m!191859))

(push 1)

(assert (not start!24960))

(assert (not b!126348))

(assert (not b!126343))

(assert (not b!126342))

(assert (not b!126344))

(assert (not b!126347))

(assert (not b!126346))

(assert (not b!126350))

(assert (not b!126345))

(assert (not b!126349))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

