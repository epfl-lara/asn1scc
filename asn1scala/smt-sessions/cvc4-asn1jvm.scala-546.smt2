; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15852 () Bool)

(assert start!15852)

(declare-fun b!79978 () Bool)

(declare-fun res!66190 () Bool)

(declare-fun e!52539 () Bool)

(assert (=> b!79978 (=> (not res!66190) (not e!52539))))

(declare-datatypes ((array!3464 0))(
  ( (array!3465 (arr!2204 (Array (_ BitVec 32) (_ BitVec 8))) (size!1597 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2756 0))(
  ( (BitStream!2757 (buf!1987 array!3464) (currentByte!3879 (_ BitVec 32)) (currentBit!3874 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5270 0))(
  ( (Unit!5271) )
))
(declare-datatypes ((tuple3!260 0))(
  ( (tuple3!261 (_1!3715 Unit!5270) (_2!3715 BitStream!2756) (_3!151 array!3464)) )
))
(declare-fun lt!127100 () tuple3!260)

(declare-fun nBits!516 () (_ BitVec 64))

(declare-fun thiss!1716 () BitStream!2756)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!79978 (= res!66190 (= (bvadd (bitIndex!0 (size!1597 (buf!1987 thiss!1716)) (currentByte!3879 thiss!1716) (currentBit!3874 thiss!1716)) nBits!516) (bitIndex!0 (size!1597 (buf!1987 (_2!3715 lt!127100))) (currentByte!3879 (_2!3715 lt!127100)) (currentBit!3874 (_2!3715 lt!127100)))))))

(declare-fun b!79979 () Bool)

(declare-fun e!52542 () Bool)

(declare-fun array_inv!1443 (array!3464) Bool)

(assert (=> b!79979 (= e!52542 (array_inv!1443 (buf!1987 thiss!1716)))))

(declare-fun res!66189 () Bool)

(declare-fun e!52541 () Bool)

(assert (=> start!15852 (=> (not res!66189) (not e!52541))))

(assert (=> start!15852 (= res!66189 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15852 e!52541))

(assert (=> start!15852 true))

(declare-fun inv!12 (BitStream!2756) Bool)

(assert (=> start!15852 (and (inv!12 thiss!1716) e!52542)))

(declare-fun b!79980 () Bool)

(assert (=> b!79980 (= e!52541 e!52539)))

(declare-fun res!66193 () Bool)

(assert (=> b!79980 (=> (not res!66193) (not e!52539))))

(assert (=> b!79980 (= res!66193 (= (buf!1987 (_2!3715 lt!127100)) (buf!1987 thiss!1716)))))

(declare-fun lt!127101 () (_ BitVec 32))

(declare-fun readBitsLoop!0 (BitStream!2756 (_ BitVec 64) array!3464 (_ BitVec 64) (_ BitVec 64)) tuple3!260)

(assert (=> b!79980 (= lt!127100 (readBitsLoop!0 thiss!1716 nBits!516 (array!3465 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!127101) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(assert (=> b!79980 (= lt!127101 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!79981 () Bool)

(assert (=> b!79981 (= e!52539 (and (= (size!1597 (_3!151 lt!127100)) lt!127101) (bvsle (currentByte!3879 thiss!1716) (currentByte!3879 (_2!3715 lt!127100))) (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!516))))))

(declare-fun b!79982 () Bool)

(declare-fun res!66191 () Bool)

(assert (=> b!79982 (=> (not res!66191) (not e!52539))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!79982 (= res!66191 (invariant!0 (currentBit!3874 (_2!3715 lt!127100)) (currentByte!3879 (_2!3715 lt!127100)) (size!1597 (buf!1987 (_2!3715 lt!127100)))))))

(declare-fun b!79983 () Bool)

(declare-fun res!66192 () Bool)

(assert (=> b!79983 (=> (not res!66192) (not e!52541))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79983 (= res!66192 (validate_offset_bits!1 ((_ sign_extend 32) (size!1597 (buf!1987 thiss!1716))) ((_ sign_extend 32) (currentByte!3879 thiss!1716)) ((_ sign_extend 32) (currentBit!3874 thiss!1716)) nBits!516))))

(assert (= (and start!15852 res!66189) b!79983))

(assert (= (and b!79983 res!66192) b!79980))

(assert (= (and b!79980 res!66193) b!79978))

(assert (= (and b!79978 res!66190) b!79982))

(assert (= (and b!79982 res!66191) b!79981))

(assert (= start!15852 b!79979))

(declare-fun m!125521 () Bool)

(assert (=> b!79978 m!125521))

(declare-fun m!125523 () Bool)

(assert (=> b!79978 m!125523))

(declare-fun m!125525 () Bool)

(assert (=> b!79983 m!125525))

(declare-fun m!125527 () Bool)

(assert (=> start!15852 m!125527))

(declare-fun m!125529 () Bool)

(assert (=> b!79980 m!125529))

(declare-fun m!125531 () Bool)

(assert (=> b!79979 m!125531))

(declare-fun m!125533 () Bool)

(assert (=> b!79982 m!125533))

(push 1)

(assert (not b!79982))

(assert (not start!15852))

(assert (not b!79979))

(assert (not b!79983))

(assert (not b!79980))

(assert (not b!79978))

(check-sat)

(pop 1)

(push 1)

(check-sat)

