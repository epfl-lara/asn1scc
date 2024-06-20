; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48882 () Bool)

(assert start!48882)

(declare-fun b!231269 () Bool)

(declare-fun e!159016 () Bool)

(declare-datatypes ((array!11851 0))(
  ( (array!11852 (arr!6178 (Array (_ BitVec 32) (_ BitVec 8))) (size!5191 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9478 0))(
  ( (BitStream!9479 (buf!5732 array!11851) (currentByte!10739 (_ BitVec 32)) (currentBit!10734 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9478)

(declare-fun array_inv!4932 (array!11851) Bool)

(assert (=> b!231269 (= e!159016 (array_inv!4932 (buf!5732 b1!101)))))

(declare-fun b!231270 () Bool)

(declare-fun e!159015 () Bool)

(assert (=> b!231270 (= e!159015 (and (not (= ((_ sign_extend 32) (currentByte!10739 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10739 b1!101))) ((_ sign_extend 32) (currentByte!10739 b1!101)))))))))

(declare-fun b!231271 () Bool)

(declare-fun res!193734 () Bool)

(assert (=> b!231271 (=> (not res!193734) (not e!159015))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368628 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231271 (= res!193734 (= lt!368628 (bvadd (bitIndex!0 (size!5191 (buf!5732 b1!101)) (currentByte!10739 b1!101) (currentBit!10734 b1!101)) bits!86)))))

(declare-fun res!193733 () Bool)

(declare-fun e!159012 () Bool)

(assert (=> start!48882 (=> (not res!193733) (not e!159012))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9478)

(assert (=> start!48882 (= res!193733 (and (= (size!5191 (buf!5732 b1!101)) (size!5191 (buf!5732 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48882 e!159012))

(declare-fun inv!12 (BitStream!9478) Bool)

(assert (=> start!48882 (and (inv!12 b1!101) e!159016)))

(declare-fun e!159013 () Bool)

(assert (=> start!48882 (and (inv!12 b2!99) e!159013)))

(assert (=> start!48882 true))

(declare-fun b!231272 () Bool)

(assert (=> b!231272 (= e!159013 (array_inv!4932 (buf!5732 b2!99)))))

(declare-fun b!231273 () Bool)

(assert (=> b!231273 (= e!159012 e!159015)))

(declare-fun res!193736 () Bool)

(assert (=> b!231273 (=> (not res!193736) (not e!159015))))

(assert (=> b!231273 (= res!193736 (and (bvsle bits!86 lt!368628) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!231273 (= lt!368628 (bitIndex!0 (size!5191 (buf!5732 b2!99)) (currentByte!10739 b2!99) (currentBit!10734 b2!99)))))

(declare-fun b!231274 () Bool)

(declare-fun res!193737 () Bool)

(assert (=> b!231274 (=> (not res!193737) (not e!159015))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231274 (= res!193737 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5191 (buf!5732 b1!101))) ((_ sign_extend 32) (currentByte!10739 b1!101)) ((_ sign_extend 32) (currentBit!10734 b1!101)) bytes!19))))

(declare-fun b!231275 () Bool)

(declare-fun res!193735 () Bool)

(assert (=> b!231275 (=> (not res!193735) (not e!159015))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231275 (= res!193735 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5191 (buf!5732 b1!101))) ((_ sign_extend 32) (currentByte!10739 b1!101)) ((_ sign_extend 32) (currentBit!10734 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and start!48882 res!193733) b!231273))

(assert (= (and b!231273 res!193736) b!231274))

(assert (= (and b!231274 res!193737) b!231271))

(assert (= (and b!231271 res!193734) b!231275))

(assert (= (and b!231275 res!193735) b!231270))

(assert (= start!48882 b!231269))

(assert (= start!48882 b!231272))

(declare-fun m!354431 () Bool)

(assert (=> start!48882 m!354431))

(declare-fun m!354433 () Bool)

(assert (=> start!48882 m!354433))

(declare-fun m!354435 () Bool)

(assert (=> b!231272 m!354435))

(declare-fun m!354437 () Bool)

(assert (=> b!231274 m!354437))

(declare-fun m!354439 () Bool)

(assert (=> b!231271 m!354439))

(declare-fun m!354441 () Bool)

(assert (=> b!231269 m!354441))

(declare-fun m!354443 () Bool)

(assert (=> b!231273 m!354443))

(declare-fun m!354445 () Bool)

(assert (=> b!231275 m!354445))

(push 1)

(assert (not b!231275))

(assert (not b!231273))

(assert (not start!48882))

(assert (not b!231272))

(assert (not b!231271))

(assert (not b!231274))

(assert (not b!231269))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

