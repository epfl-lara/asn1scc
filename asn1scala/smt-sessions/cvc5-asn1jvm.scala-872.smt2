; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25152 () Bool)

(assert start!25152)

(declare-fun b!127380 () Bool)

(declare-fun e!84097 () Bool)

(declare-fun e!84098 () Bool)

(assert (=> b!127380 (= e!84097 (not e!84098))))

(declare-fun res!105601 () Bool)

(assert (=> b!127380 (=> res!105601 e!84098)))

(declare-datatypes ((array!5777 0))(
  ( (array!5778 (arr!3231 (Array (_ BitVec 32) (_ BitVec 8))) (size!2614 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4552 0))(
  ( (BitStream!4553 (buf!3002 array!5777) (currentByte!5747 (_ BitVec 32)) (currentBit!5742 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10732 0))(
  ( (tuple2!10733 (_1!5654 BitStream!4552) (_2!5654 array!5777)) )
))
(declare-fun lt!198789 () tuple2!10732)

(declare-datatypes ((tuple2!10734 0))(
  ( (tuple2!10735 (_1!5655 BitStream!4552) (_2!5655 BitStream!4552)) )
))
(declare-fun lt!198787 () tuple2!10734)

(declare-fun arr!227 () array!5777)

(assert (=> b!127380 (= res!105601 (or (not (= (size!2614 (_2!5654 lt!198789)) (size!2614 arr!227))) (not (= (_1!5654 lt!198789) (_2!5655 lt!198787)))))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!4552 array!5777 (_ BitVec 32) (_ BitVec 32)) tuple2!10732)

(assert (=> b!127380 (= lt!198789 (readByteArrayLoopPure!0 (_1!5655 lt!198787) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-datatypes ((Unit!7831 0))(
  ( (Unit!7832) )
))
(declare-datatypes ((tuple2!10736 0))(
  ( (tuple2!10737 (_1!5656 Unit!7831) (_2!5656 BitStream!4552)) )
))
(declare-fun lt!198791 () tuple2!10736)

(declare-fun thiss!1614 () BitStream!4552)

(declare-fun lt!198786 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!127380 (validate_offset_bits!1 ((_ sign_extend 32) (size!2614 (buf!3002 (_2!5656 lt!198791)))) ((_ sign_extend 32) (currentByte!5747 thiss!1614)) ((_ sign_extend 32) (currentBit!5742 thiss!1614)) lt!198786)))

(declare-fun lt!198788 () Unit!7831)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4552 array!5777 (_ BitVec 64)) Unit!7831)

(assert (=> b!127380 (= lt!198788 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!3002 (_2!5656 lt!198791)) lt!198786))))

(declare-fun reader!0 (BitStream!4552 BitStream!4552) tuple2!10734)

(assert (=> b!127380 (= lt!198787 (reader!0 thiss!1614 (_2!5656 lt!198791)))))

(declare-fun b!127381 () Bool)

(declare-fun e!84094 () Bool)

(declare-fun array_inv!2403 (array!5777) Bool)

(assert (=> b!127381 (= e!84094 (array_inv!2403 (buf!3002 thiss!1614)))))

(declare-fun b!127382 () Bool)

(declare-fun arrayRangesEq!98 (array!5777 array!5777 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!127382 (= e!84098 (not (arrayRangesEq!98 arr!227 (_2!5654 lt!198789) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!127383 () Bool)

(declare-fun e!84092 () Bool)

(declare-fun e!84093 () Bool)

(assert (=> b!127383 (= e!84092 (not e!84093))))

(declare-fun res!105604 () Bool)

(assert (=> b!127383 (=> res!105604 e!84093)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!127383 (= res!105604 (not (= (bitIndex!0 (size!2614 (buf!3002 (_2!5656 lt!198791))) (currentByte!5747 (_2!5656 lt!198791)) (currentBit!5742 (_2!5656 lt!198791))) (bvadd (bitIndex!0 (size!2614 (buf!3002 thiss!1614)) (currentByte!5747 thiss!1614) (currentBit!5742 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(declare-fun e!84096 () Bool)

(assert (=> b!127383 e!84096))

(declare-fun res!105600 () Bool)

(assert (=> b!127383 (=> (not res!105600) (not e!84096))))

(assert (=> b!127383 (= res!105600 (= (size!2614 (buf!3002 thiss!1614)) (size!2614 (buf!3002 (_2!5656 lt!198791)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4552 array!5777 (_ BitVec 32) (_ BitVec 32)) tuple2!10736)

(assert (=> b!127383 (= lt!198791 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!127384 () Bool)

(declare-fun res!105598 () Bool)

(assert (=> b!127384 (=> (not res!105598) (not e!84092))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!127384 (= res!105598 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2614 (buf!3002 thiss!1614))) ((_ sign_extend 32) (currentByte!5747 thiss!1614)) ((_ sign_extend 32) (currentBit!5742 thiss!1614)) noOfBytes!1))))

(declare-fun b!127385 () Bool)

(assert (=> b!127385 (= e!84093 (bvsge ((_ sign_extend 32) noOfBytes!1) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!198790 () tuple2!10734)

(assert (=> b!127385 (= lt!198790 (reader!0 thiss!1614 (_2!5656 lt!198791)))))

(declare-fun res!105599 () Bool)

(assert (=> start!25152 (=> (not res!105599) (not e!84092))))

(assert (=> start!25152 (= res!105599 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2614 arr!227))))))

(assert (=> start!25152 e!84092))

(assert (=> start!25152 true))

(assert (=> start!25152 (array_inv!2403 arr!227)))

(declare-fun inv!12 (BitStream!4552) Bool)

(assert (=> start!25152 (and (inv!12 thiss!1614) e!84094)))

(declare-fun b!127386 () Bool)

(assert (=> b!127386 (= e!84096 e!84097)))

(declare-fun res!105597 () Bool)

(assert (=> b!127386 (=> (not res!105597) (not e!84097))))

(assert (=> b!127386 (= res!105597 (= (bitIndex!0 (size!2614 (buf!3002 (_2!5656 lt!198791))) (currentByte!5747 (_2!5656 lt!198791)) (currentBit!5742 (_2!5656 lt!198791))) (bvadd (bitIndex!0 (size!2614 (buf!3002 thiss!1614)) (currentByte!5747 thiss!1614) (currentBit!5742 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!198786))))))

(assert (=> b!127386 (= lt!198786 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!127387 () Bool)

(declare-fun res!105603 () Bool)

(assert (=> b!127387 (=> res!105603 e!84093)))

(declare-fun isPrefixOf!0 (BitStream!4552 BitStream!4552) Bool)

(assert (=> b!127387 (= res!105603 (not (isPrefixOf!0 thiss!1614 (_2!5656 lt!198791))))))

(declare-fun b!127388 () Bool)

(declare-fun res!105602 () Bool)

(assert (=> b!127388 (=> (not res!105602) (not e!84097))))

(assert (=> b!127388 (= res!105602 (isPrefixOf!0 thiss!1614 (_2!5656 lt!198791)))))

(assert (= (and start!25152 res!105599) b!127384))

(assert (= (and b!127384 res!105598) b!127383))

(assert (= (and b!127383 res!105600) b!127386))

(assert (= (and b!127386 res!105597) b!127388))

(assert (= (and b!127388 res!105602) b!127380))

(assert (= (and b!127380 (not res!105601)) b!127382))

(assert (= (and b!127383 (not res!105604)) b!127387))

(assert (= (and b!127387 (not res!105603)) b!127385))

(assert (= start!25152 b!127381))

(declare-fun m!193077 () Bool)

(assert (=> start!25152 m!193077))

(declare-fun m!193079 () Bool)

(assert (=> start!25152 m!193079))

(declare-fun m!193081 () Bool)

(assert (=> b!127382 m!193081))

(declare-fun m!193083 () Bool)

(assert (=> b!127384 m!193083))

(declare-fun m!193085 () Bool)

(assert (=> b!127383 m!193085))

(declare-fun m!193087 () Bool)

(assert (=> b!127383 m!193087))

(declare-fun m!193089 () Bool)

(assert (=> b!127383 m!193089))

(declare-fun m!193091 () Bool)

(assert (=> b!127388 m!193091))

(assert (=> b!127387 m!193091))

(declare-fun m!193093 () Bool)

(assert (=> b!127385 m!193093))

(assert (=> b!127386 m!193085))

(assert (=> b!127386 m!193087))

(declare-fun m!193095 () Bool)

(assert (=> b!127380 m!193095))

(declare-fun m!193097 () Bool)

(assert (=> b!127380 m!193097))

(declare-fun m!193099 () Bool)

(assert (=> b!127380 m!193099))

(assert (=> b!127380 m!193093))

(declare-fun m!193101 () Bool)

(assert (=> b!127381 m!193101))

(push 1)

(assert (not b!127387))

(assert (not b!127380))

(assert (not b!127384))

(assert (not b!127388))

(assert (not b!127382))

(assert (not b!127386))

(assert (not start!25152))

(assert (not b!127383))

(assert (not b!127385))

(assert (not b!127381))

(check-sat)

(pop 1)

(push 1)

(check-sat)

