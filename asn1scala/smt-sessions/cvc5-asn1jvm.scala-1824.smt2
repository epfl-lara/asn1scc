; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49056 () Bool)

(assert start!49056)

(declare-fun res!194975 () Bool)

(declare-fun e!160513 () Bool)

(assert (=> start!49056 (=> (not res!194975) (not e!160513))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!12025 0))(
  ( (array!12026 (arr!6265 (Array (_ BitVec 32) (_ BitVec 8))) (size!5278 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9652 0))(
  ( (BitStream!9653 (buf!5819 array!12025) (currentByte!10826 (_ BitVec 32)) (currentBit!10821 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9652)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9652)

(assert (=> start!49056 (= res!194975 (and (= (size!5278 (buf!5819 b1!101)) (size!5278 (buf!5819 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49056 e!160513))

(declare-fun e!160514 () Bool)

(declare-fun inv!12 (BitStream!9652) Bool)

(assert (=> start!49056 (and (inv!12 b1!101) e!160514)))

(declare-fun e!160517 () Bool)

(assert (=> start!49056 (and (inv!12 b2!99) e!160517)))

(assert (=> start!49056 true))

(declare-fun b!233031 () Bool)

(declare-fun array_inv!5019 (array!12025) Bool)

(assert (=> b!233031 (= e!160517 (array_inv!5019 (buf!5819 b2!99)))))

(declare-fun b!233032 () Bool)

(assert (=> b!233032 (= e!160513 false)))

(declare-fun lt!369087 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233032 (= lt!369087 (bitIndex!0 (size!5278 (buf!5819 b1!101)) (currentByte!10826 b1!101) (currentBit!10821 b1!101)))))

(declare-fun b!233033 () Bool)

(declare-fun res!194976 () Bool)

(assert (=> b!233033 (=> (not res!194976) (not e!160513))))

(assert (=> b!233033 (= res!194976 (bvsle bits!86 (bitIndex!0 (size!5278 (buf!5819 b2!99)) (currentByte!10826 b2!99) (currentBit!10821 b2!99))))))

(declare-fun b!233034 () Bool)

(declare-fun res!194974 () Bool)

(assert (=> b!233034 (=> (not res!194974) (not e!160513))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233034 (= res!194974 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5278 (buf!5819 b1!101))) ((_ sign_extend 32) (currentByte!10826 b1!101)) ((_ sign_extend 32) (currentBit!10821 b1!101)) bytes!19))))

(declare-fun b!233035 () Bool)

(declare-fun res!194973 () Bool)

(assert (=> b!233035 (=> (not res!194973) (not e!160513))))

(assert (=> b!233035 (= res!194973 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!233036 () Bool)

(assert (=> b!233036 (= e!160514 (array_inv!5019 (buf!5819 b1!101)))))

(assert (= (and start!49056 res!194975) b!233033))

(assert (= (and b!233033 res!194976) b!233035))

(assert (= (and b!233035 res!194973) b!233034))

(assert (= (and b!233034 res!194974) b!233032))

(assert (= start!49056 b!233036))

(assert (= start!49056 b!233031))

(declare-fun m!355769 () Bool)

(assert (=> start!49056 m!355769))

(declare-fun m!355771 () Bool)

(assert (=> start!49056 m!355771))

(declare-fun m!355773 () Bool)

(assert (=> b!233036 m!355773))

(declare-fun m!355775 () Bool)

(assert (=> b!233033 m!355775))

(declare-fun m!355777 () Bool)

(assert (=> b!233032 m!355777))

(declare-fun m!355779 () Bool)

(assert (=> b!233031 m!355779))

(declare-fun m!355781 () Bool)

(assert (=> b!233034 m!355781))

(push 1)

(assert (not b!233032))

(assert (not b!233031))

(assert (not start!49056))

(assert (not b!233033))

(assert (not b!233034))

(assert (not b!233036))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

