; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48548 () Bool)

(assert start!48548)

(declare-fun b!230005 () Bool)

(declare-fun e!157922 () Bool)

(declare-fun e!157926 () Bool)

(assert (=> b!230005 (= e!157922 e!157926)))

(declare-fun res!192807 () Bool)

(assert (=> b!230005 (=> (not res!192807) (not e!157926))))

(declare-datatypes ((array!11715 0))(
  ( (array!11716 (arr!6123 (Array (_ BitVec 32) (_ BitVec 8))) (size!5136 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9368 0))(
  ( (BitStream!9369 (buf!5677 array!11715) (currentByte!10624 (_ BitVec 32)) (currentBit!10619 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9368)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun lt!367763 () (_ BitVec 64))

(assert (=> b!230005 (= res!192807 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5136 (buf!5677 b1!101)))) lt!367763) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230005 (= lt!367763 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10624 b1!101))) ((_ sign_extend 32) (currentBit!10619 b1!101))))))

(declare-fun b!230007 () Bool)

(declare-fun e!157928 () Bool)

(assert (=> b!230007 (= e!157928 e!157922)))

(declare-fun res!192802 () Bool)

(assert (=> b!230007 (=> (not res!192802) (not e!157922))))

(declare-fun lt!367759 () (_ BitVec 32))

(assert (=> b!230007 (= res!192802 (bvsle lt!367759 bytes!19))))

(declare-fun lt!367764 () (_ BitVec 64))

(assert (=> b!230007 (= lt!367759 ((_ extract 31 0) lt!367764))))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!230007 (= lt!367764 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!230008 () Bool)

(declare-fun res!192801 () Bool)

(assert (=> b!230008 (=> (not res!192801) (not e!157922))))

(declare-fun lt!367761 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230008 (= res!192801 (= lt!367761 (bvadd (bitIndex!0 (size!5136 (buf!5677 b1!101)) (currentByte!10624 b1!101) (currentBit!10619 b1!101)) bits!86)))))

(declare-fun b!230009 () Bool)

(declare-fun res!192806 () Bool)

(assert (=> b!230009 (=> (not res!192806) (not e!157922))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!230009 (= res!192806 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5136 (buf!5677 b1!101))) ((_ sign_extend 32) (currentByte!10624 b1!101)) ((_ sign_extend 32) (currentBit!10619 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!230010 () Bool)

(declare-fun e!157929 () Bool)

(assert (=> b!230010 (= e!157926 e!157929)))

(declare-fun res!192805 () Bool)

(assert (=> b!230010 (=> (not res!192805) (not e!157929))))

(declare-fun lt!367762 () (_ BitVec 64))

(assert (=> b!230010 (= res!192805 (and (= lt!367761 lt!367762) (= (bvsub lt!367761 bits!86) lt!367763)))))

(declare-fun b2!99 () BitStream!9368)

(assert (=> b!230010 (= lt!367762 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10624 b2!99))) ((_ sign_extend 32) (currentBit!10619 b2!99))))))

(declare-fun b!230011 () Bool)

(declare-fun e!157925 () Bool)

(assert (=> b!230011 (= e!157925 e!157928)))

(declare-fun res!192808 () Bool)

(assert (=> b!230011 (=> (not res!192808) (not e!157928))))

(assert (=> b!230011 (= res!192808 (bvsle bits!86 lt!367761))))

(assert (=> b!230011 (= lt!367761 (bitIndex!0 (size!5136 (buf!5677 b2!99)) (currentByte!10624 b2!99) (currentBit!10619 b2!99)))))

(declare-fun b!230012 () Bool)

(declare-fun res!192799 () Bool)

(assert (=> b!230012 (=> (not res!192799) (not e!157922))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230012 (= res!192799 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5136 (buf!5677 b1!101))) ((_ sign_extend 32) (currentByte!10624 b1!101)) ((_ sign_extend 32) (currentBit!10619 b1!101)) bytes!19))))

(declare-fun b!230013 () Bool)

(declare-fun e!157924 () Bool)

(declare-fun array_inv!4877 (array!11715) Bool)

(assert (=> b!230013 (= e!157924 (array_inv!4877 (buf!5677 b1!101)))))

(declare-fun b!230014 () Bool)

(declare-fun e!157927 () Bool)

(assert (=> b!230014 (= e!157927 (array_inv!4877 (buf!5677 b2!99)))))

(declare-fun b!230006 () Bool)

(declare-fun e!157923 () Bool)

(assert (=> b!230006 (= e!157923 (or (bvsgt ((_ sign_extend 32) (size!5136 (buf!5677 b2!99))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!10624 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!10619 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun res!192800 () Bool)

(assert (=> start!48548 (=> (not res!192800) (not e!157925))))

(assert (=> start!48548 (= res!192800 (and (= (size!5136 (buf!5677 b1!101)) (size!5136 (buf!5677 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48548 e!157925))

(declare-fun inv!12 (BitStream!9368) Bool)

(assert (=> start!48548 (and (inv!12 b1!101) e!157924)))

(assert (=> start!48548 (and (inv!12 b2!99) e!157927)))

(assert (=> start!48548 true))

(declare-fun b!230015 () Bool)

(declare-fun res!192803 () Bool)

(assert (=> b!230015 (=> (not res!192803) (not e!157923))))

(assert (=> b!230015 (= res!192803 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5136 (buf!5677 b2!99))) ((_ sign_extend 32) (currentByte!10624 b2!99)) ((_ sign_extend 32) (currentBit!10619 b2!99)) (bvsub bytes!19 lt!367759)))))

(declare-fun b!230016 () Bool)

(assert (=> b!230016 (= e!157929 e!157923)))

(declare-fun res!192804 () Bool)

(assert (=> b!230016 (=> (not res!192804) (not e!157923))))

(declare-fun lt!367760 () (_ BitVec 64))

(assert (=> b!230016 (= res!192804 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub lt!367760 (bvsub lt!367762 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub lt!367760 lt!367762) #b0000000000000000000000000000000000000000000000000000000000001000) lt!367764))))))

(assert (=> b!230016 (= lt!367760 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5136 (buf!5677 b2!99)))))))

(assert (= (and start!48548 res!192800) b!230011))

(assert (= (and b!230011 res!192808) b!230007))

(assert (= (and b!230007 res!192802) b!230012))

(assert (= (and b!230012 res!192799) b!230008))

(assert (= (and b!230008 res!192801) b!230009))

(assert (= (and b!230009 res!192806) b!230005))

(assert (= (and b!230005 res!192807) b!230010))

(assert (= (and b!230010 res!192805) b!230016))

(assert (= (and b!230016 res!192804) b!230015))

(assert (= (and b!230015 res!192803) b!230006))

(assert (= start!48548 b!230013))

(assert (= start!48548 b!230014))

(declare-fun m!353485 () Bool)

(assert (=> b!230013 m!353485))

(declare-fun m!353487 () Bool)

(assert (=> b!230008 m!353487))

(declare-fun m!353489 () Bool)

(assert (=> b!230012 m!353489))

(declare-fun m!353491 () Bool)

(assert (=> b!230009 m!353491))

(declare-fun m!353493 () Bool)

(assert (=> start!48548 m!353493))

(declare-fun m!353495 () Bool)

(assert (=> start!48548 m!353495))

(declare-fun m!353497 () Bool)

(assert (=> b!230014 m!353497))

(declare-fun m!353499 () Bool)

(assert (=> b!230015 m!353499))

(declare-fun m!353501 () Bool)

(assert (=> b!230011 m!353501))

(push 1)

(assert (not b!230014))

(assert (not b!230013))

(assert (not b!230008))

(assert (not b!230015))

(assert (not b!230009))

(assert (not b!230012))

(assert (not start!48548))

(assert (not b!230011))

(check-sat)

(pop 1)

(push 1)

(check-sat)

