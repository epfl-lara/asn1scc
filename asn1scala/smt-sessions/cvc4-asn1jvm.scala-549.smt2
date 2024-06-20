; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15870 () Bool)

(assert start!15870)

(declare-fun b!80140 () Bool)

(declare-fun res!66328 () Bool)

(declare-fun e!52648 () Bool)

(assert (=> b!80140 (=> (not res!66328) (not e!52648))))

(declare-datatypes ((array!3482 0))(
  ( (array!3483 (arr!2213 (Array (_ BitVec 32) (_ BitVec 8))) (size!1606 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2774 0))(
  ( (BitStream!2775 (buf!1996 array!3482) (currentByte!3888 (_ BitVec 32)) (currentBit!3883 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2774)

(declare-fun nBits!516 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80140 (= res!66328 (validate_offset_bits!1 ((_ sign_extend 32) (size!1606 (buf!1996 thiss!1716))) ((_ sign_extend 32) (currentByte!3888 thiss!1716)) ((_ sign_extend 32) (currentBit!3883 thiss!1716)) nBits!516))))

(declare-fun b!80141 () Bool)

(assert (=> b!80141 (= e!52648 false)))

(declare-fun lt!127173 () Bool)

(declare-fun e!52649 () Bool)

(assert (=> b!80141 (= lt!127173 e!52649)))

(declare-fun res!66325 () Bool)

(assert (=> b!80141 (=> res!66325 e!52649)))

(declare-datatypes ((Unit!5288 0))(
  ( (Unit!5289) )
))
(declare-datatypes ((tuple3!278 0))(
  ( (tuple3!279 (_1!3724 Unit!5288) (_2!3724 BitStream!2774) (_3!160 array!3482)) )
))
(declare-fun lt!127171 () tuple3!278)

(assert (=> b!80141 (= res!66325 (not (= (buf!1996 (_2!3724 lt!127171)) (buf!1996 thiss!1716))))))

(declare-fun lt!127172 () (_ BitVec 32))

(declare-fun readBitsLoop!0 (BitStream!2774 (_ BitVec 64) array!3482 (_ BitVec 64) (_ BitVec 64)) tuple3!278)

(assert (=> b!80141 (= lt!127171 (readBitsLoop!0 thiss!1716 nBits!516 (array!3483 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!127172) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(assert (=> b!80141 (= lt!127172 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!80142 () Bool)

(declare-fun res!66324 () Bool)

(assert (=> b!80142 (=> res!66324 e!52649)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!80142 (= res!66324 (not (invariant!0 (currentBit!3883 (_2!3724 lt!127171)) (currentByte!3888 (_2!3724 lt!127171)) (size!1606 (buf!1996 (_2!3724 lt!127171))))))))

(declare-fun b!80143 () Bool)

(assert (=> b!80143 (= e!52649 (or (not (= (size!1606 (_3!160 lt!127171)) lt!127172)) (bvsgt (currentByte!3888 thiss!1716) (currentByte!3888 (_2!3724 lt!127171)))))))

(declare-fun res!66327 () Bool)

(assert (=> start!15870 (=> (not res!66327) (not e!52648))))

(assert (=> start!15870 (= res!66327 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15870 e!52648))

(assert (=> start!15870 true))

(declare-fun e!52650 () Bool)

(declare-fun inv!12 (BitStream!2774) Bool)

(assert (=> start!15870 (and (inv!12 thiss!1716) e!52650)))

(declare-fun b!80144 () Bool)

(declare-fun res!66326 () Bool)

(assert (=> b!80144 (=> res!66326 e!52649)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!80144 (= res!66326 (not (= (bvadd (bitIndex!0 (size!1606 (buf!1996 thiss!1716)) (currentByte!3888 thiss!1716) (currentBit!3883 thiss!1716)) nBits!516) (bitIndex!0 (size!1606 (buf!1996 (_2!3724 lt!127171))) (currentByte!3888 (_2!3724 lt!127171)) (currentBit!3883 (_2!3724 lt!127171))))))))

(declare-fun b!80145 () Bool)

(declare-fun array_inv!1452 (array!3482) Bool)

(assert (=> b!80145 (= e!52650 (array_inv!1452 (buf!1996 thiss!1716)))))

(assert (= (and start!15870 res!66327) b!80140))

(assert (= (and b!80140 res!66328) b!80141))

(assert (= (and b!80141 (not res!66325)) b!80144))

(assert (= (and b!80144 (not res!66326)) b!80142))

(assert (= (and b!80142 (not res!66324)) b!80143))

(assert (= start!15870 b!80145))

(declare-fun m!125647 () Bool)

(assert (=> b!80142 m!125647))

(declare-fun m!125649 () Bool)

(assert (=> b!80140 m!125649))

(declare-fun m!125651 () Bool)

(assert (=> b!80145 m!125651))

(declare-fun m!125653 () Bool)

(assert (=> b!80141 m!125653))

(declare-fun m!125655 () Bool)

(assert (=> start!15870 m!125655))

(declare-fun m!125657 () Bool)

(assert (=> b!80144 m!125657))

(declare-fun m!125659 () Bool)

(assert (=> b!80144 m!125659))

(push 1)

(assert (not b!80144))

(assert (not b!80140))

(assert (not b!80141))

(assert (not start!15870))

(assert (not b!80145))

(assert (not b!80142))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

