; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15864 () Bool)

(assert start!15864)

(declare-fun b!80086 () Bool)

(declare-fun res!66282 () Bool)

(declare-fun e!52611 () Bool)

(assert (=> b!80086 (=> res!66282 e!52611)))

(declare-datatypes ((array!3476 0))(
  ( (array!3477 (arr!2210 (Array (_ BitVec 32) (_ BitVec 8))) (size!1603 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2768 0))(
  ( (BitStream!2769 (buf!1993 array!3476) (currentByte!3885 (_ BitVec 32)) (currentBit!3880 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5282 0))(
  ( (Unit!5283) )
))
(declare-datatypes ((tuple3!272 0))(
  ( (tuple3!273 (_1!3721 Unit!5282) (_2!3721 BitStream!2768) (_3!157 array!3476)) )
))
(declare-fun lt!127146 () tuple3!272)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!80086 (= res!66282 (not (invariant!0 (currentBit!3880 (_2!3721 lt!127146)) (currentByte!3885 (_2!3721 lt!127146)) (size!1603 (buf!1993 (_2!3721 lt!127146))))))))

(declare-fun b!80087 () Bool)

(declare-fun e!52614 () Bool)

(declare-fun thiss!1716 () BitStream!2768)

(declare-fun array_inv!1449 (array!3476) Bool)

(assert (=> b!80087 (= e!52614 (array_inv!1449 (buf!1993 thiss!1716)))))

(declare-fun res!66283 () Bool)

(declare-fun e!52613 () Bool)

(assert (=> start!15864 (=> (not res!66283) (not e!52613))))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> start!15864 (= res!66283 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15864 e!52613))

(assert (=> start!15864 true))

(declare-fun inv!12 (BitStream!2768) Bool)

(assert (=> start!15864 (and (inv!12 thiss!1716) e!52614)))

(declare-fun b!80088 () Bool)

(declare-fun res!66280 () Bool)

(assert (=> b!80088 (=> (not res!66280) (not e!52613))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80088 (= res!66280 (validate_offset_bits!1 ((_ sign_extend 32) (size!1603 (buf!1993 thiss!1716))) ((_ sign_extend 32) (currentByte!3885 thiss!1716)) ((_ sign_extend 32) (currentBit!3880 thiss!1716)) nBits!516))))

(declare-fun b!80089 () Bool)

(declare-fun res!66281 () Bool)

(assert (=> b!80089 (=> res!66281 e!52611)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!80089 (= res!66281 (not (= (bvadd (bitIndex!0 (size!1603 (buf!1993 thiss!1716)) (currentByte!3885 thiss!1716) (currentBit!3880 thiss!1716)) nBits!516) (bitIndex!0 (size!1603 (buf!1993 (_2!3721 lt!127146))) (currentByte!3885 (_2!3721 lt!127146)) (currentBit!3880 (_2!3721 lt!127146))))))))

(declare-fun b!80090 () Bool)

(declare-fun lt!127144 () (_ BitVec 32))

(assert (=> b!80090 (= e!52611 (or (not (= (size!1603 (_3!157 lt!127146)) lt!127144)) (bvsgt (currentByte!3885 thiss!1716) (currentByte!3885 (_2!3721 lt!127146)))))))

(declare-fun b!80091 () Bool)

(assert (=> b!80091 (= e!52613 false)))

(declare-fun lt!127145 () Bool)

(assert (=> b!80091 (= lt!127145 e!52611)))

(declare-fun res!66279 () Bool)

(assert (=> b!80091 (=> res!66279 e!52611)))

(assert (=> b!80091 (= res!66279 (not (= (buf!1993 (_2!3721 lt!127146)) (buf!1993 thiss!1716))))))

(declare-fun readBitsLoop!0 (BitStream!2768 (_ BitVec 64) array!3476 (_ BitVec 64) (_ BitVec 64)) tuple3!272)

(assert (=> b!80091 (= lt!127146 (readBitsLoop!0 thiss!1716 nBits!516 (array!3477 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!127144) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(assert (=> b!80091 (= lt!127144 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and start!15864 res!66283) b!80088))

(assert (= (and b!80088 res!66280) b!80091))

(assert (= (and b!80091 (not res!66279)) b!80089))

(assert (= (and b!80089 (not res!66281)) b!80086))

(assert (= (and b!80086 (not res!66282)) b!80090))

(assert (= start!15864 b!80087))

(declare-fun m!125605 () Bool)

(assert (=> b!80087 m!125605))

(declare-fun m!125607 () Bool)

(assert (=> b!80091 m!125607))

(declare-fun m!125609 () Bool)

(assert (=> b!80089 m!125609))

(declare-fun m!125611 () Bool)

(assert (=> b!80089 m!125611))

(declare-fun m!125613 () Bool)

(assert (=> b!80086 m!125613))

(declare-fun m!125615 () Bool)

(assert (=> b!80088 m!125615))

(declare-fun m!125617 () Bool)

(assert (=> start!15864 m!125617))

(push 1)

(assert (not b!80087))

(assert (not start!15864))

(assert (not b!80091))

(assert (not b!80089))

(assert (not b!80086))

(assert (not b!80088))

(check-sat)

(pop 1)

(push 1)

(check-sat)

