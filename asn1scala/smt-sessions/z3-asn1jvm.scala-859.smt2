; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24944 () Bool)

(assert start!24944)

(declare-fun b!126130 () Bool)

(declare-fun e!83047 () Bool)

(declare-fun e!83048 () Bool)

(assert (=> b!126130 (= e!83047 e!83048)))

(declare-fun res!104499 () Bool)

(assert (=> b!126130 (=> (not res!104499) (not e!83048))))

(declare-datatypes ((array!5695 0))(
  ( (array!5696 (arr!3181 (Array (_ BitVec 32) (_ BitVec 8))) (size!2576 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4476 0))(
  ( (BitStream!4477 (buf!2958 array!5695) (currentByte!5691 (_ BitVec 32)) (currentBit!5686 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4476)

(declare-fun lt!197361 () (_ BitVec 64))

(declare-datatypes ((Unit!7755 0))(
  ( (Unit!7756) )
))
(declare-datatypes ((tuple2!10522 0))(
  ( (tuple2!10523 (_1!5543 Unit!7755) (_2!5543 BitStream!4476)) )
))
(declare-fun lt!197363 () tuple2!10522)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!126130 (= res!104499 (= (bitIndex!0 (size!2576 (buf!2958 (_2!5543 lt!197363))) (currentByte!5691 (_2!5543 lt!197363)) (currentBit!5686 (_2!5543 lt!197363))) (bvadd (bitIndex!0 (size!2576 (buf!2958 thiss!1614)) (currentByte!5691 thiss!1614) (currentBit!5686 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!197361))))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(assert (=> b!126130 (= lt!197361 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!126131 () Bool)

(declare-fun e!83050 () Bool)

(assert (=> b!126131 (= e!83048 (not e!83050))))

(declare-fun res!104498 () Bool)

(assert (=> b!126131 (=> res!104498 e!83050)))

(declare-datatypes ((tuple2!10524 0))(
  ( (tuple2!10525 (_1!5544 BitStream!4476) (_2!5544 BitStream!4476)) )
))
(declare-fun lt!197365 () tuple2!10524)

(declare-datatypes ((tuple2!10526 0))(
  ( (tuple2!10527 (_1!5545 BitStream!4476) (_2!5545 array!5695)) )
))
(declare-fun lt!197364 () tuple2!10526)

(declare-fun arr!227 () array!5695)

(assert (=> b!126131 (= res!104498 (or (not (= (size!2576 (_2!5545 lt!197364)) (size!2576 arr!227))) (not (= (_1!5545 lt!197364) (_2!5544 lt!197365)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4476 array!5695 (_ BitVec 32) (_ BitVec 32)) tuple2!10526)

(assert (=> b!126131 (= lt!197364 (readByteArrayLoopPure!0 (_1!5544 lt!197365) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!126131 (validate_offset_bits!1 ((_ sign_extend 32) (size!2576 (buf!2958 (_2!5543 lt!197363)))) ((_ sign_extend 32) (currentByte!5691 thiss!1614)) ((_ sign_extend 32) (currentBit!5686 thiss!1614)) lt!197361)))

(declare-fun lt!197362 () Unit!7755)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4476 array!5695 (_ BitVec 64)) Unit!7755)

(assert (=> b!126131 (= lt!197362 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2958 (_2!5543 lt!197363)) lt!197361))))

(declare-fun reader!0 (BitStream!4476 BitStream!4476) tuple2!10524)

(assert (=> b!126131 (= lt!197365 (reader!0 thiss!1614 (_2!5543 lt!197363)))))

(declare-fun b!126132 () Bool)

(declare-fun arrayRangesEq!63 (array!5695 array!5695 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!126132 (= e!83050 (not (arrayRangesEq!63 arr!227 (_2!5545 lt!197364) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!126133 () Bool)

(declare-fun e!83051 () Bool)

(declare-fun array_inv!2365 (array!5695) Bool)

(assert (=> b!126133 (= e!83051 (array_inv!2365 (buf!2958 thiss!1614)))))

(declare-fun res!104502 () Bool)

(declare-fun e!83049 () Bool)

(assert (=> start!24944 (=> (not res!104502) (not e!83049))))

(assert (=> start!24944 (= res!104502 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2576 arr!227))))))

(assert (=> start!24944 e!83049))

(assert (=> start!24944 true))

(assert (=> start!24944 (array_inv!2365 arr!227)))

(declare-fun inv!12 (BitStream!4476) Bool)

(assert (=> start!24944 (and (inv!12 thiss!1614) e!83051)))

(declare-fun b!126134 () Bool)

(declare-fun res!104501 () Bool)

(assert (=> b!126134 (=> (not res!104501) (not e!83048))))

(declare-fun isPrefixOf!0 (BitStream!4476 BitStream!4476) Bool)

(assert (=> b!126134 (= res!104501 (isPrefixOf!0 thiss!1614 (_2!5543 lt!197363)))))

(declare-fun b!126135 () Bool)

(declare-fun res!104497 () Bool)

(assert (=> b!126135 (=> (not res!104497) (not e!83049))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!126135 (= res!104497 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2576 (buf!2958 thiss!1614))) ((_ sign_extend 32) (currentByte!5691 thiss!1614)) ((_ sign_extend 32) (currentBit!5686 thiss!1614)) noOfBytes!1))))

(declare-fun b!126136 () Bool)

(declare-fun e!83053 () Bool)

(assert (=> b!126136 (= e!83053 true)))

(declare-fun lt!197366 () Bool)

(assert (=> b!126136 (= lt!197366 (isPrefixOf!0 thiss!1614 (_2!5543 lt!197363)))))

(declare-fun b!126137 () Bool)

(assert (=> b!126137 (= e!83049 (not e!83053))))

(declare-fun res!104500 () Bool)

(assert (=> b!126137 (=> res!104500 e!83053)))

(assert (=> b!126137 (= res!104500 (not (= (bitIndex!0 (size!2576 (buf!2958 (_2!5543 lt!197363))) (currentByte!5691 (_2!5543 lt!197363)) (currentBit!5686 (_2!5543 lt!197363))) (bvadd (bitIndex!0 (size!2576 (buf!2958 thiss!1614)) (currentByte!5691 thiss!1614) (currentBit!5686 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(assert (=> b!126137 e!83047))

(declare-fun res!104503 () Bool)

(assert (=> b!126137 (=> (not res!104503) (not e!83047))))

(assert (=> b!126137 (= res!104503 (= (size!2576 (buf!2958 thiss!1614)) (size!2576 (buf!2958 (_2!5543 lt!197363)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4476 array!5695 (_ BitVec 32) (_ BitVec 32)) tuple2!10522)

(assert (=> b!126137 (= lt!197363 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (= (and start!24944 res!104502) b!126135))

(assert (= (and b!126135 res!104497) b!126137))

(assert (= (and b!126137 res!104503) b!126130))

(assert (= (and b!126130 res!104499) b!126134))

(assert (= (and b!126134 res!104501) b!126131))

(assert (= (and b!126131 (not res!104498)) b!126132))

(assert (= (and b!126137 (not res!104500)) b!126136))

(assert (= start!24944 b!126133))

(declare-fun m!191627 () Bool)

(assert (=> b!126137 m!191627))

(declare-fun m!191629 () Bool)

(assert (=> b!126137 m!191629))

(declare-fun m!191631 () Bool)

(assert (=> b!126137 m!191631))

(assert (=> b!126130 m!191627))

(assert (=> b!126130 m!191629))

(declare-fun m!191633 () Bool)

(assert (=> start!24944 m!191633))

(declare-fun m!191635 () Bool)

(assert (=> start!24944 m!191635))

(declare-fun m!191637 () Bool)

(assert (=> b!126135 m!191637))

(declare-fun m!191639 () Bool)

(assert (=> b!126131 m!191639))

(declare-fun m!191641 () Bool)

(assert (=> b!126131 m!191641))

(declare-fun m!191643 () Bool)

(assert (=> b!126131 m!191643))

(declare-fun m!191645 () Bool)

(assert (=> b!126131 m!191645))

(declare-fun m!191647 () Bool)

(assert (=> b!126136 m!191647))

(assert (=> b!126134 m!191647))

(declare-fun m!191649 () Bool)

(assert (=> b!126133 m!191649))

(declare-fun m!191651 () Bool)

(assert (=> b!126132 m!191651))

(check-sat (not b!126133) (not b!126135) (not b!126132) (not start!24944) (not b!126137) (not b!126130) (not b!126136) (not b!126131) (not b!126134))
