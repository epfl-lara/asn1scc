; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24946 () Bool)

(assert start!24946)

(declare-fun res!104523 () Bool)

(declare-fun e!83075 () Bool)

(assert (=> start!24946 (=> (not res!104523) (not e!83075))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!5697 0))(
  ( (array!5698 (arr!3182 (Array (_ BitVec 32) (_ BitVec 8))) (size!2577 (_ BitVec 32))) )
))
(declare-fun arr!227 () array!5697)

(assert (=> start!24946 (= res!104523 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2577 arr!227))))))

(assert (=> start!24946 e!83075))

(assert (=> start!24946 true))

(declare-fun array_inv!2366 (array!5697) Bool)

(assert (=> start!24946 (array_inv!2366 arr!227)))

(declare-datatypes ((BitStream!4478 0))(
  ( (BitStream!4479 (buf!2959 array!5697) (currentByte!5692 (_ BitVec 32)) (currentBit!5687 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4478)

(declare-fun e!83076 () Bool)

(declare-fun inv!12 (BitStream!4478) Bool)

(assert (=> start!24946 (and (inv!12 thiss!1614) e!83076)))

(declare-fun b!126154 () Bool)

(declare-fun e!83074 () Bool)

(declare-fun e!83072 () Bool)

(assert (=> b!126154 (= e!83074 (not e!83072))))

(declare-fun res!104521 () Bool)

(assert (=> b!126154 (=> res!104521 e!83072)))

(declare-datatypes ((tuple2!10528 0))(
  ( (tuple2!10529 (_1!5546 BitStream!4478) (_2!5546 BitStream!4478)) )
))
(declare-fun lt!197382 () tuple2!10528)

(declare-datatypes ((tuple2!10530 0))(
  ( (tuple2!10531 (_1!5547 BitStream!4478) (_2!5547 array!5697)) )
))
(declare-fun lt!197383 () tuple2!10530)

(assert (=> b!126154 (= res!104521 (or (not (= (size!2577 (_2!5547 lt!197383)) (size!2577 arr!227))) (not (= (_1!5547 lt!197383) (_2!5546 lt!197382)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4478 array!5697 (_ BitVec 32) (_ BitVec 32)) tuple2!10530)

(assert (=> b!126154 (= lt!197383 (readByteArrayLoopPure!0 (_1!5546 lt!197382) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-datatypes ((Unit!7757 0))(
  ( (Unit!7758) )
))
(declare-datatypes ((tuple2!10532 0))(
  ( (tuple2!10533 (_1!5548 Unit!7757) (_2!5548 BitStream!4478)) )
))
(declare-fun lt!197384 () tuple2!10532)

(declare-fun lt!197381 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!126154 (validate_offset_bits!1 ((_ sign_extend 32) (size!2577 (buf!2959 (_2!5548 lt!197384)))) ((_ sign_extend 32) (currentByte!5692 thiss!1614)) ((_ sign_extend 32) (currentBit!5687 thiss!1614)) lt!197381)))

(declare-fun lt!197379 () Unit!7757)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4478 array!5697 (_ BitVec 64)) Unit!7757)

(assert (=> b!126154 (= lt!197379 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2959 (_2!5548 lt!197384)) lt!197381))))

(declare-fun reader!0 (BitStream!4478 BitStream!4478) tuple2!10528)

(assert (=> b!126154 (= lt!197382 (reader!0 thiss!1614 (_2!5548 lt!197384)))))

(declare-fun b!126155 () Bool)

(declare-fun res!104518 () Bool)

(assert (=> b!126155 (=> (not res!104518) (not e!83075))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!126155 (= res!104518 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2577 (buf!2959 thiss!1614))) ((_ sign_extend 32) (currentByte!5692 thiss!1614)) ((_ sign_extend 32) (currentBit!5687 thiss!1614)) noOfBytes!1))))

(declare-fun b!126156 () Bool)

(declare-fun res!104522 () Bool)

(assert (=> b!126156 (=> (not res!104522) (not e!83074))))

(declare-fun isPrefixOf!0 (BitStream!4478 BitStream!4478) Bool)

(assert (=> b!126156 (= res!104522 (isPrefixOf!0 thiss!1614 (_2!5548 lt!197384)))))

(declare-fun b!126157 () Bool)

(assert (=> b!126157 (= e!83076 (array_inv!2366 (buf!2959 thiss!1614)))))

(declare-fun b!126158 () Bool)

(declare-fun e!83071 () Bool)

(assert (=> b!126158 (= e!83071 e!83074)))

(declare-fun res!104524 () Bool)

(assert (=> b!126158 (=> (not res!104524) (not e!83074))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!126158 (= res!104524 (= (bitIndex!0 (size!2577 (buf!2959 (_2!5548 lt!197384))) (currentByte!5692 (_2!5548 lt!197384)) (currentBit!5687 (_2!5548 lt!197384))) (bvadd (bitIndex!0 (size!2577 (buf!2959 thiss!1614)) (currentByte!5692 thiss!1614) (currentBit!5687 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!197381))))))

(assert (=> b!126158 (= lt!197381 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!126159 () Bool)

(declare-fun arrayRangesEq!64 (array!5697 array!5697 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!126159 (= e!83072 (not (arrayRangesEq!64 arr!227 (_2!5547 lt!197383) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!126160 () Bool)

(declare-fun e!83078 () Bool)

(assert (=> b!126160 (= e!83078 true)))

(declare-fun lt!197380 () Bool)

(assert (=> b!126160 (= lt!197380 (isPrefixOf!0 thiss!1614 (_2!5548 lt!197384)))))

(declare-fun b!126161 () Bool)

(assert (=> b!126161 (= e!83075 (not e!83078))))

(declare-fun res!104519 () Bool)

(assert (=> b!126161 (=> res!104519 e!83078)))

(assert (=> b!126161 (= res!104519 (not (= (bitIndex!0 (size!2577 (buf!2959 (_2!5548 lt!197384))) (currentByte!5692 (_2!5548 lt!197384)) (currentBit!5687 (_2!5548 lt!197384))) (bvadd (bitIndex!0 (size!2577 (buf!2959 thiss!1614)) (currentByte!5692 thiss!1614) (currentBit!5687 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(assert (=> b!126161 e!83071))

(declare-fun res!104520 () Bool)

(assert (=> b!126161 (=> (not res!104520) (not e!83071))))

(assert (=> b!126161 (= res!104520 (= (size!2577 (buf!2959 thiss!1614)) (size!2577 (buf!2959 (_2!5548 lt!197384)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4478 array!5697 (_ BitVec 32) (_ BitVec 32)) tuple2!10532)

(assert (=> b!126161 (= lt!197384 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (= (and start!24946 res!104523) b!126155))

(assert (= (and b!126155 res!104518) b!126161))

(assert (= (and b!126161 res!104520) b!126158))

(assert (= (and b!126158 res!104524) b!126156))

(assert (= (and b!126156 res!104522) b!126154))

(assert (= (and b!126154 (not res!104521)) b!126159))

(assert (= (and b!126161 (not res!104519)) b!126160))

(assert (= start!24946 b!126157))

(declare-fun m!191653 () Bool)

(assert (=> b!126160 m!191653))

(declare-fun m!191655 () Bool)

(assert (=> b!126161 m!191655))

(declare-fun m!191657 () Bool)

(assert (=> b!126161 m!191657))

(declare-fun m!191659 () Bool)

(assert (=> b!126161 m!191659))

(declare-fun m!191661 () Bool)

(assert (=> b!126157 m!191661))

(declare-fun m!191663 () Bool)

(assert (=> b!126154 m!191663))

(declare-fun m!191665 () Bool)

(assert (=> b!126154 m!191665))

(declare-fun m!191667 () Bool)

(assert (=> b!126154 m!191667))

(declare-fun m!191669 () Bool)

(assert (=> b!126154 m!191669))

(assert (=> b!126158 m!191655))

(assert (=> b!126158 m!191657))

(declare-fun m!191671 () Bool)

(assert (=> start!24946 m!191671))

(declare-fun m!191673 () Bool)

(assert (=> start!24946 m!191673))

(assert (=> b!126156 m!191653))

(declare-fun m!191675 () Bool)

(assert (=> b!126159 m!191675))

(declare-fun m!191677 () Bool)

(assert (=> b!126155 m!191677))

(push 1)

(assert (not b!126160))

(assert (not b!126157))

(assert (not b!126161))

(assert (not b!126156))

(assert (not start!24946))

(assert (not b!126155))

(assert (not b!126154))

(assert (not b!126159))

(assert (not b!126158))

(check-sat)

