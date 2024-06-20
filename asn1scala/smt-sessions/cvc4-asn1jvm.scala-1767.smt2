; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48328 () Bool)

(assert start!48328)

(declare-fun b!229225 () Bool)

(declare-fun e!157301 () Bool)

(declare-datatypes ((array!11646 0))(
  ( (array!11647 (arr!6096 (Array (_ BitVec 32) (_ BitVec 8))) (size!5109 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9314 0))(
  ( (BitStream!9315 (buf!5650 array!11646) (currentByte!10544 (_ BitVec 32)) (currentBit!10539 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9314)

(assert (=> b!229225 (= e!157301 (or (bvsgt ((_ sign_extend 32) (size!5109 (buf!5650 b1!101))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!10544 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!10539 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!229226 () Bool)

(declare-fun res!192184 () Bool)

(assert (=> b!229226 (=> (not res!192184) (not e!157301))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229226 (= res!192184 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5109 (buf!5650 b1!101))) ((_ sign_extend 32) (currentByte!10544 b1!101)) ((_ sign_extend 32) (currentBit!10539 b1!101)) bytes!19))))

(declare-fun b!229227 () Bool)

(declare-fun e!157300 () Bool)

(assert (=> b!229227 (= e!157300 e!157301)))

(declare-fun res!192182 () Bool)

(assert (=> b!229227 (=> (not res!192182) (not e!157301))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!367206 () (_ BitVec 64))

(assert (=> b!229227 (= res!192182 (and (bvsle bits!86 lt!367206) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun b2!99 () BitStream!9314)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229227 (= lt!367206 (bitIndex!0 (size!5109 (buf!5650 b2!99)) (currentByte!10544 b2!99) (currentBit!10539 b2!99)))))

(declare-fun b!229228 () Bool)

(declare-fun res!192181 () Bool)

(assert (=> b!229228 (=> (not res!192181) (not e!157301))))

(assert (=> b!229228 (= res!192181 (= lt!367206 (bvadd (bitIndex!0 (size!5109 (buf!5650 b1!101)) (currentByte!10544 b1!101) (currentBit!10539 b1!101)) bits!86)))))

(declare-fun b!229229 () Bool)

(declare-fun e!157298 () Bool)

(declare-fun array_inv!4850 (array!11646) Bool)

(assert (=> b!229229 (= e!157298 (array_inv!4850 (buf!5650 b2!99)))))

(declare-fun res!192183 () Bool)

(assert (=> start!48328 (=> (not res!192183) (not e!157300))))

(assert (=> start!48328 (= res!192183 (and (= (size!5109 (buf!5650 b1!101)) (size!5109 (buf!5650 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48328 e!157300))

(declare-fun e!157303 () Bool)

(declare-fun inv!12 (BitStream!9314) Bool)

(assert (=> start!48328 (and (inv!12 b1!101) e!157303)))

(assert (=> start!48328 (and (inv!12 b2!99) e!157298)))

(assert (=> start!48328 true))

(declare-fun b!229230 () Bool)

(assert (=> b!229230 (= e!157303 (array_inv!4850 (buf!5650 b1!101)))))

(assert (= (and start!48328 res!192183) b!229227))

(assert (= (and b!229227 res!192182) b!229226))

(assert (= (and b!229226 res!192184) b!229228))

(assert (= (and b!229228 res!192181) b!229225))

(assert (= start!48328 b!229230))

(assert (= start!48328 b!229229))

(declare-fun m!352955 () Bool)

(assert (=> b!229228 m!352955))

(declare-fun m!352957 () Bool)

(assert (=> start!48328 m!352957))

(declare-fun m!352959 () Bool)

(assert (=> start!48328 m!352959))

(declare-fun m!352961 () Bool)

(assert (=> b!229229 m!352961))

(declare-fun m!352963 () Bool)

(assert (=> b!229230 m!352963))

(declare-fun m!352965 () Bool)

(assert (=> b!229226 m!352965))

(declare-fun m!352967 () Bool)

(assert (=> b!229227 m!352967))

(push 1)

(assert (not b!229230))

(assert (not b!229228))

(assert (not b!229227))

(assert (not b!229226))

(assert (not b!229229))

(assert (not start!48328))

(check-sat)

(pop 1)

(push 1)

(check-sat)

