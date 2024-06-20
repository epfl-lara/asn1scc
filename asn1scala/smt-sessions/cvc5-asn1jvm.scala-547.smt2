; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15854 () Bool)

(assert start!15854)

(declare-fun b!79996 () Bool)

(declare-fun res!66208 () Bool)

(declare-fun e!52553 () Bool)

(assert (=> b!79996 (=> (not res!66208) (not e!52553))))

(declare-datatypes ((array!3466 0))(
  ( (array!3467 (arr!2205 (Array (_ BitVec 32) (_ BitVec 8))) (size!1598 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2758 0))(
  ( (BitStream!2759 (buf!1988 array!3466) (currentByte!3880 (_ BitVec 32)) (currentBit!3875 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5272 0))(
  ( (Unit!5273) )
))
(declare-datatypes ((tuple3!262 0))(
  ( (tuple3!263 (_1!3716 Unit!5272) (_2!3716 BitStream!2758) (_3!152 array!3466)) )
))
(declare-fun lt!127107 () tuple3!262)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!79996 (= res!66208 (invariant!0 (currentBit!3875 (_2!3716 lt!127107)) (currentByte!3880 (_2!3716 lt!127107)) (size!1598 (buf!1988 (_2!3716 lt!127107)))))))

(declare-fun b!79997 () Bool)

(declare-fun e!52552 () Bool)

(assert (=> b!79997 (= e!52552 e!52553)))

(declare-fun res!66207 () Bool)

(assert (=> b!79997 (=> (not res!66207) (not e!52553))))

(declare-fun thiss!1716 () BitStream!2758)

(assert (=> b!79997 (= res!66207 (= (buf!1988 (_2!3716 lt!127107)) (buf!1988 thiss!1716)))))

(declare-fun lt!127106 () (_ BitVec 32))

(declare-fun nBits!516 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!2758 (_ BitVec 64) array!3466 (_ BitVec 64) (_ BitVec 64)) tuple3!262)

(assert (=> b!79997 (= lt!127107 (readBitsLoop!0 thiss!1716 nBits!516 (array!3467 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!127106) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(assert (=> b!79997 (= lt!127106 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun res!66205 () Bool)

(assert (=> start!15854 (=> (not res!66205) (not e!52552))))

(assert (=> start!15854 (= res!66205 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15854 e!52552))

(assert (=> start!15854 true))

(declare-fun e!52551 () Bool)

(declare-fun inv!12 (BitStream!2758) Bool)

(assert (=> start!15854 (and (inv!12 thiss!1716) e!52551)))

(declare-fun b!79998 () Bool)

(assert (=> b!79998 (= e!52553 (and (= (size!1598 (_3!152 lt!127107)) lt!127106) (bvsle (currentByte!3880 thiss!1716) (currentByte!3880 (_2!3716 lt!127107))) (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!516)) (bvsgt nBits!516 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1598 (_3!152 lt!127107)))))))))

(declare-fun b!79999 () Bool)

(declare-fun array_inv!1444 (array!3466) Bool)

(assert (=> b!79999 (= e!52551 (array_inv!1444 (buf!1988 thiss!1716)))))

(declare-fun b!80000 () Bool)

(declare-fun res!66204 () Bool)

(assert (=> b!80000 (=> (not res!66204) (not e!52552))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80000 (= res!66204 (validate_offset_bits!1 ((_ sign_extend 32) (size!1598 (buf!1988 thiss!1716))) ((_ sign_extend 32) (currentByte!3880 thiss!1716)) ((_ sign_extend 32) (currentBit!3875 thiss!1716)) nBits!516))))

(declare-fun b!80001 () Bool)

(declare-fun res!66206 () Bool)

(assert (=> b!80001 (=> (not res!66206) (not e!52553))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!80001 (= res!66206 (= (bvadd (bitIndex!0 (size!1598 (buf!1988 thiss!1716)) (currentByte!3880 thiss!1716) (currentBit!3875 thiss!1716)) nBits!516) (bitIndex!0 (size!1598 (buf!1988 (_2!3716 lt!127107))) (currentByte!3880 (_2!3716 lt!127107)) (currentBit!3875 (_2!3716 lt!127107)))))))

(assert (= (and start!15854 res!66205) b!80000))

(assert (= (and b!80000 res!66204) b!79997))

(assert (= (and b!79997 res!66207) b!80001))

(assert (= (and b!80001 res!66206) b!79996))

(assert (= (and b!79996 res!66208) b!79998))

(assert (= start!15854 b!79999))

(declare-fun m!125535 () Bool)

(assert (=> b!79999 m!125535))

(declare-fun m!125537 () Bool)

(assert (=> start!15854 m!125537))

(declare-fun m!125539 () Bool)

(assert (=> b!80001 m!125539))

(declare-fun m!125541 () Bool)

(assert (=> b!80001 m!125541))

(declare-fun m!125543 () Bool)

(assert (=> b!80000 m!125543))

(declare-fun m!125545 () Bool)

(assert (=> b!79996 m!125545))

(declare-fun m!125547 () Bool)

(assert (=> b!79997 m!125547))

(push 1)

(assert (not b!79996))

(assert (not b!80000))

(assert (not b!79999))

(assert (not start!15854))

(assert (not b!79997))

(assert (not b!80001))

(check-sat)

(pop 1)

(push 1)

(check-sat)

