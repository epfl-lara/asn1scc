; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15938 () Bool)

(assert start!15938)

(declare-fun b!80428 () Bool)

(declare-fun e!52867 () Bool)

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> b!80428 (= e!52867 (and (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 nBits!516) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!80429 () Bool)

(declare-fun res!66540 () Bool)

(assert (=> b!80429 (=> (not res!66540) (not e!52867))))

(declare-datatypes ((array!3523 0))(
  ( (array!3524 (arr!2235 (Array (_ BitVec 32) (_ BitVec 8))) (size!1625 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2812 0))(
  ( (BitStream!2813 (buf!2015 array!3523) (currentByte!3913 (_ BitVec 32)) (currentBit!3908 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5308 0))(
  ( (Unit!5309) )
))
(declare-datatypes ((tuple3!286 0))(
  ( (tuple3!287 (_1!3734 Unit!5308) (_2!3734 BitStream!2812) (_3!164 array!3523)) )
))
(declare-fun lt!127590 () tuple3!286)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!80429 (= res!66540 (invariant!0 (currentBit!3908 (_2!3734 lt!127590)) (currentByte!3913 (_2!3734 lt!127590)) (size!1625 (buf!2015 (_2!3734 lt!127590)))))))

(declare-fun b!80430 () Bool)

(declare-fun res!66537 () Bool)

(declare-fun e!52869 () Bool)

(assert (=> b!80430 (=> (not res!66537) (not e!52869))))

(declare-fun thiss!1716 () BitStream!2812)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80430 (= res!66537 (validate_offset_bits!1 ((_ sign_extend 32) (size!1625 (buf!2015 thiss!1716))) ((_ sign_extend 32) (currentByte!3913 thiss!1716)) ((_ sign_extend 32) (currentBit!3908 thiss!1716)) nBits!516))))

(declare-fun b!80432 () Bool)

(declare-fun res!66541 () Bool)

(assert (=> b!80432 (=> (not res!66541) (not e!52867))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!80432 (= res!66541 (= (bvadd (bitIndex!0 (size!1625 (buf!2015 thiss!1716)) (currentByte!3913 thiss!1716) (currentBit!3908 thiss!1716)) nBits!516) (bitIndex!0 (size!1625 (buf!2015 (_2!3734 lt!127590))) (currentByte!3913 (_2!3734 lt!127590)) (currentBit!3908 (_2!3734 lt!127590)))))))

(declare-fun b!80433 () Bool)

(assert (=> b!80433 (= e!52869 e!52867)))

(declare-fun res!66538 () Bool)

(assert (=> b!80433 (=> (not res!66538) (not e!52867))))

(assert (=> b!80433 (= res!66538 (= (buf!2015 (_2!3734 lt!127590)) (buf!2015 thiss!1716)))))

(declare-fun readBitsLoop!0 (BitStream!2812 (_ BitVec 64) array!3523 (_ BitVec 64) (_ BitVec 64)) tuple3!286)

(assert (=> b!80433 (= lt!127590 (readBitsLoop!0 thiss!1716 nBits!516 (array!3524 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(declare-fun b!80431 () Bool)

(declare-fun e!52868 () Bool)

(declare-fun array_inv!1471 (array!3523) Bool)

(assert (=> b!80431 (= e!52868 (array_inv!1471 (buf!2015 thiss!1716)))))

(declare-fun res!66539 () Bool)

(assert (=> start!15938 (=> (not res!66539) (not e!52869))))

(assert (=> start!15938 (= res!66539 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15938 e!52869))

(assert (=> start!15938 true))

(declare-fun inv!12 (BitStream!2812) Bool)

(assert (=> start!15938 (and (inv!12 thiss!1716) e!52868)))

(assert (= (and start!15938 res!66539) b!80430))

(assert (= (and b!80430 res!66537) b!80433))

(assert (= (and b!80433 res!66538) b!80432))

(assert (= (and b!80432 res!66541) b!80429))

(assert (= (and b!80429 res!66540) b!80428))

(assert (= start!15938 b!80431))

(declare-fun m!125961 () Bool)

(assert (=> b!80431 m!125961))

(declare-fun m!125963 () Bool)

(assert (=> start!15938 m!125963))

(declare-fun m!125965 () Bool)

(assert (=> b!80430 m!125965))

(declare-fun m!125967 () Bool)

(assert (=> b!80432 m!125967))

(declare-fun m!125969 () Bool)

(assert (=> b!80432 m!125969))

(declare-fun m!125971 () Bool)

(assert (=> b!80429 m!125971))

(declare-fun m!125973 () Bool)

(assert (=> b!80433 m!125973))

(push 1)

(assert (not start!15938))

(assert (not b!80431))

(assert (not b!80432))

(assert (not b!80429))

(assert (not b!80430))

(assert (not b!80433))

(check-sat)

(pop 1)

(push 1)

(check-sat)

