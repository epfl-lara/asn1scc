; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15846 () Bool)

(assert start!15846)

(declare-fun lt!127082 () (_ BitVec 32))

(declare-datatypes ((array!3458 0))(
  ( (array!3459 (arr!2201 (Array (_ BitVec 32) (_ BitVec 8))) (size!1594 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2750 0))(
  ( (BitStream!2751 (buf!1984 array!3458) (currentByte!3876 (_ BitVec 32)) (currentBit!3871 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2750)

(declare-fun b!79924 () Bool)

(declare-datatypes ((Unit!5264 0))(
  ( (Unit!5265) )
))
(declare-datatypes ((tuple3!254 0))(
  ( (tuple3!255 (_1!3712 Unit!5264) (_2!3712 BitStream!2750) (_3!148 array!3458)) )
))
(declare-fun lt!127083 () tuple3!254)

(declare-fun e!52506 () Bool)

(assert (=> b!79924 (= e!52506 (or (not (= (size!1594 (_3!148 lt!127083)) lt!127082)) (bvsgt (currentByte!3876 thiss!1716) (currentByte!3876 (_2!3712 lt!127083)))))))

(declare-fun b!79925 () Bool)

(declare-fun res!66145 () Bool)

(declare-fun e!52504 () Bool)

(assert (=> b!79925 (=> (not res!66145) (not e!52504))))

(declare-fun nBits!516 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79925 (= res!66145 (validate_offset_bits!1 ((_ sign_extend 32) (size!1594 (buf!1984 thiss!1716))) ((_ sign_extend 32) (currentByte!3876 thiss!1716)) ((_ sign_extend 32) (currentBit!3871 thiss!1716)) nBits!516))))

(declare-fun res!66147 () Bool)

(assert (=> start!15846 (=> (not res!66147) (not e!52504))))

(assert (=> start!15846 (= res!66147 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15846 e!52504))

(assert (=> start!15846 true))

(declare-fun e!52503 () Bool)

(declare-fun inv!12 (BitStream!2750) Bool)

(assert (=> start!15846 (and (inv!12 thiss!1716) e!52503)))

(declare-fun b!79926 () Bool)

(declare-fun res!66144 () Bool)

(assert (=> b!79926 (=> res!66144 e!52506)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!79926 (= res!66144 (not (invariant!0 (currentBit!3871 (_2!3712 lt!127083)) (currentByte!3876 (_2!3712 lt!127083)) (size!1594 (buf!1984 (_2!3712 lt!127083))))))))

(declare-fun b!79927 () Bool)

(declare-fun array_inv!1440 (array!3458) Bool)

(assert (=> b!79927 (= e!52503 (array_inv!1440 (buf!1984 thiss!1716)))))

(declare-fun b!79928 () Bool)

(assert (=> b!79928 (= e!52504 false)))

(declare-fun lt!127081 () Bool)

(assert (=> b!79928 (= lt!127081 e!52506)))

(declare-fun res!66146 () Bool)

(assert (=> b!79928 (=> res!66146 e!52506)))

(assert (=> b!79928 (= res!66146 (not (= (buf!1984 (_2!3712 lt!127083)) (buf!1984 thiss!1716))))))

(declare-fun readBitsLoop!0 (BitStream!2750 (_ BitVec 64) array!3458 (_ BitVec 64) (_ BitVec 64)) tuple3!254)

(assert (=> b!79928 (= lt!127083 (readBitsLoop!0 thiss!1716 nBits!516 (array!3459 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!127082) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(assert (=> b!79928 (= lt!127082 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!79929 () Bool)

(declare-fun res!66148 () Bool)

(assert (=> b!79929 (=> res!66148 e!52506)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!79929 (= res!66148 (not (= (bvadd (bitIndex!0 (size!1594 (buf!1984 thiss!1716)) (currentByte!3876 thiss!1716) (currentBit!3871 thiss!1716)) nBits!516) (bitIndex!0 (size!1594 (buf!1984 (_2!3712 lt!127083))) (currentByte!3876 (_2!3712 lt!127083)) (currentBit!3871 (_2!3712 lt!127083))))))))

(assert (= (and start!15846 res!66147) b!79925))

(assert (= (and b!79925 res!66145) b!79928))

(assert (= (and b!79928 (not res!66146)) b!79929))

(assert (= (and b!79929 (not res!66148)) b!79926))

(assert (= (and b!79926 (not res!66144)) b!79924))

(assert (= start!15846 b!79927))

(declare-fun m!125479 () Bool)

(assert (=> b!79928 m!125479))

(declare-fun m!125481 () Bool)

(assert (=> b!79925 m!125481))

(declare-fun m!125483 () Bool)

(assert (=> b!79926 m!125483))

(declare-fun m!125485 () Bool)

(assert (=> start!15846 m!125485))

(declare-fun m!125487 () Bool)

(assert (=> b!79929 m!125487))

(declare-fun m!125489 () Bool)

(assert (=> b!79929 m!125489))

(declare-fun m!125491 () Bool)

(assert (=> b!79927 m!125491))

(push 1)

(assert (not b!79929))

(assert (not b!79928))

(assert (not b!79927))

(assert (not start!15846))

(assert (not b!79925))

(assert (not b!79926))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

