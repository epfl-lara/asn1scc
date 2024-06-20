; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15940 () Bool)

(assert start!15940)

(declare-fun b!80446 () Bool)

(declare-fun res!66556 () Bool)

(declare-fun e!52878 () Bool)

(assert (=> b!80446 (=> (not res!66556) (not e!52878))))

(declare-datatypes ((array!3525 0))(
  ( (array!3526 (arr!2236 (Array (_ BitVec 32) (_ BitVec 8))) (size!1626 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2814 0))(
  ( (BitStream!2815 (buf!2016 array!3525) (currentByte!3914 (_ BitVec 32)) (currentBit!3909 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5310 0))(
  ( (Unit!5311) )
))
(declare-datatypes ((tuple3!288 0))(
  ( (tuple3!289 (_1!3735 Unit!5310) (_2!3735 BitStream!2814) (_3!165 array!3525)) )
))
(declare-fun lt!127593 () tuple3!288)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!80446 (= res!66556 (invariant!0 (currentBit!3909 (_2!3735 lt!127593)) (currentByte!3914 (_2!3735 lt!127593)) (size!1626 (buf!2016 (_2!3735 lt!127593)))))))

(declare-fun b!80448 () Bool)

(declare-fun res!66552 () Bool)

(assert (=> b!80448 (=> (not res!66552) (not e!52878))))

(declare-fun thiss!1716 () BitStream!2814)

(declare-fun nBits!516 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!80448 (= res!66552 (= (bvadd (bitIndex!0 (size!1626 (buf!2016 thiss!1716)) (currentByte!3914 thiss!1716) (currentBit!3909 thiss!1716)) nBits!516) (bitIndex!0 (size!1626 (buf!2016 (_2!3735 lt!127593))) (currentByte!3914 (_2!3735 lt!127593)) (currentBit!3909 (_2!3735 lt!127593)))))))

(declare-fun b!80449 () Bool)

(declare-fun e!52880 () Bool)

(declare-fun array_inv!1472 (array!3525) Bool)

(assert (=> b!80449 (= e!52880 (array_inv!1472 (buf!2016 thiss!1716)))))

(declare-fun b!80450 () Bool)

(declare-fun res!66554 () Bool)

(declare-fun e!52879 () Bool)

(assert (=> b!80450 (=> (not res!66554) (not e!52879))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80450 (= res!66554 (validate_offset_bits!1 ((_ sign_extend 32) (size!1626 (buf!2016 thiss!1716))) ((_ sign_extend 32) (currentByte!3914 thiss!1716)) ((_ sign_extend 32) (currentBit!3909 thiss!1716)) nBits!516))))

(declare-fun b!80451 () Bool)

(assert (=> b!80451 (= e!52879 e!52878)))

(declare-fun res!66555 () Bool)

(assert (=> b!80451 (=> (not res!66555) (not e!52878))))

(assert (=> b!80451 (= res!66555 (= (buf!2016 (_2!3735 lt!127593)) (buf!2016 thiss!1716)))))

(declare-fun readBitsLoop!0 (BitStream!2814 (_ BitVec 64) array!3525 (_ BitVec 64) (_ BitVec 64)) tuple3!288)

(assert (=> b!80451 (= lt!127593 (readBitsLoop!0 thiss!1716 nBits!516 (array!3526 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(declare-fun res!66553 () Bool)

(assert (=> start!15940 (=> (not res!66553) (not e!52879))))

(assert (=> start!15940 (= res!66553 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15940 e!52879))

(assert (=> start!15940 true))

(declare-fun inv!12 (BitStream!2814) Bool)

(assert (=> start!15940 (and (inv!12 thiss!1716) e!52880)))

(declare-fun b!80447 () Bool)

(assert (=> b!80447 (= e!52878 (and (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 nBits!516) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!15940 res!66553) b!80450))

(assert (= (and b!80450 res!66554) b!80451))

(assert (= (and b!80451 res!66555) b!80448))

(assert (= (and b!80448 res!66552) b!80446))

(assert (= (and b!80446 res!66556) b!80447))

(assert (= start!15940 b!80449))

(declare-fun m!125975 () Bool)

(assert (=> b!80450 m!125975))

(declare-fun m!125977 () Bool)

(assert (=> b!80449 m!125977))

(declare-fun m!125979 () Bool)

(assert (=> b!80446 m!125979))

(declare-fun m!125981 () Bool)

(assert (=> start!15940 m!125981))

(declare-fun m!125983 () Bool)

(assert (=> b!80451 m!125983))

(declare-fun m!125985 () Bool)

(assert (=> b!80448 m!125985))

(declare-fun m!125987 () Bool)

(assert (=> b!80448 m!125987))

(check-sat (not b!80448) (not b!80450) (not b!80449) (not b!80446) (not start!15940) (not b!80451))
(check-sat)
