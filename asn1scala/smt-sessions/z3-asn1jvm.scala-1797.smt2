; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48896 () Bool)

(assert start!48896)

(declare-fun res!193838 () Bool)

(declare-fun e!159138 () Bool)

(assert (=> start!48896 (=> (not res!193838) (not e!159138))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11865 0))(
  ( (array!11866 (arr!6185 (Array (_ BitVec 32) (_ BitVec 8))) (size!5198 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9492 0))(
  ( (BitStream!9493 (buf!5739 array!11865) (currentByte!10746 (_ BitVec 32)) (currentBit!10741 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9492)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9492)

(assert (=> start!48896 (= res!193838 (and (= (size!5198 (buf!5739 b1!101)) (size!5198 (buf!5739 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48896 e!159138))

(declare-fun e!159143 () Bool)

(declare-fun inv!12 (BitStream!9492) Bool)

(assert (=> start!48896 (and (inv!12 b1!101) e!159143)))

(declare-fun e!159142 () Bool)

(assert (=> start!48896 (and (inv!12 b2!99) e!159142)))

(assert (=> start!48896 true))

(declare-fun b!231416 () Bool)

(declare-fun array_inv!4939 (array!11865) Bool)

(assert (=> b!231416 (= e!159142 (array_inv!4939 (buf!5739 b2!99)))))

(declare-fun b!231417 () Bool)

(declare-fun res!193841 () Bool)

(declare-fun e!159141 () Bool)

(assert (=> b!231417 (=> (not res!193841) (not e!159141))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231417 (= res!193841 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5198 (buf!5739 b1!101))) ((_ sign_extend 32) (currentByte!10746 b1!101)) ((_ sign_extend 32) (currentBit!10741 b1!101)) bytes!19))))

(declare-fun b!231418 () Bool)

(assert (=> b!231418 (= e!159143 (array_inv!4939 (buf!5739 b1!101)))))

(declare-fun b!231419 () Bool)

(declare-fun res!193840 () Bool)

(assert (=> b!231419 (=> (not res!193840) (not e!159141))))

(declare-fun lt!368684 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231419 (= res!193840 (= lt!368684 (bvadd (bitIndex!0 (size!5198 (buf!5739 b1!101)) (currentByte!10746 b1!101) (currentBit!10741 b1!101)) bits!86)))))

(declare-fun b!231420 () Bool)

(declare-fun res!193839 () Bool)

(assert (=> b!231420 (=> (not res!193839) (not e!159141))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231420 (= res!193839 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5198 (buf!5739 b1!101))) ((_ sign_extend 32) (currentByte!10746 b1!101)) ((_ sign_extend 32) (currentBit!10741 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!368682 () (_ BitVec 64))

(declare-fun lt!368683 () (_ BitVec 64))

(declare-fun lt!368685 () (_ BitVec 64))

(declare-fun b!231421 () Bool)

(assert (=> b!231421 (= e!159141 (and (not (= lt!368682 (bvand lt!368683 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!368682 (bvand (bvsub lt!368685 lt!368683) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!231421 (= lt!368682 (bvand lt!368685 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!231421 (= lt!368683 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10746 b1!101))) ((_ sign_extend 32) (currentBit!10741 b1!101))))))

(assert (=> b!231421 (= lt!368685 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5198 (buf!5739 b1!101)))))))

(declare-fun b!231422 () Bool)

(assert (=> b!231422 (= e!159138 e!159141)))

(declare-fun res!193842 () Bool)

(assert (=> b!231422 (=> (not res!193842) (not e!159141))))

(assert (=> b!231422 (= res!193842 (and (bvsle bits!86 lt!368684) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!231422 (= lt!368684 (bitIndex!0 (size!5198 (buf!5739 b2!99)) (currentByte!10746 b2!99) (currentBit!10741 b2!99)))))

(assert (= (and start!48896 res!193838) b!231422))

(assert (= (and b!231422 res!193842) b!231417))

(assert (= (and b!231417 res!193841) b!231419))

(assert (= (and b!231419 res!193840) b!231420))

(assert (= (and b!231420 res!193839) b!231421))

(assert (= start!48896 b!231418))

(assert (= start!48896 b!231416))

(declare-fun m!354543 () Bool)

(assert (=> b!231417 m!354543))

(declare-fun m!354545 () Bool)

(assert (=> b!231422 m!354545))

(declare-fun m!354547 () Bool)

(assert (=> b!231416 m!354547))

(declare-fun m!354549 () Bool)

(assert (=> b!231418 m!354549))

(declare-fun m!354551 () Bool)

(assert (=> start!48896 m!354551))

(declare-fun m!354553 () Bool)

(assert (=> start!48896 m!354553))

(declare-fun m!354555 () Bool)

(assert (=> b!231420 m!354555))

(declare-fun m!354557 () Bool)

(assert (=> b!231419 m!354557))

(check-sat (not b!231417) (not start!48896) (not b!231422) (not b!231419) (not b!231418) (not b!231420) (not b!231416))
(check-sat)
