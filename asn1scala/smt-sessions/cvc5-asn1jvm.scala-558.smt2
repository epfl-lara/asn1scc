; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15950 () Bool)

(assert start!15950)

(declare-fun b!80534 () Bool)

(declare-fun e!52938 () Bool)

(assert (=> b!80534 (= e!52938 false)))

(declare-fun lt!127620 () Bool)

(declare-fun e!52941 () Bool)

(assert (=> b!80534 (= lt!127620 e!52941)))

(declare-fun res!66626 () Bool)

(assert (=> b!80534 (=> res!66626 e!52941)))

(declare-datatypes ((array!3535 0))(
  ( (array!3536 (arr!2241 (Array (_ BitVec 32) (_ BitVec 8))) (size!1631 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2824 0))(
  ( (BitStream!2825 (buf!2021 array!3535) (currentByte!3919 (_ BitVec 32)) (currentBit!3914 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5320 0))(
  ( (Unit!5321) )
))
(declare-datatypes ((tuple3!298 0))(
  ( (tuple3!299 (_1!3740 Unit!5320) (_2!3740 BitStream!2824) (_3!170 array!3535)) )
))
(declare-fun lt!127619 () tuple3!298)

(declare-fun thiss!1716 () BitStream!2824)

(assert (=> b!80534 (= res!66626 (not (= (buf!2021 (_2!3740 lt!127619)) (buf!2021 thiss!1716))))))

(declare-fun nBits!516 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!2824 (_ BitVec 64) array!3535 (_ BitVec 64) (_ BitVec 64)) tuple3!298)

(assert (=> b!80534 (= lt!127619 (readBitsLoop!0 thiss!1716 nBits!516 (array!3536 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(declare-fun b!80535 () Bool)

(declare-fun e!52939 () Bool)

(declare-fun array_inv!1477 (array!3535) Bool)

(assert (=> b!80535 (= e!52939 (array_inv!1477 (buf!2021 thiss!1716)))))

(declare-fun b!80536 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!80536 (= e!52941 (not (invariant!0 (currentBit!3914 (_2!3740 lt!127619)) (currentByte!3919 (_2!3740 lt!127619)) (size!1631 (buf!2021 (_2!3740 lt!127619))))))))

(declare-fun res!66628 () Bool)

(assert (=> start!15950 (=> (not res!66628) (not e!52938))))

(assert (=> start!15950 (= res!66628 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15950 e!52938))

(assert (=> start!15950 true))

(declare-fun inv!12 (BitStream!2824) Bool)

(assert (=> start!15950 (and (inv!12 thiss!1716) e!52939)))

(declare-fun b!80537 () Bool)

(declare-fun res!66625 () Bool)

(assert (=> b!80537 (=> (not res!66625) (not e!52938))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80537 (= res!66625 (validate_offset_bits!1 ((_ sign_extend 32) (size!1631 (buf!2021 thiss!1716))) ((_ sign_extend 32) (currentByte!3919 thiss!1716)) ((_ sign_extend 32) (currentBit!3914 thiss!1716)) nBits!516))))

(declare-fun b!80538 () Bool)

(declare-fun res!66627 () Bool)

(assert (=> b!80538 (=> res!66627 e!52941)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!80538 (= res!66627 (not (= (bvadd (bitIndex!0 (size!1631 (buf!2021 thiss!1716)) (currentByte!3919 thiss!1716) (currentBit!3914 thiss!1716)) nBits!516) (bitIndex!0 (size!1631 (buf!2021 (_2!3740 lt!127619))) (currentByte!3919 (_2!3740 lt!127619)) (currentBit!3914 (_2!3740 lt!127619))))))))

(assert (= (and start!15950 res!66628) b!80537))

(assert (= (and b!80537 res!66625) b!80534))

(assert (= (and b!80534 (not res!66626)) b!80538))

(assert (= (and b!80538 (not res!66627)) b!80536))

(assert (= start!15950 b!80535))

(declare-fun m!126045 () Bool)

(assert (=> start!15950 m!126045))

(declare-fun m!126047 () Bool)

(assert (=> b!80538 m!126047))

(declare-fun m!126049 () Bool)

(assert (=> b!80538 m!126049))

(declare-fun m!126051 () Bool)

(assert (=> b!80535 m!126051))

(declare-fun m!126053 () Bool)

(assert (=> b!80536 m!126053))

(declare-fun m!126055 () Bool)

(assert (=> b!80534 m!126055))

(declare-fun m!126057 () Bool)

(assert (=> b!80537 m!126057))

(push 1)

(assert (not b!80534))

(assert (not b!80538))

(assert (not start!15950))

(assert (not b!80536))

(assert (not b!80537))

(assert (not b!80535))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

