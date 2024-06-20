; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15968 () Bool)

(assert start!15968)

(declare-fun b!80680 () Bool)

(declare-fun res!66745 () Bool)

(declare-fun e!53048 () Bool)

(assert (=> b!80680 (=> (not res!66745) (not e!53048))))

(declare-datatypes ((array!3553 0))(
  ( (array!3554 (arr!2250 (Array (_ BitVec 32) (_ BitVec 8))) (size!1640 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2842 0))(
  ( (BitStream!2843 (buf!2030 array!3553) (currentByte!3928 (_ BitVec 32)) (currentBit!3923 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2842)

(declare-fun nBits!516 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80680 (= res!66745 (validate_offset_bits!1 ((_ sign_extend 32) (size!1640 (buf!2030 thiss!1716))) ((_ sign_extend 32) (currentByte!3928 thiss!1716)) ((_ sign_extend 32) (currentBit!3923 thiss!1716)) nBits!516))))

(declare-fun b!80681 () Bool)

(declare-fun e!53047 () Bool)

(declare-fun array_inv!1486 (array!3553) Bool)

(assert (=> b!80681 (= e!53047 (array_inv!1486 (buf!2030 thiss!1716)))))

(declare-fun b!80682 () Bool)

(declare-fun e!53046 () Bool)

(assert (=> b!80682 (= e!53048 e!53046)))

(declare-fun res!66744 () Bool)

(assert (=> b!80682 (=> (not res!66744) (not e!53046))))

(declare-datatypes ((Unit!5338 0))(
  ( (Unit!5339) )
))
(declare-datatypes ((tuple3!316 0))(
  ( (tuple3!317 (_1!3749 Unit!5338) (_2!3749 BitStream!2842) (_3!179 array!3553)) )
))
(declare-fun lt!127673 () tuple3!316)

(assert (=> b!80682 (= res!66744 (= (buf!2030 (_2!3749 lt!127673)) (buf!2030 thiss!1716)))))

(declare-fun lt!127674 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!2842 (_ BitVec 64) array!3553 (_ BitVec 64) (_ BitVec 64)) tuple3!316)

(assert (=> b!80682 (= lt!127673 (readBitsLoop!0 thiss!1716 nBits!516 (array!3554 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) lt!127674)) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(assert (=> b!80682 (= lt!127674 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!80683 () Bool)

(declare-fun res!66746 () Bool)

(assert (=> b!80683 (=> (not res!66746) (not e!53046))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!80683 (= res!66746 (= (bvadd (bitIndex!0 (size!1640 (buf!2030 thiss!1716)) (currentByte!3928 thiss!1716) (currentBit!3923 thiss!1716)) nBits!516) (bitIndex!0 (size!1640 (buf!2030 (_2!3749 lt!127673))) (currentByte!3928 (_2!3749 lt!127673)) (currentBit!3923 (_2!3749 lt!127673)))))))

(declare-fun res!66747 () Bool)

(assert (=> start!15968 (=> (not res!66747) (not e!53048))))

(assert (=> start!15968 (= res!66747 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15968 e!53048))

(assert (=> start!15968 true))

(declare-fun inv!12 (BitStream!2842) Bool)

(assert (=> start!15968 (and (inv!12 thiss!1716) e!53047)))

(declare-fun b!80684 () Bool)

(declare-fun res!66748 () Bool)

(assert (=> b!80684 (=> (not res!66748) (not e!53046))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!80684 (= res!66748 (invariant!0 (currentBit!3923 (_2!3749 lt!127673)) (currentByte!3928 (_2!3749 lt!127673)) (size!1640 (buf!2030 (_2!3749 lt!127673)))))))

(declare-fun b!80685 () Bool)

(assert (=> b!80685 (= e!53046 (and (bvslt lt!127674 #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt lt!127674 #b1111111111111111111111111111111110000000000000000000000000000000)))))

(assert (= (and start!15968 res!66747) b!80680))

(assert (= (and b!80680 res!66745) b!80682))

(assert (= (and b!80682 res!66744) b!80683))

(assert (= (and b!80683 res!66746) b!80684))

(assert (= (and b!80684 res!66748) b!80685))

(assert (= start!15968 b!80681))

(declare-fun m!126171 () Bool)

(assert (=> b!80680 m!126171))

(declare-fun m!126173 () Bool)

(assert (=> start!15968 m!126173))

(declare-fun m!126175 () Bool)

(assert (=> b!80684 m!126175))

(declare-fun m!126177 () Bool)

(assert (=> b!80681 m!126177))

(declare-fun m!126179 () Bool)

(assert (=> b!80682 m!126179))

(declare-fun m!126181 () Bool)

(assert (=> b!80683 m!126181))

(declare-fun m!126183 () Bool)

(assert (=> b!80683 m!126183))

(push 1)

(assert (not b!80680))

(assert (not b!80681))

(assert (not b!80683))

(assert (not start!15968))

(assert (not b!80684))

(assert (not b!80682))

(check-sat)

(pop 1)

(push 1)

(check-sat)

