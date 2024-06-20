; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48740 () Bool)

(assert start!48740)

(declare-fun b!230690 () Bool)

(declare-fun e!158462 () Bool)

(declare-fun e!158460 () Bool)

(assert (=> b!230690 (= e!158462 e!158460)))

(declare-fun res!193350 () Bool)

(assert (=> b!230690 (=> (not res!193350) (not e!158460))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368286 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!230690 (= res!193350 (and (bvsle bits!86 lt!368286) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-datatypes ((array!11775 0))(
  ( (array!11776 (arr!6146 (Array (_ BitVec 32) (_ BitVec 8))) (size!5159 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9414 0))(
  ( (BitStream!9415 (buf!5700 array!11775) (currentByte!10692 (_ BitVec 32)) (currentBit!10687 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9414)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230690 (= lt!368286 (bitIndex!0 (size!5159 (buf!5700 b2!99)) (currentByte!10692 b2!99) (currentBit!10687 b2!99)))))

(declare-fun b!230691 () Bool)

(declare-fun res!193347 () Bool)

(assert (=> b!230691 (=> (not res!193347) (not e!158460))))

(declare-fun b1!101 () BitStream!9414)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!230691 (= res!193347 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5159 (buf!5700 b1!101))) ((_ sign_extend 32) (currentByte!10692 b1!101)) ((_ sign_extend 32) (currentBit!10687 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!230692 () Bool)

(declare-fun e!158461 () Bool)

(declare-fun array_inv!4900 (array!11775) Bool)

(assert (=> b!230692 (= e!158461 (array_inv!4900 (buf!5700 b1!101)))))

(declare-fun b!230693 () Bool)

(declare-fun e!158465 () Bool)

(assert (=> b!230693 (= e!158465 (array_inv!4900 (buf!5700 b2!99)))))

(declare-fun b!230695 () Bool)

(declare-fun res!193349 () Bool)

(assert (=> b!230695 (=> (not res!193349) (not e!158460))))

(assert (=> b!230695 (= res!193349 (= lt!368286 (bvadd (bitIndex!0 (size!5159 (buf!5700 b1!101)) (currentByte!10692 b1!101) (currentBit!10687 b1!101)) bits!86)))))

(declare-fun b!230696 () Bool)

(declare-fun res!193348 () Bool)

(assert (=> b!230696 (=> (not res!193348) (not e!158460))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230696 (= res!193348 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5159 (buf!5700 b1!101))) ((_ sign_extend 32) (currentByte!10692 b1!101)) ((_ sign_extend 32) (currentBit!10687 b1!101)) bytes!19))))

(declare-fun res!193346 () Bool)

(assert (=> start!48740 (=> (not res!193346) (not e!158462))))

(assert (=> start!48740 (= res!193346 (and (= (size!5159 (buf!5700 b1!101)) (size!5159 (buf!5700 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48740 e!158462))

(declare-fun inv!12 (BitStream!9414) Bool)

(assert (=> start!48740 (and (inv!12 b1!101) e!158461)))

(assert (=> start!48740 (and (inv!12 b2!99) e!158465)))

(assert (=> start!48740 true))

(declare-fun lt!368285 () (_ BitVec 64))

(declare-fun b!230694 () Bool)

(assert (=> b!230694 (= e!158460 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5159 (buf!5700 b1!101)))) lt!368285) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14297 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10692 b2!99))) ((_ sign_extend 32) (currentBit!10687 b2!99))))) (and (= lt!368286 bdg!14297) (= (bvsub lt!368286 bits!86) lt!368285) (bvsgt ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5159 (buf!5700 b2!99)))) (bvsub bdg!14297 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000))))))))

(assert (=> b!230694 (= lt!368285 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10692 b1!101))) ((_ sign_extend 32) (currentBit!10687 b1!101))))))

(assert (= (and start!48740 res!193346) b!230690))

(assert (= (and b!230690 res!193350) b!230696))

(assert (= (and b!230696 res!193348) b!230695))

(assert (= (and b!230695 res!193349) b!230691))

(assert (= (and b!230691 res!193347) b!230694))

(assert (= start!48740 b!230692))

(assert (= start!48740 b!230693))

(declare-fun m!353949 () Bool)

(assert (=> b!230695 m!353949))

(declare-fun m!353951 () Bool)

(assert (=> b!230693 m!353951))

(declare-fun m!353953 () Bool)

(assert (=> b!230691 m!353953))

(declare-fun m!353955 () Bool)

(assert (=> b!230696 m!353955))

(declare-fun m!353957 () Bool)

(assert (=> start!48740 m!353957))

(declare-fun m!353959 () Bool)

(assert (=> start!48740 m!353959))

(declare-fun m!353961 () Bool)

(assert (=> b!230690 m!353961))

(declare-fun m!353963 () Bool)

(assert (=> b!230692 m!353963))

(check-sat (not b!230695) (not b!230690) (not start!48740) (not b!230696) (not b!230693) (not b!230691) (not b!230692))
(check-sat)
