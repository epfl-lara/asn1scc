; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48874 () Bool)

(assert start!48874)

(declare-fun b!231186 () Bool)

(declare-fun e!158942 () Bool)

(declare-datatypes ((array!11843 0))(
  ( (array!11844 (arr!6174 (Array (_ BitVec 32) (_ BitVec 8))) (size!5187 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9470 0))(
  ( (BitStream!9471 (buf!5728 array!11843) (currentByte!10735 (_ BitVec 32)) (currentBit!10730 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9470)

(declare-fun array_inv!4928 (array!11843) Bool)

(assert (=> b!231186 (= e!158942 (array_inv!4928 (buf!5728 b2!99)))))

(declare-fun b!231187 () Bool)

(declare-fun e!158943 () Bool)

(declare-fun b1!101 () BitStream!9470)

(assert (=> b!231187 (= e!158943 (array_inv!4928 (buf!5728 b1!101)))))

(declare-fun b!231189 () Bool)

(declare-fun res!193677 () Bool)

(declare-fun e!158944 () Bool)

(assert (=> b!231189 (=> (not res!193677) (not e!158944))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!231189 (= res!193677 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun res!193676 () Bool)

(assert (=> start!48874 (=> (not res!193676) (not e!158944))))

(assert (=> start!48874 (= res!193676 (and (= (size!5187 (buf!5728 b1!101)) (size!5187 (buf!5728 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48874 e!158944))

(declare-fun inv!12 (BitStream!9470) Bool)

(assert (=> start!48874 (and (inv!12 b1!101) e!158943)))

(assert (=> start!48874 (and (inv!12 b2!99) e!158942)))

(assert (=> start!48874 true))

(declare-fun b!231188 () Bool)

(declare-fun res!193675 () Bool)

(assert (=> b!231188 (=> (not res!193675) (not e!158944))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231188 (= res!193675 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5187 (buf!5728 b1!101))) ((_ sign_extend 32) (currentByte!10735 b1!101)) ((_ sign_extend 32) (currentBit!10730 b1!101)) bytes!19))))

(declare-fun b!231190 () Bool)

(declare-fun res!193674 () Bool)

(assert (=> b!231190 (=> (not res!193674) (not e!158944))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231190 (= res!193674 (bvsle bits!86 (bitIndex!0 (size!5187 (buf!5728 b2!99)) (currentByte!10735 b2!99) (currentBit!10730 b2!99))))))

(declare-fun b!231191 () Bool)

(assert (=> b!231191 (= e!158944 false)))

(declare-fun lt!368616 () (_ BitVec 64))

(assert (=> b!231191 (= lt!368616 (bitIndex!0 (size!5187 (buf!5728 b1!101)) (currentByte!10735 b1!101) (currentBit!10730 b1!101)))))

(assert (= (and start!48874 res!193676) b!231190))

(assert (= (and b!231190 res!193674) b!231189))

(assert (= (and b!231189 res!193677) b!231188))

(assert (= (and b!231188 res!193675) b!231191))

(assert (= start!48874 b!231187))

(assert (= start!48874 b!231186))

(declare-fun m!354369 () Bool)

(assert (=> b!231190 m!354369))

(declare-fun m!354371 () Bool)

(assert (=> b!231187 m!354371))

(declare-fun m!354373 () Bool)

(assert (=> b!231186 m!354373))

(declare-fun m!354375 () Bool)

(assert (=> start!48874 m!354375))

(declare-fun m!354377 () Bool)

(assert (=> start!48874 m!354377))

(declare-fun m!354379 () Bool)

(assert (=> b!231188 m!354379))

(declare-fun m!354381 () Bool)

(assert (=> b!231191 m!354381))

(push 1)

