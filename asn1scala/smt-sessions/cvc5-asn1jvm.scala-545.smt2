; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15842 () Bool)

(assert start!15842)

(declare-fun b!79888 () Bool)

(declare-datatypes ((array!3454 0))(
  ( (array!3455 (arr!2199 (Array (_ BitVec 32) (_ BitVec 8))) (size!1592 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2746 0))(
  ( (BitStream!2747 (buf!1982 array!3454) (currentByte!3874 (_ BitVec 32)) (currentBit!3869 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2746)

(declare-fun lt!127063 () (_ BitVec 32))

(declare-fun e!52480 () Bool)

(declare-datatypes ((Unit!5260 0))(
  ( (Unit!5261) )
))
(declare-datatypes ((tuple3!250 0))(
  ( (tuple3!251 (_1!3710 Unit!5260) (_2!3710 BitStream!2746) (_3!146 array!3454)) )
))
(declare-fun lt!127065 () tuple3!250)

(assert (=> b!79888 (= e!52480 (or (not (= (size!1592 (_3!146 lt!127065)) lt!127063)) (bvsgt (currentByte!3874 thiss!1716) (currentByte!3874 (_2!3710 lt!127065)))))))

(declare-fun b!79889 () Bool)

(declare-fun e!52479 () Bool)

(assert (=> b!79889 (= e!52479 false)))

(declare-fun lt!127064 () Bool)

(assert (=> b!79889 (= lt!127064 e!52480)))

(declare-fun res!66115 () Bool)

(assert (=> b!79889 (=> res!66115 e!52480)))

(assert (=> b!79889 (= res!66115 (not (= (buf!1982 (_2!3710 lt!127065)) (buf!1982 thiss!1716))))))

(declare-fun nBits!516 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!2746 (_ BitVec 64) array!3454 (_ BitVec 64) (_ BitVec 64)) tuple3!250)

(assert (=> b!79889 (= lt!127065 (readBitsLoop!0 thiss!1716 nBits!516 (array!3455 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!127063) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(assert (=> b!79889 (= lt!127063 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!79890 () Bool)

(declare-fun res!66114 () Bool)

(assert (=> b!79890 (=> res!66114 e!52480)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!79890 (= res!66114 (not (invariant!0 (currentBit!3869 (_2!3710 lt!127065)) (currentByte!3874 (_2!3710 lt!127065)) (size!1592 (buf!1982 (_2!3710 lt!127065))))))))

(declare-fun res!66117 () Bool)

(assert (=> start!15842 (=> (not res!66117) (not e!52479))))

(assert (=> start!15842 (= res!66117 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15842 e!52479))

(assert (=> start!15842 true))

(declare-fun e!52481 () Bool)

(declare-fun inv!12 (BitStream!2746) Bool)

(assert (=> start!15842 (and (inv!12 thiss!1716) e!52481)))

(declare-fun b!79891 () Bool)

(declare-fun array_inv!1438 (array!3454) Bool)

(assert (=> b!79891 (= e!52481 (array_inv!1438 (buf!1982 thiss!1716)))))

(declare-fun b!79892 () Bool)

(declare-fun res!66118 () Bool)

(assert (=> b!79892 (=> (not res!66118) (not e!52479))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79892 (= res!66118 (validate_offset_bits!1 ((_ sign_extend 32) (size!1592 (buf!1982 thiss!1716))) ((_ sign_extend 32) (currentByte!3874 thiss!1716)) ((_ sign_extend 32) (currentBit!3869 thiss!1716)) nBits!516))))

(declare-fun b!79893 () Bool)

(declare-fun res!66116 () Bool)

(assert (=> b!79893 (=> res!66116 e!52480)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!79893 (= res!66116 (not (= (bvadd (bitIndex!0 (size!1592 (buf!1982 thiss!1716)) (currentByte!3874 thiss!1716) (currentBit!3869 thiss!1716)) nBits!516) (bitIndex!0 (size!1592 (buf!1982 (_2!3710 lt!127065))) (currentByte!3874 (_2!3710 lt!127065)) (currentBit!3869 (_2!3710 lt!127065))))))))

(assert (= (and start!15842 res!66117) b!79892))

(assert (= (and b!79892 res!66118) b!79889))

(assert (= (and b!79889 (not res!66115)) b!79893))

(assert (= (and b!79893 (not res!66116)) b!79890))

(assert (= (and b!79890 (not res!66114)) b!79888))

(assert (= start!15842 b!79891))

(declare-fun m!125451 () Bool)

(assert (=> b!79893 m!125451))

(declare-fun m!125453 () Bool)

(assert (=> b!79893 m!125453))

(declare-fun m!125455 () Bool)

(assert (=> start!15842 m!125455))

(declare-fun m!125457 () Bool)

(assert (=> b!79890 m!125457))

(declare-fun m!125459 () Bool)

(assert (=> b!79892 m!125459))

(declare-fun m!125461 () Bool)

(assert (=> b!79889 m!125461))

(declare-fun m!125463 () Bool)

(assert (=> b!79891 m!125463))

(push 1)

(assert (not b!79892))

(assert (not b!79889))

(assert (not start!15842))

(assert (not b!79893))

(assert (not b!79891))

(assert (not b!79890))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

