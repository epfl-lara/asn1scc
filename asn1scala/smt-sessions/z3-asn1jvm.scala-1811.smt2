; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48980 () Bool)

(assert start!48980)

(declare-fun b!232266 () Bool)

(declare-fun e!159866 () Bool)

(assert (=> b!232266 (= e!159866 false)))

(declare-fun lt!368892 () (_ BitVec 64))

(declare-datatypes ((array!11949 0))(
  ( (array!11950 (arr!6227 (Array (_ BitVec 32) (_ BitVec 8))) (size!5240 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9576 0))(
  ( (BitStream!9577 (buf!5781 array!11949) (currentByte!10788 (_ BitVec 32)) (currentBit!10783 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9576)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232266 (= lt!368892 (bitIndex!0 (size!5240 (buf!5781 b1!101)) (currentByte!10788 b1!101) (currentBit!10783 b1!101)))))

(declare-fun b!232267 () Bool)

(declare-fun e!159862 () Bool)

(declare-fun array_inv!4981 (array!11949) Bool)

(assert (=> b!232267 (= e!159862 (array_inv!4981 (buf!5781 b1!101)))))

(declare-fun b!232268 () Bool)

(declare-fun res!194437 () Bool)

(assert (=> b!232268 (=> (not res!194437) (not e!159866))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232268 (= res!194437 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5240 (buf!5781 b1!101))) ((_ sign_extend 32) (currentByte!10788 b1!101)) ((_ sign_extend 32) (currentBit!10783 b1!101)) bytes!19))))

(declare-fun b!232270 () Bool)

(declare-fun res!194436 () Bool)

(assert (=> b!232270 (=> (not res!194436) (not e!159866))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b2!99 () BitStream!9576)

(assert (=> b!232270 (= res!194436 (bvsle bits!86 (bitIndex!0 (size!5240 (buf!5781 b2!99)) (currentByte!10788 b2!99) (currentBit!10783 b2!99))))))

(declare-fun b!232271 () Bool)

(declare-fun e!159864 () Bool)

(assert (=> b!232271 (= e!159864 (array_inv!4981 (buf!5781 b2!99)))))

(declare-fun b!232269 () Bool)

(declare-fun res!194439 () Bool)

(assert (=> b!232269 (=> (not res!194439) (not e!159866))))

(assert (=> b!232269 (= res!194439 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun res!194438 () Bool)

(assert (=> start!48980 (=> (not res!194438) (not e!159866))))

(assert (=> start!48980 (= res!194438 (and (= (size!5240 (buf!5781 b1!101)) (size!5240 (buf!5781 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48980 e!159866))

(declare-fun inv!12 (BitStream!9576) Bool)

(assert (=> start!48980 (and (inv!12 b1!101) e!159862)))

(assert (=> start!48980 (and (inv!12 b2!99) e!159864)))

(assert (=> start!48980 true))

(assert (= (and start!48980 res!194438) b!232270))

(assert (= (and b!232270 res!194436) b!232269))

(assert (= (and b!232269 res!194439) b!232268))

(assert (= (and b!232268 res!194437) b!232266))

(assert (= start!48980 b!232267))

(assert (= start!48980 b!232271))

(declare-fun m!355195 () Bool)

(assert (=> b!232267 m!355195))

(declare-fun m!355197 () Bool)

(assert (=> start!48980 m!355197))

(declare-fun m!355199 () Bool)

(assert (=> start!48980 m!355199))

(declare-fun m!355201 () Bool)

(assert (=> b!232271 m!355201))

(declare-fun m!355203 () Bool)

(assert (=> b!232266 m!355203))

(declare-fun m!355205 () Bool)

(assert (=> b!232270 m!355205))

(declare-fun m!355207 () Bool)

(assert (=> b!232268 m!355207))

(check-sat (not b!232270) (not b!232271) (not b!232266) (not start!48980) (not b!232268) (not b!232267))
