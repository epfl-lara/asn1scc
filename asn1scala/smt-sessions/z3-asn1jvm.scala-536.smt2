; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15710 () Bool)

(assert start!15710)

(declare-fun b!79445 () Bool)

(declare-fun res!65790 () Bool)

(declare-fun e!52149 () Bool)

(assert (=> b!79445 (=> (not res!65790) (not e!52149))))

(declare-datatypes ((array!3393 0))(
  ( (array!3394 (arr!2167 (Array (_ BitVec 32) (_ BitVec 8))) (size!1566 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2694 0))(
  ( (BitStream!2695 (buf!1956 array!3393) (currentByte!3833 (_ BitVec 32)) (currentBit!3828 (_ BitVec 32))) )
))
(declare-fun thiss!1107 () BitStream!2694)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79445 (= res!65790 (validate_offset_bit!0 ((_ sign_extend 32) (size!1566 (buf!1956 thiss!1107))) ((_ sign_extend 32) (currentByte!3833 thiss!1107)) ((_ sign_extend 32) (currentBit!3828 thiss!1107))))))

(declare-fun b!79446 () Bool)

(declare-fun e!52151 () Bool)

(declare-datatypes ((tuple2!7094 0))(
  ( (tuple2!7095 (_1!3684 BitStream!2694) (_2!3684 Bool)) )
))
(declare-fun lt!126341 () tuple2!7094)

(declare-fun lt!126335 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!79446 (= e!52151 (= (bitIndex!0 (size!1566 (buf!1956 (_1!3684 lt!126341))) (currentByte!3833 (_1!3684 lt!126341)) (currentBit!3828 (_1!3684 lt!126341))) lt!126335))))

(declare-fun b!79447 () Bool)

(declare-fun e!52154 () Bool)

(assert (=> b!79447 (= e!52149 (not e!52154))))

(declare-fun res!65794 () Bool)

(assert (=> b!79447 (=> (not res!65794) (not e!52154))))

(declare-datatypes ((Unit!5217 0))(
  ( (Unit!5218) )
))
(declare-datatypes ((tuple2!7096 0))(
  ( (tuple2!7097 (_1!3685 Unit!5217) (_2!3685 BitStream!2694)) )
))
(declare-fun lt!126336 () tuple2!7096)

(assert (=> b!79447 (= res!65794 (= (size!1566 (buf!1956 (_2!3685 lt!126336))) (size!1566 (buf!1956 thiss!1107))))))

(declare-fun e!52155 () Bool)

(assert (=> b!79447 e!52155))

(declare-fun res!65789 () Bool)

(assert (=> b!79447 (=> (not res!65789) (not e!52155))))

(assert (=> b!79447 (= res!65789 (= (size!1566 (buf!1956 thiss!1107)) (size!1566 (buf!1956 (_2!3685 lt!126336)))))))

(declare-fun lt!126340 () Bool)

(declare-fun appendBit!0 (BitStream!2694 Bool) tuple2!7096)

(assert (=> b!79447 (= lt!126336 (appendBit!0 thiss!1107 lt!126340))))

(declare-fun b!215 () (_ BitVec 8))

(declare-fun bitNr!1 () (_ BitVec 32))

(assert (=> b!79447 (= lt!126340 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) b!215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) bitNr!1))) #b00000000000000000000000000000000)))))

(declare-fun b!79448 () Bool)

(declare-fun e!52147 () Bool)

(declare-fun lt!126337 () tuple2!7094)

(declare-fun lt!126339 () (_ BitVec 64))

(assert (=> b!79448 (= e!52147 (= (bitIndex!0 (size!1566 (buf!1956 (_1!3684 lt!126337))) (currentByte!3833 (_1!3684 lt!126337)) (currentBit!3828 (_1!3684 lt!126337))) lt!126339))))

(declare-fun b!79449 () Bool)

(declare-fun e!52152 () Bool)

(assert (=> b!79449 (= e!52154 e!52152)))

(declare-fun res!65785 () Bool)

(assert (=> b!79449 (=> (not res!65785) (not e!52152))))

(declare-fun lt!126342 () (_ BitVec 64))

(assert (=> b!79449 (= res!65785 (= lt!126335 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!126342)))))

(assert (=> b!79449 (= lt!126335 (bitIndex!0 (size!1566 (buf!1956 (_2!3685 lt!126336))) (currentByte!3833 (_2!3685 lt!126336)) (currentBit!3828 (_2!3685 lt!126336))))))

(assert (=> b!79449 (= lt!126342 (bitIndex!0 (size!1566 (buf!1956 thiss!1107)) (currentByte!3833 thiss!1107) (currentBit!3828 thiss!1107)))))

(declare-fun b!79450 () Bool)

(declare-fun res!65787 () Bool)

(declare-fun e!52153 () Bool)

(assert (=> b!79450 (=> (not res!65787) (not e!52153))))

(declare-fun isPrefixOf!0 (BitStream!2694 BitStream!2694) Bool)

(assert (=> b!79450 (= res!65787 (isPrefixOf!0 thiss!1107 (_2!3685 lt!126336)))))

(declare-fun b!79451 () Bool)

(assert (=> b!79451 (= e!52153 e!52147)))

(declare-fun res!65791 () Bool)

(assert (=> b!79451 (=> (not res!65791) (not e!52147))))

(assert (=> b!79451 (= res!65791 (and (= (_2!3684 lt!126337) lt!126340) (= (_1!3684 lt!126337) (_2!3685 lt!126336))))))

(declare-fun readBitPure!0 (BitStream!2694) tuple2!7094)

(declare-fun readerFrom!0 (BitStream!2694 (_ BitVec 32) (_ BitVec 32)) BitStream!2694)

(assert (=> b!79451 (= lt!126337 (readBitPure!0 (readerFrom!0 (_2!3685 lt!126336) (currentBit!3828 thiss!1107) (currentByte!3833 thiss!1107))))))

(declare-fun b!79453 () Bool)

(assert (=> b!79453 (= e!52155 e!52153)))

(declare-fun res!65788 () Bool)

(assert (=> b!79453 (=> (not res!65788) (not e!52153))))

(declare-fun lt!126334 () (_ BitVec 64))

(assert (=> b!79453 (= res!65788 (= lt!126339 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!126334)))))

(assert (=> b!79453 (= lt!126339 (bitIndex!0 (size!1566 (buf!1956 (_2!3685 lt!126336))) (currentByte!3833 (_2!3685 lt!126336)) (currentBit!3828 (_2!3685 lt!126336))))))

(assert (=> b!79453 (= lt!126334 (bitIndex!0 (size!1566 (buf!1956 thiss!1107)) (currentByte!3833 thiss!1107) (currentBit!3828 thiss!1107)))))

(declare-fun b!79454 () Bool)

(declare-fun res!65786 () Bool)

(assert (=> b!79454 (=> (not res!65786) (not e!52152))))

(assert (=> b!79454 (= res!65786 (isPrefixOf!0 thiss!1107 (_2!3685 lt!126336)))))

(declare-fun b!79455 () Bool)

(assert (=> b!79455 (= e!52152 e!52151)))

(declare-fun res!65792 () Bool)

(assert (=> b!79455 (=> (not res!65792) (not e!52151))))

(assert (=> b!79455 (= res!65792 (and (= (_2!3684 lt!126341) lt!126340) (= (_1!3684 lt!126341) (_2!3685 lt!126336))))))

(declare-datatypes ((tuple2!7098 0))(
  ( (tuple2!7099 (_1!3686 array!3393) (_2!3686 BitStream!2694)) )
))
(declare-fun lt!126333 () tuple2!7098)

(declare-fun lt!126338 () BitStream!2694)

(declare-fun readBits!0 (BitStream!2694 (_ BitVec 64)) tuple2!7098)

(assert (=> b!79455 (= lt!126333 (readBits!0 lt!126338 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!79455 (= lt!126341 (readBitPure!0 lt!126338))))

(assert (=> b!79455 (= lt!126338 (readerFrom!0 (_2!3685 lt!126336) (currentBit!3828 thiss!1107) (currentByte!3833 thiss!1107)))))

(declare-fun b!79452 () Bool)

(declare-fun e!52150 () Bool)

(declare-fun array_inv!1412 (array!3393) Bool)

(assert (=> b!79452 (= e!52150 (array_inv!1412 (buf!1956 thiss!1107)))))

(declare-fun res!65793 () Bool)

(assert (=> start!15710 (=> (not res!65793) (not e!52149))))

(assert (=> start!15710 (= res!65793 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000)))))

(assert (=> start!15710 e!52149))

(assert (=> start!15710 true))

(declare-fun inv!12 (BitStream!2694) Bool)

(assert (=> start!15710 (and (inv!12 thiss!1107) e!52150)))

(assert (= (and start!15710 res!65793) b!79445))

(assert (= (and b!79445 res!65790) b!79447))

(assert (= (and b!79447 res!65789) b!79453))

(assert (= (and b!79453 res!65788) b!79450))

(assert (= (and b!79450 res!65787) b!79451))

(assert (= (and b!79451 res!65791) b!79448))

(assert (= (and b!79447 res!65794) b!79449))

(assert (= (and b!79449 res!65785) b!79454))

(assert (= (and b!79454 res!65786) b!79455))

(assert (= (and b!79455 res!65792) b!79446))

(assert (= start!15710 b!79452))

(declare-fun m!124843 () Bool)

(assert (=> start!15710 m!124843))

(declare-fun m!124845 () Bool)

(assert (=> b!79449 m!124845))

(declare-fun m!124847 () Bool)

(assert (=> b!79449 m!124847))

(declare-fun m!124849 () Bool)

(assert (=> b!79452 m!124849))

(declare-fun m!124851 () Bool)

(assert (=> b!79448 m!124851))

(declare-fun m!124853 () Bool)

(assert (=> b!79447 m!124853))

(declare-fun m!124855 () Bool)

(assert (=> b!79447 m!124855))

(declare-fun m!124857 () Bool)

(assert (=> b!79450 m!124857))

(assert (=> b!79454 m!124857))

(declare-fun m!124859 () Bool)

(assert (=> b!79455 m!124859))

(declare-fun m!124861 () Bool)

(assert (=> b!79455 m!124861))

(declare-fun m!124863 () Bool)

(assert (=> b!79455 m!124863))

(assert (=> b!79453 m!124845))

(assert (=> b!79453 m!124847))

(assert (=> b!79451 m!124863))

(assert (=> b!79451 m!124863))

(declare-fun m!124865 () Bool)

(assert (=> b!79451 m!124865))

(declare-fun m!124867 () Bool)

(assert (=> b!79445 m!124867))

(declare-fun m!124869 () Bool)

(assert (=> b!79446 m!124869))

(check-sat (not b!79452) (not b!79450) (not b!79446) (not b!79451) (not b!79447) (not b!79453) (not b!79454) (not start!15710) (not b!79448) (not b!79445) (not b!79449) (not b!79455))
(check-sat)
