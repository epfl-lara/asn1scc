; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48910 () Bool)

(assert start!48910)

(declare-fun res!193926 () Bool)

(declare-fun e!159250 () Bool)

(assert (=> start!48910 (=> (not res!193926) (not e!159250))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11879 0))(
  ( (array!11880 (arr!6192 (Array (_ BitVec 32) (_ BitVec 8))) (size!5205 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9506 0))(
  ( (BitStream!9507 (buf!5746 array!11879) (currentByte!10753 (_ BitVec 32)) (currentBit!10748 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9506)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9506)

(assert (=> start!48910 (= res!193926 (and (= (size!5205 (buf!5746 b1!101)) (size!5205 (buf!5746 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48910 e!159250))

(declare-fun e!159247 () Bool)

(declare-fun inv!12 (BitStream!9506) Bool)

(assert (=> start!48910 (and (inv!12 b1!101) e!159247)))

(declare-fun e!159248 () Bool)

(assert (=> start!48910 (and (inv!12 b2!99) e!159248)))

(assert (=> start!48910 true))

(declare-fun b!231546 () Bool)

(declare-fun array_inv!4946 (array!11879) Bool)

(assert (=> b!231546 (= e!159247 (array_inv!4946 (buf!5746 b1!101)))))

(declare-fun b!231547 () Bool)

(declare-fun res!193928 () Bool)

(assert (=> b!231547 (=> (not res!193928) (not e!159250))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231547 (= res!193928 (bvsle bits!86 (bitIndex!0 (size!5205 (buf!5746 b2!99)) (currentByte!10753 b2!99) (currentBit!10748 b2!99))))))

(declare-fun b!231548 () Bool)

(declare-fun res!193927 () Bool)

(assert (=> b!231548 (=> (not res!193927) (not e!159250))))

(assert (=> b!231548 (= res!193927 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!231549 () Bool)

(assert (=> b!231549 (= e!159250 false)))

(declare-fun lt!368715 () (_ BitVec 64))

(assert (=> b!231549 (= lt!368715 (bitIndex!0 (size!5205 (buf!5746 b1!101)) (currentByte!10753 b1!101) (currentBit!10748 b1!101)))))

(declare-fun b!231550 () Bool)

(assert (=> b!231550 (= e!159248 (array_inv!4946 (buf!5746 b2!99)))))

(declare-fun b!231551 () Bool)

(declare-fun res!193929 () Bool)

(assert (=> b!231551 (=> (not res!193929) (not e!159250))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231551 (= res!193929 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5205 (buf!5746 b1!101))) ((_ sign_extend 32) (currentByte!10753 b1!101)) ((_ sign_extend 32) (currentBit!10748 b1!101)) bytes!19))))

(assert (= (and start!48910 res!193926) b!231547))

(assert (= (and b!231547 res!193928) b!231548))

(assert (= (and b!231548 res!193927) b!231551))

(assert (= (and b!231551 res!193929) b!231549))

(assert (= start!48910 b!231546))

(assert (= start!48910 b!231550))

(declare-fun m!354645 () Bool)

(assert (=> b!231549 m!354645))

(declare-fun m!354647 () Bool)

(assert (=> b!231546 m!354647))

(declare-fun m!354649 () Bool)

(assert (=> b!231550 m!354649))

(declare-fun m!354651 () Bool)

(assert (=> b!231547 m!354651))

(declare-fun m!354653 () Bool)

(assert (=> b!231551 m!354653))

(declare-fun m!354655 () Bool)

(assert (=> start!48910 m!354655))

(declare-fun m!354657 () Bool)

(assert (=> start!48910 m!354657))

(push 1)

(assert (not b!231547))

