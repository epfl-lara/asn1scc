; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15944 () Bool)

(assert start!15944)

(declare-fun b!80482 () Bool)

(declare-fun res!66583 () Bool)

(declare-fun e!52904 () Bool)

(assert (=> b!80482 (=> (not res!66583) (not e!52904))))

(declare-datatypes ((array!3529 0))(
  ( (array!3530 (arr!2238 (Array (_ BitVec 32) (_ BitVec 8))) (size!1628 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2818 0))(
  ( (BitStream!2819 (buf!2018 array!3529) (currentByte!3916 (_ BitVec 32)) (currentBit!3911 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2818)

(declare-fun nBits!516 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80482 (= res!66583 (validate_offset_bits!1 ((_ sign_extend 32) (size!1628 (buf!2018 thiss!1716))) ((_ sign_extend 32) (currentByte!3916 thiss!1716)) ((_ sign_extend 32) (currentBit!3911 thiss!1716)) nBits!516))))

(declare-fun b!80483 () Bool)

(declare-fun e!52905 () Bool)

(assert (=> b!80483 (= e!52904 e!52905)))

(declare-fun res!66585 () Bool)

(assert (=> b!80483 (=> (not res!66585) (not e!52905))))

(declare-datatypes ((Unit!5314 0))(
  ( (Unit!5315) )
))
(declare-datatypes ((tuple3!292 0))(
  ( (tuple3!293 (_1!3737 Unit!5314) (_2!3737 BitStream!2818) (_3!167 array!3529)) )
))
(declare-fun lt!127601 () tuple3!292)

(assert (=> b!80483 (= res!66585 (= (buf!2018 (_2!3737 lt!127601)) (buf!2018 thiss!1716)))))

(declare-fun readBitsLoop!0 (BitStream!2818 (_ BitVec 64) array!3529 (_ BitVec 64) (_ BitVec 64)) tuple3!292)

(assert (=> b!80483 (= lt!127601 (readBitsLoop!0 thiss!1716 nBits!516 (array!3530 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(declare-fun res!66586 () Bool)

(assert (=> start!15944 (=> (not res!66586) (not e!52904))))

(assert (=> start!15944 (= res!66586 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15944 e!52904))

(assert (=> start!15944 true))

(declare-fun e!52903 () Bool)

(declare-fun inv!12 (BitStream!2818) Bool)

(assert (=> start!15944 (and (inv!12 thiss!1716) e!52903)))

(declare-fun b!80484 () Bool)

(declare-fun res!66582 () Bool)

(assert (=> b!80484 (=> (not res!66582) (not e!52905))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!80484 (= res!66582 (invariant!0 (currentBit!3911 (_2!3737 lt!127601)) (currentByte!3916 (_2!3737 lt!127601)) (size!1628 (buf!2018 (_2!3737 lt!127601)))))))

(declare-fun b!80485 () Bool)

(declare-fun array_inv!1474 (array!3529) Bool)

(assert (=> b!80485 (= e!52903 (array_inv!1474 (buf!2018 thiss!1716)))))

(declare-fun b!80486 () Bool)

(declare-fun lt!127602 () (_ BitVec 64))

(assert (=> b!80486 (= e!52905 (and (not (= lt!127602 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!127602 (bvand (bvadd nBits!516 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!80486 (= lt!127602 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 nBits!516) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!80487 () Bool)

(declare-fun res!66584 () Bool)

(assert (=> b!80487 (=> (not res!66584) (not e!52905))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!80487 (= res!66584 (= (bvadd (bitIndex!0 (size!1628 (buf!2018 thiss!1716)) (currentByte!3916 thiss!1716) (currentBit!3911 thiss!1716)) nBits!516) (bitIndex!0 (size!1628 (buf!2018 (_2!3737 lt!127601))) (currentByte!3916 (_2!3737 lt!127601)) (currentBit!3911 (_2!3737 lt!127601)))))))

(assert (= (and start!15944 res!66586) b!80482))

(assert (= (and b!80482 res!66583) b!80483))

(assert (= (and b!80483 res!66585) b!80487))

(assert (= (and b!80487 res!66584) b!80484))

(assert (= (and b!80484 res!66582) b!80486))

(assert (= start!15944 b!80485))

(declare-fun m!126003 () Bool)

(assert (=> b!80485 m!126003))

(declare-fun m!126005 () Bool)

(assert (=> b!80487 m!126005))

(declare-fun m!126007 () Bool)

(assert (=> b!80487 m!126007))

(declare-fun m!126009 () Bool)

(assert (=> start!15944 m!126009))

(declare-fun m!126011 () Bool)

(assert (=> b!80484 m!126011))

(declare-fun m!126013 () Bool)

(assert (=> b!80482 m!126013))

(declare-fun m!126015 () Bool)

(assert (=> b!80483 m!126015))

(push 1)

(assert (not b!80484))

(assert (not start!15944))

(assert (not b!80485))

(assert (not b!80483))

(assert (not b!80482))

(assert (not b!80487))

(check-sat)

(pop 1)

(push 1)

(check-sat)

