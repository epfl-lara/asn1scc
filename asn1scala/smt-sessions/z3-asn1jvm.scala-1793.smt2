; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48872 () Bool)

(assert start!48872)

(declare-fun b!231168 () Bool)

(declare-fun e!158929 () Bool)

(assert (=> b!231168 (= e!158929 false)))

(declare-fun lt!368613 () (_ BitVec 64))

(declare-datatypes ((array!11841 0))(
  ( (array!11842 (arr!6173 (Array (_ BitVec 32) (_ BitVec 8))) (size!5186 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9468 0))(
  ( (BitStream!9469 (buf!5727 array!11841) (currentByte!10734 (_ BitVec 32)) (currentBit!10729 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9468)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231168 (= lt!368613 (bitIndex!0 (size!5186 (buf!5727 b1!101)) (currentByte!10734 b1!101) (currentBit!10729 b1!101)))))

(declare-fun b!231169 () Bool)

(declare-fun e!158928 () Bool)

(declare-fun array_inv!4927 (array!11841) Bool)

(assert (=> b!231169 (= e!158928 (array_inv!4927 (buf!5727 b1!101)))))

(declare-fun res!193662 () Bool)

(assert (=> start!48872 (=> (not res!193662) (not e!158929))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9468)

(assert (=> start!48872 (= res!193662 (and (= (size!5186 (buf!5727 b1!101)) (size!5186 (buf!5727 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48872 e!158929))

(declare-fun inv!12 (BitStream!9468) Bool)

(assert (=> start!48872 (and (inv!12 b1!101) e!158928)))

(declare-fun e!158926 () Bool)

(assert (=> start!48872 (and (inv!12 b2!99) e!158926)))

(assert (=> start!48872 true))

(declare-fun b!231170 () Bool)

(declare-fun res!193664 () Bool)

(assert (=> b!231170 (=> (not res!193664) (not e!158929))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231170 (= res!193664 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5186 (buf!5727 b1!101))) ((_ sign_extend 32) (currentByte!10734 b1!101)) ((_ sign_extend 32) (currentBit!10729 b1!101)) bytes!19))))

(declare-fun b!231171 () Bool)

(assert (=> b!231171 (= e!158926 (array_inv!4927 (buf!5727 b2!99)))))

(declare-fun b!231172 () Bool)

(declare-fun res!193665 () Bool)

(assert (=> b!231172 (=> (not res!193665) (not e!158929))))

(assert (=> b!231172 (= res!193665 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!231173 () Bool)

(declare-fun res!193663 () Bool)

(assert (=> b!231173 (=> (not res!193663) (not e!158929))))

(assert (=> b!231173 (= res!193663 (bvsle bits!86 (bitIndex!0 (size!5186 (buf!5727 b2!99)) (currentByte!10734 b2!99) (currentBit!10729 b2!99))))))

(assert (= (and start!48872 res!193662) b!231173))

(assert (= (and b!231173 res!193663) b!231172))

(assert (= (and b!231172 res!193665) b!231170))

(assert (= (and b!231170 res!193664) b!231168))

(assert (= start!48872 b!231169))

(assert (= start!48872 b!231171))

(declare-fun m!354355 () Bool)

(assert (=> start!48872 m!354355))

(declare-fun m!354357 () Bool)

(assert (=> start!48872 m!354357))

(declare-fun m!354359 () Bool)

(assert (=> b!231168 m!354359))

(declare-fun m!354361 () Bool)

(assert (=> b!231169 m!354361))

(declare-fun m!354363 () Bool)

(assert (=> b!231173 m!354363))

(declare-fun m!354365 () Bool)

(assert (=> b!231170 m!354365))

(declare-fun m!354367 () Bool)

(assert (=> b!231171 m!354367))

(check-sat (not b!231168) (not start!48872) (not b!231171) (not b!231169) (not b!231170) (not b!231173))
