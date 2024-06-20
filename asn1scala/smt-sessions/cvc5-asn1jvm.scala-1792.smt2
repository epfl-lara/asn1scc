; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48864 () Bool)

(assert start!48864)

(declare-fun b!231096 () Bool)

(declare-fun e!158867 () Bool)

(declare-datatypes ((array!11833 0))(
  ( (array!11834 (arr!6169 (Array (_ BitVec 32) (_ BitVec 8))) (size!5182 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9460 0))(
  ( (BitStream!9461 (buf!5723 array!11833) (currentByte!10730 (_ BitVec 32)) (currentBit!10725 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9460)

(declare-fun array_inv!4923 (array!11833) Bool)

(assert (=> b!231096 (= e!158867 (array_inv!4923 (buf!5723 b1!101)))))

(declare-fun b!231097 () Bool)

(declare-fun res!193615 () Bool)

(declare-fun e!158870 () Bool)

(assert (=> b!231097 (=> (not res!193615) (not e!158870))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231097 (= res!193615 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5182 (buf!5723 b1!101))) ((_ sign_extend 32) (currentByte!10730 b1!101)) ((_ sign_extend 32) (currentBit!10725 b1!101)) bytes!19))))

(declare-fun b!231098 () Bool)

(declare-fun res!193614 () Bool)

(assert (=> b!231098 (=> (not res!193614) (not e!158870))))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!231098 (= res!193614 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!231099 () Bool)

(declare-fun res!193616 () Bool)

(assert (=> b!231099 (=> (not res!193616) (not e!158870))))

(declare-fun b2!99 () BitStream!9460)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231099 (= res!193616 (bvsle bits!86 (bitIndex!0 (size!5182 (buf!5723 b2!99)) (currentByte!10730 b2!99) (currentBit!10725 b2!99))))))

(declare-fun res!193617 () Bool)

(assert (=> start!48864 (=> (not res!193617) (not e!158870))))

(assert (=> start!48864 (= res!193617 (and (= (size!5182 (buf!5723 b1!101)) (size!5182 (buf!5723 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48864 e!158870))

(declare-fun inv!12 (BitStream!9460) Bool)

(assert (=> start!48864 (and (inv!12 b1!101) e!158867)))

(declare-fun e!158869 () Bool)

(assert (=> start!48864 (and (inv!12 b2!99) e!158869)))

(assert (=> start!48864 true))

(declare-fun b!231100 () Bool)

(assert (=> b!231100 (= e!158870 false)))

(declare-fun lt!368601 () (_ BitVec 64))

(assert (=> b!231100 (= lt!368601 (bitIndex!0 (size!5182 (buf!5723 b1!101)) (currentByte!10730 b1!101) (currentBit!10725 b1!101)))))

(declare-fun b!231101 () Bool)

(assert (=> b!231101 (= e!158869 (array_inv!4923 (buf!5723 b2!99)))))

(assert (= (and start!48864 res!193617) b!231099))

(assert (= (and b!231099 res!193616) b!231098))

(assert (= (and b!231098 res!193614) b!231097))

(assert (= (and b!231097 res!193615) b!231100))

(assert (= start!48864 b!231096))

(assert (= start!48864 b!231101))

(declare-fun m!354299 () Bool)

(assert (=> b!231096 m!354299))

(declare-fun m!354301 () Bool)

(assert (=> b!231099 m!354301))

(declare-fun m!354303 () Bool)

(assert (=> start!48864 m!354303))

(declare-fun m!354305 () Bool)

(assert (=> start!48864 m!354305))

(declare-fun m!354307 () Bool)

(assert (=> b!231101 m!354307))

(declare-fun m!354309 () Bool)

(assert (=> b!231100 m!354309))

(declare-fun m!354311 () Bool)

(assert (=> b!231097 m!354311))

(push 1)

(assert (not b!231099))

(assert (not start!48864))

(assert (not b!231096))

(assert (not b!231097))

(assert (not b!231101))

(assert (not b!231100))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

