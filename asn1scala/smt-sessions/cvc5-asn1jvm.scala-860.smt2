; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24948 () Bool)

(assert start!24948)

(declare-fun b!126180 () Bool)

(declare-fun e!83100 () Bool)

(declare-datatypes ((array!5699 0))(
  ( (array!5700 (arr!3183 (Array (_ BitVec 32) (_ BitVec 8))) (size!2578 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4480 0))(
  ( (BitStream!4481 (buf!2960 array!5699) (currentByte!5693 (_ BitVec 32)) (currentBit!5688 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4480)

(declare-fun array_inv!2367 (array!5699) Bool)

(assert (=> b!126180 (= e!83100 (array_inv!2367 (buf!2960 thiss!1614)))))

(declare-fun b!126181 () Bool)

(declare-fun res!104547 () Bool)

(declare-fun e!83102 () Bool)

(assert (=> b!126181 (=> res!104547 e!83102)))

(declare-datatypes ((Unit!7759 0))(
  ( (Unit!7760) )
))
(declare-datatypes ((tuple2!10534 0))(
  ( (tuple2!10535 (_1!5549 Unit!7759) (_2!5549 BitStream!4480)) )
))
(declare-fun lt!197401 () tuple2!10534)

(declare-fun isPrefixOf!0 (BitStream!4480 BitStream!4480) Bool)

(assert (=> b!126181 (= res!104547 (not (isPrefixOf!0 thiss!1614 (_2!5549 lt!197401))))))

(declare-fun b!126182 () Bool)

(declare-fun res!104544 () Bool)

(declare-fun e!83097 () Bool)

(assert (=> b!126182 (=> (not res!104544) (not e!83097))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!126182 (= res!104544 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2578 (buf!2960 thiss!1614))) ((_ sign_extend 32) (currentByte!5693 thiss!1614)) ((_ sign_extend 32) (currentBit!5688 thiss!1614)) noOfBytes!1))))

(declare-fun b!126184 () Bool)

(assert (=> b!126184 (= e!83097 (not e!83102))))

(declare-fun res!104541 () Bool)

(assert (=> b!126184 (=> res!104541 e!83102)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!126184 (= res!104541 (not (= (bitIndex!0 (size!2578 (buf!2960 (_2!5549 lt!197401))) (currentByte!5693 (_2!5549 lt!197401)) (currentBit!5688 (_2!5549 lt!197401))) (bvadd (bitIndex!0 (size!2578 (buf!2960 thiss!1614)) (currentByte!5693 thiss!1614) (currentBit!5688 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(declare-fun e!83096 () Bool)

(assert (=> b!126184 e!83096))

(declare-fun res!104546 () Bool)

(assert (=> b!126184 (=> (not res!104546) (not e!83096))))

(assert (=> b!126184 (= res!104546 (= (size!2578 (buf!2960 thiss!1614)) (size!2578 (buf!2960 (_2!5549 lt!197401)))))))

(declare-fun arr!227 () array!5699)

(declare-fun appendByteArrayLoop!0 (BitStream!4480 array!5699 (_ BitVec 32) (_ BitVec 32)) tuple2!10534)

(assert (=> b!126184 (= lt!197401 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!126185 () Bool)

(declare-fun res!104548 () Bool)

(declare-fun e!83099 () Bool)

(assert (=> b!126185 (=> (not res!104548) (not e!83099))))

(assert (=> b!126185 (= res!104548 (isPrefixOf!0 thiss!1614 (_2!5549 lt!197401)))))

(declare-fun b!126186 () Bool)

(assert (=> b!126186 (= e!83102 true)))

(declare-datatypes ((tuple2!10536 0))(
  ( (tuple2!10537 (_1!5550 BitStream!4480) (_2!5550 BitStream!4480)) )
))
(declare-fun lt!197397 () tuple2!10536)

(declare-fun reader!0 (BitStream!4480 BitStream!4480) tuple2!10536)

(assert (=> b!126186 (= lt!197397 (reader!0 thiss!1614 (_2!5549 lt!197401)))))

(declare-fun b!126183 () Bool)

(assert (=> b!126183 (= e!83096 e!83099)))

(declare-fun res!104543 () Bool)

(assert (=> b!126183 (=> (not res!104543) (not e!83099))))

(declare-fun lt!197402 () (_ BitVec 64))

(assert (=> b!126183 (= res!104543 (= (bitIndex!0 (size!2578 (buf!2960 (_2!5549 lt!197401))) (currentByte!5693 (_2!5549 lt!197401)) (currentBit!5688 (_2!5549 lt!197401))) (bvadd (bitIndex!0 (size!2578 (buf!2960 thiss!1614)) (currentByte!5693 thiss!1614) (currentBit!5688 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!197402))))))

(assert (=> b!126183 (= lt!197402 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun res!104542 () Bool)

(assert (=> start!24948 (=> (not res!104542) (not e!83097))))

(assert (=> start!24948 (= res!104542 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2578 arr!227))))))

(assert (=> start!24948 e!83097))

(assert (=> start!24948 true))

(assert (=> start!24948 (array_inv!2367 arr!227)))

(declare-fun inv!12 (BitStream!4480) Bool)

(assert (=> start!24948 (and (inv!12 thiss!1614) e!83100)))

(declare-datatypes ((tuple2!10538 0))(
  ( (tuple2!10539 (_1!5551 BitStream!4480) (_2!5551 array!5699)) )
))
(declare-fun lt!197398 () tuple2!10538)

(declare-fun b!126187 () Bool)

(declare-fun e!83095 () Bool)

(declare-fun arrayRangesEq!65 (array!5699 array!5699 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!126187 (= e!83095 (not (arrayRangesEq!65 arr!227 (_2!5551 lt!197398) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!126188 () Bool)

(assert (=> b!126188 (= e!83099 (not e!83095))))

(declare-fun res!104545 () Bool)

(assert (=> b!126188 (=> res!104545 e!83095)))

(declare-fun lt!197399 () tuple2!10536)

(assert (=> b!126188 (= res!104545 (or (not (= (size!2578 (_2!5551 lt!197398)) (size!2578 arr!227))) (not (= (_1!5551 lt!197398) (_2!5550 lt!197399)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4480 array!5699 (_ BitVec 32) (_ BitVec 32)) tuple2!10538)

(assert (=> b!126188 (= lt!197398 (readByteArrayLoopPure!0 (_1!5550 lt!197399) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!126188 (validate_offset_bits!1 ((_ sign_extend 32) (size!2578 (buf!2960 (_2!5549 lt!197401)))) ((_ sign_extend 32) (currentByte!5693 thiss!1614)) ((_ sign_extend 32) (currentBit!5688 thiss!1614)) lt!197402)))

(declare-fun lt!197400 () Unit!7759)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4480 array!5699 (_ BitVec 64)) Unit!7759)

(assert (=> b!126188 (= lt!197400 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2960 (_2!5549 lt!197401)) lt!197402))))

(assert (=> b!126188 (= lt!197399 (reader!0 thiss!1614 (_2!5549 lt!197401)))))

(assert (= (and start!24948 res!104542) b!126182))

(assert (= (and b!126182 res!104544) b!126184))

(assert (= (and b!126184 res!104546) b!126183))

(assert (= (and b!126183 res!104543) b!126185))

(assert (= (and b!126185 res!104548) b!126188))

(assert (= (and b!126188 (not res!104545)) b!126187))

(assert (= (and b!126184 (not res!104541)) b!126181))

(assert (= (and b!126181 (not res!104547)) b!126186))

(assert (= start!24948 b!126180))

(declare-fun m!191679 () Bool)

(assert (=> b!126183 m!191679))

(declare-fun m!191681 () Bool)

(assert (=> b!126183 m!191681))

(declare-fun m!191683 () Bool)

(assert (=> b!126186 m!191683))

(declare-fun m!191685 () Bool)

(assert (=> b!126187 m!191685))

(declare-fun m!191687 () Bool)

(assert (=> b!126188 m!191687))

(declare-fun m!191689 () Bool)

(assert (=> b!126188 m!191689))

(declare-fun m!191691 () Bool)

(assert (=> b!126188 m!191691))

(assert (=> b!126188 m!191683))

(declare-fun m!191693 () Bool)

(assert (=> b!126182 m!191693))

(declare-fun m!191695 () Bool)

(assert (=> b!126185 m!191695))

(assert (=> b!126184 m!191679))

(assert (=> b!126184 m!191681))

(declare-fun m!191697 () Bool)

(assert (=> b!126184 m!191697))

(declare-fun m!191699 () Bool)

(assert (=> b!126180 m!191699))

(declare-fun m!191701 () Bool)

(assert (=> start!24948 m!191701))

(declare-fun m!191703 () Bool)

(assert (=> start!24948 m!191703))

(assert (=> b!126181 m!191695))

(push 1)

(assert (not b!126181))

(assert (not b!126188))

(assert (not start!24948))

(assert (not b!126182))

(assert (not b!126186))

(assert (not b!126185))

(assert (not b!126183))

(assert (not b!126184))

(assert (not b!126187))

(assert (not b!126180))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

