; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15840 () Bool)

(assert start!15840)

(declare-fun b!79870 () Bool)

(declare-fun e!52469 () Bool)

(declare-datatypes ((array!3452 0))(
  ( (array!3453 (arr!2198 (Array (_ BitVec 32) (_ BitVec 8))) (size!1591 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2744 0))(
  ( (BitStream!2745 (buf!1981 array!3452) (currentByte!3873 (_ BitVec 32)) (currentBit!3868 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2744)

(declare-fun array_inv!1437 (array!3452) Bool)

(assert (=> b!79870 (= e!52469 (array_inv!1437 (buf!1981 thiss!1716)))))

(declare-fun b!79871 () Bool)

(declare-fun res!66099 () Bool)

(declare-fun e!52470 () Bool)

(assert (=> b!79871 (=> (not res!66099) (not e!52470))))

(declare-fun nBits!516 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79871 (= res!66099 (validate_offset_bits!1 ((_ sign_extend 32) (size!1591 (buf!1981 thiss!1716))) ((_ sign_extend 32) (currentByte!3873 thiss!1716)) ((_ sign_extend 32) (currentBit!3868 thiss!1716)) nBits!516))))

(declare-fun b!79872 () Bool)

(declare-fun res!66102 () Bool)

(declare-fun e!52467 () Bool)

(assert (=> b!79872 (=> res!66102 e!52467)))

(declare-datatypes ((Unit!5258 0))(
  ( (Unit!5259) )
))
(declare-datatypes ((tuple3!248 0))(
  ( (tuple3!249 (_1!3709 Unit!5258) (_2!3709 BitStream!2744) (_3!145 array!3452)) )
))
(declare-fun lt!127056 () tuple3!248)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!79872 (= res!66102 (not (invariant!0 (currentBit!3868 (_2!3709 lt!127056)) (currentByte!3873 (_2!3709 lt!127056)) (size!1591 (buf!1981 (_2!3709 lt!127056))))))))

(declare-fun res!66103 () Bool)

(assert (=> start!15840 (=> (not res!66103) (not e!52470))))

(assert (=> start!15840 (= res!66103 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15840 e!52470))

(assert (=> start!15840 true))

(declare-fun inv!12 (BitStream!2744) Bool)

(assert (=> start!15840 (and (inv!12 thiss!1716) e!52469)))

(declare-fun b!79873 () Bool)

(declare-fun res!66100 () Bool)

(assert (=> b!79873 (=> res!66100 e!52467)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!79873 (= res!66100 (not (= (bvadd (bitIndex!0 (size!1591 (buf!1981 thiss!1716)) (currentByte!3873 thiss!1716) (currentBit!3868 thiss!1716)) nBits!516) (bitIndex!0 (size!1591 (buf!1981 (_2!3709 lt!127056))) (currentByte!3873 (_2!3709 lt!127056)) (currentBit!3868 (_2!3709 lt!127056))))))))

(declare-fun b!79874 () Bool)

(assert (=> b!79874 (= e!52470 false)))

(declare-fun lt!127054 () Bool)

(assert (=> b!79874 (= lt!127054 e!52467)))

(declare-fun res!66101 () Bool)

(assert (=> b!79874 (=> res!66101 e!52467)))

(assert (=> b!79874 (= res!66101 (not (= (buf!1981 (_2!3709 lt!127056)) (buf!1981 thiss!1716))))))

(declare-fun lt!127055 () (_ BitVec 32))

(declare-fun readBitsLoop!0 (BitStream!2744 (_ BitVec 64) array!3452 (_ BitVec 64) (_ BitVec 64)) tuple3!248)

(assert (=> b!79874 (= lt!127056 (readBitsLoop!0 thiss!1716 nBits!516 (array!3453 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!127055) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(assert (=> b!79874 (= lt!127055 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!79875 () Bool)

(assert (=> b!79875 (= e!52467 (or (not (= (size!1591 (_3!145 lt!127056)) lt!127055)) (bvsgt (currentByte!3873 thiss!1716) (currentByte!3873 (_2!3709 lt!127056)))))))

(assert (= (and start!15840 res!66103) b!79871))

(assert (= (and b!79871 res!66099) b!79874))

(assert (= (and b!79874 (not res!66101)) b!79873))

(assert (= (and b!79873 (not res!66100)) b!79872))

(assert (= (and b!79872 (not res!66102)) b!79875))

(assert (= start!15840 b!79870))

(declare-fun m!125437 () Bool)

(assert (=> start!15840 m!125437))

(declare-fun m!125439 () Bool)

(assert (=> b!79874 m!125439))

(declare-fun m!125441 () Bool)

(assert (=> b!79872 m!125441))

(declare-fun m!125443 () Bool)

(assert (=> b!79871 m!125443))

(declare-fun m!125445 () Bool)

(assert (=> b!79870 m!125445))

(declare-fun m!125447 () Bool)

(assert (=> b!79873 m!125447))

(declare-fun m!125449 () Bool)

(assert (=> b!79873 m!125449))

(push 1)

(assert (not start!15840))

(assert (not b!79874))

(assert (not b!79872))

(assert (not b!79873))

(assert (not b!79870))

(assert (not b!79871))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

