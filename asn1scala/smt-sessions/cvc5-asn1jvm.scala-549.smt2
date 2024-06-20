; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15866 () Bool)

(assert start!15866)

(declare-fun b!80104 () Bool)

(declare-fun res!66297 () Bool)

(declare-fun e!52626 () Bool)

(assert (=> b!80104 (=> (not res!66297) (not e!52626))))

(declare-datatypes ((array!3478 0))(
  ( (array!3479 (arr!2211 (Array (_ BitVec 32) (_ BitVec 8))) (size!1604 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2770 0))(
  ( (BitStream!2771 (buf!1994 array!3478) (currentByte!3886 (_ BitVec 32)) (currentBit!3881 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2770)

(declare-fun nBits!516 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80104 (= res!66297 (validate_offset_bits!1 ((_ sign_extend 32) (size!1604 (buf!1994 thiss!1716))) ((_ sign_extend 32) (currentByte!3886 thiss!1716)) ((_ sign_extend 32) (currentBit!3881 thiss!1716)) nBits!516))))

(declare-fun b!80105 () Bool)

(declare-fun e!52625 () Bool)

(declare-fun array_inv!1450 (array!3478) Bool)

(assert (=> b!80105 (= e!52625 (array_inv!1450 (buf!1994 thiss!1716)))))

(declare-fun b!80106 () Bool)

(declare-datatypes ((Unit!5284 0))(
  ( (Unit!5285) )
))
(declare-datatypes ((tuple3!274 0))(
  ( (tuple3!275 (_1!3722 Unit!5284) (_2!3722 BitStream!2770) (_3!158 array!3478)) )
))
(declare-fun lt!127154 () tuple3!274)

(declare-fun e!52623 () Bool)

(declare-fun lt!127153 () (_ BitVec 32))

(assert (=> b!80106 (= e!52623 (or (not (= (size!1604 (_3!158 lt!127154)) lt!127153)) (bvsgt (currentByte!3886 thiss!1716) (currentByte!3886 (_2!3722 lt!127154)))))))

(declare-fun b!80107 () Bool)

(declare-fun res!66295 () Bool)

(assert (=> b!80107 (=> res!66295 e!52623)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!80107 (= res!66295 (not (= (bvadd (bitIndex!0 (size!1604 (buf!1994 thiss!1716)) (currentByte!3886 thiss!1716) (currentBit!3881 thiss!1716)) nBits!516) (bitIndex!0 (size!1604 (buf!1994 (_2!3722 lt!127154))) (currentByte!3886 (_2!3722 lt!127154)) (currentBit!3881 (_2!3722 lt!127154))))))))

(declare-fun res!66296 () Bool)

(assert (=> start!15866 (=> (not res!66296) (not e!52626))))

(assert (=> start!15866 (= res!66296 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15866 e!52626))

(assert (=> start!15866 true))

(declare-fun inv!12 (BitStream!2770) Bool)

(assert (=> start!15866 (and (inv!12 thiss!1716) e!52625)))

(declare-fun b!80108 () Bool)

(assert (=> b!80108 (= e!52626 false)))

(declare-fun lt!127155 () Bool)

(assert (=> b!80108 (= lt!127155 e!52623)))

(declare-fun res!66298 () Bool)

(assert (=> b!80108 (=> res!66298 e!52623)))

(assert (=> b!80108 (= res!66298 (not (= (buf!1994 (_2!3722 lt!127154)) (buf!1994 thiss!1716))))))

(declare-fun readBitsLoop!0 (BitStream!2770 (_ BitVec 64) array!3478 (_ BitVec 64) (_ BitVec 64)) tuple3!274)

(assert (=> b!80108 (= lt!127154 (readBitsLoop!0 thiss!1716 nBits!516 (array!3479 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!127153) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(assert (=> b!80108 (= lt!127153 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!80109 () Bool)

(declare-fun res!66294 () Bool)

(assert (=> b!80109 (=> res!66294 e!52623)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!80109 (= res!66294 (not (invariant!0 (currentBit!3881 (_2!3722 lt!127154)) (currentByte!3886 (_2!3722 lt!127154)) (size!1604 (buf!1994 (_2!3722 lt!127154))))))))

(assert (= (and start!15866 res!66296) b!80104))

(assert (= (and b!80104 res!66297) b!80108))

(assert (= (and b!80108 (not res!66298)) b!80107))

(assert (= (and b!80107 (not res!66295)) b!80109))

(assert (= (and b!80109 (not res!66294)) b!80106))

(assert (= start!15866 b!80105))

(declare-fun m!125619 () Bool)

(assert (=> start!15866 m!125619))

(declare-fun m!125621 () Bool)

(assert (=> b!80105 m!125621))

(declare-fun m!125623 () Bool)

(assert (=> b!80109 m!125623))

(declare-fun m!125625 () Bool)

(assert (=> b!80107 m!125625))

(declare-fun m!125627 () Bool)

(assert (=> b!80107 m!125627))

(declare-fun m!125629 () Bool)

(assert (=> b!80104 m!125629))

(declare-fun m!125631 () Bool)

(assert (=> b!80108 m!125631))

(push 1)

(assert (not b!80109))

(assert (not b!80104))

(assert (not start!15866))

(assert (not b!80105))

(assert (not b!80107))

(assert (not b!80108))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

